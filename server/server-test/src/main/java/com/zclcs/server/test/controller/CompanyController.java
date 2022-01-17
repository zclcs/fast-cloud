package com.zclcs.server.test.controller;

import com.zclcs.common.core.annotation.ControllerEndpoint;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.test.Company;
import com.zclcs.common.core.entity.test.ao.CompanyAo;
import com.zclcs.common.core.entity.test.vo.CompanyVo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import com.zclcs.server.test.service.CompanyService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 企业 Controller
 *
 * @author zclcs
 * @date 2022-01-13 11:16:59.185
 */
@Slf4j
@RestController
@RequestMapping("company")
@RequiredArgsConstructor
@Api(tags = "企业")
public class CompanyController {

    private final CompanyService companyService;

    @GetMapping
    @ApiOperation(value = "企业查询（分页）")
    @PreAuthorize("hasAuthority('company:view')")
    public BaseRsp<BasePage<CompanyVo>> findCompanyPage(@Validated BasePageAo basePageAo, @Validated CompanyVo companyVo) {
        BasePage<CompanyVo> page = this.companyService.findCompanyPage(basePageAo, companyVo);
        return BaseRspUtil.data(page);
    }

    @GetMapping("list")
    @ApiOperation(value = "企业查询（集合）")
    @PreAuthorize("hasAuthority('company:view')")
    public BaseRsp<List<CompanyVo>> findCompanyList(@Validated CompanyVo companyVo) {
        List<CompanyVo> list = this.companyService.findCompanyList(companyVo);
        return BaseRspUtil.data(list);
    }

    @GetMapping("one")
    @ApiOperation(value = "企业查询（单个）")
    @PreAuthorize("hasAuthority('company:view')")
    public BaseRsp<CompanyVo> findCompany(@Validated CompanyVo companyVo) {
        CompanyVo company = this.companyService.findCompany(companyVo);
        return BaseRspUtil.data(company);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('company:add')")
    @ControllerEndpoint(operation = "新增企业")
    @ApiOperation(value = "新增企业")
    public BaseRsp<Company> addCompany(@RequestBody @Validated CompanyAo companyAo) {
        return BaseRspUtil.data(this.companyService.createCompany(companyAo));
    }

    @DeleteMapping("/{companyIds}")
    @PreAuthorize("hasAuthority('company:delete')")
    @ControllerEndpoint(operation = "删除企业")
    @ApiOperation(value = "删除企业")
    public BaseRsp<String> deleteCompany(@ApiParam(value = "企业id集合(,分隔)", required = true) @NotBlank(message = "{required}") @PathVariable String companyIds) {
        List<Long> ids = Arrays.stream(companyIds.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.companyService.deleteCompany(ids);
        return BaseRspUtil.message("删除成功");
    }

    @PutMapping
    @PreAuthorize("hasAuthority('company:update')")
    @ControllerEndpoint(operation = "修改企业")
    @ApiOperation(value = "修改企业")
    public BaseRsp<Company> updateCompany(@RequestBody @Validated(UpdateStrategy.class) CompanyAo companyAo) {
        return BaseRspUtil.data(this.companyService.updateCompany(companyAo));
    }
}