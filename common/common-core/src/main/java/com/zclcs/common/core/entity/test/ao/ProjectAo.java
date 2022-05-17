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
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 项目信息表 Ao
 *
 * @author zclcs
 * @date 2022-05-16 10:48:59.648
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "ProjectAo对象", description = "项目信息表")
public class ProjectAo implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotNull(message = "{required}", groups = UpdateStrategy.class)
    @ApiModelProperty(value = "项目id")
    private Long projectId;

    @Size(max = 50, message = "{noMoreThan}")
    @ApiModelProperty(value = "项目编号")
    private String projectCode;

    @Size(max = 200, message = "{noMoreThan}")
    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "项目名称", required = true)
    private String projectName;

    @Size(max = 1000, message = "{noMoreThan}")
    @ApiModelProperty(value = "项目简介")
    private String description;

    @Size(max = 3, message = "{noMoreThan}")
    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "项目分类 @@project_category", required = true)
    private String category;

    @Size(max = 50, message = "{noMoreThan}")
    @ApiModelProperty(value = "建设用地规划许可证编号")
    private String buildPlanNum;

    @Size(max = 50, message = "{noMoreThan}")
    @ApiModelProperty(value = "建设工程规划许可证编号")
    private String childProjectPlanNum;

    @Size(max = 150, message = "{noMoreThan}")
    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "项目所在地 array @@area_code", required = true)
    private String areaCode;

    @Size(max = 1, message = "{noMoreThan}")
    @ApiModelProperty(value = "是否市直管 @@yes_no")
    private String isLeadByCity;

    @Size(max = 20, message = "{noMoreThan}")
    @ApiModelProperty(value = "总投资（单位：分）")
    private String invest;

    @Size(max = 20, message = "{noMoreThan}")
    @ApiModelProperty(value = "总面积（单位：平方分米）")
    private String buildingArea;

    @Size(max = 20, message = "{noMoreThan}")
    @ApiModelProperty(value = "总长度（单位：厘米）")
    private String buildingLength;

    @ApiModelProperty(value = "实际开工日期")
    private LocalDate startDate;

    @ApiModelProperty(value = "实际竣工日期")
    private LocalDate completeDate;

    @ApiModelProperty(value = "计划开工日期")
    private LocalDate plannedStartDate;

    @ApiModelProperty(value = "计划竣工日期")
    private LocalDate plannedCompleteDate;

    @Size(max = 50, message = "{noMoreThan}")
    @ApiModelProperty(value = "联系人姓名")
    private String linkMan;

    @Size(max = 50, message = "{noMoreThan}")
    @ApiModelProperty(value = "联系人电话")
    private String linkPhone;

    @Size(max = 3, message = "{noMoreThan}")
    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "项目状态 @@project_status", required = true)
    private String projectStatus;

    @ApiModelProperty(value = "经度")
    private BigDecimal lng;

    @ApiModelProperty(value = "纬度")
    private BigDecimal lat;

    @Size(max = 200, message = "{noMoreThan}")
    @ApiModelProperty(value = "项目地址")
    private String address;

    @Size(max = 50, message = "{noMoreThan}")
    @ApiModelProperty(value = "立项文号")
    private String approvalNum;

    @Size(max = 3, message = "{noMoreThan}")
    @ApiModelProperty(value = "立项级别 @@approval_level")
    private String approvalLevelNum;

    @Size(max = 2, message = "{noMoreThan}")
    @ApiModelProperty(value = "建设规模 @@project_size")
    private String projectSize;

    @Size(max = 3, message = "{noMoreThan}")
    @ApiModelProperty(value = "建设性质 @@property_num")
    private String propertyNum;

    @Size(max = 3, message = "{noMoreThan}")
    @ApiModelProperty(value = "工程用途 @@function_num")
    private String functionNum;

    @Size(max = 1, message = "{noMoreThan}")
    @ApiModelProperty(value = "职能单位 @@functional_unit")
    private String functionalUnit;

    @Size(max = 1, message = "{noMoreThan}")
    @ApiModelProperty(value = "是否重点项目 @@yes_no")
    private String majorProject;

    @ApiModelProperty(value = "最后一次考勤时间")
    private LocalDateTime lastAttendTime;


}