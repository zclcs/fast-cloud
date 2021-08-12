package com.zclcs.auth.manager;

import cn.hutool.core.bean.BeanUtil;
import com.zclcs.auth.entity.SystemUser;
import com.zclcs.auth.entity.SystemUserRole;
import com.zclcs.auth.entity.vo.SystemMenuVo;
import com.zclcs.auth.entity.vo.SystemUserDataPermissionVo;
import com.zclcs.auth.entity.vo.SystemUserVo;
import com.zclcs.auth.mapper.SystemMenuMapper;
import com.zclcs.auth.mapper.SystemUserMapper;
import com.zclcs.common.core.constant.MyConstant;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 用户业务逻辑
 *
 * @author MrBird
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class UserManager {

    private final SystemUserMapper userMapper;
    private final SystemMenuMapper menuMapper;

    /**
     * 通过用户名查询用户信息
     *
     * @param username 用户名
     * @return 用户
     */
    public SystemUserVo findByName(String username) {
        SystemUserVo user = userMapper.findByName(username);
        if (user != null) {
            List<SystemUserDataPermissionVo> permissions = userMapper.findUserDataPermissions(user.getUserId());
            List<Long> deptIds = permissions.stream().map(SystemUserDataPermissionVo::getDeptId).collect(Collectors.toList());
            user.setDeptIds(deptIds);
        }
        return user;
    }

    /**
     * 通过用户名查询用户权限串
     *
     * @param username 用户名
     * @return 权限
     */
    public List<String> findUserPermissions(String username) {
        List<SystemMenuVo> userPermissions = menuMapper.findUserPermissions(username);
        return userPermissions.stream().map(SystemMenuVo::getPerms).collect(Collectors.toList());
    }

    /**
     * 注册用户
     *
     * @param username username
     * @param password password
     * @return SystemUser SystemUser
     */
    @Transactional(rollbackFor = Exception.class)
    public SystemUserVo registerUser(String username, String password) {
        SystemUser systemUser = new SystemUser();
        systemUser.setUsername(username);
        systemUser.setPassword(password);
        systemUser.setCreateTime(new Date());
        systemUser.setStatus(SystemUserVo.STATUS_VALID);
        systemUser.setGender(SystemUserVo.SEX_UNKNOWN);
        systemUser.setAvatar(SystemUserVo.DEFAULT_AVATAR);
        systemUser.setDescription("注册用户");
        systemUser.insert();

        SystemUserRole userRole = new SystemUserRole();
        userRole.setUserId(systemUser.getUserId());
        // 注册用户角色 ID
        userRole.setRoleId(MyConstant.REGISTER_ROLE_ID);
        userRole.insert();
        SystemUserVo systemUserVo = new SystemUserVo();
        BeanUtil.copyProperties(systemUserVo, systemUser);
        return systemUserVo;
    }
}
