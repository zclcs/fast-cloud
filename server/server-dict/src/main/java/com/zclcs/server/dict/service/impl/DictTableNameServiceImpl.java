package com.zclcs.server.dict.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.constant.DictConstant;
import com.zclcs.common.core.constant.ValidConstant;
import com.zclcs.common.core.entity.dict.DictTableName;
import com.zclcs.common.core.entity.dict.ao.DictTableNameAo;
import com.zclcs.common.core.entity.dict.vo.DictTableNameVo;
import com.zclcs.common.core.exception.MyException;
import com.zclcs.server.dict.mapper.DictTableNameMapper;
import com.zclcs.server.dict.service.DictTableLevelService;
import com.zclcs.server.dict.service.DictTableNameService;
import com.zclcs.server.dict.service.DictTableService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * 字典名表 Service实现
 *
 * @author zclcs
 * @date 2021-11-02 15:26:20.789
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class DictTableNameServiceImpl extends ServiceImpl<DictTableNameMapper, DictTableName> implements DictTableNameService {

    private final DictTableService dictTableService;
    private final DictTableLevelService dictTableLevelService;

    @Override
    public BasePage<DictTableNameVo> findDictTableNamePage(BasePageAo basePageAo, DictTableNameVo dictTableNameVo) {
        BasePage<DictTableNameVo> basePage = new BasePage<>(basePageAo.getPageNum(), basePageAo.getPageSize());
        QueryWrapper<DictTableNameVo> queryWrapper = getQueryWrapper(dictTableNameVo);
        return this.baseMapper.findPageVo(basePage, queryWrapper);
    }

    @Override
    public List<DictTableNameVo> findDictTableNameList(DictTableNameVo dictTableNameVo) {
        QueryWrapper<DictTableNameVo> queryWrapper = getQueryWrapper(dictTableNameVo);
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    public DictTableNameVo findDictTableName(DictTableNameVo dictTableNameVo) {
        QueryWrapper<DictTableNameVo> queryWrapper = getQueryWrapper(dictTableNameVo);
        return this.baseMapper.findOneVo(queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createDictTableName(DictTableNameAo dictTableNameAo) {
        DictTableName dictTableName = new DictTableName();
        BeanUtil.copyProperties(dictTableNameAo, dictTableName);
        validAdd(dictTableName);
        this.save(dictTableName);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateDictTableName(DictTableNameAo dictTableNameAo) {
        DictTableName dictTableName = new DictTableName();
        BeanUtil.copyProperties(dictTableNameAo, dictTableName);
        validUpdate(dictTableName);
        this.updateById(dictTableName);

    }

    @Override
    @Transactional(rollbackFor = Exception.class, readOnly = false)
    public void deleteDictTableName(List<Long> ids) {
        List<DictTableName> list = this.lambdaQuery().in(DictTableName::getId, ids).list();
        List<String> tableDict = list.stream()
                .filter(dictTableName -> dictTableName.getType().equals(DictConstant.DICT_TYPE_0))
                .map(DictTableName::getDictName)
                .collect(Collectors.toList());
        List<String> tableDictLevel = list.stream()
                .filter(dictTableName -> dictTableName.getType().equals(DictConstant.DICT_TYPE_1))
                .map(DictTableName::getDictName)
                .collect(Collectors.toList());
        if (CollUtil.isNotEmpty(tableDict)) {
            dictTableService.deleteDictTableName(tableDict);
        }
        if (CollUtil.isNotEmpty(tableDictLevel)) {
            dictTableLevelService.deleteDictTableNameLevel(tableDictLevel);
        }
        this.removeByIds(ids);
    }

    private QueryWrapper<DictTableNameVo> getQueryWrapper(DictTableNameVo dictTableNameVo) {
        QueryWrapper<DictTableNameVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StrUtil.isNotBlank(dictTableNameVo.getDictName()), "dtn.dict_name", dictTableNameVo.getDictName());
        queryWrapper.eq(StrUtil.isNotBlank(dictTableNameVo.getType()), "dtn.type", dictTableNameVo.getType());
        queryWrapper.eq(dictTableNameVo.getId() != null, "dtn.id", dictTableNameVo.getId());
        return queryWrapper;
    }

    private void validAdd(DictTableName dictTableName) {
        validDictName(dictTableName);
    }

    private void validUpdate(DictTableName dictTableName) {
        DictTableNameVo dictTableNameVo = this.findDictTableName(DictTableNameVo.builder().id(dictTableName.getId()).build());
        Optional.ofNullable(dictTableNameVo).orElseThrow(() -> new MyException("查询不到该字典"));
        if (!StrUtil.equals(dictTableNameVo.getDictName(), dictTableName.getDictName())) {
            validDictName(dictTableName);
            updateDictName(dictTableNameVo.getDictName(), dictTableName.getDictName());
        }
    }

    private void validDictName(DictTableName dictTableName) {
        if (!this.lambdaQuery().eq(DictTableName::getDictName, dictTableName.getDictName()).count().equals(ValidConstant.COUNT_0)) {
            throw new MyException("字典名称重复");
        }
    }

    private void updateDictName(String oldDictName, String newDictName) {
        dictTableService.updateDictTableName(oldDictName, newDictName);
        dictTableLevelService.updateDictTableName(oldDictName, newDictName);
    }

}
