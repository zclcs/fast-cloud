package com.zclcs.server.dict.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.entity.dict.DictTableLevel;
import com.zclcs.common.core.entity.dict.vo.DictTableLevelVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 层级字典 Mapper
 *
 * @author zclcs
 * @date 2021-11-02 15:26:28.342
 */
public interface DictTableLevelMapper extends BaseMapper<DictTableLevel> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<DictTableLevelVo> findPageVo(BasePage<DictTableLevelVo> basePage, @Param(Constants.WRAPPER) Wrapper<DictTableLevelVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 集合对象
     */
    List<DictTableLevelVo> findListVo(@Param(Constants.WRAPPER) Wrapper<DictTableLevelVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 集合对象
     */
    List<DictTableLevelVo> findLevelListVo(@Param(Constants.WRAPPER) Wrapper<DictTableLevelVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 对象
     */
    DictTableLevelVo findOneVo(@Param(Constants.WRAPPER) Wrapper<DictTableLevelVo> ew);

}