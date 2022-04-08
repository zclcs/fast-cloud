package com.zclcs.server.dict.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.constant.DictConstant;
import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.common.core.constant.ValidConstant;
import com.zclcs.common.core.entity.dict.DictTableLevel;
import com.zclcs.common.core.entity.dict.DictTableName;
import com.zclcs.common.core.entity.dict.ao.DictTableLevelAo;
import com.zclcs.common.core.entity.dict.vo.DictTableLevelTreeVo;
import com.zclcs.common.core.entity.dict.vo.DictTableLevelVo;
import com.zclcs.common.core.exception.MyException;
import com.zclcs.common.core.utils.BaseTreeUtil;
import com.zclcs.server.dict.mapper.DictTableLevelMapper;
import com.zclcs.server.dict.mapper.DictTableNameMapper;
import com.zclcs.server.dict.service.DictTableLevelService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

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

    private final DictTableNameMapper dictTableNameMapper;

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
        queryWrapper.in(CollectionUtil.isNotEmpty(dictTableLevelVo.getDictNames()), "dtl.dict_name", dictTableLevelVo.getDictNames());
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
        queryWrapper.like(StrUtil.isNotBlank(dictTableLevelVo.getDictName()), "dtl.dict_name", dictTableLevelVo.getDictName());
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
        validAdd(dictTableLevel);
        this.save(dictTableLevel);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateDictTableLevel(DictTableLevelAo dictTableLevelAo) {
        DictTableLevel dictTableLevel = getDictTableLevel(dictTableLevelAo);
        validUpdate(dictTableLevel);
        this.updateById(dictTableLevel);
    }

    private DictTableLevel getDictTableLevel(DictTableLevelAo dictTableLevelAo) {
        Long parentId = Optional.ofNullable(dictTableLevelAo.getParentId()).orElse(0L);
        DictTableLevel dictTableLevel = new DictTableLevel();
        BeanUtil.copyProperties(dictTableLevelAo, dictTableLevel);
        if (!MyConstant.TOP_PARENT_ID.equals(parentId)) {
            DictTableLevel parent = this.lambdaQuery().eq(DictTableLevel::getId, dictTableLevelAo.getParentId()).one();
            dictTableLevel.setParentCode(parent.getCode());
            dictTableLevel.setLevel(parent.getLevel() + MyConstant.TOP_PARENT_LEVEL);
        } else {
            dictTableLevel.setParentCode(MyConstant.TOP_PARENT_CODE);
            dictTableLevel.setLevel(MyConstant.TOP_PARENT_LEVEL);
        }
        return dictTableLevel;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteDictTableLevel(List<Long> ids) {
        List<Long> allChildrenId = getAllChildrenId(ids);
        this.removeByIds(allChildrenId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteDictTableNameLevel(List<String> dictNames) {
        this.lambdaUpdate().in(DictTableLevel::getDictName, dictNames).remove();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateDictTableName(String oldDictName, String newDictName) {
        this.lambdaUpdate().eq(DictTableLevel::getDictName, oldDictName).set(DictTableLevel::getDictName, newDictName).update();
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

    private void validAdd(DictTableLevel dictTableLevel) {
        validDictCode(dictTableLevel);
        validDictName(dictTableLevel);
    }

    private void validUpdate(DictTableLevel dictTableLevel) {
        DictTableLevelVo dictTableLevelVo = this.findDictTableLevel(DictTableLevelVo.builder().id(dictTableLevel.getId()).build());
        Optional.ofNullable(dictTableLevelVo).orElseThrow(() -> new MyException("查询不到该层级字典项"));
        if (!StrUtil.equals(dictTableLevelVo.getCode(), dictTableLevel.getCode())) {
            validDictCode(dictTableLevel);
        }
        validDictName(dictTableLevel);
    }

    private void validDictCode(DictTableLevel dictTableLevel) {
        if (!this.lambdaQuery().eq(DictTableLevel::getCode, dictTableLevel.getCode()).count().equals(ValidConstant.COUNT_0)) {
            throw new MyException("层级字典项code重复");
        }
    }

    private void validDictName(DictTableLevel dictTableLevel) {
        if (dictTableNameMapper.selectCount(new QueryWrapper<DictTableName>().lambda()
                .eq(DictTableName::getDictName, dictTableLevel.getDictName())
                .eq(DictTableName::getType, DictConstant.DICT_TYPE_1)).equals(ValidConstant.COUNT_0)) {
            throw new MyException("未找到该层级字典：" + dictTableLevel.getDictName());
        }
    }
}
