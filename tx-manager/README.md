# 分布式事务介绍

## LCN模式

* ### LCN模式的基本原理：

> 通过代理Connection的方式实现对本地事务的操作，然后再由TxManager统一协调控制事务。当本地事务提交回滚或者关闭连接时将会执行假操作，该代理的连接将由LCN连接池管理。

* ### 特点：

> * 该模式对代码的嵌入性为低（加注解就好了）。
> * 该模式仅限于本地存在连接对象且可通过连接对象控制事务的模块。
> * 该模式下的事务提交与回滚是由本地事务方控制，对于数据一致性上有较高的保障。
> * 该模式缺陷在于代理的连接需要随事务发起方一共释放连接，增加了连接占用的时间。

## TCC模式

* ### TCC模式基本原理：

> TCC事务机制相对于传统事务机制（X/Open XA Two-Phase-Commit），其特征在于它不依赖资源管理器(RM)对XA的支持，而是通过对（由业务系统提供的）业务逻辑的调度来实现分布式事务。主要由三步操作，Try: 尝试执行业务、 Confirm:确认执行业务、 Cancel: 取消执行业务。

* ### 特点：

> * 该模式对代码的嵌入性高，要求每个业务需要写三种步骤的操作。
> * 该模式对有无本地事务控制都可以支持使用面广。
> * 数据一致性控制几乎完全由开发者控制，对业务开发难度要求高

## TXC模式

* ### TXC模式基本原理：

> TXC模式命名来源于淘宝，实现原理是在执行SQL之前，先查询SQL的影响数据，然后保存执行的SQL快走信息和创建锁。当需要回滚的时候就采用这些记录数据回滚数据库，目前锁实现依赖redis分布式锁控制。

* ### 特点：

> * 该模式同样对代码的嵌入性低。
> * 该模式仅限于对支持SQL方式的模块支持。
> * 该模式由于每次执行SQL之前需要先查询影响数据，因此相比LCN模式消耗资源与时间要多。
> * 该模式不会占用数据库的连接资源。