package com.zclcs.server.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.entity.system.SystemUser;
import com.zclcs.common.core.entity.system.ao.SelectSystemUserAo;
import com.zclcs.common.core.entity.system.ao.SystemUserAo;
import com.zclcs.common.core.entity.system.vo.SystemUserVo;

import java.util.List;

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
     * 查找用户详细信息
     *
     * @param request request
     * @param user    用户对象，用于传递查询条件
     * @return IPage
     */
    BasePage<SystemUserVo> findUserDetailPage(BasePageAo request, SelectSystemUserAo user);

    /**
     * 查找用户详细信息
     *
     * @param user 用户对象，用于传递查询条件
     * @return IPage
     */
    List<SystemUserVo> findUserList(SelectSystemUserAo user);

    /**
     * 通过用户名查找用户详细信息
     *
     * @param username 用户名
     * @return 用户信息
     */
    SystemUserVo findUserDetail(String username);

    /**
     * 缓存用户信息
     *
     * @param username 用户名
     * @return 用户
     */
    SystemUserVo cacheAndGetUserDetail(String username);

    /**
     * 删除用户信息
     *
     * @param username 用户名
     */
    void deleteUserDetailCache(String username);

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
    void createUser(SystemUserAo user);

    /**
     * 修改用户
     *
     * @param user user
     */
    void updateUser(SystemUserAo user);

    /**
     * 删除用户
     *
     * @param userIds 用户 id数组
     */
    void deleteUsers(List<Long> userIds);

    /**
     * 更新用户密码
     *
     * @param username 用户名 为空则修改当前用户
     * @param password 新密码
     */
    void updatePassword(String username, String password);

    /**
     * 更新用户状态
     *
     * @param username 用户名 为空则修改当前用户
     * @param status   状态 为空则修改为禁用状态
     */
    void updateStatus(String username, String status);

    /**
     * 重置密码
     *
     * @param usernames 用户集合
     */
    void resetPassword(List<String> usernames);

}
