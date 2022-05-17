package com.zclcs.server.system.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.entity.system.BlockLog;
import com.zclcs.common.core.entity.system.ao.BlockLogAo;
import com.zclcs.common.core.entity.system.vo.BlockLogVo;
import com.zclcs.common.core.utils.BaseAddressUtil;
import com.zclcs.common.core.utils.BaseQueryWrapperUtil;
import com.zclcs.server.system.mapper.BlockLogMapper;
import com.zclcs.server.system.service.BlockLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 黑名单拦截日志表 Service实现
 *
 * @author zclcs
 * @date 2021-12-29 17:21:44.593
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class BlockLogServiceImpl extends ServiceImpl<BlockLogMapper, BlockLog> implements BlockLogService {

    @Override
    public BasePage<BlockLogVo> findBlockLogPage(BasePageAo basePageAo, BlockLogVo blockLogVo) {
        BasePage<BlockLogVo> basePage = new BasePage<>(basePageAo.getPageNum(), basePageAo.getPageSize());
        QueryWrapper<BlockLogVo> queryWrapper = getQueryWrapper(blockLogVo);
        return this.baseMapper.findPageVo(basePage, queryWrapper);
    }

    @Override
    public List<BlockLogVo> findBlockLogList(BlockLogVo blockLogVo) {
        QueryWrapper<BlockLogVo> queryWrapper = getQueryWrapper(blockLogVo);
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    public BlockLogVo findBlockLog(BlockLogVo blockLogVo) {
        QueryWrapper<BlockLogVo> queryWrapper = getQueryWrapper(blockLogVo);
        return this.baseMapper.findOneVo(queryWrapper);
    }

    @Override
    public Integer countBlockLog(BlockLogVo blockLogVo) {
        QueryWrapper<BlockLogVo> queryWrapper = getQueryWrapper(blockLogVo);
        return this.baseMapper.countVo(queryWrapper);
    }

    private QueryWrapper<BlockLogVo> getQueryWrapper(BlockLogVo blockLogVo) {
        QueryWrapper<BlockLogVo> queryWrapper = new QueryWrapper<>();
        BaseQueryWrapperUtil.likeNotBlank(queryWrapper, "sbl.block_ip", blockLogVo.getBlockIp());
        BaseQueryWrapperUtil.likeNotBlank(queryWrapper, "sbl.request_uri", blockLogVo.getRequestUri());
        BaseQueryWrapperUtil.likeNotBlank(queryWrapper, "sbl.request_method", blockLogVo.getRequestMethod());
        BaseQueryWrapperUtil.betweenDateAddTimeNotBlank(queryWrapper, "sbl.create_at", blockLogVo.getCreateTimeFrom(), blockLogVo.getCreateTimeTo());
        queryWrapper.orderByDesc("sbl.create_at");
        return queryWrapper;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createBlockLog(BlockLogAo blockLogAo) {
        BlockLog blockLog = new BlockLog();
        BeanUtil.copyProperties(blockLogAo, blockLog);
        setBlockLog(blockLog);
        this.save(blockLog);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateBlockLog(BlockLogAo blockLogAo) {
        BlockLog blockLog = new BlockLog();
        BeanUtil.copyProperties(blockLogAo, blockLog);
        setBlockLog(blockLog);
        this.updateById(blockLog);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteBlockLog(List<Long> ids) {
        this.removeByIds(ids);
    }

    private void setBlockLog(BlockLog blockLog) {
        if (StrUtil.isNotBlank(blockLog.getBlockIp())) {
            blockLog.setLocation(BaseAddressUtil.getCityInfo(blockLog.getBlockIp()));
        }
    }
}
