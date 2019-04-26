## https://blog.csdn.net/wanglei_storage/article/details/77508620
## https://blog.csdn.net/u011781521/article/details/80468985

hostnamectl set-hostname swarm01 

## swarm集群管理  
docker swarm init --advertise-addr  192.168.71.129

查看swarm集群中的节点  
docker node list

查看节点的任务数
docker node ps

查看集群节点的详细信息
docker node inspect [--pretty] [nodeName]

docker swarm leave --force

将manager角色降级为worker
docker node demote hostname

将worker角色升级为manage  
docker node promote hostname 


docker swarm join-token manager

docker swarm join-token [-q] worker

##  swarm service manage  
docker service ls

docker service ps redis

docker network create --driver overlay --subnet 10.0.0.1/24 euraka-network

docker network ls

docker stack deploy -c docker-compose.yml hellowork

docker stack rm hellowork

docker stack ls