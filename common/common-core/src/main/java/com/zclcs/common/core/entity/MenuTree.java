package com.zclcs.common.core.entity;


import com.houkunlin.system.dict.starter.json.DictText;
import com.zclcs.common.core.entity.system.vo.SystemMenuVo;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * @author zclcs
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class MenuTree extends Tree<SystemMenuVo> implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "页面缓存名称")
    private String keepAliveName;

    @ApiModelProperty(value = "对应路由path")
    private String path;

    @ApiModelProperty(value = "对应路由组件component")
    private String component;

    @ApiModelProperty(value = "打开目录重定向的子菜单")
    private String redirect;

    @ApiModelProperty(value = "权限标识")
    private String perms;

    @ApiModelProperty(value = "图标")
    private String icon;

    @ApiModelProperty(value = "类型 0菜单 1按钮 2目录")
    @DictText("menu_type")
    private String type;

    @ApiModelProperty(value = "是否隐藏菜单 1是 0否")
    @DictText("yes_no")
    private String hideMenu;

    @ApiModelProperty(value = "是否忽略KeepAlive缓存 1是 0否")
    @DictText("yes_no")
    private String ignoreKeepAlive;

    @ApiModelProperty(value = "隐藏该路由在面包屑上面的显示 1是 0否")
    @DictText("yes_no")
    private String hideBreadcrumb;

    @ApiModelProperty(value = "隐藏所有子菜单 1是 0否")
    @DictText("yes_no")
    private String hideChildrenInMenu;

    @ApiModelProperty(value = "当前激活的菜单。用于配置详情页时左侧激活的菜单路径")
    private String currentActiveMenu;

    @ApiModelProperty(value = "排序")
    private Double orderNum;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;
}
