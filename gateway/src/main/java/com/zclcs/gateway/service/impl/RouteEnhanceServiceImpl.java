package com.zclcs.gateway.service.impl;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.google.common.base.Stopwatch;
import com.zclcs.common.core.constant.ParamsConstant;
import com.zclcs.common.core.entity.system.BlackList;
import com.zclcs.common.core.entity.system.RateLimitRule;
import com.zclcs.common.core.entity.system.ao.BlockLogAo;
import com.zclcs.common.core.entity.system.ao.RateLimitLogAo;
import com.zclcs.common.core.entity.system.ao.RouteLogAo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.common.core.utils.BaseUtil;
import com.zclcs.gateway.service.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.cloud.gateway.route.Route;
import org.springframework.cloud.gateway.support.ServerWebExchangeUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Service;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.net.URI;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * @author zclcs
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class RouteEnhanceServiceImpl implements RouteEnhanceService {

    private static final String METHOD_ALL = "ALL";
    private static final String TOKEN_CHECK_URL = "/oath2/info";
    private final RouteLogService routeLogService;
    private final BlockLogService blockLogService;
    private final RateLimitLogService rateLimitLogService;
    private final RouteEnhanceCacheService routeEnhanceCacheService;
    private final AntPathMatcher pathMatcher = new AntPathMatcher();

    @Override
    public Mono<Void> filterBlackList(ServerWebExchange exchange) {
        Stopwatch stopwatch = Stopwatch.createStarted();
        ServerHttpRequest request = exchange.getRequest();
        ServerHttpResponse response = exchange.getResponse();
        try {
            URI originUri = getGatewayOriginalRequestUrl(exchange);
            if (originUri != null) {
                String requestIp = BaseUtil.getServerHttpRequestIpAddress(request);
                String requestMethod = request.getMethodValue();
                AtomicBoolean forbid = new AtomicBoolean(false);
                Set<Object> blackList = routeEnhanceCacheService.getBlackList(requestIp);
                blackList.addAll(routeEnhanceCacheService.getBlackList());

                doBlackListCheck(forbid, blackList, originUri, requestMethod);

                log.info("Blacklist verification completed - {}", stopwatch.stop());
                if (forbid.get()) {
                    return BaseUtil.makeWebFluxResponse(response, MediaType.APPLICATION_JSON_VALUE,
                            HttpStatus.NOT_ACCEPTABLE, BaseRspUtil.message("黑名单限制，禁止访问"));
                }
            } else {
                log.info("Request IP not obtained, no blacklist check - {}", stopwatch.stop());
            }
        } catch (Exception e) {
            log.warn("Blacklist verification failed : {} - {}", e.getMessage(), stopwatch.stop());
        }
        return null;
    }

    @Override
    public Mono<Void> filterRateLimit(ServerWebExchange exchange) {
        Stopwatch stopwatch = Stopwatch.createStarted();
        ServerHttpRequest request = exchange.getRequest();
        ServerHttpResponse response = exchange.getResponse();
        try {
            URI originUri = getGatewayOriginalRequestUrl(exchange);
            if (originUri != null) {
                String requestIp = BaseUtil.getServerHttpRequestIpAddress(request);
                String requestMethod = request.getMethodValue();
                AtomicBoolean limit = new AtomicBoolean(false);
                Object o = routeEnhanceCacheService.getRateLimitRule(originUri.getPath(), METHOD_ALL);
                if (o == null) {
                    o = routeEnhanceCacheService.getRateLimitRule(originUri.getPath(), requestMethod);
                }
                if (o != null) {
                    RateLimitRule rule = (RateLimitRule) o;
                    Mono<Void> result = doRateLimitCheck(limit, rule, originUri, requestIp, requestMethod, response);
                    log.info("Rate limit verification completed - {}", stopwatch.stop());
                    if (result != null) {
                        return result;
                    }
                }
            } else {
                log.info("Request IP not obtained, no rate limit filter - {}", stopwatch.stop());
            }
        } catch (Exception e) {
            log.warn("Current limit failure : {} - {}", e.getMessage(), stopwatch.stop());
        }
        return null;
    }

    @Override
    public void saveRequestLogs(ServerWebExchange exchange) {
        URI originUri = getGatewayOriginalRequestUrl(exchange);
        // /auth/user为令牌校验请求，是系统自发行为，非用户请求，故不记录
        if (!StringUtils.equalsIgnoreCase(TOKEN_CHECK_URL, originUri.getPath())) {
            URI url = getGatewayRequestUrl(exchange);
            Route route = getGatewayRoute(exchange);
            ServerHttpRequest request = exchange.getRequest();
            String ipAddress = BaseUtil.getServerHttpRequestIpAddress(request);
            if (url != null && route != null) {
                RouteLogAo routeLog = RouteLogAo.builder()
                        .routeIp(ipAddress)
                        .requestUri(originUri.getPath())
                        .targetServer(route.getId())
                        .targetUri(url.getPath())
                        .requestMethod(request.getMethodValue())
                        .build();
                routeLogService.createRouteLog(routeLog);
            }
        }
    }

    @Override
    public void saveBlockLogs(ServerWebExchange exchange) {
        URI originUri = getGatewayOriginalRequestUrl(exchange);
        ServerHttpRequest request = exchange.getRequest();
        String requestIp = BaseUtil.getServerHttpRequestIpAddress(request);
        if (originUri != null) {
            BlockLogAo blockLog = BlockLogAo.builder()
                    .blockIp(requestIp)
                    .requestMethod(request.getMethodValue())
                    .requestUri(originUri.getPath())
                    .build();
            blockLogService.createBlockLog(blockLog);
            log.info("Store blocked request logs >>>");
        }
    }

    @Override
    public void saveRateLimitLogs(ServerWebExchange exchange) {
        URI originUri = getGatewayOriginalRequestUrl(exchange);
        ServerHttpRequest request = exchange.getRequest();
        String requestIp = BaseUtil.getServerHttpRequestIpAddress(request);
        if (originUri != null) {
            RateLimitLogAo rateLimitLog = RateLimitLogAo.builder()
                    .rateLimitLogIp(requestIp)
                    .requestMethod(request.getMethodValue())
                    .requestUri(originUri.getPath())
                    .build();
            rateLimitLogService.createRateLimitLog(rateLimitLog);
            log.info("Store rate limit logs >>>");
        }
    }

    private void doBlackListCheck(AtomicBoolean forbid, Set<Object> blackList, URI uri, String requestMethod) {
        for (Object o : blackList) {
            BlackList b = (BlackList) o;
            if (pathMatcher.match(b.getRequestUri(), uri.getPath()) && ParamsConstant.OPEN.equals(b.getBlackStatus())) {
                if (ParamsConstant.METHOD_ALL.equalsIgnoreCase(b.getRequestMethod())
                        || StringUtils.equalsIgnoreCase(requestMethod, b.getRequestMethod())) {
                    checkTime(forbid, b.getLimitFrom(), b.getLimitTo());
                }
            }
            if (forbid.get()) {
                break;
            }
        }
    }

    private Mono<Void> doRateLimitCheck(AtomicBoolean limit, RateLimitRule rule, URI uri,
                                        String requestIp, String requestMethod, ServerHttpResponse response) {
        boolean isRateLimitRuleHit = ParamsConstant.OPEN.equals(rule.getRuleStatus())
                && (ParamsConstant.METHOD_ALL.equalsIgnoreCase(rule.getRequestMethod())
                || StrUtil.equalsIgnoreCase(requestMethod, rule.getRequestMethod()));
        if (isRateLimitRuleHit) {
            checkTime(limit, rule.getLimitFrom(), rule.getLimitTo());
        }
        if (limit.get()) {
            String requestUri = uri.getPath();
            int count = routeEnhanceCacheService.getCurrentRequestCount(requestUri, requestIp);
            if (count == 0) {
                routeEnhanceCacheService.setCurrentRequestCount(requestUri, requestIp, Long.parseLong(rule.getIntervalSec()));
            } else if (count >= rule.getRateLimitCount()) {
                return BaseUtil.makeWebFluxResponse(response, MediaType.APPLICATION_JSON_VALUE,
                        HttpStatus.TOO_MANY_REQUESTS, BaseRspUtil.message("访问频率超限，请稍后再试"));
            } else {
                routeEnhanceCacheService.incrCurrentRequestCount(requestUri, requestIp);
            }
        }
        return null;
    }

    private void checkTime(AtomicBoolean checkTime, String limitFrom, String limitTo) {
        if (StrUtil.isNotBlank(limitFrom) && StrUtil.isNotBlank(limitTo)) {
            DateTime now = DateUtil.date();
            DateTime limitFromTime = DateUtil.parse(now.toString(DatePattern.NORM_DATE_PATTERN) + StrUtil.SPACE + limitFrom, DatePattern.NORM_DATETIME_PATTERN);
            DateTime limitToTime = DateUtil.parse(now.toString(DatePattern.NORM_DATE_PATTERN) + StrUtil.SPACE + limitTo, DatePattern.NORM_DATETIME_PATTERN);
            if (DateUtil.isIn(now, limitFromTime, limitToTime)) {
                checkTime.set(true);
            }
        } else {
            checkTime.set(true);
        }
    }

    private URI getGatewayOriginalRequestUrl(ServerWebExchange exchange) {
        LinkedHashSet<URI> uris = exchange.getAttribute(ServerWebExchangeUtils.GATEWAY_ORIGINAL_REQUEST_URL_ATTR);
        URI originUri = null;
        if (uris != null) {
            originUri = uris.stream().findFirst().orElse(null);
        }
        return originUri;
    }

    private URI getGatewayRequestUrl(ServerWebExchange exchange) {
        return exchange.getAttribute(ServerWebExchangeUtils.GATEWAY_REQUEST_URL_ATTR);
    }

    private Route getGatewayRoute(ServerWebExchange exchange) {
        return exchange.getAttribute(ServerWebExchangeUtils.GATEWAY_ROUTE_ATTR);
    }
}
