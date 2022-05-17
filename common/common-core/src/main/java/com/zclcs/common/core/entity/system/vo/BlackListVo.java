package com.zclcs.common.core.entity.system.vo;

import com.houkunlin.system.dict.starter.json.DictText;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
 * 黑名单表 Vo
 *
 * @author zclcs
 * @date 2021-12-29 17:20:03.111
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "BlackListVo对象", description = "黑名单表")
public class BlackListVo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "黑名单id")
    private Long blackId;

    @ApiModelProperty(value = "黑名单id集合")
    private List<Long> blackIds;

    @ApiModelProperty(value = "黑名单ip")
    private String blackIp;

    @ApiModelProperty(value = "请求uri（支持通配符）")
    private String requestUri;

    @ApiModelProperty(value = "请求方法，如果为ALL则表示对所有方法生效")
    private String requestMethod;

    @ApiModelProperty(value = "限制时间起")
    private String limitFrom;

    @ApiModelProperty(value = "限制时间止")
    private String limitTo;

    @ApiModelProperty(value = "ip对应地址")
    private String location;

    @ApiModelProperty(value = "黑名单状态 默认 1 @@enable_disable")
    @DictText("enable_disable")
    private String blackStatus;


}