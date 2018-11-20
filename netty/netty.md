netty学习
===
[netty权威指南](http://ifeve.com/netty-2-6/)

1. Netty是什么  
Netty 是一个**异步**事件驱动的网络应用程序框架，  
用于快速开发可维护的高性能协议服务器和客户端。

2. 选择netty的理由
    1. 跟JDK NIO相比更简单易用 
    2. JDK NIO的BUG  
例如臭名昭著的epoll bug，它会导致Selector空轮询，最终导致CPU 100%
Netty和Mina的区别

3. netty的核心组件及各自的作用
[核心组件](https://blog.csdn.net/summerZBH123/article/details/79344226)
    * EventLoopGroup  
    EventLoopGroup为每个新创建的Channel分配一个EventLoop，不过一个EventLoop可能对应多个Channel（阻塞传输是一对一），所以对于所有在这个EventLoop上的Channel来说，它们的ThreadLocal都将是一样的
    * Channel  
Channel始终也只会使用一个EventLoop来处理上面的事件，所以Channel是线程安全的，不用采取一些同步措施  
Channel 的状态转换
REGISTERED->CONNECT/BIND->ACTIVE->CLOSE->INACTIVE->UNREGISTERED     
    * ChannelFuture
    * EventLoop  
EventLoop用于处理Netty的各种事件循环，一个EventLoop只会绑定到一个Thread上
    * ChannelHandler
    * ChannelPipeline

4. netty 中用到技术
    * 反应堆模式  
    ![image](images/netty-reactor.png)
    * epoll
    * bio、nio、aio

5. netty可以做什么，哪些框架底层是由netty实现的  
