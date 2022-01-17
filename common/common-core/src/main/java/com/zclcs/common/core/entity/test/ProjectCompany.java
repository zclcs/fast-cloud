package com.zclcs.common.core.entity.test;

    import java.util.Date;
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
 * 参建单位 Entity
 *
 * @author zclcs
 * @date 2022-01-13 11:19:10.776
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("test_project_company")
@ApiModel(value = "ProjectCompany对象", description = "参建单位")
public class ProjectCompany {

    /**
     * 参建单位id
     */
    @TableId(value = "project_company_id", type = IdType.AUTO)
    private Long projectCompanyId;

    /**
     * 项目id
     */
    @TableField("project_id")
    private Long projectId;

    /**
     * 企业id
     */
    @TableField("company_id")
    private Long companyId;

    /**
     * 参建类型 @@company_role
     */
    @TableField("company_role")
    private String companyRole;

    /**
     * 项目经理姓名
     */
    @TableField("manager_name")
    private String managerName;

    /**
     * 项目经理证件类型 @@id_card_type
     */
    @TableField("manager_id_card_type")
    private String managerIdCardType;

    /**
     * 项目经理证件号码
     */
    @TableField("manager_id_card_number")
    private String managerIdCardNumber;

    /**
     * 项目经理联系电话
     */
    @TableField("manager_phone")
    private String managerPhone;

    /**
     * 创建时间
     */
    @TableField("create_time")
    private Date createTime;

    /**
     * 编辑时间
     */
    @TableField("modify_time")
    private Date modifyTime;


}