tickTime=2000
dataDir=/home/hadoop/storage/zookeeper
clientPort=2181
initLimit=5
syncLimit=2
server.1=192.168.0.223:2881:3881
server.2=192.168.0.223:2882:3882
server.3=192.168.0.223:2883:3883

echo 2 > data/myid

启动
zkServer.sh start

停止
zkServer.sh stop

状态
zkServer.sh status