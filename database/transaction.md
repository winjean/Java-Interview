# **PROPAGATION**  
* PROPAGATION_REQUIRED -- default  
* PROPAGATION_SUPPORTS  
* PROPAGATION_MANDATORY  
* PROPAGATION_REQUIRES_NEW  
* PROPAGATION_NOT_SUPPORTED  
* PROPAGATION_NEVER  
* PROPAGATION_NESTED  

# **ISOLATION**  
* TRANSACTION_READ_UNCOMMITTED -- dirty reads, non-repeatable reads and phantom reads  
* TRANSACTION_READ_COMMITTED -- non-repeatable reads and phantom reads  
* TRANSACTION_REPEATABLE_READ  -- phantom reads  
* TRANSACTION_SERIALIZABLE  

# **TRANSACTION**  
## 刚性事务  
刚性事务的理论基础-ACID原则  
* 原子性(Atomicity)  
事务必须是原子工作单元；对于其数据修改，要么全都执行，要么全都不执行。  
比如转账，要么转账成功，账户余额增加（减少）；要么转账失败，账户余额不变。
* 一致性(Consistency)  
事务在完成时，必须使所有的数据都保持一致状态。  
在相关数据库中，所有规则都必须应用于事务的修改，以保持所有数据的完整性。事务结束时，所有的内部数据结构（如 B 树索引或双向链表）都必须是正确的。  
某些维护一致性的责任由应用程序开发人员承担，他们必须确保应用程序已强制所有已知的完整性约束。例如，当开发用于转帐的应用程序时，应避免在转帐过程中任意移动小数点。
* 隔离性(Isolation)  
由并发事务所作的修改必须与任何其它并发事务所作的修改隔离。  
事务查看数据时数据所处的状态，要么是另一并发事务修改它之前的状态，要么是另一事务修改它之后的状态，事务不会查看中间状态的数据。  
这称为隔离性，因为它能够重新装载起始数据，并且重播一系列事务，以使数据结束时的状态与原始事务执行的状态相同。  
当事务可序列化时将获得最高的隔离级别。在此级别上，从一组可并行执行的事务获得的结果与通过连续运行每个事务所获得的结果相同。  
由于高度隔离会限制可并行执行的事务数，所以一些应用程序降低隔离级别以换取更大的吞吐量。
* 持久性(Durability)  
事务完成之后，它对于系统的影响是永久性的。该修改即使出现致命的系统故障也将一直保持。  
例如我们在使用JDBC操作数据库时，在提交事务方法后，提示用户事务操作完成，当我们程序执行完成直到看到提示后，就可以认定事务以及正确提交，即使这时候数据库出现了问题，也必须要将我们的事务完全执行完成，否则就会造成我们看到提示事务处理完毕，但是数据库因为故障而没有执行事务的重大错误。
##刚性事务的实现方案
* WAL（Write ahead logging）
* 影子分页（Shadow paging）
* 两阶段型

##分布式事务
分布式事务的理论基础-CAP理论
* 一致性（Consistency）
* 可用性（Availability）
* 分区容错性（Partition tolerance）

##柔性事务
柔性事务的理论基础-BASE理论
* 基本可用（Basically Available）
* 软状态（Soft state）
* 最终一致性（Eventually consistent）

##柔性事务的实现
* 补偿型
* 异步确保型
* 最大努力型