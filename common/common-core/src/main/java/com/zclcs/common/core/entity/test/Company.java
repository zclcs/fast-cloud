package com.zclcs.common.core.entity.test;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zclcs.common.core.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDate;

/**
 * 企业信息表 Entity
 *
 * @author zclcs
 * @date 2022-05-16 10:49:01.656
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("test_company")
@ApiModel(value = "Company对象", description = "企业信息表")
public class Company extends BaseEntity {

    /**
     * 企业id
     */
    @TableId(value = "company_id", type = IdType.AUTO)
    private Long companyId;

    /**
     * 统一社会信用代码或组织机构代码
     */
    @TableField("company_code")
    private String companyCode;

    /**
     * 营业执照扫描件
     */
    @TableField("company_attachment")
    private String companyAttachment;

    /**
     * 企业名称
     */
    @TableField("company_name")
    private String companyName;

    /**
     * 企业登记注册类型 @@company_type
     */
    @TableField("company_type")
    private String companyType;

    /**
     * 工商营业执照注册号
     */
    @TableField("license_num")
    private String licenseNum;

    /**
     * 注册地区编码 array @@area_code
     */
    @TableField("area_code")
    private String areaCode;

    /**
     * 企业营业地址
     */
    @TableField("address")
    private String address;

    /**
     * 邮政编码
     */
    @TableField("zip_code")
    private String zipCode;

    /**
     * 法定代表人姓名
     */
    @TableField("legal_man")
    private String legalMan;

    /**
     * 法定代表人电话
     */
    @TableField("legal_man_phone")
    private String legalManPhone;

    /**
     * 法定代表人职务
     */
    @TableField("legal_man_duty")
    private String legalManDuty;

    /**
     * 法定代表人职称
     */
    @TableField("legal_man_pro_title")
    private String legalManProTitle;

    /**
     * 法定代表人证件类型 @@id_card_type
     */
    @TableField("legal_man_id_card_type")
    private String legalManIdCardType;

    /**
     * 法定代表人证件号码
     */
    @TableField("legal_man_id_card_number")
    private String legalManIdCardNumber;

    /**
     * 注册资本（单位：分）
     */
    @TableField("reg_capital")
    private String regCapital;

    /**
     * 实收资本（单位：分）
     */
    @TableField("fact_reg_capital")
    private String factRegCapital;

    /**
     * 资本币种 @@currency_type
     */
    @TableField("capital_currency_type")
    private String capitalCurrencyType;

    /**
     * 注册日期
     */
    @TableField("register_date")
    private LocalDate registerDate;

    /**
     * 成立日期
     */
    @TableField("establish_date")
    private LocalDate establishDate;

    /**
     * 办公电话
     */
    @TableField("office_phone")
    private String officePhone;

    /**
     * 传真号码
     */
    @TableField("fax_number")
    private String faxNumber;

    /**
     * 联系人姓名
     */
    @TableField("link_man")
    private String linkMan;

    /**
     * 联系人职务
     */
    @TableField("link_duty")
    private String linkDuty;

    /**
     * 联系人电话
     */
    @TableField("link_phone")
    private String linkPhone;

    /**
     * 企业邮箱
     */
    @TableField("email")
    private String email;

    /**
     * 企业网址
     */
    @TableField("web_site")
    private String webSite;

    /**
     * 企业备注
     */
    @TableField("remark")
    private String remark;


}