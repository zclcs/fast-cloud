package com.zclcs.common.core.entity.generator.ao;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;

/**
 * @author zclcs
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "GenerateAo", description = "代码生成参数")
public class GenerateAo {

    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "表名", required = true)
    private String name;

    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "库名", required = true)
    private String datasource;

    @ApiModelProperty(value = "备注")
    private String remark;

    @ApiModelProperty(value = "是否需要新建菜单 yes_no 默认 否")
    private String isCreateMenu;

    @ApiModelProperty(value = "菜单名称 不填默认表注释")
    private String menuName;

    @ApiModelProperty(value = "菜单路径 不填默认类名")
    private String menuPath;

    @ApiModelProperty(value = "路由组件")
    private String menuComponent;

    @ApiModelProperty(value = "上级菜单id")
    private Long menuId;

    @ApiModelProperty(value = "是否创建目录 yes_no 默认 否 默认菜单在该目录下")
    private String isCreateDir;

    @ApiModelProperty(value = "目录名称")
    private String dirName;

    @ApiModelProperty(value = "目录路由地址")
    private String dirPath;

}
