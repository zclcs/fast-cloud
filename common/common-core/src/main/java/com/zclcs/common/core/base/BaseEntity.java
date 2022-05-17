package com.zclcs.common.core.base;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.Version;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * @author zhouchenglong
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "基础实体对象", description = "基础实体")
public class BaseEntity {

    /**
     * 版本
     */
    @Version
    @TableField("version")
    private Long version;

    /**
     * 租户id
     */
    @TableField("tenant_id")
    private String tenantId;

    /**
     * 创建时间
     */
    @TableField(value = "create_at", fill = FieldFill.INSERT)
    private LocalDateTime createAt;

    /**
     * 创建人
     */
    @TableField(value = "create_by", fill = FieldFill.INSERT)
    private String createBy;

    /**
     * 编辑时间
     */
    @TableField(value = "update_at", fill = FieldFill.UPDATE)
    private LocalDateTime updateAt;

    /**
     * 编辑人
     */
    @TableField(value = "update_by", fill = FieldFill.UPDATE)
    private String updateBy;

}
