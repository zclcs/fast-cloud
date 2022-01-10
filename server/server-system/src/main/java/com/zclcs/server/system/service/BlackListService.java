package com.zclcs.server.system.service;

import com.zclcs.common.core.entity.system.BlackList;
import com.zclcs.common.core.entity.system.ao.BlackListAo;
import com.zclcs.common.core.entity.system.vo.BlackListVo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;

import java.util.List;

/**
 * 黑名单表 Service接口
 *
 * @author zclcs
 * @date 2021-12-29 17:20:03.111
 */
public interface BlackListService extends IService<BlackList> {

    /**
     * 查询（分页）
     *
     * @param basePageAo basePageAo
     * @param blackListVo blackListVo
     * @return BasePage<BlackListVo>
     */
    BasePage<BlackListVo> findBlackListPage(BasePageAo basePageAo, BlackListVo blackListVo);

    /**
     * 查询（所有）
     *
     * @param blackListVo blackListVo
     * @return List<BlackListVo>
     */
    List<BlackListVo> findBlackListList(BlackListVo blackListVo);

    /**
     * 查询（单个）
     *
     * @param blackListVo blackListVo
     * @return BlackListVo
     */
    BlackListVo findBlackList(BlackListVo blackListVo);

    /**
     * 统计
     *
     * @param blackListVo blackListVo
     * @return BlackListVo
     */
    Integer countBlackList(BlackListVo blackListVo);

    /**
     * 新增
     *
     * @param blackListAo blackListAo
     */
    void createBlackList(BlackListAo blackListAo);

    /**
     * 修改
     *
     * @param blackListAo blackListAo
     */
    void updateBlackList(BlackListAo blackListAo);

    /**
     * 删除
     *
     * @param ids ids
     */
    void deleteBlackList(List<Long> ids);

}
