package com.zclcs.common.core.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author zhouchenglong
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CanalBinLogInfo {

    /**
     * sql 类型 INSERT UPDATE DELETE
     */
    private String type;

    /**
     * 表名
     */
    private String table;

    /**
     * 数据
     */
    private List<Object> data;
}
