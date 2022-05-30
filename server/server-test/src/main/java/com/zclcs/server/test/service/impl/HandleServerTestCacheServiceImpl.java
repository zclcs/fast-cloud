package com.zclcs.server.test.service.impl;

import com.rabbitmq.client.Channel;
import com.zclcs.common.core.entity.CanalBinLogInfo;
import com.zclcs.common.core.service.HandleCacheService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * @author zclcs
 */
@Service(value = "handleServerTestCacheService")
@RequiredArgsConstructor
@Slf4j
public class HandleServerTestCacheServiceImpl implements HandleCacheService {

    @Override
    public void handleCache(CanalBinLogInfo canalBinLogInfo, long deliveryTag, Channel channel) throws Exception {
        // 目前该服务暂时没有缓存相关 直接ack
        channel.basicAck(deliveryTag, false);
    }

}
