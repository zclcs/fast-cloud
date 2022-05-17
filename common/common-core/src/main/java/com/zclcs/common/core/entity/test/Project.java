package com.zclcs.common.core.entity.test;

    import java.util.Date;
    import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zclcs.common.core.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.LocalDate;

/**
 * 项目信息表 Entity
 *
 * @author zclcs
 * @date 2022-05-16 10:48:59.648
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("test_project")
@ApiModel(value = "Project对象", description = "项目信息表")
public class Project extends BaseEntity {

    /**
     * 项目id
     */
    @TableId(value = "project_id", type = IdType.AUTO)
    private Long projectId;

    /**
     * 项目编号
     */
    @TableField("project_code")
    private String projectCode;

    /**
     * 项目名称
     */
    @TableField("project_name")
    private String projectName;

    /**
     * 项目简介
     */
    @TableField("description")
    private String description;

    /**
     * 项目分类 @@project_category
     */
    @TableField("category")
    private String category;

    /**
     * 建设用地规划许可证编号
     */
    @TableField("build_plan_num")
    private String buildPlanNum;

    /**
     * 建设工程规划许可证编号
     */
    @TableField("child_project_plan_num")
    private String childProjectPlanNum;

    /**
     * 项目所在地 array @@area_code
     */
    @TableField("area_code")
    private String areaCode;

    /**
     * 是否市直管 @@yes_no
     */
    @TableField("is_lead_by_city")
    private String isLeadByCity;

    /**
     * 总投资（单位：分）
     */
    @TableField("invest")
    private String invest;

    /**
     * 总面积（单位：平方分米）
     */
    @TableField("building_area")
    private String buildingArea;

    /**
     * 总长度（单位：厘米）
     */
    @TableField("building_length")
    private String buildingLength;

    /**
     * 实际开工日期
     */
    @TableField("start_date")
    private LocalDate startDate;

    /**
     * 实际竣工日期
     */
    @TableField("complete_date")
    private LocalDate completeDate;

    /**
     * 计划开工日期
     */
    @TableField("planned_start_date")
    private LocalDate plannedStartDate;

    /**
     * 计划竣工日期
     */
    @TableField("planned_complete_date")
    private LocalDate plannedCompleteDate;

    /**
     * 联系人姓名
     */
    @TableField("link_man")
    private String linkMan;

    /**
     * 联系人电话
     */
    @TableField("link_phone")
    private String linkPhone;

    /**
     * 项目状态 @@project_status
     */
    @TableField("project_status")
    private String projectStatus;

    /**
     * 经度
     */
    @TableField("lng")
    private BigDecimal lng;

    /**
     * 纬度
     */
    @TableField("lat")
    private BigDecimal lat;

    /**
     * 项目地址
     */
    @TableField("address")
    private String address;

    /**
     * 立项文号
     */
    @TableField("approval_num")
    private String approvalNum;

    /**
     * 立项级别 @@approval_level
     */
    @TableField("approval_level_num")
    private String approvalLevelNum;

    /**
     * 建设规模 @@project_size
     */
    @TableField("project_size")
    private String projectSize;

    /**
     * 建设性质 @@property_num
     */
    @TableField("property_num")
    private String propertyNum;

    /**
     * 工程用途 @@function_num
     */
    @TableField("function_num")
    private String functionNum;

    /**
     * 职能单位 @@functional_unit
     */
    @TableField("functional_unit")
    private String functionalUnit;

    /**
     * 是否重点项目 @@yes_no
     */
    @TableField("major_project")
    private String majorProject;

    /**
     * 最后一次考勤时间
     */
    @TableField("last_attend_time")
    private LocalDateTime lastAttendTime;


}