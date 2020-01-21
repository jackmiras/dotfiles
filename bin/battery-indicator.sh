#!/bin/bash
# modified from http://ficate.com/blog/2012/10/15/battery-life-in-the-land-of-tmux/

HEART='♥ '

if [[ $(uname) == 'Linux' ]]; then
  current_charge=$(acpi | grep 'Discharging' | awk '{print $3}')
  if [[ -z "${current_charge}" ]]; then
    current_charge=100
  else
    current_charge=`expr "$current_chage" : '^\(.[1-9]*\)'`
  fi

  total_charge=$(acpi | grep 'Full' | awk '{print $4}')
  if [[ -z "${total_charge}" ]]; then
    total_charge=100
  else
    total_charge=${total_charge::-1}
  fi
else
  battery_info=`ioreg -rc AppleSmartBattery`
  current_charge=$(echo $battery_info | grep -o '"CurrentCapacity" = [0-9]\+' | awk '{print $3}')
  total_charge=$(echo $battery_info | grep -o '"MaxCapacity" = [0-9]\+' | awk '{print $3}')
fi

charged_slots=$(echo "((($current_charge/$total_charge)*10)/3)+1" | bc -l | cut -d '.' -f 1)
if [[ $charged_slots -gt 3 ]]; then
  charged_slots=3
fi

echo -n '#[fg=colour16]'
for i in `seq 1 $charged_slots`; do echo -n "$HEART"; done

if [[ $charged_slots -lt 3 ]]; then
  echo -n '#[fg=colour253]'
  for i in `seq 1 $(echo "3-$charged_slots" | bc)`; do echo -n "$HEART"; done
fi
