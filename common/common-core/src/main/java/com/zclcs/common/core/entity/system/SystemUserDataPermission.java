package com.zclcs.common.core.entity.system;

import com.baomidou.mybatisplus.annotation.TableField;
import com.zclcs.common.core.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 用户数据权限关联表
 * </p>
 *
 * @author zclcs
 * @since 2021-08-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "SystemUserDataPermission对象", description = "用户数据权限关联表")
public class SystemUserDataPermission extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 用户编号
     */
    @TableField("user_id")
    private Long userId;

    /**
     * 部门编号
     */
    @TableField("dept_id")
    private Long deptId;

}
