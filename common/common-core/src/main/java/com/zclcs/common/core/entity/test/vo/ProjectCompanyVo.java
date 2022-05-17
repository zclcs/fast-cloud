package com.zclcs.common.core.entity.test.vo;

import com.houkunlin.system.dict.starter.json.DictText;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 项目参建单位信息数据表 Vo
 *
 * @author zclcs
 * @date 2022-05-16 10:49:03.613
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "ProjectCompanyVo对象", description = "项目参建单位信息数据表")
public class ProjectCompanyVo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "参建单位id")
    private Long projectCompanyId;

    @ApiModelProperty(value = "项目id")
    private Long projectId;

    @ApiModelProperty(value = "企业id")
    private Long companyId;

    @ApiModelProperty(value = "参建类型 @@company_role")
    @DictText("company_role")
    private String companyRole;

    @ApiModelProperty(value = "项目经理姓名")
    private String managerName;

    @ApiModelProperty(value = "项目经理证件类型 @@id_card_type")
    @DictText("id_card_type")
    private String managerIdCardType;

    @ApiModelProperty(value = "项目经理证件号码")
    private String managerIdCardNumber;

    @ApiModelProperty(value = "项目经理联系电话")
    private String managerPhone;


}