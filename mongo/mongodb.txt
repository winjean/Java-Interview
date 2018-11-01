编辑mongodb.conf
dbpath=/mongodb/data/
logpath=/mongodb/logs/db.log
logappend=true

读取配置信息
./mongod -f mongodb.conf 

启动mongodb
./mongo 192.168.186.130:27017

关闭防火墙
systemctl stop firewalld

测试是否启动
http://192.168.186.130:27017/

mongodb --dbpath=/data/db --rest
http://192.168.186.130:28017/

-----------------配置环境-------------------------------------------------------------------------------
机器 128,129,130
mongos 20000
configserver 30000
shard1 40001   shard2 40002   shard3 40003
------------------------------------------------------------------------------------------------

-------------开始启动实例------------------------------------
启动configServer
./mongod --configsvr --dbpath /mongodb/data2 --port 30000 --logpath /mongodb/log2/config.log --rest --fork

启动mongos
./mongos --configdb 192.168.186.128:30000,192.168.186.129:30000,192.168.186.130:30000 --port 20000 --logpath /mongodb/log1/mongos.log --fork

启动分片
./mongod --shardsvr --replSet shard1 --port 40001 --dbpath /mongodb/data3  --logpath /mongodb/log3/shard1.log --rest --fork 
./mongod --shardsvr --replSet shard2 --port 40002 --dbpath /mongodb/data4  --logpath /mongodb/log4/shard2.log --rest --fork 
./mongod --shardsvr --replSet shard3 --port 40003 --dbpath /mongodb/data5  --logpath /mongodb/log5/shard3.log --rest --fork 

-------------启动完成------------------------

-------------设置副本集--------------------------
#设置分片副本集
./mongo  127.0.0.1:40001
use admin

#定义副本集配置
config={ _id:"shard1", members:[{_id:0,host:"192.168.186.128:40001"},{_id:1,host:"192.168.186.129:40001"},{_id:2,host:"192.168.186.130:40001",arbiterOnly:true}]}
#初始化副本集配置
rs.initiate(config);

config={ _id:"shard2", members:[{_id:0,host:"192.168.186.128:40002"},{_id:1,host:"192.168.186.129:40002"},{_id:2,host:"192.168.186.130:40002",arbiterOnly:true}]}
rs.initiate(config);

config={ _id:"shard3", members:[{_id:0,host:"192.168.186.128:40003"},{_id:1,host:"192.168.186.129:40003"},{_id:2,host:"192.168.186.130:40003",arbiterOnly:true}]}
rs.initiate(config);

#串联路由服务器与分配副本集
#连接到mongos
./mongo  127.0.0.1:20000
user  admin
db.runCommand({addshard:"shard1/192.168.186.128:40001,192.168.186.129:40001,192.168.186.130:40001"});
db.runCommand({addshard:"shard2/192.168.186.128:40002,192.168.186.129:40002,192.168.186.130:40002"});
db.runCommand({addshard:"shard3/192.168.186.128:40003,192.168.186.129:40003,192.168.186.130:40003"});

#查看分片服务器的配置
db.runCommand({listshards:1});

#指定数据库winjean分片生效
db.runCommand({enablesharding:"winjean"});

db.winjean.ensureIndex({id: 1})

#指定数据库里需要分片的集合和片键
db.runCommand( { shardcollection : "winjean.winjean",key : {id: 1} } )

#查看分片情况
db.winjean.stats();

查看集群分片信息
db.printShardingStatus()