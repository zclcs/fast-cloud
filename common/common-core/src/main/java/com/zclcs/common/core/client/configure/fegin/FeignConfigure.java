package com.zclcs.common.core.client.configure.fegin;

import feign.Logger;
import org.springframework.context.annotation.Bean;

/**
 * @author zclcs
 */
public class FeignConfigure {

    @Bean
    Logger.Level feignLoggerLevel() {
        //这里记录所有，根据实际情况选择合适的日志level
        return Logger.Level.FULL;
    }
}