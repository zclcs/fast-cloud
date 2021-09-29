package com.zclcs.server.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.common.core.entity.system.SystemLog;
import com.zclcs.common.core.entity.system.ao.SystemLogAo;
import com.zclcs.common.core.entity.system.vo.SystemLogVo;
import org.springframework.scheduling.annotation.Async;

import java.util.List;

/**
 * <p>
 * 用户操作日志表 服务类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
public interface SystemLogService extends IService<SystemLog> {

    /**
     * 查询操作日志分页
     *
     * @param basePageAo QueryRequest
     * @param log        日志
     * @return BasePage<SystemLogVo>
     */
    BasePage<SystemLogVo> findLogPage(BasePageAo basePageAo, SystemLogAo log);

    /**
     * 删除操作日志
     *
     * @param logIds 日志 ID集合
     */
    void deleteLogs(List<Long> logIds);

    /**
     * 异步保存操作日志
     *
     * @param className  类名
     * @param methodName 方法名
     * @param params     参数
     * @param ip         ip
     * @param operation  操作内容
     * @param username   操作用户
     * @param start      开始时间
     */
    @Async(MyConstant.ASYNC_POOL)
    void saveLog(String className, String methodName, String params, String ip, String operation, String username, long start);

}
