package com.zclcs.auth.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.zclcs.auth.manager.UserManager;
import com.zclcs.common.core.constant.ParamsConstant;
import com.zclcs.common.core.constant.SocialConstant;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.FebsAuthUser;
import com.zclcs.common.core.entity.system.vo.SystemUserVo;
import com.zclcs.common.core.utils.BaseUtil;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
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
 * @author MrBird
 */
@Service
@RequiredArgsConstructor
public class MyUserDetailServiceImpl implements UserDetailsService {

    private final PasswordEncoder passwordEncoder;
    private final UserManager userManager;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        HttpServletRequest httpServletRequest = BaseUtil.getHttpServletRequest();
        SystemUserVo systemUser = userManager.findByName(username);
        if (systemUser != null) {
            List<String> permissions = userManager.findUserPermissions(systemUser.getUsername());
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
            FebsAuthUser authUser = new FebsAuthUser(systemUser.getUsername(), password, true, true, true, notLocked,
                    grantedAuthorities);

            BeanUtils.copyProperties(systemUser, authUser);
            return authUser;
        } else {
            throw new UsernameNotFoundException("");
        }
    }
}