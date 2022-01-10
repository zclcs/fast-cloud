package com.zclcs.server.test.controller;

import com.zclcs.common.core.annotation.ControllerEndpoint;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.test.TestClass;
import com.zclcs.common.core.entity.test.ao.TestClassAo;
import com.zclcs.common.core.entity.test.vo.TestClassVo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import com.zclcs.server.test.service.TestClassService;
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
 * 班级 Controller
 *
 * @author zclcs
 * @date 2022-01-10 14:54:16.690
 */
@Slf4j
@RestController
@RequestMapping("testClass")
@RequiredArgsConstructor
@Api(tags = "班级")
public class TestClassController {

    private final TestClassService testClassService;

    @GetMapping
    @ApiOperation(value = "班级查询（分页）")
    @PreAuthorize("hasAuthority('testClass:view')")
    public BaseRsp<BasePage<TestClassVo>> findTestClassPage(@Validated BasePageAo basePageAo, @Validated TestClassVo testClassVo) {
        BasePage<TestClassVo> page = this.testClassService.findTestClassPage(basePageAo, testClassVo);
        return BaseRspUtil.data(page);
    }

    @GetMapping("list")
    @ApiOperation(value = "班级查询（集合）")
    @PreAuthorize("hasAuthority('testClass:view')")
    public BaseRsp<List<TestClassVo>> findTestClassList(@Validated TestClassVo testClassVo) {
        List<TestClassVo> list = this.testClassService.findTestClassList(testClassVo);
        return BaseRspUtil.data(list);
    }

    @GetMapping("one")
    @ApiOperation(value = "班级查询（单个）")
    @PreAuthorize("hasAuthority('testClass:view')")
    public BaseRsp<TestClassVo> findTestClass(@Validated TestClassVo testClassVo) {
        TestClassVo testClass = this.testClassService.findTestClass(testClassVo);
        return BaseRspUtil.data(testClass);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('testClass:add')")
    @ControllerEndpoint(operation = "新增班级")
    @ApiOperation(value = "新增班级")
    public BaseRsp<TestClass> addTestClass(@RequestBody @Validated TestClassAo testClassAo) {
        return BaseRspUtil.data(this.testClassService.createTestClass(testClassAo));
    }

    @DeleteMapping("/{testClassIds}")
    @PreAuthorize("hasAuthority('testClass:delete')")
    @ControllerEndpoint(operation = "删除班级")
    @ApiOperation(value = "删除班级")
    public BaseRsp<String> deleteTestClass(@ApiParam(value = "班级id集合(,分隔)", required = true) @NotBlank(message = "{required}") @PathVariable String testClassIds) {
        List<Long> ids = Arrays.stream(testClassIds.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.testClassService.deleteTestClass(ids);
        return BaseRspUtil.message("删除成功");
    }

    @PutMapping
    @PreAuthorize("hasAuthority('testClass:update')")
    @ControllerEndpoint(operation = "修改班级")
    @ApiOperation(value = "修改班级")
    public BaseRsp<TestClass> updateTestClass(@RequestBody @Validated(UpdateStrategy.class) TestClassAo testClassAo) {
        return BaseRspUtil.data(this.testClassService.updateTestClass(testClassAo));
    }
}