package com.zclcs.server.dict.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.constant.DictConstant;
import com.zclcs.common.core.entity.dict.DictTableName;
import com.zclcs.common.core.entity.dict.ao.DictTableNameAo;
import com.zclcs.common.core.entity.dict.vo.DictTableNameVo;
import com.zclcs.server.dict.mapper.DictTableNameMapper;
import com.zclcs.server.dict.service.DictTableLevelService;
import com.zclcs.server.dict.service.DictTableNameService;
import com.zclcs.server.dict.service.DictTableService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 字典名表 Service实现
 *
 * @author zclcs
 * @date 2021-11-02 15:26:20.789
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class DictTableNameServiceImpl extends ServiceImpl<DictTableNameMapper, DictTableName> implements DictTableNameService {

    private final DictTableService dictTableService;
    private final DictTableLevelService dictTableLevelService;

    @Override
    public BasePage<DictTableNameVo> findDictTableNamePage(BasePageAo basePageAo, DictTableNameVo dictTableNameVo) {
        BasePage<DictTableNameVo> basePage = new BasePage<>(basePageAo.getPageNum(), basePageAo.getPageSize());
        QueryWrapper<DictTableNameVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StrUtil.isNotBlank(dictTableNameVo.getDictName()), "dtn.dict_name", dictTableNameVo.getDictName());
        queryWrapper.eq(StrUtil.isNotBlank(dictTableNameVo.getType()), "dtn.type", dictTableNameVo.getType());
        return this.baseMapper.findPageVo(basePage, queryWrapper);
    }

    @Override
    public List<DictTableNameVo> findDictTableNameList(DictTableNameVo dictTableNameVo) {
        QueryWrapper<DictTableNameVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StrUtil.isNotBlank(dictTableNameVo.getDictName()), "dtn.dict_name", dictTableNameVo.getDictName());
        queryWrapper.eq(StrUtil.isNotBlank(dictTableNameVo.getType()), "dtn.type", dictTableNameVo.getType());
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    public DictTableNameVo findDictTableName(DictTableNameVo dictTableNameVo) {
        QueryWrapper<DictTableNameVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StrUtil.isNotBlank(dictTableNameVo.getDictName()), "dtn.dict_name", dictTableNameVo.getDictName());
        queryWrapper.eq(StrUtil.isNotBlank(dictTableNameVo.getType()), "dtn.type", dictTableNameVo.getType());
        return this.baseMapper.findOneVo(queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createDictTableName(DictTableNameAo dictTableNameAo) {
        DictTableName dictTableName = new DictTableName();
        BeanUtil.copyProperties(dictTableNameAo, dictTableName);
        this.save(dictTableName);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateDictTableName(DictTableNameAo dictTableNameAo) {
        DictTableName dictTableName = new DictTableName();
        BeanUtil.copyProperties(dictTableNameAo, dictTableName);
        this.updateById(dictTableName);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteDictTableName(List<Long> ids) {
        List<DictTableName> list = this.lambdaQuery().in(DictTableName::getId, ids).list();
        List<Long> tableIds = list.stream()
                .filter(dictTableName -> dictTableName.getType().equals(DictConstant.DICT_TYPE_0))
                .map(DictTableName::getId)
                .collect(Collectors.toList());
        List<Long> tableLevelIds = list.stream()
                .filter(dictTableName -> dictTableName.getType().equals(DictConstant.DICT_TYPE_1))
                .map(DictTableName::getId)
                .collect(Collectors.toList());
        if (CollUtil.isNotEmpty(tableIds)) {
            dictTableService.deleteDictTableName(tableIds);
        }
        if (CollUtil.isNotEmpty(tableLevelIds)) {
            dictTableLevelService.deleteDictTableNameLevel(tableLevelIds);
        }
        this.removeByIds(ids);
    }
}
