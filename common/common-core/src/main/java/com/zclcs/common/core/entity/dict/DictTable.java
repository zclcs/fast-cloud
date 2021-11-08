package com.zclcs.common.core.entity.dict;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 字典 Entity
 *
 * @author zclcs
 * @date 2021-11-02 15:26:13.215
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("dict_table")
@ApiModel(value = "DictTable对象", description = "字典")
public class DictTable extends Model<DictTable> {

    /**
     * 字典表名id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 表名id
     */
    @TableField("dict_name_id")
    private Long dictNameId;

    /**
     * 字典code
     */
    @TableField("code")
    private String code;

    /**
     * 字典中文
     */
    @TableField("title")
    private String title;

    /**
     * 备注
     */
    @TableField("remark")
    private String remark;

    @Override
    protected Serializable pkVal() {
        return this.id;
    }
}