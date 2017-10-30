#!/bin/bash
# ------------------------------------------------------------------
# offWiFiSleep_createPKG.sh
#
# Tony Liu, 2017-, TonyLiu2ca@yahoo.com
# Version 1.0
# ------------------------------------------------------------------
package="offWiFiSleep"
identifier="com.github.TonyLiu2ca"
version="1.1"

homePath=$(dirname "$0")
pushd "$homePath" 1>/dev/null 2>1
if [ "$EUID" -ne 0 ];then echo "Please run as root"; exit; fi

# Delete extra file.
find . -name '.DS_Store' -type f -delete

# Correct files' permission.
chflags -R noschg "./root/Library/Application Support/$package"
chflags -R nouchg "./root/Library/Application Support/$package"
/usr/bin/xattr -c -r "./root/"
chmod -RN "./root/Library/Application Support/$package"
chown -R root:wheel "./root/Library/Application Support/$package"
chmod -R 755  "./root/Library/Application Support/$package"
chmod 777 "./root/Library/Application Support/$package/${package}_Settings.ini"
chmod 644 "./root/Library/LaunchDaemons/${identifier}.${package}.plist"

# Create the installation package.
pkgbuild --root ./root --scripts ./scripts --identifier "${identifier}.${package}" --version "$version" "./build/${package}.pkg" 1>&- 2>&1

chmod 777 "${package}.pkg"
chown `id -un` "${package}.pkg"

# done
popd 1>/dev/null 2>1
