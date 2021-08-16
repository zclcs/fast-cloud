package com.zclcs.auth.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.entity.system.SystemUserConnection;
import com.zclcs.common.core.entity.system.ao.SystemUserConnectionAo;
import com.zclcs.common.core.entity.system.vo.SystemUserConnectionVo;

import java.util.List;

/**
 * <p>
 * 系统用户社交账户关联表 服务类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-12
 */
public interface SystemUserConnectionService extends IService<SystemUserConnection> {

    /**
     * 根据条件查询关联关系
     *
     * @param providerName   平台名称
     * @param providerUserId 平台用户ID
     * @return 关联关系
     */
    SystemUserConnectionVo findSystemUserConnectionOne(String providerName, String providerUserId);

    /**
     * 根据条件查询关联关系
     *
     * @param username 用户名
     * @return 关联关系
     */
    List<SystemUserConnectionVo> findSystemUserConnectionList(String username);

    /**
     * 新增
     *
     * @param systemUserConnectionAo systemUserConnectionAo
     */
    void createSystemUserConnection(SystemUserConnectionAo systemUserConnectionAo);

    /**
     * 删除
     *
     * @param username     username 用户名
     * @param providerName providerName 平台名称
     */
    void deleteSystemUserConnection(String username, String providerName);

}
