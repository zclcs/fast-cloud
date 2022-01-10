package com.zclcs.gateway.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.entity.system.BlockLog;
import com.zclcs.common.core.entity.system.ao.BlockLogAo;

/**
 * 黑名单拦截日志表 Service接口
 *
 * @author zclcs
 * @date 2021-12-29 17:21:44.593
 */
public interface BlockLogService extends IService<BlockLog> {

    /**
     * 新增
     *
     * @param blockLogAo blockLogAo
     */
    void createBlockLog(BlockLogAo blockLogAo);

}
