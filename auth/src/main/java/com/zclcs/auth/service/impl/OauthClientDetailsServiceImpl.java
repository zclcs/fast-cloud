package com.zclcs.auth.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.auth.manager.UserManager;
import com.zclcs.auth.mapper.OauthClientDetailsMapper;
import com.zclcs.auth.service.OauthClientDetailsService;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.entity.system.OauthClientDetails;
import com.zclcs.common.core.entity.system.ao.FindOauthClientDetailsPageAo;
import com.zclcs.common.core.entity.system.ao.OauthClientDetailsAo;
import com.zclcs.common.core.entity.system.vo.OauthClientDetailsVo;
import com.zclcs.common.core.entity.system.vo.SystemMenuVo;
import com.zclcs.common.core.exception.MyException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * <p>
 * 客户端配置表 服务实现类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-11
 */
@Service
@Slf4j
@RequiredArgsConstructor
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class OauthClientDetailsServiceImpl extends ServiceImpl<OauthClientDetailsMapper, OauthClientDetails> implements OauthClientDetailsService {

    private final PasswordEncoder passwordEncoder;
    private final UserManager userManager;
    private final RedisClientDetailsService redisClientDetailsService;

    @Override
    public BasePage<OauthClientDetailsVo> findOauthClientDetailsPage(FindOauthClientDetailsPageAo findOauthClientDetailsPageAo) {
        QueryWrapper<OauthClientDetailsVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(StringUtils.isNotBlank(findOauthClientDetailsPageAo.getClientId()), "ocd.client_id", findOauthClientDetailsPageAo.getClientId());
        BasePage<OauthClientDetailsVo> page = new BasePage<>(findOauthClientDetailsPageAo.getPageNum(), findOauthClientDetailsPageAo.getPageSize());
        BasePage<OauthClientDetailsVo> result = this.baseMapper.findPageVo(page, queryWrapper);
        List<SystemMenuVo> allPermissions = userManager.findAllPermissions();
        result.getList().forEach(oauthClientDetailsVo -> {
            Optional.ofNullable(oauthClientDetailsVo.getAuthorities()).filter(StrUtil::isNotBlank).ifPresent(s ->
                    setMenuIds(s, allPermissions, oauthClientDetailsVo));
            oauthClientDetailsVo.setClientSecret(null);
            oauthClientDetailsVo.setOriginSecret(null);
        });
        return result;
    }

    @Override
    public OauthClientDetailsVo findById(String clientId) {
        QueryWrapper<OauthClientDetailsVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(StringUtils.isNotBlank(clientId), "ocd.client_id", clientId);
        return this.baseMapper.findOneVo(queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createOauthClientDetails(OauthClientDetailsAo oauthClientDetailsAo) {
        OauthClientDetailsVo byId = this.findById(oauthClientDetailsAo.getClientId());
        if (byId != null) {
            throw new MyException("该Client已存在");
        }
        OauthClientDetails oauthClientDetails = new OauthClientDetails();
        BeanUtil.copyProperties(oauthClientDetailsAo, oauthClientDetails);
        setAuthorities(oauthClientDetailsAo.getMenuIds(), oauthClientDetails);
        oauthClientDetails.setOriginSecret(oauthClientDetails.getClientSecret());
        oauthClientDetails.setClientSecret(passwordEncoder.encode(oauthClientDetails.getClientSecret()));
        boolean saved = this.save(oauthClientDetails);
        if (saved) {
            log.info("缓存Client -> {}", oauthClientDetails);
            this.redisClientDetailsService.loadClientByClientId(oauthClientDetails.getClientId());
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateOauthClientDetails(OauthClientDetailsAo oauthClientDetailsAo) {
        String clientId = oauthClientDetailsAo.getClientId();
        LambdaQueryWrapper<OauthClientDetails> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(OauthClientDetails::getClientId, clientId);
        OauthClientDetails oauthClientDetails = new OauthClientDetails();
        BeanUtil.copyProperties(oauthClientDetailsAo, oauthClientDetails);
        setAuthorities(oauthClientDetailsAo.getMenuIds(), oauthClientDetails);
        oauthClientDetails.setClientId(null);
        oauthClientDetails.setClientSecret(null);
        boolean updated = this.update(oauthClientDetails, queryWrapper);
        if (updated) {
            log.info("更新Client -> {}", oauthClientDetails);
            this.redisClientDetailsService.removeRedisCache(clientId);
            this.redisClientDetailsService.loadClientByClientId(clientId);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteOauthClientDetails(List<String> clientIds) {
        LambdaQueryWrapper<OauthClientDetails> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.in(OauthClientDetails::getClientId, clientIds);
        boolean removed = this.remove(queryWrapper);
        if (removed) {
            log.info("删除ClientId为({})的Client", clientIds);
            clientIds.forEach(c -> this.redisClientDetailsService.removeRedisCache(String.valueOf(c)));
        }
    }

    private void setAuthorities(List<Long> menuIds, OauthClientDetails oauthClientDetails) {
        String permissions = userManager.findPermissions(menuIds);
        oauthClientDetails.setAuthorities(permissions);
    }

    private void setMenuIds(String authorities, List<SystemMenuVo> systemMenuVos, OauthClientDetailsVo oauthClientDetailsVo) {
        List<String> collect = Arrays.stream(authorities.split(StrUtil.COMMA)).collect(Collectors.toList());
        List<Long> menuIds = new ArrayList<>();
        for (String a : collect) {
            SystemMenuVo perms = CollectionUtil.findOneByField(systemMenuVos, "perms", a);
            menuIds.add(perms.getMenuId());
        }
        oauthClientDetailsVo.setMenuIds(menuIds);
    }
}
