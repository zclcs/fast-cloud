package com.zclcs.auth.service.impl;

import com.zclcs.auth.entity.SystemUserConnection;
import com.zclcs.auth.mapper.SystemUserConnectionMapper;
import com.zclcs.auth.service.SystemUserConnectionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 系统用户社交账户关联表 服务实现类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-11
 */
@Service
public class SystemUserConnectionServiceImpl extends ServiceImpl<SystemUserConnectionMapper, SystemUserConnection> implements SystemUserConnectionService {

}
