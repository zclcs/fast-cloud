package com.zclcs.auth.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.auth.mapper.SystemUserConnectionMapper;
import com.zclcs.auth.service.SystemUserConnectionService;
import com.zclcs.common.core.entity.system.SystemUserConnection;
import com.zclcs.common.core.entity.system.ao.SystemUserConnectionAo;
import com.zclcs.common.core.entity.system.vo.SystemUserConnectionVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * 系统用户社交账户关联表 服务实现类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-12
 */
@Service
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class SystemUserConnectionServiceImpl extends ServiceImpl<SystemUserConnectionMapper, SystemUserConnection> implements SystemUserConnectionService {

    @Override
    public SystemUserConnectionVo findSystemUserConnectionOne(String providerName, String providerUserId) {
        LambdaQueryWrapper<SystemUserConnectionVo> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(StrUtil.isNotBlank(providerName), SystemUserConnectionVo::getProviderName, providerName)
                .eq(StrUtil.isNotBlank(providerUserId), SystemUserConnectionVo::getProviderUserId, providerUserId);
        return this.baseMapper.findOneVo(queryWrapper);
    }

    @Override
    public List<SystemUserConnectionVo> findSystemUserConnectionList(String username) {
        LambdaQueryWrapper<SystemUserConnectionVo> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(StrUtil.isNotBlank(username), SystemUserConnectionVo::getUserName, username);
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createSystemUserConnection(SystemUserConnectionAo systemUserConnectionAo) {
        SystemUserConnection systemUserConnection = new SystemUserConnection();
        BeanUtil.copyProperties(systemUserConnectionAo, systemUserConnection);
        this.save(systemUserConnection);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteSystemUserConnection(String username, String providerName) {
        LambdaQueryWrapper<SystemUserConnection> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(StrUtil.isNotBlank(username), SystemUserConnection::getProviderName, username)
                .eq(StrUtil.isNotBlank(providerName), SystemUserConnection::getProviderUserId, providerName);
        this.remove(queryWrapper);
    }
}
