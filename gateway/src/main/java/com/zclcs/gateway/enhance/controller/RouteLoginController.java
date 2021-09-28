package com.zclcs.gateway.enhance.controller;

import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.gateway.enhance.auth.JwtTokenHelper;
import com.zclcs.gateway.enhance.service.RouteUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

/**
 * @author zclcs
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("route")
public class RouteLoginController {

    private final JwtTokenHelper tokenHelper;
    private final PasswordEncoder passwordEncoder;
    private final RouteUserService routeUserService;

    @GetMapping("login")
    public Mono<ResponseEntity<BaseRsp<Object>>> login(String username, String password) {
        String error = "认证失败，用户名或密码错误";
        return routeUserService.findByUsername(username)
                .map(u -> passwordEncoder.matches(password, u.getPassword()) ?
                        ResponseEntity.ok(BaseRspUtil.message(tokenHelper.generateToken(u))) :
                        new ResponseEntity<>(BaseRspUtil.message(error), HttpStatus.INTERNAL_SERVER_ERROR))
                .defaultIfEmpty(new ResponseEntity<>(BaseRspUtil.message(error), HttpStatus.INTERNAL_SERVER_ERROR));
    }
}
