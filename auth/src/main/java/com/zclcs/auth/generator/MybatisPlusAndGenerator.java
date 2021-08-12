package com.zclcs.auth.generator;

import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

/**
 * @author zclcs
 */
public class MybatisPlusAndGenerator {
    public static void main(String[] args) {
        // 代码生成器
        AutoGenerator mpg = new AutoGenerator();
        mpg.setTemplateEngine(new FreemarkerTemplateEngine());
        // 全局配置
        GlobalConfig gc = new GlobalConfig();
        String projectPath = System.getProperty("user.dir");
        gc.setOutputDir(projectPath + "\\auth\\src\\main\\java");
        gc.setAuthor("zclcs");
        gc.setOpen(false);
        //每次运行进行覆盖操作
        gc.setFileOverride(true);
        //java mapper类命名后缀
        gc.setServiceName("%sService");
        //mysql timestamp由java.util.Date类型映射
        gc.setDateType(DateType.ONLY_DATE);
        //生成列
        gc.setBaseColumnList(true);
        //生成result map集合
        gc.setBaseResultMap(true);
        //生成result map集合
        gc.setActiveRecord(true);
        //实体属性 Swagger2 注解
        gc.setSwagger2(true);
        mpg.setGlobalConfig(gc);

        // 数据源配置
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setUrl("jdbc:mysql://localhost:3306/cloud_system?useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai");
        // dsc.setSchemaName("public");
        dsc.setDriverName("com.mysql.cj.jdbc.Driver");
        dsc.setUsername("root");
        dsc.setPassword("root");
        //dsc.setSchemaName("test_dc");
        //dsc.setDbType(DbType.MYSQL);
        mpg.setDataSource(dsc);

        // 包配置
        PackageConfig pc = new PackageConfig();
        //设置文件的包名
        //pc.setModuleName("base");
        pc.setParent("com.zclcs.auth");
        pc.setEntity("entity");
        pc.setMapper("mapper");
        pc.setXml("mapper");
        pc.setService("service");
        pc.setServiceImpl("service.impl");
        pc.setController("controller");
        mpg.setPackageInfo(pc);

        TemplateConfig tc = new TemplateConfig();
        mpg.setTemplate(tc);

        //生成策略的配置
        StrategyConfig strategyConfig = new StrategyConfig();
        //生成指定表
        strategyConfig.setInclude("system_user_connection");
        // 模糊查询表
        //strategyConfig.setLikeTable(new LikeTable("auth"));
        //驼峰命名
        strategyConfig.setNaming(NamingStrategy.underline_to_camel);
        //字段驼峰命名
        strategyConfig.setColumnNaming(NamingStrategy.underline_to_camel);
        //设置实体Bean的lombok
        strategyConfig.setEntityLombokModel(true);
        //strategyConfig.setTablePrefix("base");
        strategyConfig.setRestControllerStyle(true);
        //设置生成策略
        mpg.setStrategy(strategyConfig);
        //执行自动生成器
        mpg.execute();
    }
}
