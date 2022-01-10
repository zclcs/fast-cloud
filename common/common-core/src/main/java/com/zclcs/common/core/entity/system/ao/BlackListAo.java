package com.zclcs.common.core.entity.system.ao;

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
 * 黑名单表 Ao
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
@ApiModel(value = "BlackListAo对象", description = "黑名单表")
public class BlackListAo implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotNull(message = "{required}", groups = UpdateStrategy.class)
    @ApiModelProperty(value = "黑名单id")
    private Long blackId;

    @Size(max = 200, message = "{noMoreThan}")
    @ApiModelProperty(value = "黑名单ip")
    private String blackIp;

    @Size(max = 200, message = "{noMoreThan}")
    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "请求uri（支持通配符）", required = true)
    private String requestUri;

    @Size(max = 10, message = "{noMoreThan}")
    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "请求方法，如果为ALL则表示对所有方法生效", required = true)
    private String requestMethod;

    @Size(max = 20, message = "{noMoreThan}")
    @ApiModelProperty(value = "限制时间起")
    private String limitFrom;

    @Size(max = 20, message = "{noMoreThan}")
    @ApiModelProperty(value = "限制时间止")
    private String limitTo;

    @Size(max = 255, message = "{noMoreThan}")
    @ApiModelProperty(value = "ip对应地址")
    private String location;

    @Size(max = 40, message = "{noMoreThan}")
    @ApiModelProperty(value = "黑名单状态 默认 1 @@enable_disable")
    private String blackStatus;


}