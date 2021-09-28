package com.zclcs.gateway.enhance.configure;

import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.gateway.enhance.runner.MyRouteEnhanceRunner;
import com.zclcs.gateway.enhance.service.BlackListService;
import com.zclcs.gateway.enhance.service.RateLimitRuleService;
import com.zclcs.gateway.enhance.service.RouteEnhanceCacheService;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.repository.config.EnableReactiveMongoRepositories;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.ThreadPoolExecutor;

/**
 * @author zclcs
 */
@EnableAsync
@Configuration
@EnableReactiveMongoRepositories(basePackages = "com.zclcs.gateway.enhance.mapper")
@ConditionalOnProperty(name = "my.gateway.enhance", havingValue = "true")
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
    public ApplicationRunner myRouteEnhanceRunner(RouteEnhanceCacheService cacheService,
                                                  BlackListService blackListService,
                                                  RateLimitRuleService rateLimitRuleService) {
        return new MyRouteEnhanceRunner(cacheService, blackListService, rateLimitRuleService);
    }
}
