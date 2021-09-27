package com.zclcs.common.logging.starter.configure;

import ch.qos.logback.classic.Logger;
import ch.qos.logback.classic.LoggerContext;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zclcs.common.logging.starter.aspect.ControllerLogAspect;
import com.zclcs.common.logging.starter.properties.MyLogProperties;
import net.logstash.logback.appender.LogstashTcpSocketAppender;
import net.logstash.logback.encoder.LogstashEncoder;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;

/**
 * @author xuefrye
 */
@Configuration
@EnableConfigurationProperties(MyLogProperties.class)
public class MyLogAutoConfigure {
    private static final LoggerContext CONTEXT;
    private static final Logger ROOTLOGGER;

    static {
        CONTEXT = (LoggerContext) LoggerFactory.getILoggerFactory();
        ROOTLOGGER = CONTEXT.getLogger("ROOT");
    }

    private final MyLogProperties properties;
    @Value("${spring.application.name}")
    private String applicationName;

    public MyLogAutoConfigure(MyLogProperties properties) {
        this.properties = properties;
    }

    @ConditionalOnProperty(name = "my.log.LOG_ENABLE_LOG_FOR_CONTROLLER", havingValue = "true")
    @Bean
    public ControllerLogAspect controllerLogAspect() {
        return new ControllerLogAspect();
    }

    @ConditionalOnProperty(name = "my.log.LOG_ENABLE_ELK", havingValue = "true")
    @Bean
    public void enableElk() throws JsonProcessingException {
        LogstashTcpSocketAppender appender = new LogstashTcpSocketAppender();
        LogstashEncoder encoder = new LogstashEncoder();

        HashMap<String, String> customFields = new HashMap<>(2);
        customFields.put("application-name", applicationName);
        String customFieldsString = new ObjectMapper().writeValueAsString(customFields);
        encoder.setCustomFields(customFieldsString);

        appender.setEncoder(encoder);
        appender.addDestination(properties.getLogstashHost());
        appender.setName("logstash[" + applicationName + "]");
        appender.start();
        appender.setContext(CONTEXT);
        ROOTLOGGER.addAppender(appender);
    }
}
