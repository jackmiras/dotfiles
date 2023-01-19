alias ec2-instances-name="aws ec2 describe-instances | grep -A1 '\"Key\": \"Name\",' | grep -i 'Value' | cut -d ':' -f2"
