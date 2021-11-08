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
 * 层级字典 Entity
 *
 * @author zclcs
 * @date 2021-11-02 15:26:28.342
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("dict_table_level")
@ApiModel(value = "DictTableLevel对象", description = "层级字典")
public class DictTableLevel extends Model<DictTableLevel> {

    /**
     * 字典表名id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 父项id-默认为0
     */
    @TableField("parent_id")
    private Long parentId;

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