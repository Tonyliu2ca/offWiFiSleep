#!/bin/bash
# ------------------------------------------------------------------
# offWiFiSleep_createPKG.sh
#
# Tony Liu, 2017-, TonyLiu2ca@yahoo.com
# Version 1.1.1
# ------------------------------------------------------------------
package="offWiFiSleep"
identifier="com.github.TonyLiu2ca"
version="1.1.1"

homePath=$(dirname "$0")
pushd "$homePath/.." &>/dev/null
if [ "$EUID" -ne 0 ];then echo "Please run as root"; exit; fi

# Delete extra file.
find . -name '.DS_Store' -type f -delete &>/dev/null

# Correct files' permission.
chflags -R noschg "./root/Library/$package"
chflags -R nouchg "./root/Library/$package"
/usr/bin/xattr -c -r "./root/"
chmod -RN "./root/Library/$package"
chown -R root:wheel "./root/Library/$package"
chmod -R 755  "./root/Library/$package"
chmod 777 "./root/Library/$package/${package}_Settings.ini"
chmod 644 "./root/Library/LaunchDaemons/${identifier}.${package}.plist"

# Create the installation package.
pkgbuild --root root --scripts scripts --identifier "${identifier}.${package}" --version "$version" --quiet ${package}.pkg

chmod 777 "${package}.pkg"; chown `id -un` "${package}.pkg"; mv -f "${package}.pkg" build
# done
popd &>/dev/null

 