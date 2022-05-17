package com.zclcs.common.web.starter.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author zclcs
 */
@Component
@ConfigurationProperties(prefix = "my")
public class MyWebProperties {

    private Boolean enableDateConverter = true;

    public Boolean getEnableDateConverter() {
        return enableDateConverter;
    }

    public void setEnableDateConverter(Boolean enableDateConverter) {
        this.enableDateConverter = enableDateConverter;
    }

    @Override
    public String toString() {
        return "MyWebProperties{" +
                "enableDateConverter=" + enableDateConverter +
                '}';
    }
}
