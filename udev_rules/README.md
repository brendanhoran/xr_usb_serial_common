# udev setup for Oille with other cdc_acm devices

## udev
Place the file `ollie.rules` into the directory `/etc/udev/rules.d/`

## Helper script
Place the helper script `ollie-plug.sh` into `/usr/local/bin/`. The above udev rule calls this script.
