#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Industrial Dual 0-20mA Bricklet 2.0

# Handle incoming current callbacks
tinkerforge dispatch industrial-dual-0-20ma-v2-bricklet $uid current &

# Configure threshold for current (channel 0) "greater than 10 mA"
# with a debounce period of 10s (10000ms)
tinkerforge call industrial-dual-0-20ma-v2-bricklet $uid set-current-callback-configuration 0 10000 false threshold-option-greater 10000000 0

echo "Press key to exit"; read dummy

kill -- -$$ # Stop callback dispatch in background
