package com.zclcs.common.core.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author zhouchenglong
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CanalBinLogInfo {

    /**
     * 数据
     */
    private String data;

    /**
     * sql 类型 INSERT UPDATE DELETE
     */
    private String database;

    /**
     * 是否ddl语句
     */
    private Boolean isDdl;

    /**
     * 表名
     */
    private String table;

    /**
     * sql 类型 INSERT UPDATE DELETE
     */
    private String type;
}
