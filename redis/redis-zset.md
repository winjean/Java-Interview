## zset
* zadd key score1 member1 score2 member2  
向有序集合添加一个或多个成员，或者更新已存在成员的分数
* zcard key  
获取有序集合的成员数
* zcount key min max  
计算在有序集合中指定区间分数的成员数
* zincrby key increment member  
有序集合中对指定成员的分数加上增量 increment
* zrange key start stop \[withscores\]  
通过索引区间返回有序集合成指定区间内的成员
* zrank key member  
返回有序集合中指定成员的索引
* zrem key members  
移除有序集合中的一个或多个成员
* zscore key member  
返回有序集中，成员的分数值