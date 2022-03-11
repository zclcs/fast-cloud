package com.zclcs.common.rabbitmq.starter.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * @author zclcs
 */
@ConfigurationProperties(prefix = "my.rabbit.mq")
public class MyRabbitMqProperties {

    /**
     * 是否开启
     */
    private Boolean enable = true;

    public Boolean getEnable() {
        return enable;
    }

    public void setEnable(Boolean enable) {
        this.enable = enable;
    }

    @Override
    public String toString() {
        return "MyRabbitMqProperties{" +
                "enable=" + enable +
                '}';
    }
}
