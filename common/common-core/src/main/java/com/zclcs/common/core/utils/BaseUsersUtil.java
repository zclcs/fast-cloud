package com.zclcs.common.core.utils;

import cn.hutool.core.collection.CollectionUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.CurrentUser;
import com.zclcs.common.core.entity.MyAuthUser;
import com.zclcs.common.core.entity.system.vo.SystemUserVo;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.authentication.OAuth2AuthenticationDetails;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * @author zclcs
 */
@Slf4j
public abstract class BaseUsersUtil {

    /**
     * 获取在线用户信息
     *
     * @return CurrentUser 当前用户信息
     */
    public static CurrentUser getCurrentUser() {
        try {
            LinkedHashMap<String, Object> authenticationDetails = getAuthenticationDetails();
            Object principal = authenticationDetails.get("principal");
            ObjectMapper mapper = new ObjectMapper();
            return mapper.readValue(mapper.writeValueAsString(principal), CurrentUser.class);
        } catch (Exception e) {
            log.error("获取当前用户信息失败", e);
            return null;
        }
    }

    /**
     * 获取当前用户名称
     *
     * @return String 用户名
     */
    public static String getCurrentUsername() {
        Object principal = getOauth2Authentication().getPrincipal();
        if (principal instanceof MyAuthUser) {
            return ((MyAuthUser) principal).getUsername();
        }
        return (String) getOauth2Authentication().getPrincipal();
    }

    /**
     * 更新用户信息
     */
    public static void updateUserDetail(SystemUserVo systemUser, List<String> permissions) {
        boolean notLocked = StringUtils.equals(SystemUserVo.STATUS_VALID, systemUser.getStatus());
        String password = systemUser.getPassword();
        List<GrantedAuthority> grantedAuthorities = AuthorityUtils.NO_AUTHORITIES;
        if (CollectionUtil.isNotEmpty(permissions)) {
            grantedAuthorities = AuthorityUtils.commaSeparatedStringToAuthorityList(String.join(StringConstant.COMMA, permissions));
        }
        MyAuthUser authUser = new MyAuthUser(systemUser.getPassword(), password, true, true, true, notLocked,
                grantedAuthorities);
        BeanUtils.copyProperties(systemUser, authUser);
        SecurityContextHolder.getContext().setAuthentication(
                new UsernamePasswordAuthenticationToken(authUser, authUser.getPassword(), grantedAuthorities));
    }

    /**
     * 更新用户信息
     */
    public static void updateUserDetail(SystemUserVo systemUser) {
        boolean notLocked = StringUtils.equals(SystemUserVo.STATUS_VALID, systemUser.getStatus());
        String password = systemUser.getPassword();
        Collection<GrantedAuthority> currentUserAuthority = getCurrentUserAuthority();
        MyAuthUser authUser = new MyAuthUser(systemUser.getPassword(), password, true, true, true, notLocked,
                currentUserAuthority);
        BeanUtils.copyProperties(systemUser, authUser);
        SecurityContextHolder.getContext().setAuthentication(
                new UsernamePasswordAuthenticationToken(authUser, authUser.getPassword(), currentUserAuthority));
    }

    /**
     * 获取当前用户权限集
     *
     * @return Collection<GrantedAuthority>权限集
     */
    public static Collection<GrantedAuthority> getCurrentUserAuthority() {
        return getOauth2Authentication().getAuthorities();
    }

    /**
     * 获取当前令牌内容
     *
     * @return String 令牌内容
     */
    public static String getCurrentTokenValue() {
        try {
            OAuth2AuthenticationDetails details = (OAuth2AuthenticationDetails) getOauth2Authentication().getDetails();
            return details.getTokenValue();
        } catch (Exception ignore) {
            return null;
        }
    }

    private static OAuth2Authentication getOauth2Authentication() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return (OAuth2Authentication) authentication;
    }

    @SuppressWarnings("all")
    private static LinkedHashMap<String, Object> getAuthenticationDetails() {
        return (LinkedHashMap<String, Object>) getOauth2Authentication().getUserAuthentication().getDetails();
    }
}
