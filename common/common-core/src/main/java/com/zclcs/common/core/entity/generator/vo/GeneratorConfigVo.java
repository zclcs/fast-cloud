package com.zclcs.common.core.entity.generator.vo;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUtil;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @author zclcs
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "GeneratorConfigVo", description = "代码生成配置表")
public class GeneratorConfigVo {

    public static final String TRIM_YES = "1";
    public static final String TRIM_NO = "0";

    /**
     * 主键
     */
    @ApiModelProperty(value = "配置id")
    private Long id;

    /**
     * 作者
     */
    @ApiModelProperty(value = "作者")
    private String author;

    /**
     * 基础包名
     */
    @ApiModelProperty(value = "基础包名")
    private String basePackage;

    /**
     * entity文件存放路径
     */
    @ApiModelProperty(value = "entity包名")
    private String entityPackage;

    /**
     * 入参
     */
    @ApiModelProperty(value = "入参包名")
    private String aoPackage;

    /**
     * 出参
     */
    @ApiModelProperty(value = "出参包名")
    private String voPackage;

    /**
     * mapper文件存放路径
     */
    @ApiModelProperty(value = "mapper包名")
    private String mapperPackage;

    /**
     * mapper xml文件存放路径
     */
    @ApiModelProperty(value = "mapper xml包名")
    private String mapperXmlPackage;

    /**
     * service文件存放路径
     */
    @ApiModelProperty(value = "service包名")
    private String servicePackage;

    /**
     * serviceImpl文件存放路径
     */
    @ApiModelProperty(value = "serviceImpl包名")
    private String serviceImplPackage;

    /**
     * controller文件存放路径
     */
    @ApiModelProperty(value = "controller包名")
    private String controllerPackage;

    /**
     * 是否去除前缀
     */
    @ApiModelProperty(value = "是否去除前缀")
    private String isTrim;

    /**
     * 前缀内容
     */
    @ApiModelProperty(value = "前缀内容")
    private String trimValue;

    /**
     * 需要排除的字段
     */
    @ApiModelProperty("需要排除的字段")
    private String excludeColumns;

    /**
     * java文件路径，固定值
     */
    private String javaPath = "/src/main/java/";
    /**
     * 配置文件存放路径，固定值
     */
    private String resourcesPath = "src/main/resources";
    /**
     * 文件生成日期
     */
    private String date = DateUtil.date().toString(DatePattern.NORM_DATETIME_MS_PATTERN);

    /**
     * 表名
     */
    private String tableName;
    /**
     * 表注释
     */
    private String tableComment;
    /**
     * 数据表对应的类名
     */
    private String className;
    /**
     * 数据表对应的主键字段名
     */
    private String keyName;

}