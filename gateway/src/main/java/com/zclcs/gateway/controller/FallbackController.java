package com.zclcs.gateway.controller;

import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.utils.BaseRspUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

/**
 * @author zclcs
 */
@Slf4j
@RestController
public class FallbackController {

    @RequestMapping("fallback/{name}")
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public Mono<BaseRsp<String>> systemFallback(@PathVariable String name) {
        String response = "当前服务器繁忙，请稍后重试";
        log.error("{}，目标微服务：{}", response, name);
        return Mono.just(BaseRspUtil.message(response));
    }

}
