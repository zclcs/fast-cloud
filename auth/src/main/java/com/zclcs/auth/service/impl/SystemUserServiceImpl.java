package com.zclcs.auth.service.impl;

import com.zclcs.auth.entity.SystemUser;
import com.zclcs.auth.mapper.SystemUserMapper;
import com.zclcs.auth.service.SystemUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-11
 */
@Service
public class SystemUserServiceImpl extends ServiceImpl<SystemUserMapper, SystemUser> implements SystemUserService {

}
