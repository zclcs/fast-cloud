package com.zclcs.common.core.entity.generator;

import lombok.Data;

/**
 * @author zclcs
 */
@Data
public class Column {
    /**
     * 名称
     */
    private String name;
    /**
     * 是否为主键
     */
    private Boolean isKey;
    /**
     * 是否可以为空
     */
    private Boolean isNullable;
    /**
     * 类型
     */
    private String type;
    /**
     * 字符串是否有长度限制
     */
    private Boolean isCharMaxLength;
    /**
     * 字符串长度限制
     */
    private String charMaxLength;
    /**
     * 注释
     */
    private String remark;
    /**
     * 属性名称
     */
    private String field;
    /**
     * 注释中是否有字典
     */
    private Boolean hasDict;
    /**
     * 注释中带的字典
     */
    private String remarkDict;
    /**
     * 字典是否是数组
     */
    private Boolean isArray;
}
