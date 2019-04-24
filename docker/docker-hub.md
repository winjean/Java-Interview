docker run -d -p 5000:5000 --restart=always --name registry2 registry:2  

docker tag repo:tag localhost:5000/repo:tag  

docker push localhost:5000/repo:tag  

docker pull localhost:5000/repo:tag  

curl http://localhost:5000/v2/_catalog  

curl http://localhost:5000/v2/repo/tags/list  

curl --header "Accept: application/vnd.docker.distribution.manifest.v2+json" -I -X HEAD  http://localhost:5000/v2/registry/manifests/2

curl -X DELETE localhost:5000/v2/java/mainfests/sha256:b1165286043f2745f45ea637873d61939bff6d9a59f76539d6228abf79f87774