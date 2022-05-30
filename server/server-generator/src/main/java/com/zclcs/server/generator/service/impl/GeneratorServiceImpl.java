package com.zclcs.server.generator.service.impl;

import cn.hutool.core.util.StrUtil;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.client.SystemClient;
import com.zclcs.common.core.constant.DictConstant;
import com.zclcs.common.core.constant.GeneratorConstant;
import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.common.core.constant.ParamsConstant;
import com.zclcs.common.core.entity.generator.Column;
import com.zclcs.common.core.entity.generator.Table;
import com.zclcs.common.core.entity.generator.ao.GenerateAo;
import com.zclcs.common.core.entity.generator.vo.GeneratorConfigVo;
import com.zclcs.common.core.entity.system.ao.SystemMenuAo;
import com.zclcs.common.core.exception.MyException;
import com.zclcs.common.core.utils.BaseFileUtil;
import com.zclcs.common.core.utils.BaseSortUtil;
import com.zclcs.common.core.utils.BaseUtil;
import com.zclcs.server.generator.helper.GeneratorHelper;
import com.zclcs.server.generator.mapper.GeneratorMapper;
import com.zclcs.server.generator.service.GeneratorConfigService;
import com.zclcs.server.generator.service.GeneratorService;
import io.seata.spring.annotation.GlobalTransactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.FileSystemUtils;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.List;
import java.util.Optional;

/**
 * @author zclcs
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class GeneratorServiceImpl implements GeneratorService {

    private final GeneratorMapper generatorMapper;
    private final GeneratorConfigService generatorConfigService;
    private final SystemClient systemClient;
    private final GeneratorHelper generatorHelper;

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
    public List<Column> getColumns(String databaseType, String schemaName, String tableName, List<String> excludeColumns) {
        return generatorMapper.getColumns(databaseType, schemaName, tableName, excludeColumns);
    }

    @Override
    @GlobalTransactional
    public void generate(GenerateAo generateAo, HttpServletResponse response) {
        String name = generateAo.getName();
        String remark = generateAo.getRemark();
        GeneratorConfigVo generatorConfigVo = generatorConfigService.findGeneratorConfig();
        if (generatorConfigVo == null) {
            throw new MyException("代码生成配置为空");
        }
        String className = name;
        if (GeneratorConfigVo.TRIM_YES.equals(generatorConfigVo.getIsTrim())) {
            className = StrUtil.removePrefix(name, generatorConfigVo.getTrimValue());
        }
        String underscoreToCamel = BaseUtil.underscoreToCamel(className);
        createMenu(generateAo, underscoreToCamel);
        generatorConfigVo.setTableName(name);
        generatorConfigVo.setClassName(underscoreToCamel);
        generatorConfigVo.setTableComment(remark);
        // 生成代码到临时目录
        List<Column> columns = this.getColumns(GeneratorConstant.DATABASE_TYPE, generateAo.getDatasource(), name, StrUtil.split(generatorConfigVo.getExcludeColumns(), StrUtil.COMMA));
        for (Column column : columns) {
            if (column.getIsKey()) {
                generatorConfigVo.setKeyName(column.getName());
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
        try {
            generatorHelper.generateEntityFile(columns, generatorConfigVo);
            generatorHelper.generateAoFile(columns, generatorConfigVo);
            generatorHelper.generateVoFile(columns, generatorConfigVo);
            generatorHelper.generateMapperFile(columns, generatorConfigVo);
            generatorHelper.generateMapperXmlFile(columns, generatorConfigVo);
            generatorHelper.generateServiceFile(columns, generatorConfigVo);
            generatorHelper.generateServiceImplFile(columns, generatorConfigVo);
            generatorHelper.generateControllerFile(columns, generatorConfigVo);
            // 打包
            String zipFile = System.currentTimeMillis() + ParamsConstant.SUFFIX;
            BaseFileUtil.compress(GeneratorConstant.TEMP_PATH + "src", zipFile);
            // 下载
            BaseFileUtil.download(zipFile, name + ParamsConstant.SUFFIX, true, response);
            // 删除临时目录
            FileSystemUtils.deleteRecursively(new File(GeneratorConstant.TEMP_PATH));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void createMenu(GenerateAo generateAo, String className) {
        className = StrUtil.lowerFirst(className);
        String isCreateMenuNew = Optional.ofNullable(generateAo.getIsCreateMenu()).filter(StrUtil::isNotBlank).orElse(DictConstant.YES_NO_0);
        String isCreateDirNew = Optional.ofNullable(generateAo.getIsCreateDir()).filter(StrUtil::isNotBlank).orElse(DictConstant.YES_NO_0);
        if (DictConstant.YES_NO_1.equals(isCreateDirNew)) {
            SystemMenuAo dir = new SystemMenuAo();
            setDir(dir, generateAo);
            BaseRsp<Long> dirRsp = systemClient.addMenu(dir);
            SystemMenuAo menu = new SystemMenuAo();
            setMenu(menu, generateAo, className, dirRsp.getData());
            addMenuAndButton(menu, className);
        } else if (DictConstant.YES_NO_1.equals(isCreateMenuNew)) {
            SystemMenuAo menu = new SystemMenuAo();
            setMenu(menu, generateAo, className, generateAo.getMenuId());
            addMenuAndButton(menu, className);
        }
    }

    private void addMenuAndButton(SystemMenuAo menu, String className) {
        BaseRsp<Long> menuRsp = systemClient.addMenu(menu);
        for (int i = 0; i < ParamsConstant.AUTHS.length; i++) {
            String auth = ParamsConstant.AUTHS[i];
            SystemMenuAo button = new SystemMenuAo();
            button.setMenuName(ParamsConstant.BUTTON_TEXT[i]);
            button.setParentId(menuRsp.getData());
            button.setType(DictConstant.MENU_TYPE_1);
            button.setPerms(className + StrUtil.COLON + auth);
            systemClient.addMenu(button);
        }
    }

    private void setDir(SystemMenuAo dir, GenerateAo generateAo) {
        dir.setMenuName(generateAo.getDirName());
        dir.setType(DictConstant.MENU_TYPE_2);
        dir.setIcon(ParamsConstant.DEFAULT_MENU_ICON);
        dir.setPath(generateAo.getDirPath());
        dir.setHideMenu(DictConstant.YES_NO_0);
        dir.setHideBreadcrumb(DictConstant.YES_NO_0);
        dir.setHideChildrenInMenu(DictConstant.YES_NO_0);
    }

    private void setMenu(SystemMenuAo menu, GenerateAo generateAo, String className, Long parentId) {
        menu.setMenuName(Optional.ofNullable(generateAo.getMenuName()).filter(StrUtil::isNotBlank).orElse(generateAo.getRemark()));
        menu.setKeepAliveName(StrUtil.upperFirst(className));
        menu.setParentId(parentId);
        //menu.setPerms(className + StrUtil.COLON + ParamsConstant.AUTH_VIEW);
        menu.setType(DictConstant.MENU_TYPE_0);
        menu.setIcon(ParamsConstant.DEFAULT_MENU_ICON);
        menu.setPath(Optional.ofNullable(generateAo.getMenuPath()).filter(StrUtil::isNotBlank).orElse(className));
        menu.setComponent(generateAo.getMenuComponent());
        menu.setIgnoreKeepAlive(DictConstant.YES_NO_0);
        menu.setHideMenu(DictConstant.YES_NO_0);
        menu.setHideBreadcrumb(DictConstant.YES_NO_0);
        menu.setHideChildrenInMenu(DictConstant.YES_NO_0);
    }
}
