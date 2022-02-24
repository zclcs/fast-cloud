package com.zclcs.common.core.entity.system.ao;

import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

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
@ApiModel(value = "SystemMenuAo", description = "菜单表")
public class SystemMenuAo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "菜单/按钮id")
    @NotNull(message = "{required}", groups = UpdateStrategy.class)
    private Long menuId;

    @ApiModelProperty(value = "上级菜单id")
    private Long parentId;

    @ApiModelProperty(value = "菜单/按钮名称", required = true)
    @NotBlank(message = "{required}")
    @Size(max = 30, message = "{noMoreThan}")
    private String menuName;

    @ApiModelProperty(value = "页面缓存名称")
    @Size(max = 50, message = "{noMoreThan}")
    private String keepAliveName;

    @ApiModelProperty(value = "对应路由path")
    @Size(max = 100, message = "{noMoreThan}")
    private String path;

    @ApiModelProperty(value = "对应路由组件component")
    @Size(max = 100, message = "{noMoreThan}")
    private String component;

    @ApiModelProperty(value = "打开目录重定向的子菜单")
    @Size(max = 100, message = "{noMoreThan}")
    private String redirect;

    @ApiModelProperty(value = "权限标识")
    @Size(max = 50, message = "{noMoreThan}")
    private String perms;

    @ApiModelProperty(value = "图标")
    private String icon;

    @ApiModelProperty(value = "类型 0菜单 1按钮 2目录", required = true)
    @NotBlank(message = "{required}")
    private String type;

    @ApiModelProperty(value = "类型 0菜单 1按钮 2目录")
    private String types;

    @ApiModelProperty(value = "是否隐藏菜单 1是 0否")
    private String hideMenu;

    @ApiModelProperty(value = "是否忽略KeepAlive缓存 1是 0否")
    private String ignoreKeepAlive;

    @ApiModelProperty(value = "隐藏该路由在面包屑上面的显示 1是 0否")
    private String hideBreadcrumb;

    @ApiModelProperty(value = "隐藏所有子菜单 1是 0否")
    private String hideChildrenInMenu;

    @ApiModelProperty(value = "当前激活的菜单。用于配置详情页时左侧激活的菜单路径")
    private String currentActiveMenu;

    @ApiModelProperty(value = "排序")
    private Double orderNum;


}
