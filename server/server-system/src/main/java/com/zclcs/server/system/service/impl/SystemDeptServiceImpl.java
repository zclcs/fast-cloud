package com.zclcs.server.system.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.common.core.entity.DeptTree;
import com.zclcs.common.core.entity.Tree;
import com.zclcs.common.core.entity.system.SystemDept;
import com.zclcs.common.core.entity.system.ao.SelectSystemDeptAo;
import com.zclcs.common.core.entity.system.ao.SystemDeptAo;
import com.zclcs.common.core.entity.system.vo.SystemDeptVo;
import com.zclcs.common.core.utils.BaseQueryWrapperUtil;
import com.zclcs.common.core.utils.BaseTreeUtil;
import com.zclcs.server.system.mapper.SystemDeptMapper;
import com.zclcs.server.system.service.SystemDeptService;
import com.zclcs.server.system.service.SystemUserDataPermissionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 部门表 服务实现类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class SystemDeptServiceImpl extends ServiceImpl<SystemDeptMapper, SystemDept> implements SystemDeptService {

    private final SystemUserDataPermissionService systemUserDataPermissionService;

    @Override
    public BasePage<DeptTree> findDeptPage(BasePageAo request, SelectSystemDeptAo dept) {
        BasePage<DeptTree> basePage = new BasePage<>();
        try {
            List<SystemDeptVo> depts = findDeptList(dept);
            List<DeptTree> trees = new ArrayList<>();
            buildTrees(trees, depts);
            List<? extends Tree<?>> deptTree = BaseTreeUtil.build(trees);

            basePage.setList((List<DeptTree>) deptTree);
            basePage.setTotal(depts.size());
        } catch (Exception e) {
            log.error("获取部门列表失败", e);
            basePage.setList(null);
            basePage.setTotal(0);
        }
        return basePage;
    }

    @Override
    public List<SystemDeptVo> findDeptList(SelectSystemDeptAo dept) {
        QueryWrapper<SystemDeptVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByAsc("sd.order_num");
        queryWrapper.like(StrUtil.isNotBlank(dept.getDeptName()), "sd.dept_name", dept.getDeptName());
        BaseQueryWrapperUtil.betweenDateAddTimeNotBlank(queryWrapper, "sd.create_at", dept.getCreateTimeFrom(), dept.getCreateTimeTo());
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    public List<DeptTree> findDeptTree(SelectSystemDeptAo dept) {
        List<SystemDeptVo> depts = findDeptList(dept);
        List<DeptTree> trees = new ArrayList<>();
        buildTrees(trees, depts);
        if (StrUtil.isNotBlank(dept.getDeptName())) {
            return trees;
        } else {
            return (List<DeptTree>) BaseTreeUtil.build(trees);
        }
    }

    @Override
    public List<Long> getChildDeptId(Long deptId) {
        List<Long> deptIds = new ArrayList<>();
        deptIds.add(deptId);
        getChild(deptIds, this.lambdaQuery().eq(SystemDept::getDeptId, deptId).one());
        return deptIds;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createDept(SystemDeptAo dept) {
        SystemDept systemDept = new SystemDept();
        BeanUtil.copyProperties(dept, systemDept);
        if (systemDept.getParentId() == null) {
            systemDept.setParentId(SystemDeptVo.TOP_DEPT_ID);
        }
        this.save(systemDept);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateDept(SystemDeptAo dept) {
        SystemDept systemDept = new SystemDept();
        BeanUtil.copyProperties(dept, systemDept);
        if (systemDept.getParentId() == null) {
            systemDept.setParentId(SystemDeptVo.TOP_DEPT_ID);
        }
        this.updateById(systemDept);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteDept(List<Long> deptIds) {
        List<Long> allDeptIds = new ArrayList<>(deptIds);
        for (Long id : deptIds) {
            List<Long> childDeptIds = getChildDeptId(id);
            allDeptIds.addAll(childDeptIds);
        }
        ArrayList<Long> distinct = CollectionUtil.distinct(allDeptIds);
        this.delete(distinct);
    }

    private void buildTrees(List<DeptTree> trees, List<SystemDeptVo> deptVos) {
        deptVos.forEach(dept -> {
            DeptTree tree = new DeptTree();
            tree.setId(dept.getDeptId());
            tree.setParentId(dept.getParentId());
            tree.setHarPar(!dept.getParentId().equals(MyConstant.TOP_PARENT_ID));
            tree.setLabel(dept.getDeptName());
            tree.setOrderNum(dept.getOrderNum());
            trees.add(tree);
        });
    }

    private void getChild(List<Long> allDeptId, SystemDept systemDept) {
        List<SystemDept> one = this.lambdaQuery().eq(SystemDept::getParentId, systemDept.getDeptId()).list();
        if (CollUtil.isNotEmpty(one)) {
            for (SystemDept dept : one) {
                allDeptId.add(dept.getDeptId());
                getChild(allDeptId, dept);
            }
        }
    }

    private void delete(List<Long> deptIds) {
        removeByIds(deptIds);
        systemUserDataPermissionService.deleteByDeptIds(deptIds);

        QueryWrapper<SystemDeptVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.in("sd.parent_id", deptIds);
        List<SystemDeptVo> deptVos = this.baseMapper.findListVo(queryWrapper);
        if (CollectionUtils.isNotEmpty(deptVos)) {
            List<Long> deptIdList = deptVos.stream().map(SystemDeptVo::getDeptId).collect(Collectors.toList());
            this.delete(deptIdList);
        }
    }
}
