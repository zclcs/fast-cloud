package com.zclcs.server.dict.service.impl;

import com.rabbitmq.client.Channel;
import com.zclcs.common.core.entity.CanalBinLogInfo;
import com.zclcs.server.dict.service.HandleCacheService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * @author zclcs
 */
@Service(value = "handleServerSystemCacheService")
@RequiredArgsConstructor
@Slf4j
public class HandleServerSystemCacheServiceImpl implements HandleCacheService {

    @Override
    public void handleCache(CanalBinLogInfo canalBinLogInfo, long deliveryTag, Channel channel) throws Exception {
        // :TODO 处理系统服务的相关缓存刷新逻辑
        channel.basicAck(deliveryTag, false);
    }

}
