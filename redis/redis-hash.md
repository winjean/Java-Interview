## Hash
* hset key field value  
在redis中设置hash表的字段

* hmset key field1 value1 field2 value2  
在redis中设置hash表的多个字段

* hget key field  
获取指定key中某一个field

* hmget key field1 field2  
获取key中多个field

* hkeys key  
获取所有哈希表中的字段

* hlen key  
获取所有哈希表中的字段

* hsetnx key field value  
只有在字段 field 不存在时，设置哈希表字段的值

* hvals key  
获取哈希表中所有值
