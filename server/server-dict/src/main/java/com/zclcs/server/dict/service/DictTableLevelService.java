package com.zclcs.server.dict.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.entity.Tree;
import com.zclcs.common.core.entity.dict.DictTableLevel;
import com.zclcs.common.core.entity.dict.ao.DictTableLevelAo;
import com.zclcs.common.core.entity.dict.vo.DictTableLevelTreeVo;
import com.zclcs.common.core.entity.dict.vo.DictTableLevelVo;

import java.util.List;

/**
 * 层级字典 Service接口
 *
 * @author zclcs
 * @date 2021-11-02 15:26:28.342
 */
public interface DictTableLevelService extends IService<DictTableLevel> {

    /**
     * 查询（分页）
     *
     * @param dictTableLevelVo dictTableLevelVo
     * @return BasePage<DictTableLevelTreeVo>
     */
    List<DictTableLevelTreeVo> findDictTableLevelTreeVo(DictTableLevelVo dictTableLevelVo);

    /**
     * 查询（所有）
     *
     * @param dictTableLevelVo dictTableLevelVo
     * @return List<DictTableLevelVo>
     */
    List<DictTableLevelVo> findDictTableLevelList(DictTableLevelVo dictTableLevelVo);

    /**
     * 查询（所有）
     *
     * @param dictTableLevelVo dictTableLevelVo
     * @return List<DictTableLevelVo>
     */
    List<DictTableLevelVo> findDictTableLevelOptionLazy(DictTableLevelVo dictTableLevelVo);

    /**
     * 查询（单个）
     *
     * @param dictTableLevelVo dictTableLevelVo
     * @return DictTableLevelVo
     */
    DictTableLevelVo findDictTableLevel(DictTableLevelVo dictTableLevelVo);

    /**
     * 获取层级字典
     *
     * @param tableLevelVo tableLevelVo
     * @return 层级字典
     */
    List<? extends Tree<?>> findDictTableLevelTree(DictTableLevelVo tableLevelVo);

    /**
     * 返回本级以及下级层级字典编号
     *
     * @param id 字典编号
     * @return 本级以及下级字典编号
     */
    List<Long> getChildDictTableLevelId(Long id);

    /**
     * 新增
     *
     * @param dictTableLevelAo dictTableLevelAo
     */
    void createDictTableLevel(DictTableLevelAo dictTableLevelAo);

    /**
     * 修改
     *
     * @param dictTableLevelAo dictTableLevelAo
     */
    void updateDictTableLevel(DictTableLevelAo dictTableLevelAo);

    /**
     * 删除
     *
     * @param ids ids
     */
    void deleteDictTableLevel(List<Long> ids);

    /**
     * 删除
     *
     * @param dictNames dictNames 字典 表名
     */
    void deleteDictTableNameLevel(List<String> dictNames);

    /**
     * 更新字典名
     *
     * @param oldDictName oldDictName 老字典名
     * @param newDictName newDictName 新字典名
     */
    void updateDictTableName(String oldDictName, String newDictName);

}
