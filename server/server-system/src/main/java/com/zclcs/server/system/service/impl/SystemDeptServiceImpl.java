package com.zclcs.server.system.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.entity.DeptTree;
import com.zclcs.common.core.entity.Tree;
import com.zclcs.common.core.entity.system.SystemDept;
import com.zclcs.common.core.entity.system.ao.SystemDeptAo;
import com.zclcs.common.core.entity.system.vo.SystemDeptVo;
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
@Service("deptService")
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class SystemDeptServiceImpl extends ServiceImpl<SystemDeptMapper, SystemDept> implements SystemDeptService {

    private final SystemUserDataPermissionService userDataPermissionService;

    @Override
    public BasePage<DeptTree> findDeptPage(BasePageAo request, SystemDeptAo dept) {
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
    public List<SystemDeptVo> findDeptList(SystemDeptAo dept) {
        QueryWrapper<SystemDeptVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StrUtil.isNotBlank(dept.getDeptName()), "sd.dept_name", dept.getDeptName());
        queryWrapper.between(StrUtil.isNotBlank(dept.getCreateTimeFrom()) && StrUtil.isNotBlank(dept.getCreateTimeTo()),
                "sd.create_time", dept.getCreateTimeFrom(), dept.getCreateTimeTo());
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createDept(SystemDeptAo dept) {
        SystemDept systemDept = new SystemDept();
        BeanUtil.copyProperties(dept, systemDept);
        if (systemDept.getParentId() == null) {
            systemDept.setParentId(SystemDeptVo.TOP_DEPT_ID);
        }
        systemDept.setCreateTime(DateUtil.date());
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
        systemDept.setModifyTime(DateUtil.date());
        this.save(systemDept);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteDept(List<Long> deptIds) {
        this.delete(deptIds);
    }

    private void buildTrees(List<DeptTree> trees, List<SystemDeptVo> deptVos) {
        deptVos.forEach(dept -> {
            DeptTree tree = new DeptTree();
            tree.setId(dept.getDeptId().toString());
            tree.setParentId(dept.getParentId().toString());
            tree.setLabel(dept.getDeptName());
            tree.setOrderNum(dept.getOrderNum());
            trees.add(tree);
        });
    }

    private void delete(List<Long> deptIds) {
        removeByIds(deptIds);
        userDataPermissionService.deleteByDeptIds(deptIds);

        QueryWrapper<SystemDeptVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.in("sd.parent_id", deptIds);
        List<SystemDeptVo> deptVos = this.baseMapper.findListVo(queryWrapper);
        if (CollectionUtils.isNotEmpty(deptVos)) {
            List<Long> deptIdList = deptVos.stream().map(SystemDeptVo::getDeptId).collect(Collectors.toList());
            this.delete(deptIdList);
        }
    }
}
