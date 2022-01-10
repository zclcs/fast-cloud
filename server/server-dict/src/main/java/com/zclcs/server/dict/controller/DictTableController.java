package com.zclcs.server.dict.controller;

import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.dict.ao.DictTableAo;
import com.zclcs.common.core.entity.dict.vo.DictTableVo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.server.dict.service.DictTableService;
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
 * 字典 Controller
 *
 * @author zclcs
 * @date 2021-11-02 15:26:13.215
 */
@Slf4j
@Validated
@RestController
@RequestMapping("table")
@RequiredArgsConstructor
@Api(tags = "字典")
public class DictTableController {

    private final DictTableService dictTableService;

    @GetMapping
    @ApiOperation(value = "字典查询（分页）")
    @PreAuthorize("hasAuthority('table:view')")
    public BaseRsp<BasePage<DictTableVo>> findDictTablePage(@Valid BasePageAo basePageAo, DictTableVo dictTableVo) {
        BasePage<DictTableVo> page = this.dictTableService.findDictTablePage(basePageAo, dictTableVo);
        return BaseRspUtil.data(page);
    }

    @GetMapping("list")
    @ApiOperation(value = "字典查询（集合）")
    @PreAuthorize("hasAuthority('table:view')")
    public BaseRsp<List<DictTableVo>> findDictTableList(DictTableVo dictTableVo) {
        List<DictTableVo> list = this.dictTableService.findDictTableList(dictTableVo);
        return BaseRspUtil.data(list);
    }

    @GetMapping("one")
    @ApiOperation(value = "字典查询（单个）")
    @PreAuthorize("hasAuthority('table:view')")
    public BaseRsp<DictTableVo> findDictTable(DictTableVo dictTableVo) {
        DictTableVo dictTable = this.dictTableService.findDictTable(dictTableVo);
        return BaseRspUtil.data(dictTable);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('table:add')")
    @ApiOperation(value = "新增字典")
    public void addDictTable(@RequestBody @Validated DictTableAo dictTableAo) {
        this.dictTableService.createDictTable(dictTableAo);
    }

    @DeleteMapping("/{tableIds}")
    @PreAuthorize("hasAuthority('table:delete')")
    @ApiOperation(value = "删除字典")
    public void deleteDictTable(@ApiParam(value = "字典id集合(,分隔)", required = true) @NotBlank(message = "{required}") @PathVariable String tableIds) {
        List<Long> ids = Arrays.stream(tableIds.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.dictTableService.deleteDictTable(ids);
    }

    @PutMapping
    @PreAuthorize("hasAuthority('table:update')")
    @ApiOperation(value = "修改字典")
    public void updateDictTable(@RequestBody @Validated DictTableAo dictTableAo) {
        this.dictTableService.updateDictTable(dictTableAo);
    }
}