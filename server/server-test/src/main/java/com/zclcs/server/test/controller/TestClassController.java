package com.zclcs.server.test.controller;

import com.zclcs.common.core.annotation.ControllerEndpoint;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.test.ao.TestClassAo;
import com.zclcs.common.core.entity.test.vo.TestClassVo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.server.test.service.TestClassService;
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
 * 班级 Controller
 *
 * @author zclcs
 * @date 2021-10-15 09:48:59.045
 */
@Slf4j
@Validated
@RestController
@RequestMapping("class")
@RequiredArgsConstructor
@Api(tags = "班级")
public class TestClassController {

    private final TestClassService testClassService;

    @GetMapping
    @ApiOperation(value = "班级查询（分页）")
    @PreAuthorize("hasAuthority('class:view')")
    public BaseRsp<BasePage<TestClassVo>> findTestClassPage(@Valid BasePageAo basePageAo, TestClassVo testClassVo) {
        BasePage<TestClassVo> page = this.testClassService.findTestClassPage(basePageAo, testClassVo);
        return BaseRspUtil.data(page);
    }

    @GetMapping("list")
    @ApiOperation(value = "班级查询（集合）")
    @PreAuthorize("hasAuthority('class:view')")
    public BaseRsp<List<TestClassVo>> findTestClassList(TestClassVo testClassVo) {
        List<TestClassVo> list = this.testClassService.findTestClassList(testClassVo);
        return BaseRspUtil.data(list);
    }

    @GetMapping("one")
    @ApiOperation(value = "班级查询（单个）")
    @PreAuthorize("hasAuthority('class:view')")
    public BaseRsp<TestClassVo> findTestClass(TestClassVo testClassVo) {
        TestClassVo testClass = this.testClassService.findTestClass(testClassVo);
        return BaseRspUtil.data(testClass);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('class:add')")
    @ControllerEndpoint(operation = "新增班级", exceptionMessage = "新增班级失败")
    @ApiOperation(value = "新增班级")
    public void addTestClass(@RequestBody @Validated TestClassAo testClassAo) {
        this.testClassService.createTestClass(testClassAo);
    }

    @DeleteMapping("/{classIds}")
    @PreAuthorize("hasAuthority('class:delete')")
    @ControllerEndpoint(operation = "删除班级", exceptionMessage = "删除班级失败")
    @ApiOperation(value = "删除班级")
    public void deleteTestClass(@ApiParam(value = "班级id集合(,分隔)", required = true) @NotBlank(message = "{required}") @PathVariable String classIds) {
        List<Long> ids = Arrays.stream(classIds.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.testClassService.deleteTestClass(ids);
    }

    @PutMapping
    @PreAuthorize("hasAuthority('class:update')")
    @ControllerEndpoint(operation = "修改班级", exceptionMessage = "修改班级失败")
    @ApiOperation(value = "修改班级")
    public void updateTestClass(@RequestBody @Validated TestClassAo testClassAo) {
        this.testClassService.updateTestClass(testClassAo);
    }
}