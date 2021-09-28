package com.zclcs.common.logging.starter.configure;

import com.zclcs.common.logging.starter.aspect.ControllerLogAspect;
import com.zclcs.common.logging.starter.properties.MyLogProperties;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author zclcs
 */
@Configuration
@EnableConfigurationProperties(MyLogProperties.class)
public class MyLogAutoConfigure {

    @ConditionalOnProperty(name = "my.log.enable-log-for-controller", havingValue = "true")
    @Bean
    public ControllerLogAspect controllerLogAspect() {
        return new ControllerLogAspect();
    }
}
