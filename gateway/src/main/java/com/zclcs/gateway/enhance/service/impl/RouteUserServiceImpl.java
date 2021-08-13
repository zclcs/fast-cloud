package com.zclcs.gateway.enhance.service.impl;

import cn.hutool.core.date.DateUtil;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.gateway.enhance.entity.RouteUser;
import com.zclcs.gateway.enhance.mapper.RouteUserMapper;
import com.zclcs.gateway.enhance.service.RouteUserService;
import com.zclcs.gateway.enhance.utils.BasePageableExecutionUtil;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.ReactiveMongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.util.Arrays;

/**
 * @author MrBird
 */
@Service
@RequiredArgsConstructor
public class RouteUserServiceImpl implements RouteUserService {

    private final PasswordEncoder passwordEncoder;

    private RouteUserMapper routeUserMapper;
    private ReactiveMongoTemplate template;

    @Autowired(required = false)
    public void setRouteUserMapper(RouteUserMapper routeUserMapper) {
        this.routeUserMapper = routeUserMapper;
    }

    @Autowired(required = false)
    public void setTemplate(ReactiveMongoTemplate template) {
        this.template = template;
    }

    @Override
    public Mono<RouteUser> create(RouteUser routeUser) {
        routeUser.setPassword(passwordEncoder.encode(routeUser.getPassword()));
        routeUser.setCreateTime(DateUtil.now());
        return routeUserMapper.insert(routeUser);
    }

    @Override
    public Mono<RouteUser> update(RouteUser routeUser) {
        return this.routeUserMapper.findById(routeUser.getId())
                .flatMap(u -> {
                    u.setRoles(routeUser.getRoles());
                    return this.routeUserMapper.save(u);
                });
    }

    @Override
    public Flux<RouteUser> delete(String ids) {
        String[] idArray = StringUtils.splitByWholeSeparatorPreserveAllTokens(ids, StringConstant.COMMA);
        return routeUserMapper.deleteByIdIn(Arrays.asList(idArray));
    }

    @Override
    public Mono<RouteUser> findByUsername(String username) {
        return routeUserMapper.findByUsername(username);
    }

    @Override
    public Flux<RouteUser> findPages(BasePageAo request, RouteUser routeUser) {
        Query query = getQuery(routeUser);
        return BasePageableExecutionUtil.getPages(query, request, RouteUser.class, template);
    }

    @Override
    public Mono<Long> findCount(RouteUser routeUser) {
        Query query = getQuery(routeUser);
        return template.count(query, RouteUser.class);
    }

    private Query getQuery(RouteUser routeUser) {
        Query query = new Query();
        Criteria criteria = new Criteria();
        if (StringUtils.isNotBlank(routeUser.getUsername())) {
            criteria.and("username").is(routeUser.getUsername());
        }
        query.addCriteria(criteria);
        return query;
    }
}
