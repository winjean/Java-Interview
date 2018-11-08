netty
===
[netty权威指南](http://ifeve.com/netty-2-6/)
1. 选择Netty的理由
   1. 跟JDK NIO相比更简单易用 
   2. JDK NIO的BUG  
例如臭名昭著的epoll bug，它会导致Selector空轮询，最终导致CPU 100%