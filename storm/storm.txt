1、主控节点(Master Node) 运行Nimbus后台程序
2、工作节点(Work Node)运行Supervisor后台程序
Supervisor负责监听从Nimbus分配给它执行的任务，据此启动或停止执行任务的工作进程
每一个工作进程执行一个Topology的子集
一个运行中的Topology由分布在不同工作节点上的多个工作进程组成


./bin/storm nimbus >/dev/null 2>&1 &
./bin/storm supervisor >/dev/null 2>&1 &
./bin/storm ui >/dev/null 2>&1 & 
http://ip:8080

开发环境
LocalCluster cluster = new LocalCluster();
cluster.submitTopology("WordCount", conf, builder.createTopology());

生产环境
StormSubmitter.submitTopology("WordCount", conf, builder.createTopology());


./storm jar /storm/storm.jar storm.WordCountTopology param
--storm.jar storm程序jar包
--storm.WordCountTopology 类全名 
--param main方法参数

