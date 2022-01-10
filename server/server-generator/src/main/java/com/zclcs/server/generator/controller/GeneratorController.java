package com.zclcs.server.generator.controller;

import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.GeneratorConstant;
import com.zclcs.common.core.entity.generator.Table;
import com.zclcs.common.core.entity.generator.ao.GenerateAo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.server.generator.service.GeneratorService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zclcs
 */
@Slf4j
@Validated
@RestController
@RequiredArgsConstructor
@RequestMapping("gen")
@Api(tags = "代码生成")
public class GeneratorController {

    private final GeneratorService generatorService;

    @GetMapping("datasource")
    @PreAuthorize("hasAuthority('gen:generate')")
    @ApiOperation(value = "查询代码生成数据源")
    public BaseRsp<List<Map<String, String>>> datasource() {
        List<String> databases = generatorService.getDatabases(null);
        List<Map<String, String>> data = new ArrayList<>();
        databases.forEach(s -> {
            Map<String, String> map = new HashMap<>(1);
            map.put("value", s);
            data.add(map);
        });
        return BaseRspUtil.data(data);
    }

    @GetMapping("tables")
    @PreAuthorize("hasAuthority('gen:generate')")
    @ApiOperation(value = "查询代码生成表")
    public BaseRsp<BasePage<Table>> tablesInfo(@ApiParam(value = "表名") String name,
                                               @ApiParam(value = "库名") String datasource,
                                               BasePageAo request) {
        BasePage<Table> tables = generatorService.getTables(name, request, GeneratorConstant.DATABASE_TYPE, datasource);
        return BaseRspUtil.data(tables);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('gen:generate:gen')")
    @ApiOperation(value = "生成代码")
    public void generate(@Validated @RequestBody GenerateAo generateAo,
                         HttpServletResponse response) {
        generatorService.generate(generateAo, response);
    }
}
