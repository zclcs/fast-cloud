package com.zclcs.server.dict.mapper;

import com.zclcs.common.core.entity.dict.DictTableName;
import com.zclcs.common.core.entity.dict.vo.DictTableNameVo;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 字典名表 Mapper
 *
 * @author zclcs
 * @date 2021-11-02 15:26:20.789
 */
public interface DictTableNameMapper extends BaseMapper<DictTableName> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<DictTableNameVo> findPageVo(BasePage<DictTableNameVo> basePage, @Param(Constants.WRAPPER) Wrapper<DictTableNameVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 集合对象
     */
    List<DictTableNameVo> findListVo(@Param(Constants.WRAPPER) Wrapper<DictTableNameVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 对象
     */
    DictTableNameVo findOneVo(@Param(Constants.WRAPPER) Wrapper<DictTableNameVo> ew);

}