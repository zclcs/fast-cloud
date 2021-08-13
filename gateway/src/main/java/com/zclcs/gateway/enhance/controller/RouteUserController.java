package com.zclcs.gateway.enhance.controller;

import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.gateway.enhance.entity.RouteUser;
import com.zclcs.gateway.enhance.service.RouteUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

/**
 * @author MrBird
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("route/auth/user")
public class RouteUserController {

    private final RouteUserService routeUserService;

    @GetMapping("data")
    public Flux<RouteUser> findUserPages(BasePageAo request, RouteUser routeUser) {
        return routeUserService.findPages(request, routeUser);
    }

    @GetMapping("count")
    public Mono<Long> findUserCount(RouteUser routeUser) {
        return routeUserService.findCount(routeUser);
    }

    @GetMapping("{username}")
    public Mono<RouteUser> findByUsername(@PathVariable String username) {
        return routeUserService.findByUsername(username);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('admin')")
    public Mono<RouteUser> createRouteUser(RouteUser routeUser) {
        return routeUserService.create(routeUser);
    }

    @PutMapping
    @PreAuthorize("hasAuthority('admin')")
    public Mono<RouteUser> updateRouteUser(RouteUser routeUser) {
        return routeUserService.update(routeUser);
    }

    @DeleteMapping
    @PreAuthorize("hasAuthority('admin')")
    public Flux<RouteUser> deleteRouteUser(String ids) {
        return routeUserService.delete(ids);
    }
}
