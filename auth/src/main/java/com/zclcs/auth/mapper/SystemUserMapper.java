package com.zclcs.auth.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zclcs.auth.entity.SystemUser;
import com.zclcs.auth.entity.vo.SystemUserDataPermissionVo;
import com.zclcs.auth.entity.vo.SystemUserVo;

import java.util.List;

/**
 * <p>
 * 用户表 Mapper 接口
 * </p>
 *
 * @author zclcs
 * @since 2021-08-11
 */
public interface SystemUserMapper extends BaseMapper<SystemUser> {

    /**
     * 获取用户
     *
     * @param username 用户名
     * @return 用户
     */
    SystemUserVo findByName(String username);

    /**
     * 获取用户数据权限
     *
     * @param userId 用户id
     * @return 数据权限
     */
    List<SystemUserDataPermissionVo> findUserDataPermissions(Long userId);

}
