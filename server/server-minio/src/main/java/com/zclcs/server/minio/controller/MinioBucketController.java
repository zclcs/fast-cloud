package com.zclcs.server.minio.controller;

import com.zclcs.common.core.annotation.ControllerEndpoint;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.minio.ao.MinioBucketAo;
import com.zclcs.common.core.entity.minio.vo.MinioBucketVo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.server.minio.service.MinioBucketService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 桶 Controller
 *
 * @author zclcs
 * @date 2021-10-18 10:37:09.922
 */
@Slf4j
@Validated
@RestController
@RequestMapping("bucket")
@RequiredArgsConstructor
@Api(tags = "桶")
public class MinioBucketController {

    private final MinioBucketService minioBucketService;

    @GetMapping
    @ApiOperation(value = "桶查询（分页）")
    @PreAuthorize("hasAuthority('bucket:view')")
    public BaseRsp<BasePage<MinioBucketVo>> findMinioBucketPage(@Valid BasePageAo basePageAo, MinioBucketVo minioBucketVo) {
        BasePage<MinioBucketVo> page = this.minioBucketService.findMinioBucketPage(basePageAo, minioBucketVo);
        return BaseRspUtil.data(page);
    }

    @GetMapping("list")
    @ApiOperation(value = "桶查询（集合）")
    @PreAuthorize("hasAuthority('bucket:view')")
    public BaseRsp<List<MinioBucketVo>> findMinioBucketList(MinioBucketVo minioBucketVo) {
        List<MinioBucketVo> list = this.minioBucketService.findMinioBucketList(minioBucketVo);
        return BaseRspUtil.data(list);
    }

    @GetMapping("one")
    @ApiOperation(value = "桶查询（单个）")
    @PreAuthorize("hasAuthority('bucket:view')")
    public BaseRsp<MinioBucketVo> findMinioBucket(MinioBucketVo minioBucketVo) {
        MinioBucketVo minioBucket = this.minioBucketService.findMinioBucket(minioBucketVo);
        return BaseRspUtil.data(minioBucket);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('bucket:add')")
    @ApiOperation(value = "新增桶")
    @ControllerEndpoint(operation = "新增桶")
    public void addMinioBucket(@RequestBody @Validated MinioBucketAo minioBucketAo) {
        this.minioBucketService.createMinioBucket(minioBucketAo);
    }

    @DeleteMapping("/{bucketIds}")
    @PreAuthorize("hasAuthority('bucket:delete')")
    @ApiOperation(value = "删除桶")
    @ControllerEndpoint(operation = "删除桶")
    public void deleteMinioBucket(@ApiParam(value = "桶id集合(,分隔)", required = true) @NotBlank(message = "{required}") @PathVariable String bucketIds) {
        List<Long> ids = Arrays.stream(bucketIds.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.minioBucketService.deleteMinioBucket(ids);
    }

}