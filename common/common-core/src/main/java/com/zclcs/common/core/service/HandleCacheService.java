package com.zclcs.common.core.service;

import com.rabbitmq.client.Channel;
import com.zclcs.common.core.entity.CanalBinLogInfo;

/**
 * @author zclcs
 */
public interface HandleCacheService {

    /**
     * 处理缓存逻辑
     *
     * @param canalBinLogInfo binlog日志
     * @param deliveryTag     消息队列标识
     * @param channel         通道
     * @throws Exception 抛出异常统一处理
     */
    void handleCache(CanalBinLogInfo canalBinLogInfo, long deliveryTag, Channel channel) throws Exception;

}
