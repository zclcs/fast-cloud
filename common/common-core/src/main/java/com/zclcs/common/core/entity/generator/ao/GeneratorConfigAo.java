package com.zclcs.common.core.entity.generator.ao;

import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * @author zclcs
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "GeneratorConfigAo", description = "代码生成配置表")
public class GeneratorConfigAo {

    /**
     * 主键
     */
    @ApiModelProperty(value = "配置id")
    @NotNull(message = "{required}", groups = UpdateStrategy.class)
    private Long id;

    /**
     * 作者
     */
    @ApiModelProperty(value = "作者", required = true)
    @NotBlank(message = "{required}")
    @Size(max = 50, message = "{noMoreThan}")
    private String author;

    /**
     * 基础包名
     */
    @ApiModelProperty(value = "基础包名", required = true)
    @NotBlank(message = "{required}")
    @Size(max = 50, message = "{noMoreThan}")
    private String basePackage;

    /**
     * entity文件存放路径
     */
    @ApiModelProperty(value = "entity包名", required = true)
    @NotBlank(message = "{required}")
    @Size(max = 50, message = "{noMoreThan}")
    private String entityPackage;

    /**
     * 入参
     */
    @ApiModelProperty(value = "入参包名", required = true)
    @NotBlank(message = "{required}")
    @Size(max = 50, message = "{noMoreThan}")
    private String aoPackage;

    /**
     * 出参
     */
    @ApiModelProperty(value = "出参包名", required = true)
    @NotBlank(message = "{required}")
    @Size(max = 50, message = "{noMoreThan}")
    private String voPackage;

    /**
     * mapper文件存放路径
     */
    @ApiModelProperty(value = "mapper包名", required = true)
    @NotBlank(message = "{required}")
    @Size(max = 50, message = "{noMoreThan}")
    private String mapperPackage;

    /**
     * mapper xml文件存放路径
     */
    @ApiModelProperty(value = "mapper xml包名", required = true)
    @NotBlank(message = "{required}")
    @Size(max = 50, message = "{noMoreThan}")
    private String mapperXmlPackage;

    /**
     * service文件存放路径
     */
    @ApiModelProperty(value = "service包名", required = true)
    @NotBlank(message = "{required}")
    @Size(max = 50, message = "{noMoreThan}")
    private String servicePackage;

    /**
     * serviceImpl文件存放路径
     */
    @ApiModelProperty(value = "serviceImpl包名", required = true)
    @NotBlank(message = "{required}")
    @Size(max = 50, message = "{noMoreThan}")
    private String serviceImplPackage;

    /**
     * controller文件存放路径
     */
    @ApiModelProperty(value = "controller包名", required = true)
    @NotBlank(message = "{required}")
    @Size(max = 50, message = "{noMoreThan}")
    private String controllerPackage;

    /**
     * 是否去除前缀
     */
    @ApiModelProperty(value = "是否去除前缀", required = true)
    @NotBlank(message = "{required}")
    @Size(max = 1, message = "{noMoreThan}")
    private String isTrim;

    /**
     * 前缀内容
     */
    @ApiModelProperty(value = "前缀内容")
    @Size(max = 50, message = "{noMoreThan}")
    private String trimValue;

    /**
     * 需要排除的字段
     */
    @ApiModelProperty("需要排除的字段")
    @Size(max = 255, message = "{noMoreThan}")
    private String excludeColumns;

}