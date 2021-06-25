# udev setup for Oille with other cdc_acm devices

## udev
Place the file "ollie.rules" into  the directory "/etc/udev/rules.d/"

## Helper script
Place the helper script "ollie-plug.sh" into "/usr/local/bin/"


### Notes
Vendor ID: 0424 
Model ID: 2514
Is the root hub USB device of the Olle, this allows us to detect when its plugged in and take action
