package com.zclcs.common.core.constant;

/**
 * 代码生成常量
 *
 * @author zclcs
 */
public interface GeneratorConstant {

    /**
     * 数据库类型
     */
    String DATABASE_TYPE = "mysql";

    /**
     * 生成代码的临时目录
     */
    String TEMP_PATH = "my_gen_temp/";

    /**
     * java类型文件后缀
     */
    String JAVA_FILE_SUFFIX = ".java";
    /**
     * java类型文件后缀
     */
    String AO_FILE_SUFFIX = "Ao.java";
    /**
     * java类型文件后缀
     */
    String VO_FILE_SUFFIX = "Vo.java";
    /**
     * mapper文件类型后缀
     */
    String MAPPER_FILE_SUFFIX = "Mapper.java";
    /**
     * service文件类型后缀
     */
    String SERVICE_FILE_SUFFIX = "Service.java";
    /**
     * service impl文件类型后缀
     */
    String SERVICE_IMPL_FILE_SUFFIX = "ServiceImpl.java";
    /**
     * controller文件类型后缀
     */
    String CONTROLLER_FILE_SUFFIX = "Controller.java";
    /**
     * mapper xml文件类型后缀
     */
    String MAPPER_XML_FILE_SUFFIX = "Mapper.xml";
    /**
     * entity模板
     */
    String ENTITY_TEMPLATE = "entity.ftl";
    /**
     * 入参
     */
    String AO_TEMPLATE = "ao.ftl";
    /**
     * 出参
     */
    String VO_TEMPLATE = "vo.ftl";
    /**
     * mapper模板
     */
    String MAPPER_TEMPLATE = "mapper.ftl";
    /**
     * service接口模板
     */
    String SERVICE_TEMPLATE = "service.ftl";
    /**
     * service impl接口模板
     */
    String SERVICE_IMPL_TEMPLATE = "serviceImpl.ftl";
    /**
     * controller接口模板
     */
    String CONTROLLER_TEMPLATE = "controller.ftl";
    /**
     * mapper xml接口模板
     */
    String MAPPER_XML_TEMPLATE = "mapperXml.ftl";
}
