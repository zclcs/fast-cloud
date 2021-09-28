package com.zclcs.gateway.enhance.service.impl;

import cn.hutool.core.date.DateUtil;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.gateway.enhance.entity.RateLimitRule;
import com.zclcs.gateway.enhance.mapper.RateLimitRuleMapper;
import com.zclcs.gateway.enhance.service.RateLimitRuleService;
import com.zclcs.gateway.enhance.service.RouteEnhanceCacheService;
import com.zclcs.gateway.enhance.utils.BasePageableExecutionUtil;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.ReactiveMongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.util.Arrays;

/**
 * @author zclcs
 */
@Service
@RequiredArgsConstructor
public class RateLimitRuleServiceImpl implements RateLimitRuleService {

    private final RouteEnhanceCacheService routeEnhanceCacheService;
    private RateLimitRuleMapper rateLimitRuleMapper;
    private ReactiveMongoTemplate template;

    @Autowired(required = false)
    public void setRateLimitRuleMapper(RateLimitRuleMapper rateLimitRuleMapper) {
        this.rateLimitRuleMapper = rateLimitRuleMapper;
    }

    @Autowired(required = false)
    public void setTemplate(ReactiveMongoTemplate template) {
        this.template = template;
    }

    @Override
    public Flux<RateLimitRule> findAll() {
        return rateLimitRuleMapper.findAll();
    }

    @Override
    public Flux<RateLimitRule> findByRequestUriAndRequestMethod(String requestUri, String requestMethod) {
        return rateLimitRuleMapper.findByRequestUriAndRequestMethod(requestUri, requestMethod);
    }

    @Override
    public Flux<RateLimitRule> findPages(BasePageAo request, RateLimitRule rateLimitRule) {
        Query query = getQuery(rateLimitRule);
        return BasePageableExecutionUtil.getPages(query, request, RateLimitRule.class, template);
    }

    @Override
    public Mono<Long> findCount(RateLimitRule rateLimitRule) {
        Query query = getQuery(rateLimitRule);
        return template.count(query, RateLimitRule.class);
    }

    @Override
    public Mono<RateLimitRule> create(RateLimitRule rateLimitRule) {
        rateLimitRule.setCreateTime(DateUtil.now());
        return rateLimitRuleMapper.insert(rateLimitRule)
                .doOnSuccess(routeEnhanceCacheService::saveRateLimitRule);
    }

    @Override
    public Mono<RateLimitRule> update(RateLimitRule rateLimitRule) {
        return this.rateLimitRuleMapper.findById(rateLimitRule.getId())
                .flatMap(r -> {
                    routeEnhanceCacheService.removeRateLimitRule(r);
                    BeanUtils.copyProperties(rateLimitRule, r);
                    return this.rateLimitRuleMapper.save(r);
                }).doOnSuccess(routeEnhanceCacheService::saveRateLimitRule);
    }

    @Override
    public Flux<RateLimitRule> delete(String ids) {
        String[] idArray = StringUtils.splitByWholeSeparatorPreserveAllTokens(ids, StringConstant.COMMA);
        return rateLimitRuleMapper.deleteByIdIn(Arrays.asList(idArray))
                .doOnNext(routeEnhanceCacheService::removeRateLimitRule);
    }

    private Query getQuery(RateLimitRule rateLimitRule) {
        Query query = new Query();
        Criteria criteria = new Criteria();
        if (StringUtils.isNotBlank(rateLimitRule.getRequestMethod())) {
            criteria.and("requestMethod").is(rateLimitRule.getRequestMethod());
        }
        if (StringUtils.isNotBlank(rateLimitRule.getRequestUri())) {
            criteria.and("requestUri").is(rateLimitRule.getRequestUri());
        }
        if (StringUtils.isNotBlank(rateLimitRule.getStatus())) {
            criteria.and("status").is(rateLimitRule.getStatus());
        }
        query.addCriteria(criteria);
        return query;
    }
}
