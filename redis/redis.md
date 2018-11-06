redis command
###

[redis](http://www.runoob.com/redis/redis-commands.html)  

* redis-cli -h host -p port -a password  
客户端连接redis

* set key value  
在redis中设置key和value值
* del keys ...  
删除redis中的一个或多个key
* type key  
获取这个key的存储类型
* exists key   
在redis中判断key是否存在
* keys key  
查找redis中是否存在某个key，可以用*，?,[]进行配置  
\*匹配一个或多个字符  
\?匹配一个字符  
[]配置方括号中某一个字符
* rename key newKey  
重命名key
* ttl key  
作用: 查询key的生命周期  
返回: 秒数   
注:对于不存在的key或已过期的key/不过期的key,都返回-1  
Redis2.8中,对于不存在的key,返回-2
* expire key 整型值  
作用: 设置key的生命周期,以秒为单位  
同理:   
pexpire key 毫秒数,设置生命周期  
pttl key, 以毫秒返回生命周期  
* persist key  
作用: 把指定key置为永久有效