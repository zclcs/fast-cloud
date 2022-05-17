package com.zclcs.common.core.entity.dict;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zclcs.common.core.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 字典名表 Entity
 *
 * @author zclcs
 * @date 2021-11-02 15:26:20.789
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("dict_table_name")
@ApiModel(value = "DictTableName对象", description = "字典名表")
public class DictTableName extends BaseEntity {

    /**
     * 字典名表主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 字典名
     */
    @TableField("dict_name")
    private String dictName;

    /**
     * 字典名中文
     */
    @TableField("dict_title")
    private String dictTitle;

    /**
     * 排序
     */
    @TableField("sort")
    private Integer sort;

    /**
     * 字典类型 0 普通 1层级-默认为0
     */
    @TableField("type")
    private String type;

    /**
     * 备注
     */
    @TableField("remark")
    private String remark;

}