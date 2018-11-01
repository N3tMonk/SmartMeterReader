#!/bin/bash

# ==============================================================
#                        SmartMeterReader
# ==============================================================
# Name    : SmartMeterReader
# Version : v1.0
# Author  : N3tMonk
# Purpose : Read actual values from a smartmeter.
# Date    : 01-11-2018
# License : MIT
# ==============================================================

# Configuration
# --------------------------------------------------------------
WorkDirectory="/opt/SMR"             # Location of the script
LogDirectory="$WorkDirectory/log"    # Logdirectory
TempDirectory="$WorkDirectory/temp"  # Directory for outputfiles
InterfacePort="ttyUSB0"              # Specify ineteractionport

# Script
# --------------------------------------------------------------

function Instructions() {
        echo "
SmartMeterReader v1.0
================================================================
 --tofile        Write current values to the specified tempfile.
 --toscreen      Don't write to file but print this on screen
 
 Example: SmartMeterReader.sh --tofile
 
"
}

if [ "$1" = "--tofile" ]; then
      echo -n "Datafetch in process..."
      head -26 < /dev/$InterfacePort > $TempDirectory/MeterValues.out
      echo "Done"
elif [ "$1" = "--toscreen" ]; then
      head -26 < /dev/$InterfacePort
else
      echo "Invalid or missing argument"
      Instructions
fi

echo ""
