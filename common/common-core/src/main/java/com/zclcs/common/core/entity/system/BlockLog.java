package com.zclcs.common.core.entity.system;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zclcs.common.core.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 黑名单拦截日志表 Entity
 *
 * @author zclcs
 * @date 2021-12-29 17:21:44.593
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("system_block_log")
@ApiModel(value = "BlockLog对象", description = "黑名单拦截日志表")
public class BlockLog extends BaseEntity {

    /**
     * 拦截日志id
     */
    @TableId(value = "block_id", type = IdType.AUTO)
    private Long blockId;

    /**
     * 拦截ip
     */
    @TableField("block_ip")
    private String blockIp;

    /**
     * 被拦截请求URI
     */
    @TableField("request_uri")
    private String requestUri;

    /**
     * 被拦截请求方法
     */
    @TableField("request_method")
    private String requestMethod;

    /**
     * IP对应地址
     */
    @TableField("location")
    private String location;


}