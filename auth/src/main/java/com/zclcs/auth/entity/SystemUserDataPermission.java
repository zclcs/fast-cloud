package com.zclcs.auth.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

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
public class SystemUserDataPermission extends Model<SystemUserDataPermission> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "用户编号")
    private Long userId;

    @ApiModelProperty(value = "部门编号")
    private Long deptId;


    @Override
    protected Serializable pkVal() {
        return this.userId;
    }

}
