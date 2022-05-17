package com.zclcs.common.core.entity.test.vo;

import com.houkunlin.system.dict.starter.json.Array;
import com.houkunlin.system.dict.starter.json.DictText;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 企业信息表 Vo
 *
 * @author zclcs
 * @date 2022-05-16 10:49:01.656
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "CompanyVo对象", description = "企业信息表")
public class CompanyVo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "企业id")
    private Long companyId;

    @ApiModelProperty(value = "统一社会信用代码或组织机构代码")
    private String companyCode;

    @ApiModelProperty(value = "营业执照扫描件")
    private String companyAttachment;

    @ApiModelProperty(value = "企业名称")
    private String companyName;

    @ApiModelProperty(value = "企业登记注册类型 @@company_type")
    @DictText("company_type")
    private String companyType;

    @ApiModelProperty(value = "工商营业执照注册号")
    private String licenseNum;

    @ApiModelProperty(value = "注册地区编码 array @@area_code")
    @DictText(value = "area_code", array = @Array)
    private String areaCode;

    @ApiModelProperty(value = "企业营业地址")
    private String address;

    @ApiModelProperty(value = "邮政编码")
    private String zipCode;

    @ApiModelProperty(value = "法定代表人姓名")
    private String legalMan;

    @ApiModelProperty(value = "法定代表人电话")
    private String legalManPhone;

    @ApiModelProperty(value = "法定代表人职务")
    private String legalManDuty;

    @ApiModelProperty(value = "法定代表人职称")
    private String legalManProTitle;

    @ApiModelProperty(value = "法定代表人证件类型 @@id_card_type")
    @DictText("id_card_type")
    private String legalManIdCardType;

    @ApiModelProperty(value = "法定代表人证件号码")
    private String legalManIdCardNumber;

    @ApiModelProperty(value = "注册资本（单位：分）")
    private String regCapital;

    @ApiModelProperty(value = "实收资本（单位：分）")
    private String factRegCapital;

    @ApiModelProperty(value = "资本币种 @@currency_type")
    @DictText("currency_type")
    private String capitalCurrencyType;

    @ApiModelProperty(value = "注册日期")
    private String registerDate;

    @ApiModelProperty(value = "成立日期")
    private String establishDate;

    @ApiModelProperty(value = "办公电话")
    private String officePhone;

    @ApiModelProperty(value = "传真号码")
    private String faxNumber;

    @ApiModelProperty(value = "联系人姓名")
    private String linkMan;

    @ApiModelProperty(value = "联系人职务")
    private String linkDuty;

    @ApiModelProperty(value = "联系人电话")
    private String linkPhone;

    @ApiModelProperty(value = "企业邮箱")
    private String email;

    @ApiModelProperty(value = "企业网址")
    private String webSite;

    @ApiModelProperty(value = "企业备注")
    private String remark;


}