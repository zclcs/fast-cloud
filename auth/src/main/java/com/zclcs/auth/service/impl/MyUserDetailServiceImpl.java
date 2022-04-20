package com.zclcs.auth.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.zclcs.auth.manager.UserManager;
import com.zclcs.common.core.constant.ParamsConstant;
import com.zclcs.common.core.constant.RedisCachePrefixConstant;
import com.zclcs.common.core.constant.SocialConstant;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.MyAuthUser;
import com.zclcs.common.core.entity.system.vo.SystemUserVo;
import com.zclcs.common.core.utils.BaseUtil;
import com.zclcs.common.redis.starter.service.RedisService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author zclcs
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class MyUserDetailServiceImpl implements UserDetailsService {

    private final PasswordEncoder passwordEncoder;
    private final UserManager userManager;
    private final RedisService redisService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        HttpServletRequest httpServletRequest = BaseUtil.getHttpServletRequest();
        SystemUserVo systemUser = userManager.findByName(username);
        if (systemUser != null) {
            systemUser.setNeedUpdateUserDetail(false);
            redisService.set(RedisCachePrefixConstant.USER + username, systemUser);
            String systemUserUsername = systemUser.getUsername();
            // 缓存路由 以及 权限
            List<String> permissions = userManager.findUserPermissions(systemUserUsername);
            redisService.set(RedisCachePrefixConstant.USER_PERMISSIONS + username, permissions);
            boolean notLocked = StringUtils.equals(SystemUserVo.STATUS_VALID, systemUser.getStatus());
            String password = systemUser.getPassword();
            String loginType = (String) httpServletRequest.getAttribute(ParamsConstant.LOGIN_TYPE);
            if (StringUtils.equals(loginType, SocialConstant.SOCIAL_LOGIN)) {
                password = passwordEncoder.encode(SocialConstant.getSocialLoginPassword());
            }
            List<GrantedAuthority> grantedAuthorities = AuthorityUtils.NO_AUTHORITIES;
            if (CollectionUtil.isNotEmpty(permissions)) {
                grantedAuthorities = AuthorityUtils.commaSeparatedStringToAuthorityList(String.join(StringConstant.COMMA, permissions));
            }
            MyAuthUser authUser = new MyAuthUser(systemUserUsername, password, true, true, true, notLocked,
                    grantedAuthorities);
            BeanUtils.copyProperties(systemUser, authUser);
            return authUser;
        } else {
            throw new UsernameNotFoundException("");
        }
    }
}
