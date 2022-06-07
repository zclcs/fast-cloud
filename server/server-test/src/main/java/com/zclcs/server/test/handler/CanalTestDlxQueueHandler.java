package com.zclcs.server.test.handler;

import cn.hutool.json.JSONUtil;
import com.rabbitmq.client.Channel;
import com.zclcs.common.core.constant.RabbitConstant;
import com.zclcs.common.core.entity.CanalBinLogInfo;
import com.zclcs.common.core.properties.GlobalProperties;
import com.zclcs.common.core.service.HandleCacheService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.Exchange;
import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.rabbit.annotation.QueueBinding;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

/**
 * <p>
 * canal 动态topic 死信队列 处理器
 * </p>
 *
 * @author zclcs
 */
@Slf4j
@Component
public class CanalTestDlxQueueHandler {

    private GlobalProperties globalProperties;
    private HandleCacheService handleServerTestCacheService;

    @Autowired
    public void setGlobalProperties(GlobalProperties globalProperties) {
        this.globalProperties = globalProperties;
    }

    @Autowired
    @Qualifier(value = "handleServerTestCacheService")
    public void setHandleServerTestCacheService(HandleCacheService handleServerTestCacheService) {
        this.handleServerTestCacheService = handleServerTestCacheService;
    }

    @RabbitListener(bindings = {
            @QueueBinding(
                    value = @Queue(value = RabbitConstant.CANAL_TEST_DLX_QUEUE, durable = "true"),
                    exchange = @Exchange(value = RabbitConstant.DLX_EXCHANGE),
                    key = RabbitConstant.CANAL_TEST_DLX_ROUTE_KEY
            )
    })
    public void directHandlerManualAck(String messageStruct, Message message, Channel channel) {
        // 正常队列没处理完成，便会进入该队列，在处理一次，报错要通知开发或者运维，处理完报错后，重新推送消息
        // 可能的报错：数据库挂了，或者别的问题
        final long deliveryTag = message.getMessageProperties().getDeliveryTag();
        CanalBinLogInfo canalBinLogInfo = JSONUtil.toBean(messageStruct, CanalBinLogInfo.class);
        log.info("canal test 死信队列 接收消息：{}", JSONUtil.toJsonStr(canalBinLogInfo));
        String database = canalBinLogInfo.getDatabase();
        if (database.equals(globalProperties.getDatabase().getServerSystem())) {
            try {
                handleServerTestCacheService.handleCache(canalBinLogInfo, deliveryTag, channel);
            } catch (Exception e) {
                log.error("canal test 死信队列 接收消息：{}, 出现异常 {}", messageStruct, e.getMessage(), e);
            }
        }
    }

}
