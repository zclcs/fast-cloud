package com.zclcs.server.dict.service.impl;

import cn.hutool.json.JSONUtil;
import com.rabbitmq.client.Channel;
import com.zclcs.common.core.constant.RabbitConstant;
import com.zclcs.common.core.entity.CanalBinLogInfo;
import com.zclcs.common.core.entity.MessageStruct;
import com.zclcs.server.dict.service.HandleCacheService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Service;

/**
 * @author zclcs
 */
@Service(value = "handleServerSystemCacheService")
@RequiredArgsConstructor
@Slf4j
public class HandleServerSystemCacheServiceImpl implements HandleCacheService {

    private final RabbitTemplate rabbitTemplate;

    @Override
    public void handleCache(CanalBinLogInfo canalBinLogInfo, long deliveryTag, Channel channel) throws Exception {
        if (!canalBinLogInfo.getIsDdl()) {
            //log.info("发送信息更新server-system服务缓存：{}", JSONUtil.toJsonStr(canalBinLogInfo));
            // 传递到处理系统服务缓存消息队列
            rabbitTemplate.convertAndSend(RabbitConstant.QUEUE_SERVER_SYSTEM_CACHE, new MessageStruct(JSONUtil.toJsonStr(canalBinLogInfo)));
        }
        channel.basicAck(deliveryTag, false);
    }

}
