package com.zclcs.gateway.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.entity.system.RateLimitLog;
import com.zclcs.common.core.entity.system.ao.RateLimitLogAo;

/**
 * 限流拦截日志表 Service接口
 *
 * @author zclcs
 * @date 2021-12-29 17:21:34.946
 */
public interface RateLimitLogService extends IService<RateLimitLog> {

    /**
     * 新增
     *
     * @param rateLimitLogAo rateLimitLogAo
     */
    void createRateLimitLog(RateLimitLogAo rateLimitLogAo);

}
