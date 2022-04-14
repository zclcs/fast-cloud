package com.zclcs.common.core.constant;

/**
 * <p>
 * RabbitMQ常量池
 * </p>
 *
 * @author zclcs
 */
public interface RabbitConstant {

    /**
     * 直接模式队列1 - 记录系统日志
     */
    String QUEUE_SERVER_SYSTEM_LOG = "queue.server.system.log";

    /**
     * 直接模式队列2 - 处理系统服务缓存
     */
    String QUEUE_SERVER_SYSTEM_CACHE = "queue.server.system.cache";

    /**
     * canal 读取 binlog 更新缓存队列
     */
    String CANAL_QUEUE = "canal";

    /**
     * canal 读取 binlog 更新缓存交换器
     */
    String CANAL_EXCHANGE = "exchange.canal";

    /**
     * canal 读取 binlog 更新缓存交换器
     */
    String CANAL_ROUTE_KEY = "canal-routing-key";

    /**
     * 延迟队列
     */
    String DELAY_QUEUE = "delay.queue";

    /**
     * 延迟队列交换器
     */
    String DELAY_MODE_QUEUE = "delay.mode";

}
