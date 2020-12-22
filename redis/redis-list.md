## List
* lpush key value1 value2  
将一个或多个值插入到列表头部

* rpush key value1 value2  
将一个或多个值插入到列表尾部

* lpushx key value
将一个值插入到已存在的列表头部

* rpushx key value
将一个值插入到已存在的列表尾部

* lrange key start end
获取列表指定范围内的元素

* lrem key count value  
根据参数 COUNT 的值，移除列表中与参数 VALUE 相等的元素。  
COUNT 的值可以是以下几种：  
count > 0 : 从表头开始向表尾搜索，移除与 VALUE 相等的元素，数量为 COUNT 。  
count < 0 : 从表尾开始向表头搜索，移除与 VALUE 相等的元素，数量为 COUNT 的绝对值。  
count = 0 : 移除表中所有与 VALUE 相等的值

* lpop key  
移出并获取列表的第一个元素

* rpop key  
移出并获取列表的最后一个元素

* lset key index value
通过索引设置列表元素的值
ltrim key start stop  
对一个列表进行修剪(trim)，就是说，让列表只保留指定区间内的元素，不在指定区间之内的元素都将被删除