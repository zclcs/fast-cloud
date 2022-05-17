package com.zclcs.server.system.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.common.core.entity.system.SystemLog;
import com.zclcs.common.core.entity.system.ao.SystemLogAo;
import com.zclcs.common.core.entity.system.vo.SystemLogVo;
import com.zclcs.common.core.utils.BaseAddressUtil;
import com.zclcs.common.core.utils.BaseQueryWrapperUtil;
import com.zclcs.common.core.utils.BaseSortUtil;
import com.zclcs.server.system.mapper.SystemLogMapper;
import com.zclcs.server.system.service.SystemLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

/**
 * <p>
 * 用户操作日志表 服务实现类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class SystemLogServiceImpl extends ServiceImpl<SystemLogMapper, SystemLog> implements SystemLogService {

    @Override
    public BasePage<SystemLogVo> findLogPage(BasePageAo basePageAo, SystemLogAo log) {
        BasePage<SystemLogVo> basePage = new BasePage<>();
        BaseSortUtil.handlePageSort(basePageAo, basePage, "createTime", MyConstant.ORDER_DESC, true);
        QueryWrapper<SystemLogVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(StrUtil.isNotBlank(log.getUsername()), "sl.username", log.getUsername());
        queryWrapper.eq(StrUtil.isNotBlank(log.getOperation()), "sl.operation", log.getOperation());
        queryWrapper.eq(StrUtil.isNotBlank(log.getLocation()), "sl.location", log.getLocation());
        BaseQueryWrapperUtil.betweenDateAddTimeNotBlank(queryWrapper, "sl.create_at", log.getCreateTimeFrom(), log.getCreateTimeTo());
        return this.baseMapper.findPageVo(basePage, queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteLogs(List<Long> logIds) {
        this.removeByIds(logIds);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveLog(String className, String methodName, String params, String ip, String operation, String username, long start) {
        SystemLog log = new SystemLog();
        log.setIp(ip);
        log.setUsername(username);
        log.setTime(BigDecimal.valueOf(System.currentTimeMillis() - start));
        log.setOperation(operation);
        log.setMethod(className + "." + methodName + "()");
        log.setParams(Optional.ofNullable(params).orElse(""));
        log.setLocation(BaseAddressUtil.getCityInfo(ip));
        // 保存系统日志
        save(log);
    }
}
