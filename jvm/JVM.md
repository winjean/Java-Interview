[JVM参数](https://www.cnblogs.com/duanxz/p/3482366.html)  
[oracle vm options](https://www.oracle.com/technetwork/java/javase/tech/vmoptions-jsp-140102.html)
* java 虚拟机种类  
    HotSpot VM  
    JRockit VM  
example:java -Xmx12m -Xms3m -Xmn1m -XX:PermSize=20m -XX:MaxPermSize=20m -XX:+UseSerialGC -jar java-application.jar
* Garbage Collector type

|GC type|desc|
|:---:|:---:|
|Serial Garbage Collector|-XX:+UseSerialGC|
|Parallel Garbage Collector(default)| -XX:+UseParallelGC|
|CMS Garbage Collector (并发标记扫描)| -XX:+USeParNewGC|
|G1 Garbage Collector| –XX:+UseG1GC|

* heap config  

|value|desc|
|:---:|:---:|
|Xss|每个线程的stack大小（栈）|
|-Xms|初始化堆内存大小|
|-Xmx|堆内存最大值|
|-Xmn|新生代大小|
|-XX:PermSize|初始化永久代大小(jdk8以后已取消)|
|-XX:MaxPermSize|永久代最大容量(jdk8以后已取消)|
|-XX:MetaspaceSize|取代PermSize|
|-XX:MaxMetaspaceSize|MaxPermSize
|-XX:SurvivorRatio|年轻代中Eden区与两个Survivor区的比值。注意Survivor区有两个。如：3，表示Eden：Survivor=3：2，一个Survivor区占整个年轻代的1/5|
|-XX:NewSize|设置年轻代大小|
|-XX:NewRatio|设置年轻代和年老代的比值。如:为3，表示年轻代与年老代比值为1：3，年轻代占整个年轻代年老代和的1/4|
