package com.zclcs.server.system.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.entity.system.SystemLog;
import com.zclcs.common.core.entity.system.vo.SystemLogVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 用户操作日志表 Mapper 接口
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
public interface SystemLogMapper extends BaseMapper<SystemLog> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<SystemLogVo> findPageVo(BasePage<SystemLogVo> basePage, @Param(Constants.WRAPPER) Wrapper<SystemLogVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    List<SystemLogVo> findListVo(@Param(Constants.WRAPPER) Wrapper<SystemLogVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    SystemLogVo findOneVo(@Param(Constants.WRAPPER) Wrapper<SystemLogVo> ew);

}
