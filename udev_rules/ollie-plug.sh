#!/bin/bash

# 3-1.2:1.X is each UART on Ollie.
#EG:
# cdc_xr_usb_serial 3-1.2:1.0: USB_device_id idVendor:04e2, idProduct 1414
# cdc_xr_usb_serial 3-1.2:1.0: ttyXR_USB_SERIAL0: USB XR_USB_SERIAL device
# cdc_xr_usb_serial 3-1.2:1.2: USB_device_id idVendor:04e2, idProduct 1414
# cdc_xr_usb_serial 3-1.2:1.2: ttyXR_USB_SERIAL1: USB XR_USB_SERIAL device
# cdc_xr_usb_serial 3-1.2:1.4: USB_device_id idVendor:04e2, idProduct 1414
# cdc_xr_usb_serial 3-1.2:1.4: ttyXR_USB_SERIAL2: USB XR_USB_SERIAL device
# cdc_xr_usb_serial 3-1.2:1.6: USB_device_id idVendor:04e2, idProduct 1414
# cdc_xr_usb_serial 3-1.2:1.6: ttyXR_USB_SERIAL3: USB XR_USB_SERIAL device

# Unbind kernel module cdc_acm module
echo "3-1.2:1.0" > /sys/bus/usb/drivers/cdc_acm/unbind
echo "3-1.2:1.2" > /sys/bus/usb/drivers/cdc_acm/unbind
echo "3-1.2:1.4" > /sys/bus/usb/drivers/cdc_acm/unbind
echo "3-1.2:1.6" > /sys/bus/usb/drivers/cdc_acm/unbind

# Bind cdc_xr_usb_serial module
echo "3-1.2:1.0" > /sys/bus/usb/drivers/cdc_xr_usb_serial/bind
echo "3-1.2:1.2" > /sys/bus/usb/drivers/cdc_xr_usb_serial/bind
echo "3-1.2:1.4" > /sys/bus/usb/drivers/cdc_xr_usb_serial/bind
echo "3-1.2:1.6" > /sys/bus/usb/drivers/cdc_xr_usb_serial/bind

