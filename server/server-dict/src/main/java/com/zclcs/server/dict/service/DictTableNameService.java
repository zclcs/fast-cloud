package com.zclcs.server.dict.service;

import com.zclcs.common.core.entity.dict.DictTableName;
import com.zclcs.common.core.entity.dict.ao.DictTableNameAo;
import com.zclcs.common.core.entity.dict.vo.DictTableNameVo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;

import java.util.List;

/**
 * 字典名表 Service接口
 *
 * @author zclcs
 * @date 2021-11-02 15:26:20.789
 */
public interface DictTableNameService extends IService<DictTableName> {

    /**
     * 查询（分页）
     *
     * @param basePageAo basePageAo
     * @param dictTableNameVo dictTableNameVo
     * @return BasePage<DictTableNameVo>
     */
    BasePage<DictTableNameVo> findDictTableNamePage(BasePageAo basePageAo, DictTableNameVo dictTableNameVo);

    /**
     * 查询（所有）
     *
     * @param dictTableNameVo dictTableNameVo
     * @return List<DictTableNameVo>
     */
    List<DictTableNameVo> findDictTableNameList(DictTableNameVo dictTableNameVo);

    /**
     * 查询（单个）
     *
     * @param dictTableNameVo dictTableNameVo
     * @return DictTableNameVo
     */
    DictTableNameVo findDictTableName(DictTableNameVo dictTableNameVo);

    /**
     * 新增
     *
     * @param dictTableNameAo dictTableNameAo
     */
    void createDictTableName(DictTableNameAo dictTableNameAo);

    /**
     * 修改
     *
     * @param dictTableNameAo dictTableNameAo
     */
    void updateDictTableName(DictTableNameAo dictTableNameAo);

    /**
     * 删除
     *
     * @param ids ids
     */
    void deleteDictTableName(List<Long> ids);

}
