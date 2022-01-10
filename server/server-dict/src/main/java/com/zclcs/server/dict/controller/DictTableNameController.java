package com.zclcs.server.dict.controller;

import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.dict.ao.DictTableNameAo;
import com.zclcs.common.core.entity.dict.vo.DictTableNameVo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.server.dict.service.DictTableNameService;
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
 * 字典名表 Controller
 *
 * @author zclcs
 * @date 2021-11-02 15:26:20.789
 */
@Slf4j
@Validated
@RestController
@RequestMapping("tableName")
@RequiredArgsConstructor
@Api(tags = "字典名表")
public class DictTableNameController {

    private final DictTableNameService dictTableNameService;

    @GetMapping
    @ApiOperation(value = "字典名表查询（分页）")
    @PreAuthorize("hasAuthority('tableName:view')")
    public BaseRsp<BasePage<DictTableNameVo>> findDictTableNamePage(@Valid BasePageAo basePageAo, DictTableNameVo dictTableNameVo) {
        BasePage<DictTableNameVo> page = this.dictTableNameService.findDictTableNamePage(basePageAo, dictTableNameVo);
        return BaseRspUtil.data(page);
    }

    @GetMapping("list")
    @ApiOperation(value = "字典名表查询（集合）")
    @PreAuthorize("hasAuthority('tableName:view')")
    public BaseRsp<List<DictTableNameVo>> findDictTableNameList(DictTableNameVo dictTableNameVo) {
        List<DictTableNameVo> list = this.dictTableNameService.findDictTableNameList(dictTableNameVo);
        return BaseRspUtil.data(list);
    }

    @GetMapping("one")
    @ApiOperation(value = "字典名表查询（单个）")
    @PreAuthorize("hasAuthority('tableName:view')")
    public BaseRsp<DictTableNameVo> findDictTableName(DictTableNameVo dictTableNameVo) {
        DictTableNameVo dictTableName = this.dictTableNameService.findDictTableName(dictTableNameVo);
        return BaseRspUtil.data(dictTableName);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('tableName:add')")
    @ApiOperation(value = "新增字典名表")
    public void addDictTableName(@RequestBody @Validated DictTableNameAo dictTableNameAo) {
        this.dictTableNameService.createDictTableName(dictTableNameAo);
    }

    @DeleteMapping("/{tableNameIds}")
    @PreAuthorize("hasAuthority('tableName:delete')")
    @ApiOperation(value = "删除字典名表")
    public void deleteDictTableName(@ApiParam(value = "字典名表id集合(,分隔)", required = true) @NotBlank(message = "{required}") @PathVariable String tableNameIds) {
        List<Long> ids = Arrays.stream(tableNameIds.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.dictTableNameService.deleteDictTableName(ids);
    }

    @PutMapping
    @PreAuthorize("hasAuthority('tableName:update')")
    @ApiOperation(value = "修改字典名表")
    public void updateDictTableName(@RequestBody @Validated DictTableNameAo dictTableNameAo) {
        this.dictTableNameService.updateDictTableName(dictTableNameAo);
    }
}