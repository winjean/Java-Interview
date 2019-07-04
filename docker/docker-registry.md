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

#删除镜像  
curl -I -X DELETE http://192.168.0.153:5000/v2/fbgweb/manifests/sha256:6a67ba482a8dd4f8143ac96b1dcffa5e45af95b8d3e37aeba72401a5afd7ab8e  