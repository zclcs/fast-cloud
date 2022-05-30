package com.zclcs.common.core.utils;

import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.common.core.entity.MyAuthUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.authentication.OAuth2AuthenticationDetails;

import java.util.Collection;

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
    public static MyAuthUser getCurrentUser() {
        try {
            Object principal = getOauth2Authentication().getPrincipal();
            return (MyAuthUser) principal;
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
        OAuth2Authentication oauth2Authentication = getOauth2Authentication();
        if (oauth2Authentication == null) {
            return MyConstant.ADMIN;
        }
        Object principal = oauth2Authentication.getPrincipal();
        if (principal instanceof MyAuthUser) {
            return ((MyAuthUser) principal).getUsername();
        }
        return (String) oauth2Authentication.getPrincipal();
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

    public static OAuth2Authentication getOauth2Authentication() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return (OAuth2Authentication) authentication;
    }
}
