package com.zclcs.common.core.base;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModelProperty;

import java.util.*;
import java.util.function.Predicate;

/**
 * @author zhouchenglong
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

    protected boolean isSearchCount;

    protected boolean hitCount;

    protected String countId;

    protected Long maxLimit;

    public BasePage() {
        this.list = Collections.emptyList();
        this.total = 0L;
        this.pageSize = 10L;
        this.pageNum = 1L;
        this.orders = new ArrayList<>();
        this.optimizeCountSql = true;
        this.isSearchCount = true;
        this.hitCount = false;
    }

    public BasePage(long pageNum, long pageSize) {
        this(pageNum, pageSize, 0L);
    }

    public BasePage(long pageNum, long pageSize, long total) {
        this(pageNum, pageSize, total, true);
    }

    public BasePage(long pageNum, long pageSize, boolean isSearchCount) {
        this(pageNum, pageSize, 0L, isSearchCount);
    }

    public BasePage(long pageNum, long pageSize, long total, boolean isSearchCount) {
        this.list = Collections.emptyList();
        this.total = 0L;
        this.pageSize = 10L;
        this.pageNum = 1L;
        this.orders = new ArrayList<>();
        this.optimizeCountSql = true;
        this.hitCount = false;
        if (pageNum > 1L) {
            this.pageNum = pageNum;
        }
        this.pageSize = pageSize;
        this.total = total;
        this.isSearchCount = isSearchCount;
    }

    public boolean hasPrevious() {
        return this.pageNum > 1L;
    }

    public boolean hasNext() {
        return this.pageNum < this.getPages();
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

    private String[] mapOrderToArray(Predicate<OrderItem> filter) {
        List<String> columns = new ArrayList(this.orders.size());
        this.orders.forEach((i) -> {
            if (filter.test(i)) {
                columns.add(i.getColumn());
            }

        });
        return columns.toArray(new String[0]);
    }

    private void removeOrder(Predicate<OrderItem> filter) {
        for (int i = this.orders.size() - 1; i >= 0; --i) {
            if (filter.test(this.orders.get(i))) {
                this.orders.remove(i);
            }
        }

    }

    public BasePage<T> addOrder(OrderItem... items) {
        this.orders.addAll(Arrays.asList(items));
        return this;
    }

    public BasePage<T> addOrder(List<OrderItem> items) {
        this.orders.addAll(items);
        return this;
    }

    /**
     * @deprecated
     */
    @Deprecated
    public BasePage<T> setAscs(List<String> ascs) {
        return CollectionUtils.isNotEmpty(ascs) ? this.setAsc((String[]) ascs.toArray(new String[0])) : this;
    }

    /**
     * @deprecated
     */
    @Deprecated
    public BasePage<T> setAsc(String... ascs) {
        this.removeOrder(OrderItem::isAsc);
        String[] var2 = ascs;
        int var3 = ascs.length;

        for (int var4 = 0; var4 < var3; ++var4) {
            String s = var2[var4];
            this.addOrder(OrderItem.asc(s));
        }

        return this;
    }

    /**
     * @deprecated
     */
    @Deprecated
    public BasePage<T> setDescs(List<String> descs) {
        if (CollectionUtils.isNotEmpty(descs)) {
            this.removeOrder((item) -> {
                return !item.isAsc();
            });
            Iterator var2 = descs.iterator();

            while (var2.hasNext()) {
                String s = (String) var2.next();
                this.addOrder(OrderItem.desc(s));
            }
        }

        return this;
    }

    /**
     * @deprecated
     */
    @Deprecated
    public BasePage<T> setDesc(String... descs) {
        this.setDescs(Arrays.asList(descs));
        return this;
    }

    @Override
    public List<OrderItem> orders() {
        return this.getOrders();
    }

    @Override
    public boolean optimizeCountSql() {
        return this.optimizeCountSql;
    }

    public boolean isOptimizeCountSql() {
        return this.optimizeCountSql();
    }

    @JsonIgnore
    public BasePage<T> setOptimizeCountSql(boolean optimizeCountSql) {
        this.optimizeCountSql = optimizeCountSql;
        return this;
    }

    @Override
    public boolean isSearchCount() {
        return this.total >= 0L && this.isSearchCount;
    }

    @JsonIgnore
    public BasePage<T> setSearchCount(boolean isSearchCount) {
        this.isSearchCount = isSearchCount;
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

    @JsonIgnore
    public void setHitCount(boolean hit) {
        this.hitCount = hit;
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
}
