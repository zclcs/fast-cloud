package com.zclcs.auth.controller;

import com.zclcs.auth.service.SocialLoginService;
import com.zclcs.auth.service.SystemUserConnectionService;
import com.zclcs.common.core.base.BaseController;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.system.ao.BindUserAo;
import com.zclcs.common.core.entity.system.vo.SystemUserConnectionVo;
import com.zclcs.common.core.utils.BaseUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.zhyd.oauth.model.AuthCallback;
import me.zhyd.oauth.model.AuthUser;
import me.zhyd.oauth.request.AuthRequest;
import me.zhyd.oauth.utils.AuthStateUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.io.IOException;
import java.util.List;

/**
 * @author zclcs
 */
@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("social")
@Api(tags = "系统基础信息")
public class SocialLoginController extends BaseController {

    private static final String TYPE_LOGIN = "login";
    private static final String TYPE_BIND = "bind";

    private final SocialLoginService socialLoginService;
    private final SystemUserConnectionService systemUserConnectionService;
    @Value("${my.frontUrl}")
    private String frontUrl;


    /**
     * 登录
     *
     * @param oauthType 第三方登录类型
     * @param response  response
     */
    @ResponseBody
    @GetMapping("/login/{oauthType}/{type}")
    @ApiOperation(value = "登录")
    public void renderAuth(@PathVariable String oauthType, @PathVariable String type, HttpServletResponse response) throws IOException {
        AuthRequest authRequest = socialLoginService.renderAuth(oauthType);
        response.sendRedirect(authRequest.authorize(oauthType + StringConstant.DOUBLE_COLON + AuthStateUtils.createState()) + "::" + type);
    }

    /**
     * 登录成功后的回调
     *
     * @param oauthType 第三方登录类型
     * @param callback  携带返回的信息
     * @return String
     */
    @GetMapping("/{oauthType}/callback")
    @ApiOperation(value = "登录成功后的回调")
    public String login(@PathVariable String oauthType, AuthCallback callback, String state, Model model) {
        try {
            BaseRsp<Object> objectBaseRsp;
            String type = StringUtils.substringAfterLast(state, StringConstant.DOUBLE_COLON);
            if (StringUtils.equals(type, TYPE_BIND)) {
                objectBaseRsp = socialLoginService.resolveBind(oauthType, callback);
            } else {
                objectBaseRsp = socialLoginService.resolveLogin(oauthType, callback);
            }
            model.addAttribute("response", objectBaseRsp);
            model.addAttribute("frontUrl", frontUrl);
            return "result";
        } catch (Exception e) {
            String errorMessage = BaseUtil.containChinese(e.getMessage()) ? e.getMessage() : "第三方登录失败";
            model.addAttribute("error", errorMessage);
            return "fail";
        }
    }

    /**
     * 绑定并登录
     *
     * @param bindUser bindUser
     * @param authUser authUser
     * @return BaseRsp
     */
    @ResponseBody
    @PostMapping("bind/login")
    @ApiOperation(value = "绑定并登录")
    public BaseRsp<OAuth2AccessToken> bindLogin(@Valid BindUserAo bindUser, AuthUser authUser) {
        OAuth2AccessToken oAuth2AccessToken = this.socialLoginService.bindLogin(bindUser, authUser);
        return this.success(oAuth2AccessToken);
    }

    /**
     * 注册并登录
     *
     * @param registUser registUser
     * @param authUser   authUser
     * @return Response
     */
    @ResponseBody
    @PostMapping("sign/login")
    @ApiOperation(value = "注册并登录")
    public BaseRsp<OAuth2AccessToken> signLogin(@Valid BindUserAo registUser, AuthUser authUser) {
        OAuth2AccessToken oAuth2AccessToken = this.socialLoginService.signLogin(registUser, authUser);
        return this.success(oAuth2AccessToken);
    }

    /**
     * 绑定
     *
     * @param bindUser bindUser
     * @param authUser authUser
     */
    @ResponseBody
    @PostMapping("bind")
    @ApiOperation(value = "绑定")
    public void bind(BindUserAo bindUser, AuthUser authUser) {
        this.socialLoginService.bind(bindUser, authUser);
    }

    /**
     * 解绑
     *
     * @param bindUser  bindUser
     * @param oauthType oauthType
     */
    @ResponseBody
    @DeleteMapping("unbind")
    @ApiOperation(value = "解绑")
    public void unbind(BindUserAo bindUser, String oauthType) {
        this.socialLoginService.unbind(bindUser, oauthType);
    }

    /**
     * 根据用户名获取绑定关系
     *
     * @param username 用户名
     * @return Response
     */
    @ResponseBody
    @GetMapping("connections/{username}")
    @ApiOperation(value = "根据用户名获取绑定关系")
    public BaseRsp<List<SystemUserConnectionVo>> findSystemUserConnectionList(@NotBlank(message = "{required}") @PathVariable String username) {
        return this.success(this.systemUserConnectionService.findSystemUserConnectionList(username));
    }
}
