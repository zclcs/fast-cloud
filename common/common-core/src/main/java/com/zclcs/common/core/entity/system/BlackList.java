package com.zclcs.common.core.entity.system;

import com.baomidou.mybatisplus.annotation.*;
import com.zclcs.common.core.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 黑名单表 Entity
 *
 * @author zclcs
 * @date 2021-12-29 17:20:03.111
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("system_black_list")
@ApiModel(value = "BlackList对象", description = "黑名单表")
public class BlackList extends BaseEntity {

    /**
     * 黑名单id
     */
    @TableId(value = "black_id", type = IdType.AUTO)
    private Long blackId;

    /**
     * 黑名单ip
     */
    @TableField("black_ip")
    private String blackIp;

    /**
     * 请求uri（支持通配符）
     */
    @TableField("request_uri")
    private String requestUri;

    /**
     * 请求方法，如果为ALL则表示对所有方法生效
     */
    @TableField("request_method")
    private String requestMethod;

    /**
     * 限制时间起
     */
    @TableField(value = "limit_from", updateStrategy = FieldStrategy.IGNORED)
    private String limitFrom;

    /**
     * 限制时间止
     */
    @TableField(value = "limit_to", updateStrategy = FieldStrategy.IGNORED)
    private String limitTo;

    /**
     * ip对应地址
     */
    @TableField(value = "location", updateStrategy = FieldStrategy.IGNORED)
    private String location;

    /**
     * 黑名单状态 默认 1 @@enable_disable
     */
    @TableField("black_status")
    private String blackStatus;


}