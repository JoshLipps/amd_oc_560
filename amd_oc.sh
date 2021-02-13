#!/bin/bash

CARD_BASE=/sys/class/drm/card

CARD_1=${CARD_BASE}1
CARD_2=${CARD_BASE}2




function oc() {
  local CARD=${1:-${CARD_BASE}1}
  local GPU=${2:-1150}
  local CORE_V=${3:-850}
  local MEM=${4:-2000}
  local MEM_V=${5:-875}

  # compute mode
  echo "manual" > ${CARD}/device/power_dpm_force_performance_level 
  echo 5 > ${CARD}/device/pp_power_profile_mode 
  
  echo "m 2 $MEM $MEM_V" > ${CARD}/device/pp_od_clk_voltage
  echo "s 3 $GPU  $CORE_V" > ${CARD}/device/pp_od_clk_voltage
  echo "s 4 $GPU  $CORE_V" > ${CARD}/device/pp_od_clk_voltage
  echo "s 5 $GPU  $CORE_V" > ${CARD}/device/pp_od_clk_voltage
  echo "s 6 $GPU  $CORE_V" > ${CARD}/device/pp_od_clk_voltage
  echo "s 7 $GPU  $CORE_V" > ${CARD}/device/pp_od_clk_voltage
  echo "c" > ${CARD}/device/pp_od_clk_voltage
}

oc $CARD_1 1150 850 2000 875  
oc $CARD_2 1150 850 2000 875
