package com.zclcs.server.test.controller;

import com.zclcs.common.core.annotation.ControllerEndpoint;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.test.Project;
import com.zclcs.common.core.entity.test.ao.ProjectAo;
import com.zclcs.common.core.entity.test.vo.ProjectVo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import com.zclcs.server.test.service.ProjectService;
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
 * 项目 Controller
 *
 * @author zclcs
 * @date 2022-01-13 11:18:52.469
 */
@Slf4j
@RestController
@RequestMapping("project")
@RequiredArgsConstructor
@Api(tags = "项目")
public class ProjectController {

    private final ProjectService projectService;

    @GetMapping
    @ApiOperation(value = "项目查询（分页）")
    @PreAuthorize("hasAuthority('project:view')")
    public BaseRsp<BasePage<ProjectVo>> findProjectPage(@Validated BasePageAo basePageAo, @Validated ProjectVo projectVo) {
        BasePage<ProjectVo> page = this.projectService.findProjectPage(basePageAo, projectVo);
        return BaseRspUtil.data(page);
    }

    @GetMapping("list")
    @ApiOperation(value = "项目查询（集合）")
    @PreAuthorize("hasAuthority('project:view')")
    public BaseRsp<List<ProjectVo>> findProjectList(@Validated ProjectVo projectVo) {
        List<ProjectVo> list = this.projectService.findProjectList(projectVo);
        return BaseRspUtil.data(list);
    }

    @GetMapping("one")
    @ApiOperation(value = "项目查询（单个）")
    @PreAuthorize("hasAuthority('project:view')")
    public BaseRsp<ProjectVo> findProject(@Validated ProjectVo projectVo) {
        ProjectVo project = this.projectService.findProject(projectVo);
        return BaseRspUtil.data(project);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('project:add')")
    @ControllerEndpoint(operation = "新增项目")
    @ApiOperation(value = "新增项目")
    public BaseRsp<Project> addProject(@RequestBody @Validated ProjectAo projectAo) {
        return BaseRspUtil.data(this.projectService.createProject(projectAo));
    }

    @DeleteMapping("/{projectIds}")
    @PreAuthorize("hasAuthority('project:delete')")
    @ControllerEndpoint(operation = "删除项目")
    @ApiOperation(value = "删除项目")
    public BaseRsp<String> deleteProject(@ApiParam(value = "项目id集合(,分隔)", required = true) @NotBlank(message = "{required}") @PathVariable String projectIds) {
        List<Long> ids = Arrays.stream(projectIds.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.projectService.deleteProject(ids);
        return BaseRspUtil.message("删除成功");
    }

    @PutMapping
    @PreAuthorize("hasAuthority('project:update')")
    @ControllerEndpoint(operation = "修改项目")
    @ApiOperation(value = "修改项目")
    public BaseRsp<Project> updateProject(@RequestBody @Validated(UpdateStrategy.class) ProjectAo projectAo) {
        return BaseRspUtil.data(this.projectService.updateProject(projectAo));
    }
}