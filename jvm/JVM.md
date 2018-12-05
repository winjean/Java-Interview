[JVM参数](https://www.cnblogs.com/duanxz/p/3482366.html)  
* java 虚拟机种类: HotSpot VM、JRockit VM
* Garbage Collector
1. Serial Garbage Collector  -XX:+UseSerialGC
2. Parallel Garbage Collector(default) -XX:+UseParallelGC
3. CMS Garbage Collector (并发标记扫描) -XX:+USeParNewGC
4. G1 Garbage Collector –XX:+UseG1GC

* GC config  
example:java -Xmx12m -Xms3m -Xmn1m -XX:PermSize=20m -XX:MaxPermSize=20m -XX:+UseSerialGC -jar java-application.jar

|配置|描述|
|:---:|:---:|
|-Xms|初始化堆内存大小|
|-Xmx|堆内存最大值|
|-Xmn|新生代大小|
|-XX:PermSize|初始化永久代大小|
|-XX:MaxPermSize|永久代最大容量|