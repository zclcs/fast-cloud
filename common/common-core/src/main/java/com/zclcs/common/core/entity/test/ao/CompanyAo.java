package com.zclcs.common.core.entity.test.ao;

import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.time.LocalDate;

/**
 * 企业信息表 Ao
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
@ApiModel(value = "CompanyAo对象", description = "企业信息表")
public class CompanyAo implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotNull(message = "{required}", groups = UpdateStrategy.class)
    @ApiModelProperty(value = "企业id")
    private Long companyId;

    @Size(max = 18, message = "{noMoreThan}")
    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "统一社会信用代码或组织机构代码", required = true)
    private String companyCode;

    @Size(max = 64, message = "{noMoreThan}")
    @ApiModelProperty(value = "营业执照扫描件")
    private String companyAttachment;

    @Size(max = 200, message = "{noMoreThan}")
    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "企业名称", required = true)
    private String companyName;

    @Size(max = 3, message = "{noMoreThan}")
    @ApiModelProperty(value = "企业登记注册类型 @@company_type")
    private String companyType;

    @Size(max = 50, message = "{noMoreThan}")
    @ApiModelProperty(value = "工商营业执照注册号")
    private String licenseNum;

    @Size(max = 150, message = "{noMoreThan}")
    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "注册地区编码 array @@area_code", required = true)
    private String areaCode;

    @Size(max = 200, message = "{noMoreThan}")
    @ApiModelProperty(value = "企业营业地址")
    private String address;

    @Size(max = 6, message = "{noMoreThan}")
    @ApiModelProperty(value = "邮政编码")
    private String zipCode;

    @Size(max = 50, message = "{noMoreThan}")
    @ApiModelProperty(value = "法定代表人姓名")
    private String legalMan;

    @Size(max = 50, message = "{noMoreThan}")
    @ApiModelProperty(value = "法定代表人电话")
    private String legalManPhone;

    @Size(max = 50, message = "{noMoreThan}")
    @ApiModelProperty(value = "法定代表人职务")
    private String legalManDuty;

    @Size(max = 50, message = "{noMoreThan}")
    @ApiModelProperty(value = "法定代表人职称")
    private String legalManProTitle;

    @Size(max = 2, message = "{noMoreThan}")
    @ApiModelProperty(value = "法定代表人证件类型 @@id_card_type")
    private String legalManIdCardType;

    @Size(max = 30, message = "{noMoreThan}")
    @ApiModelProperty(value = "法定代表人证件号码")
    private String legalManIdCardNumber;

    @Size(max = 20, message = "{noMoreThan}")
    @ApiModelProperty(value = "注册资本（单位：分）")
    private String regCapital;

    @Size(max = 20, message = "{noMoreThan}")
    @ApiModelProperty(value = "实收资本（单位：分）")
    private String factRegCapital;

    @Size(max = 40, message = "{noMoreThan}")
    @ApiModelProperty(value = "资本币种 @@currency_type")
    private String capitalCurrencyType;

    @ApiModelProperty(value = "注册日期")
    private LocalDate registerDate;

    @ApiModelProperty(value = "成立日期")
    private LocalDate establishDate;

    @Size(max = 20, message = "{noMoreThan}")
    @ApiModelProperty(value = "办公电话")
    private String officePhone;

    @Size(max = 20, message = "{noMoreThan}")
    @ApiModelProperty(value = "传真号码")
    private String faxNumber;

    @Size(max = 50, message = "{noMoreThan}")
    @ApiModelProperty(value = "联系人姓名")
    private String linkMan;

    @Size(max = 255, message = "{noMoreThan}")
    @ApiModelProperty(value = "联系人职务")
    private String linkDuty;

    @Size(max = 50, message = "{noMoreThan}")
    @ApiModelProperty(value = "联系人电话")
    private String linkPhone;

    @Size(max = 100, message = "{noMoreThan}")
    @ApiModelProperty(value = "企业邮箱")
    private String email;

    @Size(max = 200, message = "{noMoreThan}")
    @ApiModelProperty(value = "企业网址")
    private String webSite;

    @Size(max = 200, message = "{noMoreThan}")
    @ApiModelProperty(value = "企业备注")
    private String remark;


}