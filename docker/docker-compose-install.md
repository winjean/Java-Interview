1、安装 Docker Compose 可以通过下面命令自动下载适应版本的 Compose
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

2、为安装脚本添加执行权限
sudo chmod +x /usr/local/bin/docker-compose

3、查看docker-compose版本
docker-compose -v