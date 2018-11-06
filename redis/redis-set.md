## Set
* sadd key value1 value2  
向集合添加一个或多个成员
* scard key  
获取集合的成员数
* smembers key  
返回集合中的所有成员
* sismember key value  
判断 member 元素是否是集合 key 的成员
* smove source destination member  
将 member 元素从 source 集合移动到 destination 集合
* spop key count  
移除并返回集合中的count随机元素
* srem key value1 value2  
移除集合中一个或多个成员