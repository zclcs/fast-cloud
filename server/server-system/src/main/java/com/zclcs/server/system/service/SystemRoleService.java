package com.zclcs.server.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.entity.system.SystemRole;
import com.zclcs.common.core.entity.system.ao.SystemRoleAo;
import com.zclcs.common.core.entity.system.vo.SystemRoleVo;

import java.util.List;

/**
 * <p>
 * 角色表 服务类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
public interface SystemRoleService extends IService<SystemRole> {

    /**
     * 查找角色分页数据
     *
     * @param basePageAo basePageAo
     * @param role       role
     * @return 角色分页数据
     */
    IPage<SystemRoleVo> findSystemRolePage(BasePageAo basePageAo, SystemRoleAo role);

    /**
     * 获取用户角色
     *
     * @param username 用户名
     * @return 角色集
     */
    List<SystemRoleVo> findUserRole(String username);

    /**
     * 获取所有角色
     *
     * @return 角色列表
     */
    List<SystemRoleVo> findSystemRoleList();

    /**
     * 通过名称获取角色
     *
     * @param roleName 角色名称
     * @return 角色
     */
    SystemRoleVo findByName(String roleName);

    /**
     * 创建角色
     *
     * @param role role
     */
    void createSystemRole(SystemRoleAo role);

    /**
     * 删除角色
     *
     * @param roleIds 角色id数组
     */
    void deleteSystemRoles(List<Long> roleIds);

    /**
     * 更新角色
     *
     * @param role role
     */
    void updateSystemRole(SystemRoleAo role);

}
