package com.zclcs.common.core.entity.test.vo;

import com.houkunlin.system.dict.starter.json.Array;
import com.houkunlin.system.dict.starter.json.DictText;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 项目信息表 Vo
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
@ApiModel(value = "ProjectVo对象", description = "项目信息表")
public class ProjectVo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "项目id")
    private Long projectId;

    @ApiModelProperty(value = "项目编号")
    private String projectCode;

    @ApiModelProperty(value = "项目名称")
    private String projectName;

    @ApiModelProperty(value = "项目简介")
    private String description;

    @ApiModelProperty(value = "项目分类 @@project_category")
    @DictText("project_category")
    private String category;

    @ApiModelProperty(value = "建设用地规划许可证编号")
    private String buildPlanNum;

    @ApiModelProperty(value = "建设工程规划许可证编号")
    private String childProjectPlanNum;

    @ApiModelProperty(value = "项目所在地 array @@area_code")
    @DictText(value = "area_code", array = @Array)
    private String areaCode;

    @ApiModelProperty(value = "是否市直管 @@yes_no")
    @DictText("yes_no")
    private String isLeadByCity;

    @ApiModelProperty(value = "总投资（单位：分）")
    private String invest;

    @ApiModelProperty(value = "总面积（单位：平方分米）")
    private String buildingArea;

    @ApiModelProperty(value = "总长度（单位：厘米）")
    private String buildingLength;

    @ApiModelProperty(value = "实际开工日期")
    private String startDate;

    @ApiModelProperty(value = "实际竣工日期")
    private String completeDate;

    @ApiModelProperty(value = "计划开工日期")
    private String plannedStartDate;

    @ApiModelProperty(value = "计划竣工日期")
    private String plannedCompleteDate;

    @ApiModelProperty(value = "联系人姓名")
    private String linkMan;

    @ApiModelProperty(value = "联系人电话")
    private String linkPhone;

    @ApiModelProperty(value = "项目状态 @@project_status")
    @DictText("project_status")
    private String projectStatus;

    @ApiModelProperty(value = "经度")
    private BigDecimal lng;

    @ApiModelProperty(value = "纬度")
    private BigDecimal lat;

    @ApiModelProperty(value = "项目地址")
    private String address;

    @ApiModelProperty(value = "立项文号")
    private String approvalNum;

    @ApiModelProperty(value = "立项级别 @@approval_level")
    @DictText("approval_level")
    private String approvalLevelNum;

    @ApiModelProperty(value = "建设规模 @@project_size")
    @DictText("project_size")
    private String projectSize;

    @ApiModelProperty(value = "建设性质 @@property_num")
    @DictText("property_num")
    private String propertyNum;

    @ApiModelProperty(value = "工程用途 @@function_num")
    @DictText("function_num")
    private String functionNum;

    @ApiModelProperty(value = "职能单位 @@functional_unit")
    @DictText("functional_unit")
    private String functionalUnit;

    @ApiModelProperty(value = "是否重点项目 @@yes_no")
    @DictText("yes_no")
    private String majorProject;

    @ApiModelProperty(value = "最后一次考勤时间")
    private String lastAttendTime;


}