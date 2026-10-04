#!/bin/bash
# Project Lyra - PU2 bypass flasher for Kiisu v4br clones
set -e
FW="${1:-firmware_bypass_pls.dfu}"
[ -f "$FW" ] || { echo "usage: $0 [firmware.dfu]"; exit 1; }

echo "== waiting for DFU device (LEFT+BACK 5s, release BACK) =="
for i in $(seq 1 60); do
  dfu-util -l 2>/dev/null | grep -q "Found DFU" && break
  sleep 2
  [ $i -eq 60 ] && { echo "no DFU device found"; exit 1; }
done
dfu-util -a 0 -d 0483:df11 -D "$FW" 2>&1 | grep -E "Download done|error" && echo "flash OK - unplug and replug (no buttons)"
