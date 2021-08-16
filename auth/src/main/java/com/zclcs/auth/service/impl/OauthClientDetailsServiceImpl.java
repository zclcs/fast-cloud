package com.zclcs.auth.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.auth.mapper.OauthClientDetailsMapper;
import com.zclcs.auth.service.OauthClientDetailsService;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.entity.system.OauthClientDetails;
import com.zclcs.common.core.entity.system.ao.FindOauthClientDetailsPageAo;
import com.zclcs.common.core.entity.system.ao.OauthClientDetailsAo;
import com.zclcs.common.core.entity.system.vo.OauthClientDetailsVo;
import com.zclcs.common.core.exception.MyException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class OauthClientDetailsServiceImpl extends ServiceImpl<OauthClientDetailsMapper, OauthClientDetails> implements OauthClientDetailsService {

    private final PasswordEncoder passwordEncoder;
    private final RedisClientDetailsService redisClientDetailsService;

    @Override
    public BasePage<OauthClientDetailsVo> findOauthClientDetailsPage(FindOauthClientDetailsPageAo findOauthClientDetailsPageAo) {
        QueryWrapper<OauthClientDetailsVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(StringUtils.isNotBlank(findOauthClientDetailsPageAo.getClientId()), "ocd.client_id", findOauthClientDetailsPageAo.getClientId());
        BasePage<OauthClientDetailsVo> page = new BasePage<>(findOauthClientDetailsPageAo.getPageNum(), findOauthClientDetailsPageAo.getPageSize());
        BasePage<OauthClientDetailsVo> result = this.baseMapper.findPageVo(page, queryWrapper);
        result.getList().forEach(oauthClientDetailsVo -> {
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
}
