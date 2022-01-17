package com.zclcs.server.test.controller;

import com.zclcs.common.core.annotation.ControllerEndpoint;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.test.ProjectCompany;
import com.zclcs.common.core.entity.test.ao.ProjectCompanyAo;
import com.zclcs.common.core.entity.test.vo.ProjectCompanyVo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import com.zclcs.server.test.service.ProjectCompanyService;
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
 * 参建单位 Controller
 *
 * @author zclcs
 * @date 2022-01-13 11:19:10.776
 */
@Slf4j
@RestController
@RequestMapping("projectCompany")
@RequiredArgsConstructor
@Api(tags = "参建单位")
public class ProjectCompanyController {

    private final ProjectCompanyService projectCompanyService;

    @GetMapping
    @ApiOperation(value = "参建单位查询（分页）")
    @PreAuthorize("hasAuthority('projectCompany:view')")
    public BaseRsp<BasePage<ProjectCompanyVo>> findProjectCompanyPage(@Validated BasePageAo basePageAo, @Validated ProjectCompanyVo projectCompanyVo) {
        BasePage<ProjectCompanyVo> page = this.projectCompanyService.findProjectCompanyPage(basePageAo, projectCompanyVo);
        return BaseRspUtil.data(page);
    }

    @GetMapping("list")
    @ApiOperation(value = "参建单位查询（集合）")
    @PreAuthorize("hasAuthority('projectCompany:view')")
    public BaseRsp<List<ProjectCompanyVo>> findProjectCompanyList(@Validated ProjectCompanyVo projectCompanyVo) {
        List<ProjectCompanyVo> list = this.projectCompanyService.findProjectCompanyList(projectCompanyVo);
        return BaseRspUtil.data(list);
    }

    @GetMapping("one")
    @ApiOperation(value = "参建单位查询（单个）")
    @PreAuthorize("hasAuthority('projectCompany:view')")
    public BaseRsp<ProjectCompanyVo> findProjectCompany(@Validated ProjectCompanyVo projectCompanyVo) {
        ProjectCompanyVo projectCompany = this.projectCompanyService.findProjectCompany(projectCompanyVo);
        return BaseRspUtil.data(projectCompany);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('projectCompany:add')")
    @ControllerEndpoint(operation = "新增参建单位")
    @ApiOperation(value = "新增参建单位")
    public BaseRsp<ProjectCompany> addProjectCompany(@RequestBody @Validated ProjectCompanyAo projectCompanyAo) {
        return BaseRspUtil.data(this.projectCompanyService.createProjectCompany(projectCompanyAo));
    }

    @DeleteMapping("/{projectCompanyIds}")
    @PreAuthorize("hasAuthority('projectCompany:delete')")
    @ControllerEndpoint(operation = "删除参建单位")
    @ApiOperation(value = "删除参建单位")
    public BaseRsp<String> deleteProjectCompany(@ApiParam(value = "参建单位id集合(,分隔)", required = true) @NotBlank(message = "{required}") @PathVariable String projectCompanyIds) {
        List<Long> ids = Arrays.stream(projectCompanyIds.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.projectCompanyService.deleteProjectCompany(ids);
        return BaseRspUtil.message("删除成功");
    }

    @PutMapping
    @PreAuthorize("hasAuthority('projectCompany:update')")
    @ControllerEndpoint(operation = "修改参建单位")
    @ApiOperation(value = "修改参建单位")
    public BaseRsp<ProjectCompany> updateProjectCompany(@RequestBody @Validated(UpdateStrategy.class) ProjectCompanyAo projectCompanyAo) {
        return BaseRspUtil.data(this.projectCompanyService.updateProjectCompany(projectCompanyAo));
    }
}