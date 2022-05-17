package com.zclcs.common.core.utils;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DatePattern;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zclcs.common.core.constant.ParamsConstant;
import com.zclcs.common.core.constant.ValidConstant;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Collection;
import java.util.Optional;

/**
 * @author zclcs
 */
public abstract class BaseQueryWrapperUtil {

    public static <T> QueryWrapper<T> likeAreaCodeNotBlank(QueryWrapper<T> queryWrapper, String column, String param) {
        Optional.ofNullable(param).filter(StrUtil::isNotBlank).ifPresent(s -> {
            switch (BaseUtil.getNameByAreaCode(s)) {
                case ValidConstant.PROVINCE:
                    queryWrapper.likeRight(column, s);
                    break;
                case ValidConstant.CITY:
                    queryWrapper.like(column, s);
                    break;
                case ValidConstant.COUNTY:
                    queryWrapper.likeLeft(column, s);
                    break;
                default:
                    break;
            }
        });
        return queryWrapper;
    }

    public static <T> QueryWrapper<T> likeNotBlank(QueryWrapper<T> queryWrapper, String column, String param) {
        queryWrapper.like(StrUtil.isNotBlank(param), column, param);
        return queryWrapper;
    }

    /**
     * 介于查询 两个参数都不能为空或空字符串
     *
     * @param queryWrapper 条件构造器
     * @param column       表字段
     * @param paramFrom    开始
     * @param paramTo      结束
     * @param <T>          泛型
     * @return 条件构造器
     */
    public static <T> QueryWrapper<T> betweenNotBlank(QueryWrapper<T> queryWrapper, String column, String paramFrom, String paramTo) {
        queryWrapper.between(StrUtil.isNotBlank(paramFrom) && StrUtil.isNotBlank(paramTo), column, paramFrom, paramTo);
        return queryWrapper;
    }

    /**
     * 介于时间段查询 两个参数都不能为空或空字符串 默认开始日期加上 00:00:00 结束日期加上 23:59:59
     *
     * @param queryWrapper 条件构造器
     * @param column       表字段
     * @param paramFrom    开始
     * @param paramTo      结束
     * @param <T>          泛型
     * @return 条件构造器
     */
    public static <T> QueryWrapper<T> betweenDateAddTimeNotBlank(QueryWrapper<T> queryWrapper, String column, String paramFrom, String paramTo) {
        queryWrapper.between(StrUtil.isNotBlank(paramFrom) && StrUtil.isNotBlank(paramTo), column, paramFrom + StrUtil.SPACE + ParamsConstant.BEGIN_OF_DAY, paramTo + StrUtil.SPACE + ParamsConstant.END_OF_DAY);
        return queryWrapper;
    }

    /**
     * 介于时间段查询 两个参数都不能为空或空字符串 默认开始日期加上 00:00:00 结束日期加上 23:59:59
     *
     * @param queryWrapper 条件构造器
     * @param column       表字段
     * @param paramFrom    开始
     * @param paramTo      结束
     * @param <T>          泛型
     * @return 条件构造器
     */
    public static <T> QueryWrapper<T> betweenDateAddTimeNotBlank(QueryWrapper<T> queryWrapper, String column, LocalDate paramFrom, LocalDate paramTo) {
        if (paramFrom != null && paramTo != null) {
            queryWrapper.between(column, paramFrom.format(DateTimeFormatter.ofPattern(DatePattern.NORM_DATE_PATTERN)) + StrUtil.SPACE + ParamsConstant.BEGIN_OF_DAY,
                    paramTo.format(DateTimeFormatter.ofPattern(DatePattern.NORM_DATE_PATTERN)) + StrUtil.SPACE + ParamsConstant.END_OF_DAY);
        }
        return queryWrapper;
    }

    public static <T> QueryWrapper<T> likeNotNull(QueryWrapper<T> queryWrapper, String column, Object param) {
        queryWrapper.like(param != null, column, param);
        return queryWrapper;
    }

    public static <T> QueryWrapper<T> likeRightNotBlank(QueryWrapper<T> queryWrapper, String column, String param) {
        queryWrapper.likeRight(StrUtil.isNotBlank(param), column, param);
        return queryWrapper;
    }

    public static <T> QueryWrapper<T> likeRightNotNull(QueryWrapper<T> queryWrapper, String column, Object param) {
        queryWrapper.likeRight(param != null, column, param);
        return queryWrapper;
    }

    public static <T> QueryWrapper<T> likeLeftNotBlank(QueryWrapper<T> queryWrapper, String column, String param) {
        queryWrapper.likeLeft(StrUtil.isNotBlank(param), column, param);
        return queryWrapper;
    }

    public static <T> QueryWrapper<T> likeLeftNotNull(QueryWrapper<T> queryWrapper, String column, Object param) {
        queryWrapper.likeLeft(param != null, column, param);
        return queryWrapper;
    }

    public static <T> QueryWrapper<T> eqNotBlank(QueryWrapper<T> queryWrapper, String column, String param) {
        queryWrapper.eq(StrUtil.isNotBlank(param), column, param);
        return queryWrapper;
    }

    public static <T> QueryWrapper<T> eqNotNull(QueryWrapper<T> queryWrapper, String column, Object param) {
        queryWrapper.eq(param != null, column, param);
        return queryWrapper;
    }

    public static <T> QueryWrapper<T> inNotEmpty(QueryWrapper<T> queryWrapper, String column, Collection<?> param) {
        queryWrapper.in(CollectionUtil.isNotEmpty(param), column, param);
        return queryWrapper;
    }


}
