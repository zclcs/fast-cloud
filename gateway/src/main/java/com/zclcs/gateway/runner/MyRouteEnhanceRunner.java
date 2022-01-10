package com.zclcs.gateway.runner;

import com.zclcs.gateway.service.BlackListService;
import com.zclcs.gateway.service.RateLimitRuleService;
import com.zclcs.gateway.service.RouteEnhanceCacheService;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;

/**
 * @author zclcs
 */
@RequiredArgsConstructor
public class MyRouteEnhanceRunner implements ApplicationRunner {

    private final RouteEnhanceCacheService routeEnhanceCacheService;
    private final BlackListService blackListService;
    private final RateLimitRuleService rateLimitRuleService;

    @Override
    public void run(ApplicationArguments args) {
        routeEnhanceCacheService.saveAllBlackList(blackListService.lambdaQuery().list());
        routeEnhanceCacheService.saveAllRateLimitRules(rateLimitRuleService.lambdaQuery().list());
    }
}
