package com.zclcs.server.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.entity.system.SystemUser;
import com.zclcs.common.core.entity.system.vo.SystemUserVo;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
public interface SystemUserService extends IService<SystemUser> {

    /**
     * 通过用户名查找用户
     *
     * @param username 用户名
     * @return 用户
     */
    SystemUserVo findByName(String username);

    /**
     * 通过用户名查找用户详细信息
     *
     * @param username 用户名
     * @return 用户信息
     */
    SystemUserVo findUserDetail(String username);

    /**
     * 更新用户登录时间
     *
     * @param username username
     */
    void updateLoginTime(String username);

    /**
     * 新增用户
     *
     * @param user user
     */
    void createUser(SystemUser user);

    /**
     * 修改用户
     *
     * @param user user
     */
    void updateUser(SystemUser user);

    /**
     * 删除用户
     *
     * @param userIds 用户 id数组
     */
    void deleteUsers(String[] userIds);

    /**
     * 更新用户密码
     *
     * @param password 新密码
     */
    void updatePassword(String password);

    /**
     * 重置密码
     *
     * @param usernames 用户集合
     */
    void resetPassword(String[] usernames);

}
