package com.zclcs.auth.controller;

import com.zclcs.auth.manager.UserManager;
import com.zclcs.auth.service.ValidateCodeService;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.exception.ValidateCodeException;
import com.zclcs.common.core.utils.BaseRspUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.security.oauth2.provider.token.ConsumerTokenServices;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.Principal;

/**
 * @author zclcs
 */
@Controller
@RequiredArgsConstructor
@Api(tags = "系统基础信息")
public class SecurityController {

    private final ValidateCodeService validateCodeService;
    private final UserManager userManager;
    private final ConsumerTokenServices consumerTokenServices;

    @ResponseBody
    @GetMapping("user")
    @ApiOperation(value = "获取当前用户信息")
    public Principal currentUser(Principal principal) {
        return principal;
    }

    @ResponseBody
    @GetMapping("captcha")
    @ApiOperation(value = "验证码")
    public void captcha(HttpServletRequest request, HttpServletResponse response) throws IOException, ValidateCodeException {
        validateCodeService.create(request, response);
    }

    @RequestMapping("login")
    public String login() {
        return "login";
    }

    @ResponseBody
    @DeleteMapping("signout")
    @ApiOperation(value = "登出")
    public BaseRsp<String> signout(HttpServletRequest request, @RequestHeader("Authorization") String token) {
        token = StringUtils.replace(token, "Bearer ", StringConstant.EMPTY).trim();
        consumerTokenServices.revokeToken(token);
        return BaseRspUtil.message("signout");
    }
}
