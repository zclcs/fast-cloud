package com.zclcs.server.generator.service.impl;

import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.common.core.entity.generator.Column;
import com.zclcs.common.core.entity.generator.Table;
import com.zclcs.common.core.utils.BaseSortUtil;
import com.zclcs.server.generator.mapper.GeneratorMapper;
import com.zclcs.server.generator.service.GeneratorService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zclcs
 */
@Service
@RequiredArgsConstructor
public class GeneratorServiceImpl implements GeneratorService {

    private final GeneratorMapper generatorMapper;

    @Override
    public List<String> getDatabases(String databaseType) {
        return generatorMapper.getDatabases(databaseType);
    }

    @Override
    public BasePage<Table> getTables(String tableName, BasePageAo request, String databaseType, String schemaName) {
        BasePage<Table> page = new BasePage<>(request.getPageNum(), request.getPageSize());
        BaseSortUtil.handlePageSort(request, page, "createTime", MyConstant.ORDER_ASC, false);
        generatorMapper.getTables(page, tableName, databaseType, schemaName);
        return page;
    }

    @Override
    public List<Column> getColumns(String databaseType, String schemaName, String tableName) {
        return generatorMapper.getColumns(databaseType, schemaName, tableName);
    }
}
