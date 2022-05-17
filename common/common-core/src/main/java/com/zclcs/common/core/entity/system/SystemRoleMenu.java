package com.zclcs.common.core.entity.system;

import com.baomidou.mybatisplus.annotation.TableField;
import com.zclcs.common.core.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 角色菜单关联表
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "SystemRoleMenu对象", description = "角色菜单关联表")
public class SystemRoleMenu extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 角色编号
     */
    @TableField("role_id")
    private Long roleId;

    /**
     * 菜单编号
     */
    @TableField("menu_id")
    private Long menuId;

}
