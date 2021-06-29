### 缓存使用场景
* 读多写少

### 缓存模式
* Cache-Aside Pattern(旁路缓存模式)
* Read-Through/Write-through(读写穿透)  
**跟Cache-Aside比会多出Cache-Provider层**
* Write-behind(异步缓存写入)

### 缓存写入的时机
* 先写数据再写缓存(都会出现脏数据,只是这种方式稍微好一点)

### 缓存优点  
* 提升性能
* 减少数据库压力

### 缓存使用的缺点
* 数据库和缓存的数据不一致问题(强一致性、弱一致性、最终一致性)