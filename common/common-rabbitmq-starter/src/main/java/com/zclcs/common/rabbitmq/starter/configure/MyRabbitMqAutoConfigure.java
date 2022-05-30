package com.zclcs.common.rabbitmq.starter.configure;

import com.google.common.collect.Maps;
import com.zclcs.common.core.constant.RabbitConstant;
import com.zclcs.common.core.properties.GlobalProperties;
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

    /**
     * 直接模式队列1 - 记录系统日志
     */
    @Bean
    public Queue directOneQueue() {
        return new Queue(RabbitConstant.QUEUE_SERVER_SYSTEM_LOG);
    }

    /**
     * canal 读取 binlog 更新缓存队列
     */
    @Bean
    public Queue canalQueue() {
        return new Queue(RabbitConstant.CANAL_QUEUE, true);
    }

    /**
     * canal 读取 binlog 更新缓存交换器
     */
    @Bean
    public DirectExchange canalExChange() {
        return new DirectExchange(RabbitConstant.CANAL_EXCHANGE);
    }

    /**
     * 直接模式绑定canal队列
     *
     * @param canalQueue    canal队列
     * @param canalExChange 直接模式交换器
     */
    @Bean
    public Binding canalExChangeBinding(Queue canalQueue, DirectExchange canalExChange) {
        return BindingBuilder.bind(canalQueue).to(canalExChange).with(RabbitConstant.CANAL_ROUTE_KEY);
    }

    /**
     * canal system 读取 binlog 更新缓存队列
     */
    @Bean
    public Queue canalSystemQueue() {
        return new Queue(RabbitConstant.CANAL_SYSTEM_QUEUE, true);
    }

    /**
     * system 直接模式绑定canal队列
     *
     * @param canalSystemQueue canal队列
     * @param canalExChange    直接模式交换器
     */
    @Bean
    public Binding canalSystemExChangeBinding(Queue canalSystemQueue, DirectExchange canalExChange) {
        return BindingBuilder.bind(canalSystemQueue).to(canalExChange).with(RabbitConstant.CANAL_SYSTEM_ROUTE_KEY);
    }

    /**
     * canal dict 读取 binlog 更新缓存队列
     */
    @Bean
    public Queue canalDictQueue() {
        return new Queue(RabbitConstant.CANAL_DICT_QUEUE, true);
    }

    /**
     * dict 直接模式绑定canal队列
     *
     * @param canalDictQueue canal队列
     * @param canalExChange  直接模式交换器
     */
    @Bean
    public Binding canalDictExChangeBinding(Queue canalDictQueue, DirectExchange canalExChange) {
        return BindingBuilder.bind(canalDictQueue).to(canalExChange).with(RabbitConstant.CANAL_DICT_ROUTE_KEY);
    }

    /**
     * canal generator 读取 binlog 更新缓存队列
     */
    @Bean
    public Queue canalGeneratorQueue() {
        return new Queue(RabbitConstant.CANAL_GENERATOR_QUEUE, true);
    }

    /**
     * generator 直接模式绑定canal队列
     *
     * @param canalGeneratorQueue canal队列
     * @param canalExChange       直接模式交换器
     */
    @Bean
    public Binding canalGeneratorExChangeBinding(Queue canalGeneratorQueue, DirectExchange canalExChange) {
        return BindingBuilder.bind(canalGeneratorQueue).to(canalExChange).with(RabbitConstant.CANAL_GENERATOR_ROUTE_KEY);
    }

    /**
     * canal system 读取 binlog 更新缓存队列
     */
    @Bean
    public Queue canalMinioQueue() {
        return new Queue(RabbitConstant.CANAL_MINIO_QUEUE, true);
    }

    /**
     * system 直接模式绑定canal队列
     *
     * @param canalMinioQueue canal队列
     * @param canalExChange   直接模式交换器
     */
    @Bean
    public Binding canalMinioExChangeBinding(Queue canalMinioQueue, DirectExchange canalExChange) {
        return BindingBuilder.bind(canalMinioQueue).to(canalExChange).with(RabbitConstant.CANAL_MINIO_ROUTE_KEY);
    }

    /**
     * canal test 读取 binlog 更新缓存队列
     */
    @Bean
    public Queue canalTestQueue() {
        return new Queue(RabbitConstant.CANAL_TEST_QUEUE, true);
    }

    /**
     * test 直接模式绑定canal队列
     *
     * @param canalTestQueue canal队列
     * @param canalExChange  直接模式交换器
     */
    @Bean
    public Binding canalTestExChangeBinding(Queue canalTestQueue, DirectExchange canalExChange) {
        return BindingBuilder.bind(canalTestQueue).to(canalExChange).with(RabbitConstant.CANAL_TEST_ROUTE_KEY);
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
