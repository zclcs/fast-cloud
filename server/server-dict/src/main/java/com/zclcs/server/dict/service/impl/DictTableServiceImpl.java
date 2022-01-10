package com.zclcs.server.dict.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.houkunlin.system.dict.starter.bean.DictValueVo;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.entity.dict.DictTable;
import com.zclcs.common.core.entity.dict.ao.DictTableAo;
import com.zclcs.common.core.entity.dict.vo.DictTableVo;
import com.zclcs.server.dict.mapper.DictTableMapper;
import com.zclcs.server.dict.provider.DictProvider;
import com.zclcs.server.dict.service.DictTableService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 字典 Service实现
 *
 * @author zclcs
 * @date 2021-11-02 15:26:13.215
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
@Slf4j
public class DictTableServiceImpl extends ServiceImpl<DictTableMapper, DictTable> implements DictTableService {

    private final DictProvider dictProvider;

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
        queryWrapper.in(CollectionUtil.isNotEmpty(dictTableVo.getDictNameIds()), "dt.dict_name_id", dictTableVo.getDictNameIds());
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    public DictTableVo findDictTable(DictTableVo dictTableVo) {
        QueryWrapper<DictTableVo> queryWrapper = getQueryWrapper(dictTableVo);
        return this.baseMapper.findOneVo(queryWrapper);
    }

    private QueryWrapper<DictTableVo> getQueryWrapper(DictTableVo dictTableVo) {
        QueryWrapper<DictTableVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StrUtil.isNotBlank(dictTableVo.getDictName()), "dtn.dict_name", dictTableVo.getDictName());
        queryWrapper.eq(dictTableVo.getDictNameId() != null, "dt.dict_name_id", dictTableVo.getDictNameId());
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
        this.save(dictTable);
        refreshDictValue(dictTable.getId());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateDictTable(DictTableAo dictTableAo) {
        DictTable dictTable = new DictTable();
        BeanUtil.copyProperties(dictTableAo, dictTable);
        this.updateById(dictTable);
        refreshDictValue(dictTable.getId());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteDictTable(List<Long> ids) {
        List<DictTableVo> dictTableList = this.findDictTableList(DictTableVo.builder().ids(ids).build());
        this.removeByIds(ids);
        deleteDictValue(dictTableList);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteDictTableName(List<Long> ids) {
        List<DictTableVo> dictTableList = this.findDictTableList(DictTableVo.builder().dictNameIds(ids).build());
        List<Long> tableIds = dictTableList.stream().map(DictTableVo::getId).collect(Collectors.toList());
        if (CollectionUtil.isNotEmpty(tableIds)) {
            this.removeByIds(tableIds);
            deleteDictValue(dictTableList);
        }
    }

    private void refreshDictValue(Long id) {
        DictTableVo dictTable = this.findDictTable(DictTableVo.builder().id(id).build());
        dictProvider.refreshDictCache(DictValueVo.builder()
                .dictType(dictTable.getDictName())
                .value(dictTable.getCode())
                .title(dictTable.getTitle())
                .build());
    }

    private void deleteDictValue(List<DictTableVo> dictTableList) {
        List<DictValueVo> dictValueVos = new ArrayList<>();
        for (DictTableVo dictTableVo : dictTableList) {
            DictValueVo dictValueVo = DictValueVo.builder()
                    .dictType(dictTableVo.getDictName())
                    .value(dictTableVo.getCode())
                    .title(null)
                    .build();
            dictValueVos.add(dictValueVo);
        }
        dictProvider.refreshDictListCache(dictValueVos);
    }
}
