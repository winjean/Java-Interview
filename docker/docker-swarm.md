## https://blog.csdn.net/wanglei_storage/article/details/77508620
## https://blog.csdn.net/u011781521/article/details/80468985

docker swarm init --advertise-addr  192.168.71.129

hostnamectl set-hostname swarm01 

docker node list

sudo docker node inspect [nodeName]

docker swarm leave --force

docker swarm join-token manager

docker swarm join-token worker

docker swarm join-token -q worker

docker node inspect swarm02 --pretty

docker service ls

docker service ps redis

docker network create --driver overlay --subnet 10.0.0.1/24 euraka-network

docker network ls

docker stack deploy -c docker-compose.yml hellowork

docker stack rm hellowork

docker stack ls