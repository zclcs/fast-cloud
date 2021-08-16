package com.zclcs.common.core.entity.system.vo;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * <p>
 * excel导入导出测试
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "SystemExport对象", description = "excel导入导出测试")
public class SystemExportVo {

    private static final long serialVersionUID = 1L;

    private String field1;

    private Integer field2;

    private String field3;

    private Date createTime;

}
