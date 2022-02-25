package com.zclcs.server.dict.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.houkunlin.system.dict.starter.bean.DictValueVo;
import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.common.core.entity.dict.DictTableLevel;
import com.zclcs.common.core.entity.dict.ao.DictTableLevelAo;
import com.zclcs.common.core.entity.dict.vo.DictTableLevelTreeVo;
import com.zclcs.common.core.entity.dict.vo.DictTableLevelVo;
import com.zclcs.common.core.utils.BaseTreeUtil;
import com.zclcs.server.dict.mapper.DictTableLevelMapper;
import com.zclcs.server.dict.provider.DictProvider;
import com.zclcs.server.dict.service.DictTableLevelService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * 层级字典 Service实现
 *
 * @author zclcs
 * @date 2021-11-02 15:26:28.342
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class DictTableLevelServiceImpl extends ServiceImpl<DictTableLevelMapper, DictTableLevel> implements DictTableLevelService {

    private final DictProvider dictProvider;

    @Override
    public List<DictTableLevelTreeVo> findDictTableLevelTreeVo(DictTableLevelVo dictTableLevelVo) {
        if (dictTableLevelVo.getParentId() != null && !dictTableLevelVo.getParentId().equals(MyConstant.TOP_PARENT_ID)) {
            dictTableLevelVo.setIds(getChildDictTableLevelId(dictTableLevelVo.getParentId()));
            dictTableLevelVo.setParentId(null);
        }
        List<DictTableLevelVo> tableLevelVos = findDictTableLevelList(dictTableLevelVo);
        List<DictTableLevelTreeVo> trees = new ArrayList<>();
        buildTrees(trees, tableLevelVos);
        if (dictTableLevelVo.getParentId() == null && StrUtil.isNotBlank(dictTableLevelVo.getTitle())) {
            return trees;
        } else {
            return (List<DictTableLevelTreeVo>) BaseTreeUtil.build(trees);
        }
    }

    @Override
    public List<DictTableLevelVo> findDictTableLevelList(DictTableLevelVo dictTableLevelVo) {
        QueryWrapper<DictTableLevelVo> queryWrapper = getQueryWrapper(dictTableLevelVo);
        queryWrapper.in(CollectionUtil.isNotEmpty(dictTableLevelVo.getIds()), "dtl.id", dictTableLevelVo.getIds());
        queryWrapper.in(CollectionUtil.isNotEmpty(dictTableLevelVo.getDictNameIds()), "dtl.dict_name_id", dictTableLevelVo.getDictNameIds());
        queryWrapper.eq(dictTableLevelVo.getParentId() != null, "dtl.parent_id", dictTableLevelVo.getParentId());
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    public List<DictTableLevelVo> findDictTableLevelOptionLazy(DictTableLevelVo dictTableLevelVo) {
        QueryWrapper<DictTableLevelVo> queryWrapper = getQueryWrapper(dictTableLevelVo);
        return this.baseMapper.findLevelListVo(queryWrapper);
    }

    @Override
    public DictTableLevelVo findDictTableLevel(DictTableLevelVo dictTableLevelVo) {
        QueryWrapper<DictTableLevelVo> queryWrapper = getQueryWrapper(dictTableLevelVo);
        return this.baseMapper.findOneVo(queryWrapper);
    }

    private QueryWrapper<DictTableLevelVo> getQueryWrapper(DictTableLevelVo dictTableLevelVo) {
        QueryWrapper<DictTableLevelVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StrUtil.isNotBlank(dictTableLevelVo.getDictName()), "dtn.dict_name", dictTableLevelVo.getDictName());
        queryWrapper.eq(dictTableLevelVo.getDictNameId() != null, "dtl.dict_name_id", dictTableLevelVo.getDictNameId());
        queryWrapper.eq(StrUtil.isNotBlank(dictTableLevelVo.getCode()), "dtl.code", dictTableLevelVo.getCode());
        queryWrapper.like(StrUtil.isNotBlank(dictTableLevelVo.getTitle()), "dtl.title", dictTableLevelVo.getTitle());
        queryWrapper.eq(dictTableLevelVo.getParentCode() != null, "dtl.parent_code", dictTableLevelVo.getParentCode());
        queryWrapper.eq(dictTableLevelVo.getId() != null, "dtl.id", dictTableLevelVo.getId());
        return queryWrapper;
    }

    @Override
    public List<DictTableLevelTreeVo> findDictTableLevelTree(DictTableLevelVo tableLevelVo) {
        List<DictTableLevelVo> dictTableLevelList = findDictTableLevelList(tableLevelVo);
        List<DictTableLevelTreeVo> treeVos = new ArrayList<>();
        buildTrees(treeVos, dictTableLevelList);
        return (List<DictTableLevelTreeVo>) BaseTreeUtil.build(treeVos);
    }

    @Override
    public List<Long> getChildDictTableLevelId(Long id) {
        List<Long> ids = new ArrayList<>();
        ids.add(id);
        getChild(ids, this.lambdaQuery().eq(DictTableLevel::getId, id).one());
        return ids;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createDictTableLevel(DictTableLevelAo dictTableLevelAo) {
        DictTableLevel dictTableLevel = getDictTableLevel(dictTableLevelAo);
        this.save(dictTableLevel);
        refreshDictValue(dictTableLevel.getId());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateDictTableLevel(DictTableLevelAo dictTableLevelAo) {
        DictTableLevel dictTableLevel = getDictTableLevel(dictTableLevelAo);
        this.updateById(dictTableLevel);
        refreshDictValue(dictTableLevel.getId());
    }

    private DictTableLevel getDictTableLevel(DictTableLevelAo dictTableLevelAo) {
        Long parentId = Optional.ofNullable(dictTableLevelAo.getParentId()).orElse(0L);
        DictTableLevel dictTableLevel = new DictTableLevel();
        BeanUtil.copyProperties(dictTableLevelAo, dictTableLevel);
        if (!MyConstant.TOP_PARENT_ID.equals(parentId)) {
            dictTableLevel.setParentCode(this.lambdaQuery().eq(DictTableLevel::getId, dictTableLevelAo.getParentId()).one().getCode());
        } else {
            dictTableLevel.setParentCode(MyConstant.TOP_PARENT_CODE);
        }
        return dictTableLevel;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteDictTableLevel(List<Long> ids) {
        List<Long> allChildrenId = getAllChildrenId(ids);
        List<DictTableLevelVo> dictTableList = this.findDictTableLevelList(DictTableLevelVo.builder().ids(allChildrenId).build());
        this.removeByIds(allChildrenId);
        deleteDictValue(dictTableList);
    }

    @Override
    public void deleteDictTableNameLevel(List<Long> ids) {
        List<DictTableLevelVo> dictTableList = this.findDictTableLevelList(DictTableLevelVo.builder().dictNameIds(ids).build());
        List<Long> tableLevelIds = dictTableList.stream().map(DictTableLevelVo::getId).collect(Collectors.toList());
        if (CollectionUtil.isNotEmpty(tableLevelIds)) {
            this.removeByIds(tableLevelIds);
            deleteDictValue(dictTableList);
        }
    }

    private List<Long> getAllChildrenId(List<Long> tableLevelIds) {
        List<Long> allIds = new ArrayList<>(tableLevelIds);
        for (Long tableLevelId : tableLevelIds) {
            List<Long> childIds = getChildDictTableLevelId(tableLevelId);
            allIds.addAll(childIds);
        }
        return CollectionUtil.distinct(allIds);
    }

    private void buildTrees(List<DictTableLevelTreeVo> trees, List<DictTableLevelVo> tableLevelVos) {
        tableLevelVos.forEach(tableLevelVo -> {
            DictTableLevelTreeVo tree = new DictTableLevelTreeVo();
            tree.setId(tableLevelVo.getId());
            tree.setParentId(tableLevelVo.getParentId());
            tree.setLabel(tableLevelVo.getTitle());
            tree.setDictName(tableLevelVo.getDictName());
            tree.setHasPar(!tableLevelVo.getParentId().equals(MyConstant.TOP_PARENT_ID));
            tree.setDictNameId(tableLevelVo.getDictNameId());
            tree.setCode(tableLevelVo.getCode());
            tree.setTitle(tableLevelVo.getTitle());
            tree.setRemark(tableLevelVo.getRemark());
            trees.add(tree);
        });
    }

    private void getChild(List<Long> allDeptId, DictTableLevel dictTableLevel) {
        List<DictTableLevel> one = this.lambdaQuery().eq(DictTableLevel::getParentId, dictTableLevel.getId()).list();
        if (CollUtil.isNotEmpty(one)) {
            for (DictTableLevel tableLevel : one) {
                allDeptId.add(tableLevel.getId());
                getChild(allDeptId, tableLevel);
            }
        }
    }

    private void refreshDictValue(Long id) {
        DictTableLevelVo dictTable = this.findDictTableLevel(DictTableLevelVo.builder().id(id).build());
        dictProvider.refreshDictCache(DictValueVo.builder()
                .dictType(dictTable.getDictName())
                .value(dictTable.getCode())
                .title(dictTable.getTitle())
                .build());
    }

    private void deleteDictValue(List<DictTableLevelVo> dictTableList) {
        List<DictValueVo> dictValueVos = new ArrayList<>();
        for (DictTableLevelVo dictTableVo : dictTableList) {
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
