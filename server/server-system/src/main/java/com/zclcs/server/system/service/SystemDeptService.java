package com.zclcs.server.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.entity.DeptTree;
import com.zclcs.common.core.entity.system.SystemDept;
import com.zclcs.common.core.entity.system.ao.SelectSystemDeptAo;
import com.zclcs.common.core.entity.system.ao.SystemDeptAo;
import com.zclcs.common.core.entity.system.vo.SystemDeptVo;

import java.util.List;

/**
 * <p>
 * 部门表 服务类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
public interface SystemDeptService extends IService<SystemDept> {

    /**
     * 获取部门信息
     *
     * @param request request
     * @param dept    dept
     * @return 部门信息
     */
    BasePage<DeptTree> findDeptPage(BasePageAo request, SelectSystemDeptAo dept);

    /**
     * 获取部门列表
     *
     * @param dept dept
     * @return 部门列表
     */
    List<SystemDeptVo> findDeptList(SelectSystemDeptAo dept);

    /**
     * 获取部门列表
     *
     * @param dept dept
     * @return 部门列表
     */
    List<DeptTree> findDeptTree(SelectSystemDeptAo dept);

    /**
     * 返回本级以及下级部门编号
     *
     * @param deptId 部门编号
     * @return 本级以及下级部门编号
     */
    List<Long> getChildDeptId(Long deptId);

    /**
     * 创建部门
     *
     * @param dept dept
     */
    void createDept(SystemDeptAo dept);

    /**
     * 更新部门
     *
     * @param dept dept
     */
    void updateDept(SystemDeptAo dept);

    /**
     * 删除部门
     *
     * @param deptIds 部门id数组
     */
    void deleteDept(List<Long> deptIds);

}
