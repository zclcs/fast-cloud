package com.zclcs.server.system.handler;

import cn.hutool.json.JSONUtil;
import com.rabbitmq.client.Channel;
import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.common.core.constant.RabbitConstant;
import com.zclcs.common.core.entity.CanalBinLogInfo;
import com.zclcs.common.core.entity.MessageStruct;
import com.zclcs.common.core.entity.system.*;
import com.zclcs.common.core.entity.system.vo.SystemRoleVo;
import com.zclcs.server.system.service.SystemMenuService;
import com.zclcs.server.system.service.SystemRoleService;
import com.zclcs.server.system.service.SystemUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 直接队列1 处理器
 * </p>
 *
 * @author zclcs
 */
@Slf4j
@RabbitListener(queues = RabbitConstant.QUEUE_SERVER_SYSTEM_CACHE)
@Component
public class DirectQueueTwoHandler {

    private static final String SYSTEM_USER = "system_user";
    private static final String SYSTEM_USER_DATA_PERMISSION = "system_user_data_permission";
    private static final String SYSTEM_USER_ROLE = "system_user_role";
    private static final String SYSTEM_ROLE = "system_role";
    private static final String SYSTEM_ROLE_MENU = "system_role_menu";
    private static final String SYSTEM_MENU = "system_menu";
    private SystemUserService systemUserService;
    private SystemRoleService systemRoleService;
    private SystemMenuService systemMenuService;

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

    @RabbitHandler
    public void directHandlerManualAck(MessageStruct messageStruct, Message message, Channel channel) {
        //  如果手动ACK,消息会被监听消费,但是消息在队列中依旧存在,如果 未配置 acknowledge-mode 默认是会在消费完毕后自动ACK掉
        final long deliveryTag = message.getMessageProperties().getDeliveryTag();
        try {
            //log.info("直接队列2，处理server-system服务缓存，手动ACK，接收消息：{}", messageStruct.getMessage());
            CanalBinLogInfo canalBinLogInfo = JSONUtil.toBean(messageStruct.getMessage(), CanalBinLogInfo.class);
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
                default:
                    break;
            }
            // 通知 MQ 消息已被成功消费,可以ACK了
            channel.basicAck(deliveryTag, false);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            try {
                // 处理失败,重新压入MQ
                channel.basicRecover();
            } catch (IOException e1) {
                log.error(e1.getMessage(), e1);
            }
        }
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
}
