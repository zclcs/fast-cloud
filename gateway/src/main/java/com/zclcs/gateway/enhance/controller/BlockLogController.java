package com.zclcs.gateway.enhance.controller;

import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.gateway.enhance.entity.BlockLog;
import com.zclcs.gateway.enhance.service.BlockLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

/**
 * @author zclcs
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("route/auth/blockLog")
public class BlockLogController {

    private final BlockLogService blockLogService;

    @GetMapping("data")
    public Flux<BlockLog> findUserPages(BasePageAo request, BlockLog blockLog) {
        return blockLogService.findPages(request, blockLog);
    }

    @GetMapping("count")
    public Mono<Long> findUserCount(BlockLog blockLog) {
        return blockLogService.findCount(blockLog);
    }

    @DeleteMapping
    @PreAuthorize("hasAuthority('admin')")
    public Flux<BlockLog> deleteBlockLog(String ids) {
        return blockLogService.delete(ids);
    }
}
