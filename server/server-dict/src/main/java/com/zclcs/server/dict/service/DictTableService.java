package com.zclcs.server.dict.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.entity.dict.DictTable;
import com.zclcs.common.core.entity.dict.ao.DictTableAo;
import com.zclcs.common.core.entity.dict.vo.DictTableVo;

import java.util.List;

/**
 * 字典 Service接口
 *
 * @author zclcs
 * @date 2021-11-02 15:26:13.215
 */
public interface DictTableService extends IService<DictTable> {

    /**
     * 查询（分页）
     *
     * @param basePageAo  basePageAo
     * @param dictTableVo dictTableVo
     * @return BasePage<DictTableVo>
     */
    BasePage<DictTableVo> findDictTablePage(BasePageAo basePageAo, DictTableVo dictTableVo);

    /**
     * 查询（所有）
     *
     * @param dictTableVo dictTableVo
     * @return List<DictTableVo>
     */
    List<DictTableVo> findDictTableList(DictTableVo dictTableVo);

    /**
     * 查询（单个）
     *
     * @param dictTableVo dictTableVo
     * @return DictTableVo
     */
    DictTableVo findDictTable(DictTableVo dictTableVo);

    /**
     * 新增
     *
     * @param dictTableAo dictTableAo
     */
    void createDictTable(DictTableAo dictTableAo);

    /**
     * 修改
     *
     * @param dictTableAo dictTableAo
     */
    void updateDictTable(DictTableAo dictTableAo);

    /**
     * 删除
     *
     * @param ids ids
     */
    void deleteDictTable(List<Long> ids);

    /**
     * 删除
     *
     * @param dictNames dictNames 字典 表名
     */
    void deleteDictTableName(List<String> dictNames);

    /**
     * 更新字典名
     *
     * @param oldDictName oldDictName 老字典名
     * @param newDictName newDictName 新字典名
     */
    void updateDictTableName(String oldDictName, String newDictName);

}
