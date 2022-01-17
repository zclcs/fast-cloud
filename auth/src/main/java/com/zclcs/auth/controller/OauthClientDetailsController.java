package com.zclcs.auth.controller;

import com.zclcs.auth.service.OauthClientDetailsService;
import com.zclcs.common.core.base.BaseController;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.system.ao.FindOauthClientDetailsPageAo;
import com.zclcs.common.core.entity.system.ao.OauthClientDetailsAo;
import com.zclcs.common.core.entity.system.vo.OauthClientDetailsVo;
import com.zclcs.common.core.validate.strategy.AddStrategy;
import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author zclcs
 */
@Slf4j
@Validated
@RestController
@RequiredArgsConstructor
@RequestMapping("client")
@Api(tags = "客户端配置")
public class OauthClientDetailsController extends BaseController {

    private final OauthClientDetailsService oauthClientDetailsService;

    @GetMapping("check/{clientId}")
    @ApiOperation(value = "根据主键查询")
    public boolean checkClientId(@ApiParam(value = "客户端id", required = true) @NotBlank(message = "{required}") @PathVariable String clientId) {
        OauthClientDetailsVo client = this.oauthClientDetailsService.findById(clientId);
        return client == null;
    }

    @GetMapping("secret/{clientId}")
    @PreAuthorize("hasAuthority('client:decrypt')")
    @ApiOperation(value = "获取密钥")
    public BaseRsp<String> getOriginClientSecret(@ApiParam(value = "客户端id", required = true) @NotBlank(message = "{required}") @PathVariable String clientId) {
        OauthClientDetailsVo client = this.oauthClientDetailsService.findById(clientId);
        String origin = client != null ? client.getOriginSecret() : StringUtils.EMPTY;
        return this.success(origin);
    }

    @GetMapping
    @PreAuthorize("hasAuthority('client:view')")
    @ApiOperation(value = "分页")
    public BaseRsp<BasePage<OauthClientDetailsVo>> findOauthClientDetailsPage(FindOauthClientDetailsPageAo findOauthClientDetailsPageAo) {
        return this.success(this.oauthClientDetailsService.findOauthClientDetailsPage(findOauthClientDetailsPageAo));
    }

    @PostMapping
    @PreAuthorize("hasAuthority('client:add')")
    @ApiOperation(value = "添加")
    public void createOauthClientDetails(@RequestBody @Validated(AddStrategy.class) OauthClientDetailsAo oauthClientDetailsAo) {
        this.oauthClientDetailsService.createOauthClientDetails(oauthClientDetailsAo);
    }

    @DeleteMapping("/{clientIds}")
    @PreAuthorize("hasAuthority('client:delete')")
    @ApiOperation(value = "删除")
    public void deleteOauthClientDetails(@ApiParam(value = "客户端id集合(,分隔)", required = true) @NotBlank(message = "{required}") @PathVariable String clientIds) {
        List<String> ids = Arrays.stream(clientIds.split(StringConstant.COMMA)).collect(Collectors.toList());
        this.oauthClientDetailsService.deleteOauthClientDetails(ids);
    }

    @PutMapping
    @PreAuthorize("hasAuthority('client:update')")
    @ApiOperation(value = "更新")
    public void updateOauthClientDetails(@RequestBody @Validated(UpdateStrategy.class) OauthClientDetailsAo oauthClientDetailsAo) {
        this.oauthClientDetailsService.updateOauthClientDetails(oauthClientDetailsAo);
    }
}
