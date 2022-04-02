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
    String RECORD_SYSTEM_LOG_QUEUE = "queue.direct.1";

    /**
     * 队列2
     */
    String QUEUE_TWO = "queue.2";

    /**
     * 队列3
     */
    String QUEUE_THREE = "3.queue";

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
     * 分列模式
     */
    String FANOUT_MODE_QUEUE = "fanout.mode";

    /**
     * 主题模式
     */
    String TOPIC_MODE_QUEUE = "topic.mode";

    /**
     * 路由1
     */
    String TOPIC_ROUTING_KEY_ONE = "queue.#";

    /**
     * 路由2
     */
    String TOPIC_ROUTING_KEY_TWO = "*.queue";

    /**
     * 路由3
     */
    String TOPIC_ROUTING_KEY_THREE = "3.queue";

    /**
     * 延迟队列
     */
    String DELAY_QUEUE = "delay.queue";

    /**
     * 延迟队列交换器
     */
    String DELAY_MODE_QUEUE = "delay.mode";
}
