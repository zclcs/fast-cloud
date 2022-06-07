package com.zclcs.gateway.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.common.core.entity.system.RateLimitLog;
import com.zclcs.common.core.entity.system.ao.RateLimitLogAo;
import com.zclcs.common.core.utils.BaseAddressUtil;
import com.zclcs.gateway.mapper.RateLimitLogMapper;
import com.zclcs.gateway.service.RateLimitLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * 限流拦截日志表 Service实现
 *
 * @author zclcs
 * @date 2021-12-29 17:21:34.946
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class RateLimitLogServiceImpl extends ServiceImpl<RateLimitLogMapper, RateLimitLog> implements RateLimitLogService {

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createRateLimitLog(RateLimitLogAo rateLimitLogAo) {
        RateLimitLog rateLimitLog = new RateLimitLog();
        BeanUtil.copyProperties(rateLimitLogAo, rateLimitLog);
        setRateLimitLog(rateLimitLog);
        this.save(rateLimitLog);
    }

    private void setRateLimitLog(RateLimitLog rateLimitLog) {
        if (StrUtil.isNotBlank(rateLimitLog.getRateLimitLogIp())) {
            rateLimitLog.setLocation(BaseAddressUtil.getCityInfo(rateLimitLog.getRateLimitLogIp()));
        }
        rateLimitLog.setCreateBy(MyConstant.ADMIN);
    }
}
