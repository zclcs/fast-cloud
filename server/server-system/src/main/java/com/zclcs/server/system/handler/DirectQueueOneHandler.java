package com.zclcs.server.system.handler;

import cn.hutool.json.JSONUtil;
import com.rabbitmq.client.Channel;
import com.zclcs.common.core.constant.RabbitConstant;
import com.zclcs.common.core.entity.MessageStruct;
import com.zclcs.common.core.entity.system.ao.SystemLogAo;
import com.zclcs.server.system.service.SystemLogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.Exchange;
import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.rabbit.annotation.QueueBinding;
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
@Component
public class DirectQueueOneHandler {

    private SystemLogService logService;

    @Autowired
    public void setLogService(SystemLogService logService) {
        this.logService = logService;
    }

    @RabbitListener(bindings = {
            @QueueBinding(
                    value = @Queue(value = RabbitConstant.QUEUE_SERVER_SYSTEM_LOG, durable = "true"),
                    exchange = @Exchange(value = RabbitConstant.LOG_EXCHANGE),
                    key = RabbitConstant.SERVER_SYSTEM_LOG_ROUTE_KEY
            )
    })
    public void directHandlerManualAck(MessageStruct messageStruct, Message message, Channel channel) {
        //  如果手动ACK,消息会被监听消费,但是消息在队列中依旧存在,如果 未配置 acknowledge-mode 默认是会在消费完毕后自动ACK掉
        final long deliveryTag = message.getMessageProperties().getDeliveryTag();
        try {
            //log.info("直接队列1，处理系统日志，手动ACK，接收消息：{}", messageStruct.getMessage());
            SystemLogAo systemLogAo = JSONUtil.toBean(messageStruct.getMessage(), SystemLogAo.class);
            logService.saveLog(systemLogAo.getClassName(), systemLogAo.getMethodName(), systemLogAo.getParams(), systemLogAo.getIp(), systemLogAo.getOperation(), systemLogAo.getUsername(), systemLogAo.getStart());
            // 通知 MQ 消息已被成功消费,可以ACK了
            channel.basicAck(deliveryTag, false);
        } catch (IOException e) {
            try {
                // 处理失败,直接丢弃这条日志
                channel.basicAck(deliveryTag, false);
            } catch (IOException e1) {
                log.error(e1.getMessage(), e1);
            }
        }
    }
}
