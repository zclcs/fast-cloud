package com.zclcs.common.core.entity.system.vo;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 用户权限测试
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "SystemDataPermissionTestVo", description = "用户权限测试")
public class SystemDataPermissionTestVo implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    private String field1;

    private String field2;

    private String field3;

    private String field4;

    private Integer deptId;

    private Date createTime;


}
