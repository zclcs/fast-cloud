package com.zclcs.server.generator.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.dynamic.datasource.spring.boot.autoconfigure.DynamicDataSourceProperties;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.GeneratorConstant;
import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.common.core.entity.generator.Column;
import com.zclcs.common.core.entity.generator.GeneratorConfig;
import com.zclcs.common.core.entity.generator.Table;
import com.zclcs.common.core.entity.generator.vo.GeneratorConfigVo;
import com.zclcs.common.core.exception.MyException;
import com.zclcs.common.core.utils.BaseFileUtil;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.common.core.utils.BaseUtil;
import com.zclcs.server.generator.helper.GeneratorHelper;
import com.zclcs.server.generator.service.GeneratorConfigService;
import com.zclcs.server.generator.service.GeneratorService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.RegExUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.util.FileSystemUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotBlank;
import java.io.File;
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

    private static final String SUFFIX = "_code.zip";

    private final GeneratorService generatorService;
    private final GeneratorConfigService generatorConfigService;
    private final GeneratorHelper generatorHelper;
    private final DynamicDataSourceProperties properties;

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
    public void generate(@ApiParam(value = "表名", required = true) @NotBlank(message = "{required}") String name,
                         @ApiParam(value = "库名", required = true) @NotBlank(message = "{required}") String datasource,
                         @ApiParam(value = "对象中文名", required = true) @NotBlank(message = "{required}") String objectName,
                         @ApiParam(value = "备注") String remark,
                         HttpServletResponse response) throws Exception {
        GeneratorConfigVo generatorConfigVo = generatorConfigService.findGeneratorConfig();
        if (generatorConfigVo == null) {
            throw new MyException("代码生成配置为空");
        }
        GeneratorConfig generatorConfig = new GeneratorConfig();
        BeanUtil.copyProperties(generatorConfigVo, generatorConfig);
        String className = name;
        if (GeneratorConfig.TRIM_YES.equals(generatorConfig.getIsTrim())) {
            className = RegExUtils.replaceFirst(name, generatorConfig.getTrimValue(), StringUtils.EMPTY);
        }

        generatorConfig.setTableName(name);
        generatorConfig.setClassName(BaseUtil.underscoreToCamel(className));
        generatorConfig.setObjectName(BaseUtil.underscoreToCamel(objectName));
        generatorConfig.setTableComment(remark);
        // 生成代码到临时目录
        List<Column> columns = generatorService.getColumns(GeneratorConstant.DATABASE_TYPE, datasource, name);
        for (Column column : columns) {
            if (column.getIsKey()) {
                generatorConfig.setKeyName(column.getName());
            }
            String columnRemark = column.getRemark();
            if (StrUtil.contains(columnRemark, MyConstant.DICT_REMARK)) {
                column.setHasDict(true);
                List<String> strings = StrUtil.splitTrim(columnRemark, MyConstant.DICT_REMARK);
                column.setRemarkDict(strings.get(strings.size() - 1));
            } else {
                column.setHasDict(false);
            }
            column.setIsArray(StrUtil.contains(columnRemark, MyConstant.DICT_ARRAY));
        }
        generatorHelper.generateEntityFile(columns, generatorConfig);
        generatorHelper.generateAoFile(columns, generatorConfig);
        generatorHelper.generateVoFile(columns, generatorConfig);
        generatorHelper.generateMapperFile(columns, generatorConfig);
        generatorHelper.generateMapperXmlFile(columns, generatorConfig);
        generatorHelper.generateServiceFile(columns, generatorConfig);
        generatorHelper.generateServiceImplFile(columns, generatorConfig);
        generatorHelper.generateControllerFile(columns, generatorConfig);
        // 打包
        String zipFile = System.currentTimeMillis() + SUFFIX;
        BaseFileUtil.compress(GeneratorConstant.TEMP_PATH + "src", zipFile);
        // 下载
        BaseFileUtil.download(zipFile, name + SUFFIX, true, response);
        // 删除临时目录
        FileSystemUtils.deleteRecursively(new File(GeneratorConstant.TEMP_PATH));
    }
}
