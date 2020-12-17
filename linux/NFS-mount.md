## service
yum install nfs-utils
yum install rpcbind
mkdir -p /usr/nfsShare
chmod 777 /usr/nfsShare
vi /etc/exports  # add
/usr/nfsShare 192.168.71.0/24(rw,sync,no_root_squash)
systemctl start rpcbind 
systemctl start nfs
netstat -lt
rpcinfo -p # check 
exportfs -r # make active
exportfs


## client
yum install nfs_utils
yum install rpcbind
systemctl start rpcbind  
systemctl start nfs   
systemctl enable rpcbind  
systemctl enablenfs-server.service  
mount -t nfs 192.168.71.130:/usr/nfsShare /usr/test
showmount -e 192.168.71.130 # check share 