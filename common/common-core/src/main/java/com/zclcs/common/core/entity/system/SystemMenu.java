package com.zclcs.common.core.entity.system;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.zclcs.common.core.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 菜单表
 * </p>
 *
 * @author zclcs
 * @since 2021-08-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "SystemMenu对象", description = "菜单表")
public class SystemMenu extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 菜单/按钮id
     */
    @TableId(value = "menu_id", type = IdType.AUTO)
    private Long menuId;

    /**
     * 上级菜单id
     */
    @TableField("parent_id")
    private Long parentId;

    /**
     * 菜单/按钮名称
     */
    @TableField("menu_name")
    private String menuName;

    /**
     * 页面缓存名称
     */
    @TableField("keep_alive_name")
    private String keepAliveName;

    /**
     * 对应路由path
     */
    @TableField("path")
    private String path;

    /**
     * 对应路由组件component
     */
    @TableField("component")
    private String component;

    /**
     * 打开目录重定向的子菜单
     */
    @TableField("redirect")
    private String redirect;

    /**
     * 权限标识
     */
    @TableField("perms")
    private String perms;

    /**
     * 图标
     */
    @TableField("icon")
    private String icon;

    /**
     * 类型 0 菜单 1 按钮 2 目录
     */
    @TableField("type")
    private String type;

    /**
     * 是否隐藏菜单 1 是 0 否
     */
    @TableField("hide_menu")
    private String hideMenu;

    /**
     * 是否忽略KeepAlive缓存 1是 0否
     */
    @TableField("ignore_keep_alive")
    private String ignoreKeepAlive;

    /**
     * 隐藏该路由在面包屑上面的显示 1是 0否
     */
    @TableField("hide_breadcrumb")
    private String hideBreadcrumb;

    /**
     * 隐藏所有子菜单 1是 0否
     */
    @TableField("hide_children_in_menu")
    private String hideChildrenInMenu;

    /**
     * 当前激活的菜单。用于配置详情页时左侧激活的菜单路径
     */
    @TableField("current_active_menu")
    private String currentActiveMenu;

    /**
     * 排序
     */
    @TableField("order_num")
    private Double orderNum;

}
