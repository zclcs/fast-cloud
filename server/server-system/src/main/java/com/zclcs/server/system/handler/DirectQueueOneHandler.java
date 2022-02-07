package com.zclcs.server.system.handler;

import cn.hutool.json.JSONUtil;
import com.rabbitmq.client.Channel;
import com.zclcs.common.core.constant.RabbitConstant;
import com.zclcs.common.core.entity.MessageStruct;
import com.zclcs.common.core.entity.system.ao.SystemLogAo;
import com.zclcs.server.system.service.SystemLogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;

/**
 * <p>
 * 直接队列1 处理器
 * </p>
 *
 * @author zclcs
 */
@Slf4j
@RabbitListener(queues = RabbitConstant.DIRECT_MODE_QUEUE_ONE)
@Component
public class DirectQueueOneHandler {

    private SystemLogService logService;

    @Autowired
    public void setLogService(SystemLogService logService) {
        this.logService = logService;
    }

    /**
     * 如果 spring.rabbitmq.listener.direct.acknowledge-mode: auto，则可以用这个方式，会自动ack
     */
    // @RabbitHandler
    public void directHandlerAutoAck(MessageStruct message) {
        log.info("直接队列处理器，接收消息：{}", JSONUtil.toJsonStr(message));
    }

    @RabbitHandler
    public void directHandlerManualAck(MessageStruct messageStruct, Message message, Channel channel) {
        //  如果手动ACK,消息会被监听消费,但是消息在队列中依旧存在,如果 未配置 acknowledge-mode 默认是会在消费完毕后自动ACK掉
        final long deliveryTag = message.getMessageProperties().getDeliveryTag();
        try {
            log.info("直接队列1，手动ACK，接收消息：{}", JSONUtil.toJsonStr(messageStruct));
            SystemLogAo systemLogAo = JSONUtil.toBean(messageStruct.getMessage(), SystemLogAo.class);
            logService.saveLog(systemLogAo.getClassName(), systemLogAo.getMethodName(), systemLogAo.getParams(), systemLogAo.getIp(), systemLogAo.getOperation(), systemLogAo.getUsername(), systemLogAo.getStart());
            // 通知 MQ 消息已被成功消费,可以ACK了
            channel.basicAck(deliveryTag, false);
        } catch (IOException e) {
            try {
                // 处理失败,重新压入MQ
                channel.basicRecover();
            } catch (IOException e1) {
                log.error(e1.getMessage(), e1);
            }
        }
    }
}
