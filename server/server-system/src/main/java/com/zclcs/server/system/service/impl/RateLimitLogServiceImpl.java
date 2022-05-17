package com.zclcs.server.system.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.entity.system.RateLimitLog;
import com.zclcs.common.core.entity.system.ao.RateLimitLogAo;
import com.zclcs.common.core.entity.system.vo.RateLimitLogVo;
import com.zclcs.common.core.utils.BaseAddressUtil;
import com.zclcs.common.core.utils.BaseQueryWrapperUtil;
import com.zclcs.server.system.mapper.RateLimitLogMapper;
import com.zclcs.server.system.service.RateLimitLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
    public BasePage<RateLimitLogVo> findRateLimitLogPage(BasePageAo basePageAo, RateLimitLogVo rateLimitLogVo) {
        BasePage<RateLimitLogVo> basePage = new BasePage<>(basePageAo.getPageNum(), basePageAo.getPageSize());
        QueryWrapper<RateLimitLogVo> queryWrapper = getQueryWrapper(rateLimitLogVo);
        return this.baseMapper.findPageVo(basePage, queryWrapper);
    }

    @Override
    public List<RateLimitLogVo> findRateLimitLogList(RateLimitLogVo rateLimitLogVo) {
        QueryWrapper<RateLimitLogVo> queryWrapper = getQueryWrapper(rateLimitLogVo);
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    public RateLimitLogVo findRateLimitLog(RateLimitLogVo rateLimitLogVo) {
        QueryWrapper<RateLimitLogVo> queryWrapper = getQueryWrapper(rateLimitLogVo);
        return this.baseMapper.findOneVo(queryWrapper);
    }

    @Override
    public Integer countRateLimitLog(RateLimitLogVo rateLimitLogVo) {
        QueryWrapper<RateLimitLogVo> queryWrapper = getQueryWrapper(rateLimitLogVo);
        return this.baseMapper.countVo(queryWrapper);
    }

    private QueryWrapper<RateLimitLogVo> getQueryWrapper(RateLimitLogVo rateLimitLogVo) {
        QueryWrapper<RateLimitLogVo> queryWrapper = new QueryWrapper<>();
        BaseQueryWrapperUtil.likeNotBlank(queryWrapper, "srll.rate_limit_log_ip", rateLimitLogVo.getRateLimitLogIp());
        BaseQueryWrapperUtil.likeNotBlank(queryWrapper, "srll.request_uri", rateLimitLogVo.getRequestUri());
        BaseQueryWrapperUtil.likeNotBlank(queryWrapper, "srll.request_method", rateLimitLogVo.getRequestMethod());
        BaseQueryWrapperUtil.betweenDateAddTimeNotBlank(queryWrapper, "srll.create_at", rateLimitLogVo.getCreateTimeFrom(), rateLimitLogVo.getCreateTimeTo());
        queryWrapper.orderByDesc("srll.create_at");
        return queryWrapper;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createRateLimitLog(RateLimitLogAo rateLimitLogAo) {
        RateLimitLog rateLimitLog = new RateLimitLog();
        BeanUtil.copyProperties(rateLimitLogAo, rateLimitLog);
        setRateLimitLog(rateLimitLog);
        this.save(rateLimitLog);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateRateLimitLog(RateLimitLogAo rateLimitLogAo) {
        RateLimitLog rateLimitLog = new RateLimitLog();
        BeanUtil.copyProperties(rateLimitLogAo, rateLimitLog);
        setRateLimitLog(rateLimitLog);
        this.updateById(rateLimitLog);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteRateLimitLog(List<Long> ids) {
        this.removeByIds(ids);
    }

    private void setRateLimitLog(RateLimitLog rateLimitLog) {
        if (StrUtil.isNotBlank(rateLimitLog.getRateLimitLogIp())) {
            rateLimitLog.setLocation(BaseAddressUtil.getCityInfo(rateLimitLog.getRateLimitLogIp()));
        }
    }
}
