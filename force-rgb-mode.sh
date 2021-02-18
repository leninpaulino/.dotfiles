#!/bin/bash

# Normal mode
# Download and run the script 
[ -e ~/patch-edid.rb ] && rm ~/patch-edid.rb
wget -O ~/patch-edid.rb https://gist.githubusercontent.com/adaugherity/7435890/raw 
[ -d "~/DisplayVendorID-*" ] && rm ~/DisplayVendorID-*
ruby ~/patch-edid.rb
sudo reboot

# Recovery mode
# It only generates a couple of files in your user’s directory and does not require any special rights to read the current monitor. (Monitor must be connected).
# Be sure that FileVault is disabled. You find it in Preferences -> Security and Privacy.
# Boot to into the recovery system (Cmd+R during boot).

mount -u -w /Volumes/Macintosh\ HD
cp -r /Volumes/Macintosh\ HD/Users/lenin/DisplayVendorID-* /Volumes/Macintosh\ HD/System/Library/Displays/Contents/Resources/Overrides/
bless –folder /Volumes/Machintosh\ HD/System/Library/CoreServices –bootefi –create-snapshot
csrutil authenticated-root disable
reboot
