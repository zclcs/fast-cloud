package com.zclcs.server.generator.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.entity.generator.GeneratorConfig;
import com.zclcs.common.core.entity.generator.vo.GeneratorConfigVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zclcs
 */
public interface GeneratorConfigMapper extends BaseMapper<GeneratorConfig> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<GeneratorConfigVo> findPageVo(BasePage<GeneratorConfigVo> basePage, @Param(Constants.WRAPPER) Wrapper<GeneratorConfigVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    List<GeneratorConfigVo> findListVo(@Param(Constants.WRAPPER) Wrapper<GeneratorConfigVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    GeneratorConfigVo findOneVo(@Param(Constants.WRAPPER) Wrapper<GeneratorConfigVo> ew);

}
