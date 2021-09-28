package com.zclcs.auth.service;

import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.entity.system.ao.BindUserAo;
import me.zhyd.oauth.model.AuthCallback;
import me.zhyd.oauth.model.AuthUser;
import me.zhyd.oauth.request.AuthRequest;
import org.springframework.security.oauth2.common.OAuth2AccessToken;

/**
 * @author zclcs
 */
public interface SocialLoginService {

    /**
     * 解析第三方登录请求
     *
     * @param oauthType 第三方平台类型
     * @return AuthRequest
     */
    AuthRequest renderAuth(String oauthType);

    /**
     * 处理第三方登录（绑定页面）
     *
     * @param oauthType 第三方平台类型
     * @param callback  回调
     */
    BaseRsp<Object> resolveBind(String oauthType, AuthCallback callback);

    /**
     * 处理第三方登录（登录页面）
     *
     * @param oauthType 第三方平台类型
     * @param callback  回调
     * @return 是否成功
     */
    BaseRsp<Object> resolveLogin(String oauthType, AuthCallback callback);

    /**
     * 绑定并登录
     *
     * @param bindUser 绑定用户
     * @param authUser 第三方平台对象
     * @return OAuth2AccessToken 令牌对象
     */
    OAuth2AccessToken bindLogin(BindUserAo bindUser, AuthUser authUser);

    /**
     * 注册并登录
     *
     * @param registerUser 注册用户
     * @param authUser     第三方平台对象
     * @return OAuth2AccessToken 令牌对象
     */
    OAuth2AccessToken signLogin(BindUserAo registerUser, AuthUser authUser);

    /**
     * 绑定
     *
     * @param bindUser 绑定对象
     * @param authUser 第三方平台对象
     */
    void bind(BindUserAo bindUser, AuthUser authUser);

    /**
     * 解绑
     *
     * @param bindUser  绑定对象
     * @param oauthType 第三方平台对象
     */
    void unbind(BindUserAo bindUser, String oauthType);
}
