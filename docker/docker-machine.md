## https://www.jianshu.com/p/a40c07f9f456  
yum -y install epel-release  
cd /etc/yum.repos.d/  
wget https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo  
yum search virtualbox  
yum -y install VirtualBox-5.2  

base=https://github.com/docker/machine/releases/download/v0.15.0 &&
curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
install /tmp/docker-machine /usr/local/bin/docker-machine

base=https://raw.githubusercontent.com/docker/machine/v0.15.0
for i in docker-machine-prompt.bash docker-machine-wrapper.bash docker-machine.bash
do  
  wget "$base/contrib/completion/bash/${i}" -P /etc/bash_completion.d  
done

docker-machine create --driver virtualbox default
