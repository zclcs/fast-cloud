package com.zclcs.common.rabbitmq.starter.configure;

import com.google.common.collect.Maps;
import com.zclcs.common.core.constant.RabbitConstant;
import com.zclcs.common.rabbitmq.starter.properties.MyRabbitMqProperties;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.*;
import org.springframework.amqp.rabbit.connection.CachingConnectionFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

import java.util.Map;

/**
 * <p>
 * RabbitMQ配置，主要是配置队列，如果提前存在该队列，可以省略本配置类
 * </p>
 *
 * @author zclcs
 */
@Slf4j
@EnableConfigurationProperties(MyRabbitMqProperties.class)
@ConditionalOnProperty(value = "my.lettuce.redis.enable", havingValue = "true", matchIfMissing = true)
public class MyRabbitMqAutoConfigure {

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

    /**
     * 直接模式队列1 - 记录系统日志
     */
    @Bean
    public Queue directOneQueue() {
        return new Queue(RabbitConstant.QUEUE_SERVER_SYSTEM_LOG);
    }

    /**
     * 直接模式队列2 - 刷新系统服务缓存
     */
    @Bean
    public Queue directTwoQueue() {
        return new Queue(RabbitConstant.QUEUE_SERVER_SYSTEM_CACHE);
    }

    /**
     * canal 读取 binlog 更新缓存队列
     */
    @Bean
    public Queue canalQueue() {
        return new Queue(RabbitConstant.CANAL_QUEUE, true);
    }

    /**
     * 直接模式队列
     */
    @Bean
    public DirectExchange directExChange() {
        return new DirectExchange(RabbitConstant.CANAL_EXCHANGE);
    }

    /**
     * 直接模式绑定canal队列
     *
     * @param canalQueue     canal队列
     * @param directExChange 直接模式交换器
     */
    @Bean
    public Binding directExChangeBinding1(Queue canalQueue, DirectExchange directExChange) {
        return BindingBuilder.bind(canalQueue).to(directExChange).with(RabbitConstant.CANAL_ROUTE_KEY);
    }

    /**
     * 延迟队列
     */
    @Bean
    public Queue delayQueue() {
        return new Queue(RabbitConstant.DELAY_QUEUE, true);
    }

    /**
     * 延迟队列交换器, x-delayed-type 和 x-delayed-message 固定
     */
    @Bean
    public CustomExchange delayExchange() {
        Map<String, Object> args = Maps.newHashMap();
        args.put("x-delayed-type", "direct");
        return new CustomExchange(RabbitConstant.DELAY_MODE_QUEUE, "x-delayed-message", true, false, args);
    }

    /**
     * 延迟队列绑定自定义交换器
     *
     * @param delayQueue    队列
     * @param delayExchange 延迟交换器
     */
    @Bean
    public Binding delayBinding(Queue delayQueue, CustomExchange delayExchange) {
        return BindingBuilder.bind(delayQueue).to(delayExchange).with(RabbitConstant.DELAY_QUEUE).noargs();
    }

}
