name:root - winjean
name:winjean - winjean

vsftpd home:/etc/vsftpd
vsftpd user
		ftpuser1 - ftpuser1 ???/var/ftp/user1
		ftpuser2 - ftpuser2 ???/var/ftp/user2
		
 rpm -ivh jdk-6u11-linux-i586-rpm		
		

???????java	
rpm -qa |grep jdk	
rpm -e --nodeps jdk-1.7.0_79-fcs.x86_64

???java
rpm -ivh jdk-7u79-linux-x64.rpm

????java????
vi /etc/profile
export JAVA_HOME=/usr/java/jdk1.7.0_79
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

??????????
~/hadoop/etc/hadoop/hadoop-env.sh
~/hadoop/etc/hadoop/yarn-env.sh
~/hadoop/etc/hadoop/slaves
~/hadoop/etc/hadoop/core-site.xml
~/hadoop/etc/hadoop/hdfs-site.xml
~/hadoop/etc/hadoop/mapred-site.xml
~/hadoop/etc/hadoop/yarn-site.xml

????hdfs
./sbin/start-dfs.sh

????yarn
./sbin/start-yarn.sh

????datanode
./sbin/hadoop-daemon.sh start datanode

?????????
 ./bin/hdfs dfsadmin -report

??hadoop
http://192.168.186.128:50070/

http://192.168.186.128:8088/

????wordcount????
1?????? input????[spark@S1PA11 hadoop-2.6.0]$ mkdir input
2????input????f1??f2???????
 cat input/f1 
Hello world  bye jj
cat input/f2
Hello Hadoop  bye Hadoop
3????hdfs????/tmp/input??
 ./bin/hadoop fs  -mkdir /tmp
 ./bin/hadoop fs  -mkdir /tmp/input
4????f1??f2???copy??hdfs /tmp/input??
 ./bin/hadoop fs  -put input/ /tmp
5????hdfs???????f1??f2???
 ./bin/hadoop fs -ls /tmp/input/
Found 2 items
-rw-r--r--   3 spark supergroup         20 2015-01-04 19:09 /tmp/input/f1
-rw-r--r--   3 spark supergroup         25 2015-01-04 19:09 /tmp/input/f2
6?????wordcount????
 ./bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.6.1.jar wordcount /tmp/input /output
7???????wordcount???
 ./bin/hdfs dfs -cat /output/*
 
 eclipse Map/Reduce Location
 MR Master??DFS Master????????mapred-site.xml??core-site.xml????????????