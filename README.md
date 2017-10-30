# offWiFiSleep
Turn Wi-Fi service off on sleep, back on when wake up.
当Mac进入睡眠的时候，关闭WiFi服务，这样可以避免系统服务在睡眠时访问网络。有助于省电。
当再次唤醒的时候，自动打开WiFI服务。

##打包
请参考createpkg目录的脚本

##安装：
设计的思想是，将所有的文件都安装在/Library/Application Support/offWifiSleep文件夹中，并利用LaunchDaemon来启动服务。

##卸载：
为了方便卸载，最直接的方法是执行下面的命令：
sudo "/Library/Application Support/offWifiSleep/uninstall.sh"

##禁止/准许：
有的时候你可能需要禁止这个操作，而又不想从系统中彻底卸载它，那么可以运行下面的命令：
sudo launchctl unload -w /Library/LaunchDaemons/com.github.TonyLiu2ca.offWiFiSleep.plist
再次开启的命令是：
sudo launchctl load -w /Library/LaunchDaemons/com.github.TonyLiu2ca.offWiFiSleep.plist
注：当运行上述命令的时候，它可能会询问当前管理员帐户的密码，以便提升权限进行修改
