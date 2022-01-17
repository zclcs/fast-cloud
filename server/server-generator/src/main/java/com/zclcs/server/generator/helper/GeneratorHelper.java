package com.zclcs.server.generator.helper;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.google.common.io.Files;
import com.zclcs.common.core.annotation.Helper;
import com.zclcs.common.core.constant.GeneratorConstant;
import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.common.core.entity.generator.Column;
import com.zclcs.common.core.entity.generator.FieldType;
import com.zclcs.common.core.entity.generator.vo.GeneratorConfigVo;
import com.zclcs.common.core.utils.BaseUtil;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * 代码生成器工具类
 *
 * @author zclcs
 */
@Slf4j
@Helper
public class GeneratorHelper {

    private static String getFilePath(GeneratorConfigVo configure, String packagePath, String suffix, boolean serviceInterface) {
        String filePath = GeneratorConstant.TEMP_PATH + configure.getJavaPath() +
                packageConvertPath(configure.getBasePackage() + "." + packagePath);
        filePath += configure.getClassName() + suffix;
        return filePath;
    }

    private static String packageConvertPath(String packageName) {
        return String.format("/%s/", packageName.contains(".") ? packageName.replaceAll("\\.", "/") : packageName);
    }

    public void generateEntityFile(List<Column> columns, GeneratorConfigVo configure) throws Exception {
        String suffix = GeneratorConstant.JAVA_FILE_SUFFIX;
        String path = getFilePath(configure, configure.getEntityPackage(), suffix, false);
        String templateName = GeneratorConstant.ENTITY_TEMPLATE;
        getDao(columns, configure, path, templateName);
    }

    public void generateAoFile(List<Column> columns, GeneratorConfigVo configure) throws Exception {
        String suffix = GeneratorConstant.AO_FILE_SUFFIX;
        String path = getFilePath(configure, configure.getAoPackage(), suffix, false);
        String templateName = GeneratorConstant.AO_TEMPLATE;
        getDao(columns, configure, path, templateName);
    }

    public void generateVoFile(List<Column> columns, GeneratorConfigVo configure) throws Exception {
        String suffix = GeneratorConstant.VO_FILE_SUFFIX;
        String path = getFilePath(configure, configure.getVoPackage(), suffix, false);
        String templateName = GeneratorConstant.VO_TEMPLATE;
        getDao(columns, configure, path, templateName);
    }

    private void getDao(List<Column> columns, GeneratorConfigVo configure, String path, String templateName) throws Exception {
        File entityFile = new File(path);
        Map<String, Object> map = BeanUtil.beanToMap(configure);
        map.put("hasDate", false);
        map.put("hasBigDecimal", false);
        columns.forEach(c -> {
            c.setField(BaseUtil.underscoreToCamel(StringUtils.lowerCase(c.getName())));
            if (StrUtil.containsAny(c.getType(), FieldType.DATE, FieldType.DATETIME, FieldType.TIMESTAMP)) {
                map.put("hasDate", true);
            }
            if (StrUtil.containsAny(c.getType(), FieldType.DECIMAL, FieldType.NUMERIC)) {
                map.put("hasBigDecimal", true);
            }
        });
        map.put("columns", columns);
        this.generateFileByTemplate(templateName, entityFile, map);
    }

    public void generateMapperFile(List<Column> columns, GeneratorConfigVo configure) throws Exception {
        String suffix = GeneratorConstant.MAPPER_FILE_SUFFIX;
        String path = getFilePath(configure, configure.getMapperPackage(), suffix, false);
        String templateName = GeneratorConstant.MAPPER_TEMPLATE;
        File mapperFile = new File(path);
        generateFileByTemplate(templateName, mapperFile, BeanUtil.beanToMap(configure));
    }

    public void generateServiceFile(List<Column> columns, GeneratorConfigVo configure) throws Exception {
        String suffix = GeneratorConstant.SERVICE_FILE_SUFFIX;
        String path = getFilePath(configure, configure.getServicePackage(), suffix, true);
        String templateName = GeneratorConstant.SERVICE_TEMPLATE;
        File serviceFile = new File(path);
        generateFileByTemplate(templateName, serviceFile, BeanUtil.beanToMap(configure));
    }

    public void generateServiceImplFile(List<Column> columns, GeneratorConfigVo configure) throws Exception {
        String suffix = GeneratorConstant.SERVICE_IMPL_FILE_SUFFIX;
        String path = getFilePath(configure, configure.getServiceImplPackage(), suffix, false);
        String templateName = GeneratorConstant.SERVICE_IMPL_TEMPLATE;
        File serviceImplFile = new File(path);
        generateFileByTemplate(templateName, serviceImplFile, BeanUtil.beanToMap(configure));
    }

    public void generateControllerFile(List<Column> columns, GeneratorConfigVo configure) throws Exception {
        String suffix = GeneratorConstant.CONTROLLER_FILE_SUFFIX;
        String path = getFilePath(configure, configure.getControllerPackage(), suffix, false);
        String templateName = GeneratorConstant.CONTROLLER_TEMPLATE;
        File controllerFile = new File(path);
        generateFileByTemplate(templateName, controllerFile, BeanUtil.beanToMap(configure));
    }

    public void generateMapperXmlFile(List<Column> columns, GeneratorConfigVo configure) throws Exception {
        String suffix = GeneratorConstant.MAPPER_XML_FILE_SUFFIX;
        String path = getFilePath(configure, configure.getMapperXmlPackage(), suffix, false);
        String templateName = GeneratorConstant.MAPPER_XML_TEMPLATE;
        File mapperXmlFile = new File(path);
        Map<String, Object> map = BeanUtil.beanToMap(configure);
        columns.forEach(c -> c.setField(BaseUtil.underscoreToCamel(StringUtils.lowerCase(c.getName()))));
        map.put("columns", columns);
        generateFileByTemplate(templateName, mapperXmlFile, map);
    }

    @SuppressWarnings("all")
    private void generateFileByTemplate(String templateName, File file, Object data) throws Exception {
        Template template = getTemplate(templateName);
        Files.createParentDirs(file);
        FileOutputStream fileOutputStream = new FileOutputStream(file);
        try (Writer out = new BufferedWriter(new OutputStreamWriter(fileOutputStream, StandardCharsets.UTF_8), 10240)) {
            template.process(data, out);
        } catch (Exception e) {
            String message = "代码生成异常";
            log.error(message, e);
            throw new Exception(message);
        }
    }

    private Template getTemplate(String templateName) throws Exception {
        Configuration configuration = new Configuration(Configuration.VERSION_2_3_23);
        String templatePath = Objects.requireNonNull(GeneratorHelper.class.getResource("/generator/templates/")).getPath();
        File file = new File(templatePath);
        if (!file.exists()) {
            templatePath = System.getProperties().getProperty(MyConstant.JAVA_TEMP_DIR);
            file = new File(templatePath + File.separator + templateName);
            FileUtils.copyInputStreamToFile(Objects.requireNonNull(GeneratorHelper.class.getClassLoader().getResourceAsStream("classpath:generator/templates/" + templateName)), file);
        }
        configuration.setDirectoryForTemplateLoading(new File(templatePath));
        configuration.setDefaultEncoding(MyConstant.UTF8);
        configuration.setTemplateExceptionHandler(TemplateExceptionHandler.IGNORE_HANDLER);
        return configuration.getTemplate(templateName);

    }
}
