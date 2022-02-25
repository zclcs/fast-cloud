package com.zclcs.gateway.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.entity.system.RateLimitRule;
import com.zclcs.gateway.mapper.RateLimitRuleMapper;
import com.zclcs.gateway.service.RateLimitRuleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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

}
