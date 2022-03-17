#!/bin/bash

# USB id is in the format of:
#   bus-port.port.port ... port:config.interface
#   http://www.linux-usb.org/FAQ.html#i6

# This script extracts the usb id from the DEVPATH environment
# variable, which is passed to this script via set by udev rules.
# Here are some more tips on how to find which environment
# variables are available:
#  https://stackoverflow.com/a/12819134

# For debugging scripts called by udev:
#   sudo udevadm control --log-priority=debug
#   journalctl -f
# You can add prints/echo to this script (viewable in journalctl)
# and/or log to a file

# To get more information about device attributes for udev matching:
#   Before this script is run (with acm driver):
#     udevadm info -a /dev/ttyACM0
#   After this script is run (with xr_usb driver):
#     udevadm info -a /dev/ttyXRUSB0

# As a sanity check for usb ID when replugging ollie:
#  dmesg -Hw

my_usb_id=$(basename $DEVPATH)

# Unbind kernel module cdc_acm module
echo "$my_usb_id:1.0" > /sys/bus/usb/drivers/cdc_acm/unbind
echo "$my_usb_id:1.2" > /sys/bus/usb/drivers/cdc_acm/unbind
echo "$my_usb_id:1.4" > /sys/bus/usb/drivers/cdc_acm/unbind
echo "$my_usb_id:1.6" > /sys/bus/usb/drivers/cdc_acm/unbind

# Bind cdc_xr_usb_serial module
echo "$my_usb_id:1.0" > /sys/bus/usb/drivers/cdc_xr_usb_serial/bind
echo "$my_usb_id:1.2" > /sys/bus/usb/drivers/cdc_xr_usb_serial/bind
echo "$my_usb_id:1.4" > /sys/bus/usb/drivers/cdc_xr_usb_serial/bind
echo "$my_usb_id:1.6" > /sys/bus/usb/drivers/cdc_xr_usb_serial/bind

