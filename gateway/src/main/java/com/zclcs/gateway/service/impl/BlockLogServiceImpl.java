package com.zclcs.gateway.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.entity.system.BlockLog;
import com.zclcs.common.core.entity.system.ao.BlockLogAo;
import com.zclcs.common.core.utils.BaseAddressUtil;
import com.zclcs.gateway.mapper.BlockLogMapper;
import com.zclcs.gateway.service.BlockLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * 黑名单拦截日志表 Service实现
 *
 * @author zclcs
 * @date 2021-12-29 17:21:44.593
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class BlockLogServiceImpl extends ServiceImpl<BlockLogMapper, BlockLog> implements BlockLogService {

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createBlockLog(BlockLogAo blockLogAo) {
        BlockLog blockLog = new BlockLog();
        BeanUtil.copyProperties(blockLogAo, blockLog);
        setBlockLog(blockLog);
        this.save(blockLog);
    }

    private void setBlockLog(BlockLog blockLog) {
        blockLog.setCreateTime(DateUtil.date());
        if (StrUtil.isNotBlank(blockLog.getBlockIp())) {
            blockLog.setLocation(BaseAddressUtil.getCityInfo(blockLog.getBlockIp()));
        }
        blockLog.setModifyTime(DateUtil.date());
    }
}
