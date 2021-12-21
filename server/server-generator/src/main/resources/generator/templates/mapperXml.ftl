<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${basePackage}.${mapperPackage}.${className}Mapper">

    <sql id="baseSql">
        // TODO 设置分页、集合、单个查询sql
    </sql>
    <sql id="baseCountSql">
        // TODO 设置统计查询sql
    </sql>
    <select id="findPageVo" resultType="${basePackage}.${voPackage}.${className}Vo">
        <include refid="baseSql"/>
    </select>
    <select id="findListVo" resultType="${basePackage}.${voPackage}.${className}Vo">
        <include refid="baseSql"/>
    </select>
    <select id="findOneVo" resultType="${basePackage}.${voPackage}.${className}Vo">
        <include refid="baseSql"/>
    </select>
    <select id="countVo" resultType="java.lang.Integer">
        <include refid="baseCountSql"/>
    </select>
</mapper>
