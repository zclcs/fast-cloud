package com.zclcs.server.system.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.entity.system.RateLimitRule;
import com.zclcs.common.core.entity.system.ao.RateLimitRuleAo;
import com.zclcs.common.core.entity.system.vo.RateLimitRuleVo;
import com.zclcs.common.core.utils.BaseQueryWrapperUtil;
import com.zclcs.server.system.mapper.RateLimitRuleMapper;
import com.zclcs.server.system.service.RateLimitRuleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 限流规则表 Service实现
 *
 * @author zclcs
 * @date 2021-12-29 17:21:19.726
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class RateLimitRuleServiceImpl extends ServiceImpl<RateLimitRuleMapper, RateLimitRule> implements RateLimitRuleService {

    @Override
    public BasePage<RateLimitRuleVo> findRateLimitRulePage(BasePageAo basePageAo, RateLimitRuleVo rateLimitRuleVo) {
        BasePage<RateLimitRuleVo> basePage = new BasePage<>(basePageAo.getPageNum(), basePageAo.getPageSize());
        QueryWrapper<RateLimitRuleVo> queryWrapper = getQueryWrapper(rateLimitRuleVo);
        return this.baseMapper.findPageVo(basePage, queryWrapper);
    }

    @Override
    public List<RateLimitRuleVo> findRateLimitRuleList(RateLimitRuleVo rateLimitRuleVo) {
        QueryWrapper<RateLimitRuleVo> queryWrapper = getQueryWrapper(rateLimitRuleVo);
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    public RateLimitRuleVo findRateLimitRule(RateLimitRuleVo rateLimitRuleVo) {
        QueryWrapper<RateLimitRuleVo> queryWrapper = getQueryWrapper(rateLimitRuleVo);
        return this.baseMapper.findOneVo(queryWrapper);
    }

    @Override
    public Integer countRateLimitRule(RateLimitRuleVo rateLimitRuleVo) {
        QueryWrapper<RateLimitRuleVo> queryWrapper = getQueryWrapper(rateLimitRuleVo);
        return this.baseMapper.countVo(queryWrapper);
    }

    private QueryWrapper<RateLimitRuleVo> getQueryWrapper(RateLimitRuleVo rateLimitRuleVo) {
        QueryWrapper<RateLimitRuleVo> queryWrapper = new QueryWrapper<>();
        BaseQueryWrapperUtil.likeNotBlank(queryWrapper, "srlr.request_uri", rateLimitRuleVo.getRequestUri());
        BaseQueryWrapperUtil.eqNotBlank(queryWrapper, "srlr.request_method", rateLimitRuleVo.getRequestMethod());
        BaseQueryWrapperUtil.eqNotBlank(queryWrapper, "srlr.rule_status", rateLimitRuleVo.getRuleStatus());
        return queryWrapper;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createRateLimitRule(RateLimitRuleAo rateLimitRuleAo) {
        RateLimitRule rateLimitRule = new RateLimitRule();
        BeanUtil.copyProperties(rateLimitRuleAo, rateLimitRule);
        setRateLimitRule(rateLimitRule);
        this.save(rateLimitRule);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateRateLimitRule(RateLimitRuleAo rateLimitRuleAo) {
        RateLimitRule rateLimitRule = new RateLimitRule();
        BeanUtil.copyProperties(rateLimitRuleAo, rateLimitRule);
        setRateLimitRule(rateLimitRule);
        this.updateById(rateLimitRule);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteRateLimitRule(List<Long> ids) {
        this.removeByIds(ids);
    }

    private void setRateLimitRule(RateLimitRule rateLimitRule) {
        if (StrUtil.isNotBlank(rateLimitRule.getLimitFrom()) && StrUtil.isNotBlank(rateLimitRule.getLimitTo())) {
            rateLimitRule.setLimitFrom(DateUtil.parse(rateLimitRule.getLimitFrom()).toString(DatePattern.NORM_TIME_PATTERN));
            rateLimitRule.setLimitTo(DateUtil.parse(rateLimitRule.getLimitTo()).toString(DatePattern.NORM_TIME_PATTERN));
        }
    }
}
