# 分布式 ID 生成器
一个唯一 ID 在一个分布式系统中是非常重要的一个业务属性，其中包括一些如订单 ID，消息 ID ，会话 ID，他们都有一些共有的特性：  
- 全局唯一。
- 趋势递增。

全局唯一很好理解，目的就是唯一标识某个次请求，某个业务。

通常有以下几种方案：

## 基于数据库
可以利用 `MySQL` 中的自增属性 `auto_increment` 来生成全局唯一 ID，也能保证趋势递增。
但这种方式太依赖 DB，如果数据库挂了那就非常容易出问题。

### 水平扩展改进
但也有改进空间，可以将数据库水平拆分，如果拆为了两个库 A 库和 B 库。
A 库的递增方式可以是 `0 ,2 ,4 ,6`。B 库则是 `1 ,3 ,5 ,7`。这样的方式可以提高系统可用性，并且 ID 也是趋势递增的。

但也有如下一下问题：
- 想要扩容增加性能变的困难，之前已经定义好了 A B 库递增的步数，新加的数据库不好加入进来，水平扩展困难。
- 也是强依赖与数据库，并且如果其中一台挂掉了那就不是绝对递增了。

## 本地 UUID 生成
还可以采用 `UUID` 的方式生成唯一 ID，由于是在本地生成没有了网络之类的消耗，所有效率非常高。

但也有以下几个问题：
- 生成的 ID 是无序性的，不能做到趋势递增。
- 由于是字符串并且不是递增，所以不太适合用作主键。

## 采用本地时间
这种做法非常简单，可以利用本地的毫秒数加上一些业务 ID 来生成唯一ID，这样可以做到趋势递增，并且是在本地生成效率也很高。

但有一个致命的缺点:当并发量足够高的时候**唯一性**就不能保证了。

## Twitter 雪花算法

可以基于 `Twitter` 的 `Snowflake` 算法来实现。它主要是一种划分命名空间的算法，将生成的 ID 按照机器、时间等来进行标志。