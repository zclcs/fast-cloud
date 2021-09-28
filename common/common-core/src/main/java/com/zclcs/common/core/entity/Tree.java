package com.zclcs.common.core.entity;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @author zclcs
 */
@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Tree<T> implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;

    private String label;

    private List<Tree<T>> children;

    private Long parentId;

    private boolean hasParent = false;

    private boolean hasChildren = false;

    public void initChildren() {
        this.children = new ArrayList<>();
    }

}
