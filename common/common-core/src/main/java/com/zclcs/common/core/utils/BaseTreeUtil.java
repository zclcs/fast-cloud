package com.zclcs.common.core.utils;

import com.zclcs.common.core.entity.Tree;
import com.zclcs.common.core.entity.router.VueRouter;

import java.util.ArrayList;
import java.util.List;

/**
 * @author MrBird
 */
public abstract class BaseTreeUtil {

    private final static Long TOP_NODE_ID = 0L;

    /**
     * 用于构建菜单或部门树
     *
     * @param nodes nodes
     * @return <T> List<? extends Tree>
     */
    public static <T> List<? extends Tree<?>> build(List<? extends Tree<T>> nodes) {
        if (nodes == null) {
            return null;
        }
        List<Tree<T>> topNodes = new ArrayList<>();
        nodes.forEach(node -> {
            Long pid = node.getParentId();
            if (pid == null || TOP_NODE_ID.equals(pid)) {
                node.setHasParent(false);
                topNodes.add(node);
                return;
            }
            for (Tree<T> n : nodes) {
                Long id = n.getId();
                if (id != null && id.equals(pid)) {
                    if (n.getChildren() == null) {
                        n.initChildren();
                    }
                    n.getChildren().add(node);
                    node.setHasParent(true);
                    n.setHasChildren(true);
                    n.setHasParent(false);
                    return;
                }
            }
            if (topNodes.isEmpty()) {
                topNodes.add(node);
            }
        });
        return topNodes;
    }


    /**
     * 构造前端路由
     *
     * @param routes routes
     * @param <T>    T
     * @return ArrayList<VueRouter < T>>
     */
    public static <T> List<VueRouter<T>> buildVueRouter(List<VueRouter<T>> routes) {
        if (routes == null) {
            return null;
        }
        List<VueRouter<T>> topRoutes = new ArrayList<>();
        routes.forEach(route -> {
            Long parentId = route.getParentId();
            if (parentId == null || TOP_NODE_ID.equals(parentId)) {
                topRoutes.add(route);
                return;
            }
            for (VueRouter<T> parent : routes) {
                Long id = parent.getId();
                if (id != null && id.equals(parentId)) {
                    if (parent.getChildren() == null) {
                        parent.initChildren();
                    }
                    parent.getChildren().add(route);
                    parent.setHasChildren(true);
                    route.setHasParent(true);
                    parent.setHasParent(true);
                    return;
                }
            }
        });
        return topRoutes;
    }
}