package com.zclcs.server.system.service;

import com.zclcs.common.core.entity.system.RateLimitLog;
import com.zclcs.common.core.entity.system.ao.RateLimitLogAo;
import com.zclcs.common.core.entity.system.vo.RateLimitLogVo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;

import java.util.List;

/**
 * 限流拦截日志表 Service接口
 *
 * @author zclcs
 * @date 2021-12-29 17:21:34.946
 */
public interface RateLimitLogService extends IService<RateLimitLog> {

    /**
     * 查询（分页）
     *
     * @param basePageAo basePageAo
     * @param rateLimitLogVo rateLimitLogVo
     * @return BasePage<RateLimitLogVo>
     */
    BasePage<RateLimitLogVo> findRateLimitLogPage(BasePageAo basePageAo, RateLimitLogVo rateLimitLogVo);

    /**
     * 查询（所有）
     *
     * @param rateLimitLogVo rateLimitLogVo
     * @return List<RateLimitLogVo>
     */
    List<RateLimitLogVo> findRateLimitLogList(RateLimitLogVo rateLimitLogVo);

    /**
     * 查询（单个）
     *
     * @param rateLimitLogVo rateLimitLogVo
     * @return RateLimitLogVo
     */
    RateLimitLogVo findRateLimitLog(RateLimitLogVo rateLimitLogVo);

    /**
     * 统计
     *
     * @param rateLimitLogVo rateLimitLogVo
     * @return RateLimitLogVo
     */
    Integer countRateLimitLog(RateLimitLogVo rateLimitLogVo);

    /**
     * 新增
     *
     * @param rateLimitLogAo rateLimitLogAo
     */
    void createRateLimitLog(RateLimitLogAo rateLimitLogAo);

    /**
     * 修改
     *
     * @param rateLimitLogAo rateLimitLogAo
     */
    void updateRateLimitLog(RateLimitLogAo rateLimitLogAo);

    /**
     * 删除
     *
     * @param ids ids
     */
    void deleteRateLimitLog(List<Long> ids);

}
