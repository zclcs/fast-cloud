package com.zclcs.common.core.constant;

/**
 * <p>
 * RabbitMQ常量池
 * </p>
 *
 * @author zclcs
 */
public interface RabbitConstant {

    String DLX_EXCHANGE_PRE = "x-dead-letter-exchange";

    String DLX_ROUTE_KEY_PRE = "x-dead-letter-routing-key";

    /**
     * 直接模式队列1 - 记录系统日志
     */
    String QUEUE_SERVER_SYSTEM_LOG = "queue.server.system.log";

    /**
     * canal 读取 binlog 更新缓存交换器
     */
    String LOG_EXCHANGE = "exchange.log";

    /**
     * canal 读取 binlog 更新缓存交换器
     */
    String SERVER_SYSTEM_LOG_ROUTE_KEY = "server-system-log-routing-key";

    /**
     * 死信队列交换器
     */
    String DLX_EXCHANGE = "exchange.dlx";

    /**
     * canal 读取 binlog 更新缓存队列
     */
    String CANAL_QUEUE = "canal";

    /**
     * canal 读取 binlog 更新缓存交换器
     */
    String CANAL_EXCHANGE = "exchange.canal";

    /**
     * canal 读取 binlog 路由key
     */
    String CANAL_ROUTE_KEY = "canal-routing-key";

    /**
     * server-system 读取 binlog 更新缓存队列
     */
    String CANAL_SYSTEM_QUEUE = "canal.system";

    /**
     * server-system 读取 binlog 路由key
     */
    String CANAL_SYSTEM_ROUTE_KEY = "canal-system-routing-key";

    /**
     * server-system 读取 binlog 更新缓存死信队列
     */
    String CANAL_SYSTEM_DLX_QUEUE = "canal.system.dlx";

    /**
     * canal 读取 binlog 路由key
     */
    String CANAL_SYSTEM_DLX_ROUTE_KEY = "canal-system-dlx-routing-key";

    /**
     * server-dict 读取 binlog 更新缓存队列
     */
    String CANAL_DICT_QUEUE = "canal.dict";

    /**
     * server-dict 读取 binlog 路由key
     */
    String CANAL_DICT_ROUTE_KEY = "canal-dict-routing-key";

    /**
     * server-system 读取 binlog 更新缓存死信队列
     */
    String CANAL_DICT_DLX_QUEUE = "canal.dict.dlx";

    /**
     * canal 读取 binlog 路由key
     */
    String CANAL_DICT_DLX_ROUTE_KEY = "canal-dict-dlx-routing-key";

    /**
     * server-generator 读取 binlog 更新缓存队列
     */
    String CANAL_GENERATOR_QUEUE = "canal.generator";

    /**
     * server-generator 读取 binlog 路由key
     */
    String CANAL_GENERATOR_ROUTE_KEY = "canal-generator-routing-key";

    /**
     * server-generator 读取 binlog 更新缓存死信队列
     */
    String CANAL_GENERATOR_DLX_QUEUE = "canal.generator.dlx";

    /**
     * canal 读取 binlog 路由key
     */
    String CANAL_GENERATOR_DLX_ROUTE_KEY = "canal-generator-dlx-routing-key";

    /**
     * server-minio 读取 binlog 更新缓存队列
     */
    String CANAL_MINIO_QUEUE = "canal.minio";

    /**
     * server-minio 读取 binlog 路由key
     */
    String CANAL_MINIO_ROUTE_KEY = "canal-minio-routing-key";

    /**
     * server-system 读取 binlog 更新缓存死信队列
     */
    String CANAL_MINIO_DLX_QUEUE = "canal.minio.dlx";

    /**
     * canal 读取 binlog 路由key
     */
    String CANAL_MINIO_DLX_ROUTE_KEY = "canal-minio-dlx-routing-key";

    /**
     * server-test 读取 binlog 更新缓存队列
     */
    String CANAL_TEST_QUEUE = "canal.test";

    /**
     * server-test 读取 binlog 路由key
     */
    String CANAL_TEST_ROUTE_KEY = "canal-test-routing-key";

    /**
     * server-system 读取 binlog 更新缓存死信队列
     */
    String CANAL_TEST_DLX_QUEUE = "canal.test.dlx";

    /**
     * canal 读取 binlog 路由key
     */
    String CANAL_TEST_DLX_ROUTE_KEY = "canal-test-dlx-routing-key";

    /**
     * 延迟队列
     */
    String DELAY_QUEUE = "delay.queue";

    /**
     * 延迟队列交换器
     */
    String DELAY_MODE_QUEUE = "delay.mode";

}
