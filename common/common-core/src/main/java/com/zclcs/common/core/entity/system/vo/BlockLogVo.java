package com.zclcs.common.core.entity.system.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * 黑名单拦截日志表 Vo
 *
 * @author zclcs
 * @date 2021-12-29 17:21:44.593
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "BlockLogVo对象", description = "黑名单拦截日志表")
public class BlockLogVo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "拦截日志id")
    private Long blockId;

    @ApiModelProperty(value = "拦截ip")
    private String blockIp;

    @ApiModelProperty(value = "被拦截请求URI")
    private String requestUri;

    @ApiModelProperty(value = "被拦截请求方法")
    private String requestMethod;

    @ApiModelProperty(value = "IP对应地址")
    private String location;

    @ApiModelProperty(value = "创建时间起")
    private LocalDate createTimeFrom;

    @ApiModelProperty(value = "创建时间起终")
    private LocalDate createTimeTo;


}