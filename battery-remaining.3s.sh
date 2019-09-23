#!/usr/bin/env bash

BATTERY_INFO="$(pmset -g batt | grep -F 'InternalBattery')"

if echo "${BATTERY_INFO}" | grep -F -q 'discharging'; then
    echo "${BATTERY_INFO}" | awk 'match($0, /([0-9]+:[0-9]+)/) { print substr($0, RSTART, RLENGTH) }'
else
    echo "${BATTERY_INFO}" | awk 'match($0, /[0-9]+%/) { print substr($0, RSTART, RLENGTH) }'
fi

echo "---"

echo "${BATTERY_INFO}"
