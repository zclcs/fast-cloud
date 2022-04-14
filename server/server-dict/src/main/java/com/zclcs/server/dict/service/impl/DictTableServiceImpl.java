package com.zclcs.server.dict.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.constant.DictConstant;
import com.zclcs.common.core.constant.ValidConstant;
import com.zclcs.common.core.entity.dict.DictTable;
import com.zclcs.common.core.entity.dict.DictTableName;
import com.zclcs.common.core.entity.dict.ao.DictTableAo;
import com.zclcs.common.core.entity.dict.vo.DictTableVo;
import com.zclcs.common.core.exception.MyException;
import com.zclcs.server.dict.mapper.DictTableMapper;
import com.zclcs.server.dict.mapper.DictTableNameMapper;
import com.zclcs.server.dict.service.DictTableService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

/**
 * 字典 Service实现
 *
 * @author zclcs
 * @date 2021-11-02 15:26:13.215
 */
@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class DictTableServiceImpl extends ServiceImpl<DictTableMapper, DictTable> implements DictTableService {

    private final DictTableNameMapper dictTableNameMapper;

    @Override
    public BasePage<DictTableVo> findDictTablePage(BasePageAo basePageAo, DictTableVo dictTableVo) {
        BasePage<DictTableVo> basePage = new BasePage<>(basePageAo.getPageNum(), basePageAo.getPageSize());
        QueryWrapper<DictTableVo> queryWrapper = getQueryWrapper(dictTableVo);
        return this.baseMapper.findPageVo(basePage, queryWrapper);
    }

    @Override
    public List<DictTableVo> findDictTableList(DictTableVo dictTableVo) {
        QueryWrapper<DictTableVo> queryWrapper = getQueryWrapper(dictTableVo);
        queryWrapper.in(CollectionUtil.isNotEmpty(dictTableVo.getIds()), "dt.id", dictTableVo.getIds());
        queryWrapper.in(CollectionUtil.isNotEmpty(dictTableVo.getDictNames()), "dt.dict_name", dictTableVo.getDictNames());
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    public DictTableVo findDictTable(DictTableVo dictTableVo) {
        QueryWrapper<DictTableVo> queryWrapper = getQueryWrapper(dictTableVo);
        return this.baseMapper.findOneVo(queryWrapper);
    }

    private QueryWrapper<DictTableVo> getQueryWrapper(DictTableVo dictTableVo) {
        QueryWrapper<DictTableVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(dictTableVo.getDictName() != null, "dt.dict_name", dictTableVo.getDictName());
        queryWrapper.eq(StrUtil.isNotBlank(dictTableVo.getCode()), "dt.code", dictTableVo.getCode());
        queryWrapper.like(StrUtil.isNotBlank(dictTableVo.getTitle()), "dt.title", dictTableVo.getTitle());
        queryWrapper.eq(dictTableVo.getId() != null, "dt.id", dictTableVo.getId());
        return queryWrapper;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createDictTable(DictTableAo dictTableAo) {
        DictTable dictTable = new DictTable();
        BeanUtil.copyProperties(dictTableAo, dictTable);
        validAdd(dictTable);
        this.save(dictTable);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateDictTable(DictTableAo dictTableAo) {
        DictTable dictTable = new DictTable();
        BeanUtil.copyProperties(dictTableAo, dictTable);
        validUpdate(dictTable);
        this.updateById(dictTable);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteDictTable(List<Long> ids) {
        this.removeByIds(ids);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteDictTableName(List<String> dictNames) {
        this.lambdaUpdate().in(DictTable::getDictName, dictNames).remove();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateDictTableName(String oldDictName, String newDictName) {
        this.lambdaUpdate().eq(DictTable::getDictName, oldDictName).set(DictTable::getDictName, newDictName).update();
    }

    private void validAdd(DictTable dictTable) {
        validDictCode(dictTable);
        validDictName(dictTable);
    }

    private void validUpdate(DictTable dictTable) {
        DictTableVo dictTableVo = this.findDictTable(DictTableVo.builder().id(dictTable.getId()).build());
        Optional.ofNullable(dictTableVo).orElseThrow(() -> new MyException("查询不到该字典项"));
        if (!StrUtil.equals(dictTableVo.getCode(), dictTable.getCode())) {
            validDictCode(dictTable);
        }
        validDictName(dictTable);
    }

    private void validDictCode(DictTable dictTable) {
        if (!this.lambdaQuery().eq(DictTable::getCode, dictTable.getCode()).count().equals(ValidConstant.COUNT_0)) {
            throw new MyException("字典项code重复");
        }
    }

    private void validDictName(DictTable dictTable) {
        if (dictTableNameMapper.selectCount(new QueryWrapper<DictTableName>().lambda()
                .eq(DictTableName::getDictName, dictTable.getDictName())
                .eq(DictTableName::getType, DictConstant.DICT_TYPE_0)).equals(ValidConstant.COUNT_0)) {
            throw new MyException("未找到该字典：" + dictTable.getDictName());
        }
    }
}
