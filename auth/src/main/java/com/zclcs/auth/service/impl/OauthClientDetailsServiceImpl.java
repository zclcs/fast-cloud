package com.zclcs.auth.service.impl;

import com.zclcs.auth.entity.OauthClientDetails;
import com.zclcs.auth.mapper.OauthClientDetailsMapper;
import com.zclcs.auth.service.OauthClientDetailsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 客户端配置表 服务实现类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-11
 */
@Service
public class OauthClientDetailsServiceImpl extends ServiceImpl<OauthClientDetailsMapper, OauthClientDetails> implements OauthClientDetailsService {

}
