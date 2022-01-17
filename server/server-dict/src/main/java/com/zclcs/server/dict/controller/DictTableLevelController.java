package com.zclcs.server.dict.controller;

import cn.hutool.core.util.StrUtil;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.dict.ao.DictTableLevelAo;
import com.zclcs.common.core.entity.dict.vo.DictTableLevelTreeVo;
import com.zclcs.common.core.entity.dict.vo.DictTableLevelVo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.server.dict.service.DictTableLevelService;
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
 * 层级字典 Controller
 *
 * @author zclcs
 * @date 2021-11-02 15:26:28.342
 */
@Slf4j
@Validated
@RestController
@RequestMapping("tableLevel")
@RequiredArgsConstructor
@Api(tags = "层级字典")
public class DictTableLevelController {

    private final DictTableLevelService dictTableLevelService;

    @GetMapping
    @ApiOperation(value = "层级字典查询（树结构）")
    @PreAuthorize("hasAuthority('tableLevel:view')")
    public BaseRsp<List<DictTableLevelTreeVo>> findDictTableLevelTreeVo(@Validated DictTableLevelVo dictTableLevelVo) {
        List<DictTableLevelTreeVo> dictTableLevelTreeVo = this.dictTableLevelService.findDictTableLevelTreeVo(dictTableLevelVo);
        return BaseRspUtil.data(dictTableLevelTreeVo);
    }

    @GetMapping("option")
    @ApiOperation(value = "层级字典查询（树结构）下拉框")
    @PreAuthorize("hasAuthority('tableLevel:view')")
    public BaseRsp<List<DictTableLevelTreeVo>> findDictTableLevelOption(DictTableLevelVo dictTableLevelVo) {
        List<DictTableLevelTreeVo> dictTableLevelTreeVo = this.dictTableLevelService.findDictTableLevelTreeVo(dictTableLevelVo);
        return BaseRspUtil.data(dictTableLevelTreeVo);
    }

    @GetMapping("lazy/option")
    @ApiOperation(value = "层级字典查询（懒加载）", notes = "不传parentId 默认查顶级 不传 dictName 默认 area_code")
    public BaseRsp<List<DictTableLevelVo>> findDictTableLevelOptionLazy(DictTableLevelVo dictTableLevelVo) {
        if (StrUtil.isBlank(dictTableLevelVo.getDictName())) {
            dictTableLevelVo.setDictName(MyConstant.AREA_CODE);
        }
        List<DictTableLevelVo> dictTableLevelList = this.dictTableLevelService.findDictTableLevelOptionLazy(dictTableLevelVo);
        return BaseRspUtil.data(dictTableLevelList);
    }

    @GetMapping("list")
    @ApiOperation(value = "层级字典查询（集合）")
    @PreAuthorize("hasAuthority('tableLevel:view')")
    public BaseRsp<List<DictTableLevelVo>> findDictTableLevelList(DictTableLevelVo dictTableLevelVo) {
        List<DictTableLevelVo> dictTableLevelTreeVo = this.dictTableLevelService.findDictTableLevelList(dictTableLevelVo);
        return BaseRspUtil.data(dictTableLevelTreeVo);
    }

//    @GetMapping("list")
//    @ApiOperation(value = "层级字典查询（集合）")
//    public BaseRsp<List<DictTableLevelVo>> findDictTableLevelList(DictTableLevelVo dictTableLevelVo) {
//        List<DictTableLevelVo> list = this.dictTableLevelService.findDictTableLevelList(dictTableLevelVo);
//        return BaseRspUtil.data(list);
//    }

    @GetMapping("one")
    @ApiOperation(value = "层级字典查询（单个）")
    @PreAuthorize("hasAuthority('tableLevel:view')")
    public BaseRsp<DictTableLevelVo> findDictTableLevel(DictTableLevelVo dictTableLevelVo) {
        DictTableLevelVo dictTableLevel = this.dictTableLevelService.findDictTableLevel(dictTableLevelVo);
        return BaseRspUtil.data(dictTableLevel);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('tableLevel:add')")
    @ApiOperation(value = "新增层级字典")
    public void addDictTableLevel(@RequestBody @Validated DictTableLevelAo dictTableLevelAo) {
        this.dictTableLevelService.createDictTableLevel(dictTableLevelAo);
    }

    @DeleteMapping("/{tableLevelIds}")
    @PreAuthorize("hasAuthority('tableLevel:delete')")
    @ApiOperation(value = "删除层级字典")
    public void deleteDictTableLevel(@ApiParam(value = "层级字典id集合(,分隔)", required = true) @NotBlank(message = "{required}") @PathVariable String tableLevelIds) {
        List<Long> ids = Arrays.stream(tableLevelIds.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.dictTableLevelService.deleteDictTableLevel(ids);
    }

    @PutMapping
    @PreAuthorize("hasAuthority('tableLevel:update')")
    @ApiOperation(value = "修改层级字典")
    public void updateDictTableLevel(@RequestBody @Validated DictTableLevelAo dictTableLevelAo) {
        this.dictTableLevelService.updateDictTableLevel(dictTableLevelAo);
    }
}