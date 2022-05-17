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

/**
 * 项目参建单位信息数据表 Ao
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
@ApiModel(value = "ProjectCompanyAo对象", description = "项目参建单位信息数据表")
public class ProjectCompanyAo implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotNull(message = "{required}", groups = UpdateStrategy.class)
    @ApiModelProperty(value = "参建单位id")
    private Long projectCompanyId;

    @NotNull(message = "{required}")
    @ApiModelProperty(value = "项目id", required = true)
    private Long projectId;

    @NotNull(message = "{required}")
    @ApiModelProperty(value = "企业id", required = true)
    private Long companyId;

    @Size(max = 3, message = "{noMoreThan}")
    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "参建类型 @@company_role", required = true)
    private String companyRole;

    @Size(max = 50, message = "{noMoreThan}")
    @ApiModelProperty(value = "项目经理姓名")
    private String managerName;

    @Size(max = 2, message = "{noMoreThan}")
    @ApiModelProperty(value = "项目经理证件类型 @@id_card_type")
    private String managerIdCardType;

    @Size(max = 30, message = "{noMoreThan}")
    @ApiModelProperty(value = "项目经理证件号码")
    private String managerIdCardNumber;

    @Size(max = 50, message = "{noMoreThan}")
    @ApiModelProperty(value = "项目经理联系电话")
    private String managerPhone;


}