package com.zclcs.server.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.entity.system.SystemTradeLog;
import com.zclcs.server.system.mapper.SystemTradeLogMapper;
import com.zclcs.server.system.service.SystemTradeLogService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 分布式事务测试 服务实现类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Service
public class SystemTradeLogServiceImpl extends ServiceImpl<SystemTradeLogMapper, SystemTradeLog> implements SystemTradeLogService {

}
