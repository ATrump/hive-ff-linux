#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Industrial Dual 0-20mA Bricklet 2.0

# Get current current from channel 0
tinkerforge call industrial-dual-0-20ma-v2-bricklet $uid get-current 0
