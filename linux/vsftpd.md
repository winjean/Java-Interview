Vsftpd搭建手册
1、vsftpd安装
vsftpd属于系统自带服务，可在系统安装时选择软件包安装，如果没有安装也可以yum安装
yum install *vsftp*    前后加星号是为了避免缺少安装包

2、 添加虚拟用户口令文件
#vi /etc/vsftpd/vftpuser.txt
添加虚拟用户名和密码，一行用户名，一行密码，以此类推。奇数行为用户名，偶数行为密码。
test #用户名
123456 #密码
Test1 #用户名
123456 #密码

3、 生成虚拟用户口令认证文件
将刚添加的vftpuser.txt虚拟用户口令文件转换成系统识别的口令认证文件。
首先查看系统有没有安装生成口令认证文件所需的软件db4-utils。
#rpm –qa |grep db4-utils
# Yum install db4*
下面使用db_load命令生成虚拟用户口令认证文件。
#db_load –T –t hash –f /etc/vsftpd/vftpuser.txt /etc/vsftpd/vftpuser.db

4、 编辑vsftpd的PAM认证文件
虚拟用户登录ftp需要系统的pam认证，所以要编辑/etc/pam.d
#vi /etc/pam.d/vsftpd
将里面其他的都注释掉，添加下面这两行：
Auth required /lib/security/pam_userdb.so db=/etc/vsftpd/vftpuser
account required /lib/security/pam_userdb.so db=/etc/vsftpd/vftpuser
 
4. 建立本地映射用户并设置宿主目录权限
所有的FTP虚拟用户需要使用一个系统用户，这个系统用户不需要密码。
#useradd–s /sbin/nologin vftpd  # vsftpd服务的宿主用户
#chown –R vsftpd.vsftpd /var/ftp
# chown –R vsftpd.vsftpd /etc/vsftpd #这里注意下/etc/vsftpd下的vsftpd.conf要设置成root的属组，不然访问不了，还没搞明白什么原因。

5. 配置vsftpd.conf（设置虚拟用户配置项）
#vi /etc/vsftpd/vsftpd.conf
anonymous_enable=NO #设定不允许匿名访问
local_enable=YES #设定本地用户可以访问。注意：主要是为虚拟宿主用户，如果该项目设定为NO那么所有虚拟用户将无法访问
write_enable=YES #设定可以进行写操作
local_umask=022 #设定上传后文件的权限掩码
anon_upload_enable=NO #禁止匿名用户上传
anon_mkdir_write_enable=NO #禁止匿名用户建立目录
xferlog_enable=YES #设定开启日志记录功能
connect_from_port_20=YES #设定端口20进行数据连接
chown_uploads=NO #设定禁止上传文件更改宿主
xferlog_file=/var/log/vsftpd.log 
vsftpd的服务日志。注意，该文件必须要手动touch出来，必须注意给与该用户对日志的写入权限（vsftpd服务宿主用户），否则服务将启动失败
xferlog_std_format=YES #设定日志使用标准的记录格式
nopriv_user=vsftpd 
vsftpd服务的宿主用户vsftpd。必须注意与该服务相关的读写文件的读写权限问题
async_abor_enable=YES #设定支持异步传输功能
ascii_upload_enable=YES 
ascii_download_enable=YES #设定支持ASCII模式的上传和下载功能
ftpd_banner=Welcome to blah FTP service. #设定vsftpd的登陆标语
chroot_list_enable=NO #限定在自己的FTP主目录里边pam_service_name=vsftpd #设定PAM服务下Vsftpd的验证配置文件名。刚刚修改的是/etc/pam.d/下的vsftpd文件，可以自己新建文件，目录要正确
userlist_enable=YES #设定userlist_file中的用户将不得使用FTP 
tcp_wrappers=YES #设定支持TCP Wrappers
###########################################################
好了，需要修改新增的如下：(具体根据需要而定)
anonymous_enable=NO #不允许匿名用户登录 
anon_upload_enable=NO #不允许匿名用户上传 
anon_mkdir_write_enable=NO #不允许匿名用户建立目录
chown_uploads=NO #设定禁止上传文件更改宿主。
dual_log_enable=YES #用户下载日志记录
xferlog_file=/var/log/vsftpd.log #设定Vsftpd的服务日志保存路径
async_abor_enable=YES #设定支持异步传输功能。
ascii_upload_enable=YES 
ascii_download_enable=YES #设定支持ASCII模式的上传和下载功能也都开启吧
ftpd_banner= Welcome to Lemko FTP service.
chroot_list_enable=NO #限定在ftp主目录
nopriv_user=vsftpd #支撑Vsftpd服务的宿主用户
guest_enable=YES #设定启用虚拟用户功能 
virtual_use_local_privs=YES #设定虚拟用户的权限符合他们的宿主用户 
user_config_dir=/etc/vsftpd/ftp_user 设定虚拟用户个人Vsftp的配置文件存放路径。/etc/vsftpd/ ftp_user里面的文件都是虚拟用户的专用配置文件，注意：配置文件名必须和虚拟用户名相同
那我们就专门为虚拟用户建立一个配置文件目录吧

６、建立虚拟用户配置文件/
#mkdir /etc/vsftpd/ftp_user
#vim test #虚拟用户只有下载权限
local_root=/var/ftp/caiwu #制定虚拟用户访问目录
write_enable=NO  
anon_world_readable_only=NO
#vim test1   #虚拟用户对用户目录用完全控制权限
local_root=/var/ftp
write_enable=YES
anon_world_readable_only=NO #具有浏览FTP目录和下载权限
anon_upload_enable=YES #具有上传文件权限
anon_mkdir_write_enable=YES #具有建立和删除目录的权利
anon_other_write_enable=YES #具有文件改名和删除文件的权利

７． 重启vsftpd服务
#service vsftpd restart