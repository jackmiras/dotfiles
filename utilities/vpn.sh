#!/bin/bash
set -euo pipefail

readonly CURRENT_WORKDIR=$(pwd)
readonly WORKDIR="${HOME}/Projects/dotfiles/utilities"

function add_user() {
  cleanup_pki "${1}"
  echo "✓ 1. Old certs and ovpn files removed"

  build_client "${1}"
  echo "✓ 2. User ${1} created"

  create_ovpn_file "${1}"
  echo "✓ 3. Open VPN file created"

  echo "✓ 4. Uploading certificate to ACM"
  upload_certificate "${1}"
}

function remove_user() {
  cleanup_pki "${1}"
  echo "✓ 1. Certs locally removed"

  remove_certificate
  echo "✓ 2. Certs removed from AWS ACM"
}

function connect_user() {
  sudo openvpn "${WORKDIR}/easy-rsa/ovpn-files/${USER_NAME}.ovpn"
}

function cleanup_pki() {
  local USER_NAME=$1
  rm -rf "${WORKDIR}/easy-rsa/ovpn-files/${USER_NAME}.ovpn"
  rm -rf "${WORKDIR}/easy-rsa/easyrsa3/pki/reqs/${USER_NAME}.menu.vpn.req"
  rm -rf "${WORKDIR}/easy-rsa/easyrsa3/pki/issued/${USER_NAME}.menu.vpn.crt"
  rm -rf "${WORKDIR}/easy-rsa/easyrsa3/pki/private/${USER_NAME}.menu.vpn.key"
}

function build_client() {
  local USER_NAME=$1

  # Access easyrsa3 directory
  cd "${WORKDIR}/easy-rsa/easyrsa3"

  # Generate user cert and private key
  sh easyrsa build-client-full "${USER_NAME}.menu.vpn" nopass > /dev/null 2>&1

  # Exit easyrsa3 directory
  cd "${CURRENT_WORKDIR}"
}

function create_ovpn_file() {
  local USER_NAME=$1
  declare -a REMOTE_HOST_ARRAY

  # Creating users ovpn file
  cp "${WORKDIR}/easy-rsa/ovpn-files/cvpn-endpoint-0c82181b1225caeae.ovpn" "${WORKDIR}/easy-rsa/ovpn-files/${USER_NAME}.ovpn"

  # Extracting line 4
  readonly REMOTE_HOST_LINE=$(sed -n '4,4p;5q' "${WORKDIR}/easy-rsa/ovpn-files/${USER_NAME}.ovpn")
  REMOTE_HOST_ARRAY=($REMOTE_HOST_LINE)

  # Prepend username in the VPN remote host
  readonly NEW_REMOTE_HOST="remote ${USER_NAME}.${REMOTE_HOST_ARRAY[1]} 443"

  # Replace VPN remote host in the ovpn file
  sed -i "4s/.*/${NEW_REMOTE_HOST}/" "${WORKDIR}/easy-rsa/ovpn-files/${USER_NAME}.ovpn"

  # Remove file last line
  sed -i "$ d" "${WORKDIR}/easy-rsa/ovpn-files/${USER_NAME}.ovpn"

  # Extracting lines from 65 to 85
  local CRT=$(sed -n '65,85p;86q' "${WORKDIR}/easy-rsa/easyrsa3/pki/issued/${USER_NAME}.menu.vpn.crt")
  # Extracting lines from 1 to 28
  local KEY=$(sed -n '1,28p;29q' "${WORKDIR}/easy-rsa/easyrsa3/pki/private/${USER_NAME}.menu.vpn.key")

  {
    echo "<cert>"
    echo "${CRT}"
    echo "</cert>"

    echo ""
    echo ""

    echo "<key>"
    echo "${KEY}"
    echo "</key>"

    echo ""
    echo ""

    echo "reneg-sec 0"
  } >> "${WORKDIR}/easy-rsa/ovpn-files/${USER_NAME}.ovpn"
}

function upload_certificate() {
  local USER_NAME=$1

  # Check if the user's certificate exists in AWS ACM
  readonly USER=$(aws acm list-certificates | jq ".[][] | select(.DomainName==\"${USER_NAME}.menu.vpn\")")

  # If the user exists it imports the user's certs into AWS ACM
  if [[ -z "${USER}" ]]; then
    aws acm import-certificate \
      --certificate "fileb://${WORKDIR}/easy-rsa/easyrsa3/pki/issued/${USER_NAME}.menu.vpn.crt" \
      --private-key "fileb://${WORKDIR}/easy-rsa/easyrsa3/pki/private/${USER_NAME}.menu.vpn.key" \
      --certificate-chain "fileb://${WORKDIR}/easy-rsa/easyrsa3/pki/ca.crt" \
      --region us-west-2 \
      --output json
  else
    # Otherwise, it throws an error message
    echo "User '${USER_NAME}' already exists in AWS ACM" && exit 1
  fi
}

function remove_certificate() {
  # Check if the user's certificate exists in AWS ACM
  readonly USER=$(aws acm list-certificates | jq ".[][] | select(.DomainName==\"${USER_NAME}.menu.vpn\")")

  # If the user doesn't exist it throws an error message
  if [[ -z "${USER}" ]]; then
    echo "User '${USER_NAME}' doesn't exists in AWS ACM" && exit 1
  fi

  # If the user exists it gets the user's certificate ARN
  readonly USER_ARN=$(aws acm list-certificates \
    | jq ".[][] | select(.DomainName==\"${USER_NAME}.menu.vpn\")" \
    | jq ".CertificateArn" \
    | tr -d '"' \
  )

  # Finally, it removes the user's certificate from ACM
  aws acm delete-certificate --certificate-arn "${USER_ARN}"
}

function main() {
  local FLAG=$(echo "${1}" | awk -F= '{print $1}')
  local USER_NAME=$(echo "${1}" | awk -F= '{print $2}')

  if [[ "${FLAG}" == "--add-user" ]] ; then
    add_user "${USER_NAME}"
  elif [[ "${FLAG}" == "--remove-user" ]] ; then
    remove_user "${USER_NAME}"
  elif [[ "$FLAG" == "--connect" ]]; then
    connect_user "${USER_NAME}"
  else
    echo "Flag '${FLAG}' doesn't exists" && exit 1
  fi
}

main "${1}"
