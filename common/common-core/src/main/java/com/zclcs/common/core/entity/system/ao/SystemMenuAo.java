package com.zclcs.common.core.entity.system.ao;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

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
public class SystemMenuAo {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "上级菜单id")
    private Long parentId;

    @ApiModelProperty(value = "菜单/按钮名称")
    @NotBlank(message = "{required}")
    @Size(max = 10, message = "{noMoreThan}")
    private String menuName;

    @ApiModelProperty(value = "对应路由path")
    @Size(max = 100, message = "{noMoreThan}")
    private String path;

    @ApiModelProperty(value = "对应路由组件component")
    @Size(max = 100, message = "{noMoreThan}")
    private String component;

    @ApiModelProperty(value = "权限标识")
    @Size(max = 50, message = "{noMoreThan}")
    private String perms;

    @ApiModelProperty(value = "图标")
    private String icon;

    @ApiModelProperty(value = "类型 0菜单 1按钮")
    @NotBlank(message = "{required}")
    private String type;

    @ApiModelProperty(value = "排序")
    private Double orderNum;


}
