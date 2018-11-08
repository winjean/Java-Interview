netty
===
[netty权威指南](http://ifeve.com/netty-2-6/)
1. 什么是netty

2. 选择netty的理由
    1. 跟JDK NIO相比更简单易用 
    2. JDK NIO的BUG  
例如臭名昭著的epoll bug，它会导致Selector空轮询，最终导致CPU 100%

3. netty的核心组件及各自的作用
    * Channel
    * ChannelFuture
    * EventLoop
    * ChannelHandler
    * ChannelPipeline

4. netty可以做什么，哪些框架底层是由netty实现的

