启动nginx服务
systemctl start nginx.service
设置开机自启动
systemctl enable nginx.service
停止开机自启动
systemctl disable nginx.service
查看服务当前状态
systemctl status nginx.service
重新启动服务
systemctl restart nginx.service
查看所有已启动的服务
systemctl list-units --type=service

修改centos默认启动级别
systemctl set-default multi-user.target   命令启动
systemctl set-default graphical.target    图形界面模式

上面的操作命令真实的操作为以下的实现
rm /etc/systemd/system/default.target  删除已经存在的符号链接
ln -sf /lib/systemd/system/multi-user.target /etc/systemd/system/default.target  默认级别转换为3(文本模式)
ln -sf /lib/systemd/system/graphical.target /etc/systemd/system/default.target  默认级别转换为5(图形模式)

启动系统时启动网卡
vi /etc/sysconfig/network-scripts/ifcfg-eno16777736
ONBOOT=no 改为ONBOOT=yes

禁用IPV6
vi /etc/default/grub
GRUB_CMDLINE_LINUX="ipv6.disable=1" 
grub2-mkconfig -o /boot/grub2/grub.cfg

32位：
rpm -Uvh http://mirror.centos.org/centos/6/os/i386/Packages/ftp-0.17-54.el6.i686.rpm

64位：
rpm -Uvh http://mirror.centos.org/centos/6/os/x86_64/Packages/ftp-0.17-54.el6.x86_64.rpm

快捷键
Ctrl + u            删除光标之前到行首的字符
Ctrl + k            删除光标之前到行尾的字符
Ctrl + c            取消当前行输入的命令，相当于Ctrl + Break
Ctrl + a            光标移动到行首（ahead of line），相当于通常的Home键
Ctrl + e            光标移动到行尾（end of line）
Ctrl + f            光标向前（forward）移动一个字符位置
Ctrl + b            光标往回（backward）移动一个字符位置
Ctrl + l            清屏，相当于执行clear命令
Ctrl + r            显示:号提示，根据用户输入查找相关历史命令（reverse-i-search）
Ctrl + w            删除从光标位置前到当前所处单词（word）的开头
Ctrl + t            交换光标位置前的两个字符
Ctrl + y            粘贴最后一次被删除的单词
Ctrl + Alt + d      显示桌面
Alt + b             光标往回（backward）移动到前一个单词
Alt + d             删除从光标位置到当前所处单词的末尾
Alt + F2            运行
Alt + F4            关闭当前窗口
Alt + F9            最小化当前窗口
Alt + F10           最大化当前窗口
Alt + Tab           切换窗口
