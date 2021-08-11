package com.zclcs.common.core.utils;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.constant.MyConstant;
import org.apache.commons.lang3.StringUtils;

/**
 * 处理排序工具类
 *
 * @author MrBird
 */
public abstract class BaseSortUtil {
    /**
     * 处理排序（分页情况下） for mybatis-plus
     *
     * @param basePageAo        BasePageAo
     * @param page              Page
     * @param defaultSort       默认排序的字段
     * @param defaultOrder      默认排序规则
     * @param camelToUnderscore 是否开启驼峰转下划线
     */
    public static void handlePageSort(BasePageAo basePageAo, Page<?> page, String defaultSort, String defaultOrder, boolean camelToUnderscore) {
        page.setCurrent(basePageAo.getPageNum());
        page.setSize(basePageAo.getPageSize());
        String sortField = basePageAo.getField();
        if (camelToUnderscore) {
            sortField = BaseUtil.camelToUnderscore(sortField);
            defaultSort = BaseUtil.camelToUnderscore(defaultSort);
        }
        if (StringUtils.isNotBlank(basePageAo.getField())
                && StringUtils.isNotBlank(basePageAo.getOrder())
                && !StringUtils.equalsIgnoreCase(basePageAo.getField(), "null")
                && !StringUtils.equalsIgnoreCase(basePageAo.getOrder(), "null")) {
            if (StringUtils.equals(basePageAo.getOrder(), MyConstant.ORDER_DESC)) {
                page.addOrder(OrderItem.desc(sortField));
            } else {
                page.addOrder(OrderItem.asc(sortField));
            }
        } else {
            if (StringUtils.isNotBlank(defaultSort)) {
                if (StringUtils.equals(defaultOrder, MyConstant.ORDER_DESC)) {
                    page.addOrder(OrderItem.desc(defaultSort));
                } else {
                    page.addOrder(OrderItem.asc(defaultSort));
                }
            }
        }
    }

    /**
     * 处理排序 for mybatis-plus
     *
     * @param basePageAo BasePageAo
     * @param page       Page
     */
    public static void handlePageSort(BasePageAo basePageAo, Page<?> page) {
        handlePageSort(basePageAo, page, null, null, false);
    }

    /**
     * 处理排序 for mybatis-plus
     *
     * @param basePageAo        basePageAo
     * @param page              Page
     * @param camelToUnderscore 是否开启驼峰转下划线
     */
    public static void handlePageSort(BasePageAo basePageAo, Page<?> page, boolean camelToUnderscore) {
        handlePageSort(basePageAo, page, null, null, camelToUnderscore);
    }

    /**
     * 处理排序 for mybatis-plus
     *
     * @param basePageAo        BasePageAo
     * @param wrapper           wrapper
     * @param defaultSort       默认排序的字段
     * @param defaultOrder      默认排序规则
     * @param camelToUnderscore 是否开启驼峰转下划线
     */
    public static void handleWrapperSort(BasePageAo basePageAo, QueryWrapper<?> wrapper, String defaultSort, String defaultOrder, boolean camelToUnderscore) {
        String sortField = basePageAo.getField();
        if (camelToUnderscore) {
            sortField = BaseUtil.camelToUnderscore(sortField);
            defaultSort = BaseUtil.camelToUnderscore(defaultSort);
        }
        if (StringUtils.isNotBlank(basePageAo.getField())
                && StringUtils.isNotBlank(basePageAo.getOrder())
                && !StringUtils.equalsIgnoreCase(basePageAo.getField(), "null")
                && !StringUtils.equalsIgnoreCase(basePageAo.getOrder(), "null")) {
            if (StringUtils.equals(basePageAo.getOrder(), MyConstant.ORDER_DESC)) {
                wrapper.orderByDesc(sortField);
            } else {
                wrapper.orderByAsc(sortField);
            }
        } else {
            if (StringUtils.isNotBlank(defaultSort)) {
                if (StringUtils.equals(defaultOrder, MyConstant.ORDER_DESC)) {
                    wrapper.orderByDesc(defaultSort);
                } else {
                    wrapper.orderByAsc(defaultSort);
                }
            }
        }
    }

    /**
     * 处理排序 for mybatis-plus
     *
     * @param basePageAo BasePageAo
     * @param wrapper    wrapper
     */
    public static void handleWrapperSort(BasePageAo basePageAo, QueryWrapper<?> wrapper) {
        handleWrapperSort(basePageAo, wrapper, null, null, false);
    }

    /**
     * 处理排序 for mybatis-plus
     *
     * @param basePageAo        BasePageAo
     * @param wrapper           wrapper
     * @param camelToUnderscore 是否开启驼峰转下划线
     */
    public static void handleWrapperSort(BasePageAo basePageAo, QueryWrapper<?> wrapper, boolean camelToUnderscore) {
        handleWrapperSort(basePageAo, wrapper, null, null, camelToUnderscore);
    }
}
