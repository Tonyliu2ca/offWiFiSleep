#!/bin/bash
# ------------------------------------------------------------------
# offWiFiSleep_uninstall.sh - part of offWiFiSleep package
#
# Tony Liu, 2017-, TonyLiu2ca@yahoo.com
# Version 1.0
# ------------------------------------------------------------------
if [ "$EUID" -ne 0 ];then echo "Please run as root"; exit; fi

pkgutil --forget "com.github.TonyLiu2ca.offWiFiSleep" 1>&- 2>&1
/bin/launchctl unload -w /Library/LaunchDaemons/com.github.TonyLiu2ca.offWiFiSleep 1>&- 2>&1
rm /Library/LaunchDaemons/com.github.TonyLiu2ca.offWiFiSleep.plist 1>&- 2>&1
rm -fr /Library/Application\ Support/offWiFiSleep 1>&- 2>&1
exit 0
