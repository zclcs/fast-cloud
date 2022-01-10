package com.zclcs.gateway.configure;

import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.gateway.runner.MyRouteEnhanceRunner;
import com.zclcs.gateway.service.BlackListService;
import com.zclcs.gateway.service.RateLimitRuleService;
import com.zclcs.gateway.service.RouteEnhanceCacheService;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.ThreadPoolExecutor;

/**
 * @author zclcs
 */
@EnableAsync
@Configuration
@MapperScan("com.zclcs.gateway.mapper")
public class MyRouteEnhanceConfigure {

    @Bean(MyConstant.ASYNC_POOL)
    public ThreadPoolTaskExecutor asyncThreadPoolTaskExecutor() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        executor.setCorePoolSize(5);
        executor.setMaxPoolSize(20);
        executor.setQueueCapacity(100);
        executor.setKeepAliveSeconds(30);
        executor.setThreadNamePrefix("My-Gateway-Async-Thread");
        executor.setWaitForTasksToCompleteOnShutdown(true);
        executor.setAwaitTerminationSeconds(60);
        executor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());
        executor.initialize();
        return executor;
    }

    @Bean
    public ApplicationRunner myRouteEnhanceRunner(RouteEnhanceCacheService routeEnhanceCacheService,
                                                  BlackListService blackListService,
                                                  RateLimitRuleService rateLimitRuleService) {
        return new MyRouteEnhanceRunner(routeEnhanceCacheService, blackListService, rateLimitRuleService);
    }
}
