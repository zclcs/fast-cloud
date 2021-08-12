package com.zclcs.auth.controller;

import com.zclcs.auth.entity.ao.FindOauthClientDetailsPageAo;
import com.zclcs.auth.entity.ao.OauthClientDetailsAo;
import com.zclcs.auth.entity.vo.OauthClientDetailsVo;
import com.zclcs.auth.service.OauthClientDetailsService;
import com.zclcs.common.core.base.BaseController;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BaseRsp;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * @author Yuuki
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
    public boolean checkUserName(@NotBlank(message = "{required}") @PathVariable String clientId) {
        OauthClientDetailsVo client = this.oauthClientDetailsService.findById(clientId);
        return client == null;
    }

    @GetMapping("secret/{clientId}")
    @PreAuthorize("hasAuthority('client:decrypt')")
    @ApiOperation(value = "获取密钥")
    public BaseRsp<String> getOriginClientSecret(@NotBlank(message = "{required}") @PathVariable String clientId) {
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
    public void createOauthClientDetails(@Valid OauthClientDetailsAo oauthClientDetailsAo) {
        this.oauthClientDetailsService.createOauthClientDetails(oauthClientDetailsAo);
    }

    @DeleteMapping
    @PreAuthorize("hasAuthority('client:delete')")
    @ApiOperation(value = "删除")
    public void deleteOauthClientDetails(@NotNull(message = "{required}") List<String> clientIds) {
        this.oauthClientDetailsService.deleteOauthClientDetails(clientIds);
    }

    @PutMapping
    @PreAuthorize("hasAuthority('client:update')")
    @ApiOperation(value = "更新")
    public void updateOauthClientDetails(@Valid OauthClientDetailsAo oauthClientDetailsAo) {
        this.oauthClientDetailsService.updateOauthClientDetails(oauthClientDetailsAo);
    }
}
