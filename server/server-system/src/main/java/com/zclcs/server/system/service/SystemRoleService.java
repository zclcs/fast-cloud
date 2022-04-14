package com.zclcs.server.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.base.BasePage;
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
     * @param basePageAo   basePageAo
     * @param systemRoleAo systemRoleAo
     * @return 角色分页数据
     */
    BasePage<SystemRoleVo> findSystemRolePage(BasePageAo basePageAo, SystemRoleAo systemRoleAo);

    /**
     * 获取所有角色
     *
     * @param systemRoleAo 查询参数
     * @return 角色列表
     */
    List<SystemRoleVo> findSystemRoleList(SystemRoleAo systemRoleAo);

    /**
     * 获取单个角色
     *
     * @param systemRoleAo 查询参数
     * @return 角色
     */
    SystemRoleVo findSystemRoleOne(SystemRoleAo systemRoleAo);

    /**
     * 通过id获取角色
     *
     * @param roleId 角色id
     * @return 角色
     */
    SystemRoleVo findById(Long roleId);

    /**
     * 通过id缓存角色
     *
     * @param roleId 角色id
     */
    SystemRoleVo cacheAndGetById(Long roleId);

    /**
     * 通过id删除角色缓存
     *
     * @param roleId 角色id
     */
    void deleteCacheById(Long roleId);

    /**
     * 通过角色id获取账号
     *
     * @param roleId 角色id
     * @return 账号集合
     */
    List<String> selectUsernamesByRoleId(Long roleId);

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
