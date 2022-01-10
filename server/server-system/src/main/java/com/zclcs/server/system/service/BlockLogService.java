package com.zclcs.server.system.service;

import com.zclcs.common.core.entity.system.BlockLog;
import com.zclcs.common.core.entity.system.ao.BlockLogAo;
import com.zclcs.common.core.entity.system.vo.BlockLogVo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;

import java.util.List;

/**
 * 黑名单拦截日志表 Service接口
 *
 * @author zclcs
 * @date 2021-12-29 17:21:44.593
 */
public interface BlockLogService extends IService<BlockLog> {

    /**
     * 查询（分页）
     *
     * @param basePageAo basePageAo
     * @param blockLogVo blockLogVo
     * @return BasePage<BlockLogVo>
     */
    BasePage<BlockLogVo> findBlockLogPage(BasePageAo basePageAo, BlockLogVo blockLogVo);

    /**
     * 查询（所有）
     *
     * @param blockLogVo blockLogVo
     * @return List<BlockLogVo>
     */
    List<BlockLogVo> findBlockLogList(BlockLogVo blockLogVo);

    /**
     * 查询（单个）
     *
     * @param blockLogVo blockLogVo
     * @return BlockLogVo
     */
    BlockLogVo findBlockLog(BlockLogVo blockLogVo);

    /**
     * 统计
     *
     * @param blockLogVo blockLogVo
     * @return BlockLogVo
     */
    Integer countBlockLog(BlockLogVo blockLogVo);

    /**
     * 新增
     *
     * @param blockLogAo blockLogAo
     */
    void createBlockLog(BlockLogAo blockLogAo);

    /**
     * 修改
     *
     * @param blockLogAo blockLogAo
     */
    void updateBlockLog(BlockLogAo blockLogAo);

    /**
     * 删除
     *
     * @param ids ids
     */
    void deleteBlockLog(List<Long> ids);

}
