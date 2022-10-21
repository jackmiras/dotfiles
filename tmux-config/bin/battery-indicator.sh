#!/bin/bash

# BATTERY_SYMBOL='♥ '
BATTERY_SYMBOL=' '

# Amount of heart slots we wanna show at Tmux status bar
# Eg: 5 hearts means that every heart represents 20% batery usage
BATTERY_SLOTS=5

# This multiplier is proportional to the number of BATTERY_SLOTS
# if the slots double this number should double as well
BATTERY_MULTIPLIER=20 # This should

if [[ $(uname) == 'Linux' ]]; then
  current_charge=$(acpi | grep 'Discharging' | awk '{print $4}')
  if [[ -z "${current_charge}" ]]; then
    current_charge=100
  else
    current_charge=${current_charge::-2}
  fi

  total_charge=$(acpi | grep 'Full' | awk '{print $4}')
  if [[ -z "${total_charge}" ]]; then
    total_charge=100
  else
    total_charge=${total_charge::-1}
  fi
else
  battery_info=$(ioreg -rc AppleSmartBattery)
  current_charge=$(echo "${battery_info}" | grep -o '"CurrentCapacity" = [0-9]\+' | awk '{print $3}')
  total_charge=$(echo "${battery_info}" | grep -o '"MaxCapacity" = [0-9]\+' | awk '{print $3}')
fi

charged_slots=$(echo "(((${current_charge}/${total_charge})*${BATTERY_MULTIPLIER})/${BATTERY_SLOTS})+1" | bc -l | cut -d '.' -f 1)

if [[ $charged_slots -gt $BATTERY_SLOTS ]]; then
  charged_slots=$BATTERY_SLOTS
fi

echo -n '#[fg=colour16]'

for i in $(seq 1 $charged_slots); do
  echo -n "$BATTERY_SYMBOL"
done

if [[ $charged_slots -lt $BATTERY_SLOTS ]]; then
  echo -n '#[fg=colour253]'
  for i in $(seq 1 "$(echo "${BATTERY_SLOTS}-${charged_slots}" | bc)"); do
    echo -n "$BATTERY_SYMBOL"
  done
fi
