package com.zclcs.server.dict.mapper;

import com.zclcs.common.core.entity.dict.DictTable;
import com.zclcs.common.core.entity.dict.vo.DictTableVo;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 字典 Mapper
 *
 * @author zclcs
 * @date 2021-11-02 15:26:13.215
 */
public interface DictTableMapper extends BaseMapper<DictTable> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<DictTableVo> findPageVo(BasePage<DictTableVo> basePage, @Param(Constants.WRAPPER) Wrapper<DictTableVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 集合对象
     */
    List<DictTableVo> findListVo(@Param(Constants.WRAPPER) Wrapper<DictTableVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 对象
     */
    DictTableVo findOneVo(@Param(Constants.WRAPPER) Wrapper<DictTableVo> ew);

}