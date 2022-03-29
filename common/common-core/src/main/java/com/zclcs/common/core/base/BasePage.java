package com.zclcs.common.core.base;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModelProperty;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * @author zclcs
 */
public class BasePage<T> implements IPage<T> {

    private static final long serialVersionUID = 8545996863226528798L;

    @ApiModelProperty("分页对象记录列表")
    protected List<T> list;

    @ApiModelProperty("总条数")
    protected long total;

    @ApiModelProperty("每页显示条数")
    protected long pageSize;

    @ApiModelProperty("当前页")
    protected long pageNum;

    protected List<OrderItem> orders;

    protected boolean optimizeCountSql;

    protected boolean searchCount;

    protected boolean optimizeJoinOfCountSql;

    protected String countId;

    protected Long maxLimit;

    public BasePage() {
        this.list = Collections.emptyList();
        this.total = 0L;
        this.pageSize = 10L;
        this.pageNum = 1L;
        this.orders = new ArrayList<>();
        this.optimizeCountSql = true;
        this.searchCount = true;
        this.optimizeJoinOfCountSql = true;
    }

    public BasePage(long pageNum, long pageSize) {
        this(pageNum, pageSize, 0L);
    }

    public BasePage(long pageNum, long pageSize, long total) {
        this(pageNum, pageSize, total, true);
    }

    public BasePage(long pageNum, long pageSize, boolean searchCount) {
        this(pageNum, pageSize, 0L, searchCount);
    }

    public BasePage(long pageNum, long pageSize, long total, boolean searchCount) {
        this.list = Collections.emptyList();
        this.orders = new ArrayList<>();
        this.optimizeCountSql = true;
        this.optimizeJoinOfCountSql = true;
        this.pageSize = Math.max(pageSize, 1L);
        this.pageNum = pageNum;
        this.total = total;
        this.searchCount = searchCount;
    }

    public static <T> BasePage<T> of(long pageNum, long pageSize, long total, boolean searchCount) {
        return new BasePage<>(pageNum, pageSize, total, searchCount);
    }

    public static <T> BasePage<T> of(long pageNum, long pageSize) {
        return of(pageNum, pageSize, 0L);
    }

    public static <T> BasePage<T> of(long pageNum, long pageSize, long total) {
        return of(pageNum, pageSize, total, true);
    }

    public static <T> BasePage<T> of(long pageNum, long pageSize, boolean searchCount) {
        return of(pageNum, pageSize, 0L, searchCount);
    }

    public boolean hasPrevious() {
        return this.pageSize > 1L;
    }

    public boolean hasNext() {
        return this.pageSize < this.getPages();
    }

    @Override
    public List<T> getRecords() {
        return this.list;
    }

    @JsonIgnore
    @Override
    public BasePage<T> setRecords(List<T> records) {
        this.list = records;
        return this;
    }

    @Override
    public long getTotal() {
        return this.total;
    }

    @Override
    public BasePage<T> setTotal(long total) {
        this.total = total;
        return this;
    }

    @JsonIgnore
    @Override
    public long getSize() {
        return this.pageSize;
    }

    @Override
    public BasePage<T> setSize(long size) {
        this.pageSize = size;
        return this;
    }

    @Override
    public long getCurrent() {
        return this.pageNum;
    }

    @JsonIgnore
    @Override
    public BasePage<T> setCurrent(long current) {
        this.pageNum = current;
        return this;
    }

    @Override
    public String countId() {
        return this.countId;
    }

    @Override
    public Long maxLimit() {
        return this.maxLimit;
    }


    public void addOrder(OrderItem... items) {
        this.orders.addAll(Arrays.asList(items));
    }

    @Override
    public List<OrderItem> orders() {
        return this.orders;
    }

    @Override
    public boolean optimizeCountSql() {
        return this.optimizeCountSql;
    }

    @Override
    public boolean optimizeJoinOfCountSql() {
        return optimizeJoinOfCountSql;
    }

    @JsonIgnore
    public BasePage<T> setSearchCount(boolean searchCount) {
        this.searchCount = searchCount;
        return this;
    }

    @JsonIgnore
    public BasePage<T> setOptimizeCountSql(boolean optimizeCountSql) {
        this.optimizeCountSql = optimizeCountSql;
        return this;
    }

    /**
     * 内部什么也不干
     * <p>只是为了 json 反序列化时不报错</p>
     *
     * @param pages 总页数
     */
    @JsonIgnore
    @Override
    public IPage<T> setPages(long pages) {
        return null;
    }

    @Override
    public long getPages() {
        return IPage.super.getPages();
    }

    public List<OrderItem> getOrders() {
        return this.orders;
    }

    @JsonIgnore
    public void setOrders(final List<OrderItem> orders) {
        this.orders = orders;
    }

    public String getCountId() {
        return this.countId;
    }

    @JsonIgnore
    public void setCountId(final String countId) {
        this.countId = countId;
    }

    public Long getMaxLimit() {
        return this.maxLimit;
    }

    @JsonIgnore
    public void setMaxLimit(final Long maxLimit) {
        this.maxLimit = maxLimit;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public long getPageSize() {
        return pageSize;
    }

    public void setPageSize(long pageSize) {
        this.pageSize = pageSize;
    }

    public long getPageNum() {
        return pageNum;
    }

    public void setPageNum(long pageNum) {
        this.pageNum = pageNum;
    }

    @JsonIgnore
    public void setOptimizeJoinOfCountSql(final boolean optimizeJoinOfCountSql) {
        this.optimizeJoinOfCountSql = optimizeJoinOfCountSql;
    }
}
