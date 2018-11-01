一、环境准备
CentOS-7-x86_64-DVD-1611.iso
Oracle Database 11g Release 2

二、安装Oracle前准备
1.创建运行oracle数据库的系统用户和用户组
su root　　#切换到root
groupadd oinstall　　#创建用户组oinstall
groupadd dba　　     #创建用户组dba
useradd -g oinstall -g dba -m oracle　　#创建oracle用户，并加入到oinstall和dba用户组
passwd oracle　　    #设置用户oracle的登陆密码，不设置密码，在CentOS的图形登陆界面没法登陆
id oracle            #查看新建的oracle用户

2.创建oracle数据库安装目录
su root
mkdir -p /data/oracle /data/oraInventory /data/database　      #oracle数据库安装目录\配置文件目录\软件包解压目录
chown -R oracle:oinstall /data/oracle /data/oraInventory /data/database   #设置目录所有者为oinstall用户组的oracle用户
 

3.修改OS系统标识
su root
vi /etc/redhat-release
redhat-7

4.安装oracle数据库所需要的软件包
yum -y install binutils compat-libcap1 gcc gcc-c++ glibc glibc-devel ksh libaio libaio-devel libgcc libstdc++ libstdc++-devel libXi libXtst make sysstat elfutils-libelf-devel compat-libstdc++-33

5.关闭防火墙 CentOS 7.2默认使用的是firewall作为防火墙
systemctl stop firewalld.service　　#关闭防火墙
systemctl disable firewalld.service　　#禁止使用防火墙（重启也是禁止的）
systemctl status firewalld.service　　#查看防火墙状态，运行中

6.关闭selinux（需重启生效）
vi /etc/selinux/config
SELINUX=disabled   #此处修改为disabled

7.修改内核参数
vi /etc/sysctl.conf(增加以下内容)

net.ipv4.icmp_echo_ignore_broadcasts = 1
net.ipv4.conf.all.rp_filter = 1
fs.file-max = 6815744 #设置最大打开文件数
fs.aio-max-nr = 1048576
kernel.shmall = 2097152 #共享内存的总量，8G内存设置：2097152*4k/1024/1024
kernel.shmmax = 2147483648 #最大共享内存的段大小
kernel.shmmni = 4096 #整个系统共享内存端的最大数
kernel.sem = 250 32000 100 128
net.ipv4.ip_local_port_range = 9000 65500 #可使用的IPv4端口范围
net.core.rmem_default = 262144
net.core.rmem_max= 4194304
net.core.wmem_default= 262144
net.core.wmem_max= 1048576

sysctl -p

8.对oracle用户设置限制，提高软件运行性能（添加部分为 oracle）
vi /etc/security/limits.conf
#@student        -       maxlogins       4
oracle soft nproc 2047
oracle hard nproc 16384
oracle soft nofile 1024
oracle hard nofile 65536

# End of file

9.配置用户的环境变量（红色部分为添加代码）
export ORACLE_BASE=/data/oracle #oracle数据库安装目录
export ORACLE_HOME=$ORACLE_BASE/product/11.2.0/db_1 #oracle数据库路径
export ORACLE_SID=orcl #oracle启动数据库实例名
export ORACLE_TERM=xterm #xterm窗口模式安装
export PATH=$ORACLE_HOME/bin:/usr/sbin:$PATH #添加系统环境变量
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib #添加系统环境变量
export LANG=C #防止安装过程出现乱码
export NLS_LANG=AMERICAN_AMERICA.ZHS16GBK  #设置Oracle客户端字符集，必须与Oracle安装时设置的字符集保持一致，如：ZHS16GBK，否则出现数据导入导出中文乱码问题

source /home/oracle/.bash_profile  #使生效

10.解压安装包
unzip database.zip -d /data/database/
chown -R oracle:oinstall /data/database/database/

11.安装
图形界面登陆oracle用户
启动oralce安装，到/data/database/database/目录下，执行runInstaller


12.配置
配置监听listener
netca

创建Oracle数据实例Orcl
dbca


ORA-00845: MEMORY_TARGET not supported on this system
mount -o remount,size=4G /dev/shm


13.常用命令
lsnrctl start #启动oracle监听器

start #开启数据库

shutdown immediate #关闭数据库

sqlplus /nolog
conn sys/password as sysdba

create user winjean identified by winjean; #创建用户
drop user winjean; #删除用户

alter user winjean account lock;
alter user winjean account unlock;

grant create session to winjean; #登陆权限
grant dba to winjean; #库管理员权限

