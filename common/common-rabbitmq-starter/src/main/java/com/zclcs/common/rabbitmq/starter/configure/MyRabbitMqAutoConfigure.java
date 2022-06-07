package com.zclcs.common.rabbitmq.starter.configure;

import com.zclcs.common.core.properties.GlobalProperties;
import com.zclcs.common.rabbitmq.starter.properties.MyRabbitMqProperties;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.connection.CachingConnectionFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

/**
 * <p>
 * RabbitMQ配置，主要是配置队列，如果提前存在该队列，可以省略本配置类
 * </p>
 *
 * @author zclcs
 */
@Slf4j
@EnableConfigurationProperties({MyRabbitMqProperties.class, GlobalProperties.class})
@ConditionalOnProperty(value = "my.lettuce.redis.enable", havingValue = "true", matchIfMissing = true)
public class MyRabbitMqAutoConfigure {

    private MyRabbitMqProperties myRabbitMqProperties;

    private GlobalProperties globalProperties;

    public MyRabbitMqAutoConfigure(MyRabbitMqProperties myRabbitMqProperties, GlobalProperties globalProperties) {
        this.myRabbitMqProperties = myRabbitMqProperties;
        this.globalProperties = globalProperties;
    }

    @Bean(name = "rabbitTemplate")
    public RabbitTemplate rabbitTemplate(CachingConnectionFactory connectionFactory) {
        connectionFactory.setPublisherConfirmType(CachingConnectionFactory.ConfirmType.CORRELATED);
        connectionFactory.setPublisherReturns(true);
        RabbitTemplate rabbitTemplate = new RabbitTemplate(connectionFactory);
        rabbitTemplate.setMandatory(true);
        rabbitTemplate.setConfirmCallback((correlationData, ack, cause) ->
                log.info("消息发送成功:correlationData({}),ack({}),cause({})", correlationData, ack, cause));
        rabbitTemplate.setReturnCallback((message, replyCode, replyText, exchange, routingKey) ->
                log.info("消息丢失:exchange({}),route({}),replyCode({}),replyText({}),message:{}", exchange, routingKey, replyCode, replyText, message));
        return rabbitTemplate;
    }

}
