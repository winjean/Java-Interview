https://blog.csdn.net/qq_35904833/article/details/80807592  
https://www.cnblogs.com/Tempted/p/7768694.html

#查询镜像  
docker search registry

#拉取镜像  
docker pull registry

#启动镜像查库  
docker run -d -p 5000:5000 -v /opt/data/registry:/tmp/registry registry


docker tag busybox 192.168.0.153:5000/busybox

#上传镜像  
docker push 192.168.0.153:5000/busybox  

#查看镜像  
curl -XGET http://registry:5000/v2/_catalog

#查看镜像标签  
curl -XGET http://registry:5000/v2/image_name/tags/list  

#查看镜像详情
curl -XGET http://localhost:5000/v2/image_name/manifests/tag

#删除镜像  
默认是删除是关闭的，须开启  
curl -I -X DELETE http://192.168.0.153:5000/v2/image_name/manifests/sha256:6a67ba482a8dd4f8143ac96b1dcffa5e45af95b8d3e37aeba72401a5afd7ab8e  