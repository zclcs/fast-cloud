package com.zclcs.server.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.entity.system.SystemExport;
import com.zclcs.server.system.mapper.SystemExportMapper;
import com.zclcs.server.system.service.SystemExportService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * excel导入导出测试 服务实现类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Service
public class SystemExportServiceImpl extends ServiceImpl<SystemExportMapper, SystemExport> implements SystemExportService {

}
