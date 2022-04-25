package com.zclcs.auth.controller;

import cn.hutool.core.collection.CollectionUtil;
import com.zclcs.auth.service.ValidateCodeService;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.RedisCachePrefixConstant;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.MyAuthUser;
import com.zclcs.common.core.entity.system.vo.SystemUserVo;
import com.zclcs.common.core.exception.ValidateCodeException;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.common.core.utils.BaseUsersUtil;
import com.zclcs.common.redis.starter.service.RedisService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.ConsumerTokenServices;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

/**
 * @author zclcs
 */
@Controller
@RequiredArgsConstructor
@Api(tags = "系统基础信息")
public class SecurityController {

    private final ValidateCodeService validateCodeService;
    private final ConsumerTokenServices consumerTokenServices;
    private final RedisService redisService;
    private final TokenStore tokenStore;

    @ResponseBody
    @GetMapping("user")
    @ApiOperation(value = "获取当前用户信息(前端)")
    public MyAuthUser user() {
        updateUserInfo();
        return BaseUsersUtil.getCurrentUser();
    }

    @ResponseBody
    @GetMapping("/oath2/info")
    @ApiOperation(value = "获取当前认证信息(系统)")
    public Principal currentUser() {
        updateUserInfo();
        return BaseUsersUtil.getOauth2Authentication();
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

    private void updateUserInfo() {
        String username = BaseUsersUtil.getCurrentUsername();
        SystemUserVo systemUserVo = (SystemUserVo) redisService.get(RedisCachePrefixConstant.USER + username);
        if (systemUserVo.getNeedUpdateUserDetail()) {
            List<String> permissions = (List<String>) redisService.get(RedisCachePrefixConstant.USER_PERMISSIONS + username);
            // 得到当前的认证信息
            OAuth2Authentication auth = (OAuth2Authentication) SecurityContextHolder.getContext().getAuthentication();
            boolean notLocked = StringUtils.equals(SystemUserVo.STATUS_VALID, systemUserVo.getStatus());
            String password = systemUserVo.getPassword();
            List<GrantedAuthority> grantedAuthorities = AuthorityUtils.NO_AUTHORITIES;
            if (CollectionUtil.isNotEmpty(permissions)) {
                grantedAuthorities = AuthorityUtils.commaSeparatedStringToAuthorityList(String.join(StringConstant.COMMA, permissions));
            }
            MyAuthUser authUser = new MyAuthUser(username, password, true, true, true, notLocked,
                    grantedAuthorities);
            BeanUtils.copyProperties(systemUserVo, authUser);
            UsernamePasswordAuthenticationToken newAuth = new UsernamePasswordAuthenticationToken(
                    authUser,
                    authUser.getPassword(),
                    grantedAuthorities
            );
            newAuth.setDetails(auth.getDetails());
            OAuth2Authentication oAuth2Auth = new OAuth2Authentication(auth.getOAuth2Request(), newAuth);
            oAuth2Auth.setDetails(auth.getDetails());
            oAuth2Auth.setAuthenticated(true);
            OAuth2AccessToken existingAccessToken = this.tokenStore.getAccessToken(auth);
            tokenStore.storeAccessToken(existingAccessToken, oAuth2Auth);
            SecurityContextHolder.getContext().setAuthentication(oAuth2Auth);
            systemUserVo.setNeedUpdateUserDetail(false);
            redisService.set(RedisCachePrefixConstant.USER + username, systemUserVo);
        }
    }
}
