package com.zclcs.server.system.service.impl;

import cn.hutool.json.JSONUtil;
import com.rabbitmq.client.Channel;
import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.common.core.entity.CanalBinLogInfo;
import com.zclcs.common.core.entity.system.*;
import com.zclcs.common.core.entity.system.vo.SystemRoleVo;
import com.zclcs.common.core.service.HandleCacheService;
import com.zclcs.server.system.service.RouteEnhanceCacheService;
import com.zclcs.server.system.service.SystemMenuService;
import com.zclcs.server.system.service.SystemRoleService;
import com.zclcs.server.system.service.SystemUserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author zclcs
 */
@Service(value = "handleServerSystemCacheService")
@RequiredArgsConstructor
@Slf4j
public class HandleServerSystemCacheServiceImpl implements HandleCacheService {

    private static final String SYSTEM_USER = "system_user";
    private static final String SYSTEM_USER_DATA_PERMISSION = "system_user_data_permission";
    private static final String SYSTEM_USER_ROLE = "system_user_role";
    private static final String SYSTEM_ROLE = "system_role";
    private static final String SYSTEM_ROLE_MENU = "system_role_menu";
    private static final String SYSTEM_MENU = "system_menu";

    private static final String SYSTEM_BLACK_LIST = "system_black_list";

    private static final String SYSTEM_RATE_LIMIT_RULE = "system_rate_limit_rule";
    private SystemUserService systemUserService;
    private SystemRoleService systemRoleService;
    private SystemMenuService systemMenuService;

    private RouteEnhanceCacheService routeEnhanceCacheService;

    @Autowired
    public void setSystemUserService(SystemUserService systemUserService) {
        this.systemUserService = systemUserService;
    }

    @Autowired
    public void setSystemRoleService(SystemRoleService systemRoleService) {
        this.systemRoleService = systemRoleService;
    }

    @Autowired
    public void setSystemMenuService(SystemMenuService systemMenuService) {
        this.systemMenuService = systemMenuService;
    }

    @Autowired
    public void setRouteEnhanceCacheService(RouteEnhanceCacheService routeEnhanceCacheService) {
        this.routeEnhanceCacheService = routeEnhanceCacheService;
    }

    @Override
    public void handleCache(CanalBinLogInfo canalBinLogInfo, long deliveryTag, Channel channel) throws Exception {
        if (!canalBinLogInfo.getIsDdl()) {
            switch (canalBinLogInfo.getTable()) {
                case SYSTEM_USER:
                    handleSystemUserCache(canalBinLogInfo);
                    break;
                case SYSTEM_USER_DATA_PERMISSION:
                    handleSystemUserDataPermissionCache(canalBinLogInfo);
                    break;
                case SYSTEM_USER_ROLE:
                    handleSystemUserRoleCache(canalBinLogInfo);
                    break;
                case SYSTEM_ROLE:
                    handleSystemRoleCache(canalBinLogInfo);
                    break;
                case SYSTEM_ROLE_MENU:
                    handleSystemRoleMenuCache(canalBinLogInfo);
                    break;
                case SYSTEM_MENU:
                    handleSystemMenuCache(canalBinLogInfo);
                    break;
                case SYSTEM_BLACK_LIST:
                    handleSystemBlackListCache(canalBinLogInfo);
                    break;
                case SYSTEM_RATE_LIMIT_RULE:
                    handleSystemRateLimitRuleCache(canalBinLogInfo);
                    break;
                default:
                    break;
            }
            // 通知 MQ 消息已被成功消费,可以ACK了
            channel.basicAck(deliveryTag, false);
        }
        channel.basicAck(deliveryTag, false);
    }

    private void handleSystemUserCache(CanalBinLogInfo canalBinLogInfo) {
        List<SystemUser> systemUsers = JSONUtil.toList(canalBinLogInfo.getData(), SystemUser.class);
        for (SystemUser systemUser : systemUsers) {
            switch (canalBinLogInfo.getType()) {
                case MyConstant.INSERT:
                case MyConstant.UPDATE:
                    cacheAndUpdateUserDetail(systemUser.getUsername());
                    break;
                case MyConstant.DELETE:
                    systemUserService.deleteUserDetailCache(systemUser.getUsername());
                    break;
                default:
                    break;
            }
        }
    }

    private void handleSystemUserDataPermissionCache(CanalBinLogInfo canalBinLogInfo) {
        List<SystemUserDataPermission> systemUserDataPermissions = JSONUtil.toList(canalBinLogInfo.getData(), SystemUserDataPermission.class);
        List<Long> permissionsUserIds = systemUserDataPermissions.stream().map(SystemUserDataPermission::getUserId).distinct().collect(Collectors.toList());
        List<SystemUser> systemUsersPermission = systemUserService.lambdaQuery().in(SystemUser::getUserId, permissionsUserIds).list();
        for (SystemUser systemUser : systemUsersPermission) {
            cacheAndUpdateUserDetail(systemUser.getUsername());
        }
    }

    private void handleSystemUserRoleCache(CanalBinLogInfo canalBinLogInfo) {
        List<SystemUserRole> systemUserRoles = JSONUtil.toList(canalBinLogInfo.getData(), SystemUserRole.class);
        List<Long> rolesUserIds = systemUserRoles.stream().map(SystemUserRole::getUserId).distinct().collect(Collectors.toList());
        List<SystemUser> systemUsersRole = systemUserService.lambdaQuery().in(SystemUser::getUserId, rolesUserIds).list();
        for (SystemUser systemUser : systemUsersRole) {
            cacheAndUpdateUserDetail(systemUser.getUsername());
        }
    }

    private void cacheAndUpdateUserDetail(String username) {
        systemUserService.cacheAndGetUserDetail(username);
        systemMenuService.cacheAndGetUserPermissions(username);
        systemMenuService.cacheAndGetUserRouters(username);
    }

    private void handleSystemRoleCache(CanalBinLogInfo canalBinLogInfo) {
        List<SystemRole> systemRoles = JSONUtil.toList(canalBinLogInfo.getData(), SystemRole.class);
        for (SystemRole systemRole : systemRoles) {
            switch (canalBinLogInfo.getType()) {
                case MyConstant.INSERT:
                case MyConstant.UPDATE:
                    systemRoleService.cacheAndGetById(systemRole.getRoleId());
                    break;
                case MyConstant.DELETE:
                    systemRoleService.deleteCacheById(systemRole.getRoleId());
                    break;
                default:
                    break;
            }
        }
    }

    private void handleSystemRoleMenuCache(CanalBinLogInfo canalBinLogInfo) {
        List<SystemRoleMenu> systemRoleMenus = JSONUtil.toList(canalBinLogInfo.getData(), SystemRoleMenu.class);
        List<Long> roleIds = systemRoleMenus.stream().map(SystemRoleMenu::getRoleId).distinct().collect(Collectors.toList());
        List<SystemRole> systemRoleList = systemRoleService.lambdaQuery().in(SystemRole::getRoleId, roleIds).list();
        for (SystemRole systemRole : systemRoleList) {
            SystemRoleVo systemRoleVo = systemRoleService.cacheAndGetById(systemRole.getRoleId());
            for (String username : systemRoleVo.getUsernames()) {
                cacheAndUpdateUserDetail(username);
            }
        }
    }

    private void handleSystemMenuCache(CanalBinLogInfo canalBinLogInfo) {
        List<SystemMenu> systemMenus = JSONUtil.toList(canalBinLogInfo.getData(), SystemMenu.class);
        for (SystemMenu systemMenu : systemMenus) {
            switch (canalBinLogInfo.getType()) {
                case MyConstant.INSERT:
                case MyConstant.UPDATE:
                    systemMenuService.cacheAndGetById(systemMenu.getMenuId());
                    break;
                case MyConstant.DELETE:
                    systemMenuService.deleteCacheById(systemMenu.getMenuId());
                    break;
                default:
                    break;
            }
        }
    }

    private void handleSystemBlackListCache(CanalBinLogInfo canalBinLogInfo) {
        List<BlackList> blackLists = JSONUtil.toList(canalBinLogInfo.getData(), BlackList.class);
        for (BlackList blackList : blackLists) {
            switch (canalBinLogInfo.getType()) {
                case MyConstant.INSERT:
                    routeEnhanceCacheService.saveBlackList(blackList);
                case MyConstant.UPDATE:
                    routeEnhanceCacheService.updateBlackList(blackList);
                    break;
                case MyConstant.DELETE:
                    routeEnhanceCacheService.removeBlackList(blackList);
                    break;
                default:
                    break;
            }
        }
    }

    private void handleSystemRateLimitRuleCache(CanalBinLogInfo canalBinLogInfo) {
        List<RateLimitRule> rateLimitRules = JSONUtil.toList(canalBinLogInfo.getData(), RateLimitRule.class);
        for (RateLimitRule rateLimitRule : rateLimitRules) {
            switch (canalBinLogInfo.getType()) {
                case MyConstant.INSERT:
                    routeEnhanceCacheService.saveRateLimitRule(rateLimitRule);
                case MyConstant.UPDATE:
                    routeEnhanceCacheService.updateRateLimitRule(rateLimitRule);
                    break;
                case MyConstant.DELETE:
                    routeEnhanceCacheService.removeRateLimitRule(rateLimitRule);
                    break;
                default:
                    break;
            }
        }
    }

}
