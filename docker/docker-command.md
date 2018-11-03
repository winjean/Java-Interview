docker command
===
* docker images： 列出images
* docker images -a ：列出所有的images（包含历史）
* docker images --tree ：显示镜像的所有层(layer)
* docker rmi  <image ID>： 删除一个或多个image

* docker pull pull centos:latest 下载最新的centos
* docker run -it centos	运行centos i交互式 t临时终端	exit退出
* docker start|stop|restart -ai 容器名 
-a 参数将容器的输出导出到终端，同时使用 -i 参数进行交互式的操作。这条命令可以让我们继续运行容器
* docker ps -a 列出正在运行的容器
* docker commit -a "" -m "" 容器名 镜像名:版本
* docker rm 容器名
* docker rmi 镜像名
* docker logs -f 容器id 查看tomcat日志