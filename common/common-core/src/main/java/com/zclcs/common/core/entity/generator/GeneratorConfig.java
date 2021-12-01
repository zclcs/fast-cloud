package com.zclcs.common.core.entity.generator;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import javax.validation.constraints.Size;

/**
 * @author zclcs
 */
@Data
@TableName("generator_config")
public class GeneratorConfig {

    public static final String TRIM_YES = "1";
    public static final String TRIM_NO = "0";

    /**
     * 主键
     */
    @TableId(value = "ID", type = IdType.AUTO)
    private Long id;

    /**
     * 作者
     */
    @TableField("author")
    @Size(max = 20, message = "{noMoreThan}")
    private String author;

    /**
     * 基础包名
     */
    @TableField("base_package")
    @Size(max = 50, message = "{noMoreThan}")
    private String basePackage;

    /**
     * entity文件存放路径
     */
    @TableField("entity_package")
    @Size(max = 20, message = "{noMoreThan}")
    private String entityPackage;

    /**
     * 入参
     */
    @TableField("ao_package")
    @Size(max = 20, message = "{noMoreThan}")
    private String aoPackage;

    /**
     * 出参
     */
    @TableField("vo_package")
    @Size(max = 20, message = "{noMoreThan}")
    private String voPackage;

    /**
     * mapper文件存放路径
     */
    @TableField("mapper_package")
    @Size(max = 20, message = "{noMoreThan}")
    private String mapperPackage;

    /**
     * mapper xml文件存放路径
     */
    @TableField("mapper_xml_package")
    @Size(max = 20, message = "{noMoreThan}")
    private String mapperXmlPackage;

    /**
     * servcie文件存放路径
     */
    @TableField("service_package")
    private String servicePackage;

    /**
     * serviceImpl文件存放路径
     */
    @TableField("service_impl_package")
    @Size(max = 20, message = "{noMoreThan}")
    private String serviceImplPackage;

    /**
     * controller文件存放路径
     */
    @TableField("controller_package")
    @Size(max = 20, message = "{noMoreThan}")
    private String controllerPackage;

    /**
     * 是否去除前缀
     */
    @TableField("is_trim")
    private String isTrim;

    /**
     * 前缀内容
     */
    @TableField("trim_value")
    private String trimValue;

    /**
     * java文件路径，固定值
     */
    private transient String javaPath = "/src/main/java/";
    /**
     * 配置文件存放路径，固定值
     */
    private transient String resourcesPath = "src/main/resources";
    /**
     * 文件生成日期
     */
    private transient String date = DateUtil.date().toString(DatePattern.NORM_DATETIME_MS_PATTERN);

    /**
     * 表名
     */
    private transient String tableName;
    /**
     * 表注释
     */
    private transient String tableComment;
    /**
     * 数据表对应的类名
     */
    private transient String className;
    /**
     * 数据表对应的对象名
     */
    private transient String objectName;
    /**
     * 数据表对应的主键字段名
     */
    private transient String keyName;

}