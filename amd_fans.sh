#!/bin/bash

CARD_BASE=/sys/class/drm/card

CARD_1=${CARD_BASE}1/device/hwmon/hwmon3
CARD_2=${CARD_BASE}2/device/hwmon/hwmon4

SPEED_1=${1:-80}
SPEED_2=${2:-60}



function setGPUFan() {
  local CARD=$1
  local FAN_SPEED=$2
  echo 1 > ${CARD}/pwm1_enable 
  echo $2 > ${CARD}/pwm1
  
}



setGPUFan $CARD_1 $SPEED_1 
setGPUFan $CARD_2 $SPEED_2
