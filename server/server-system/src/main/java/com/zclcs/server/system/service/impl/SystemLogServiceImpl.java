package com.zclcs.server.system.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.common.core.entity.system.SystemLog;
import com.zclcs.common.core.entity.system.ao.SystemLogAo;
import com.zclcs.common.core.entity.system.vo.SystemLogVo;
import com.zclcs.common.core.utils.BaseSortUtil;
import com.zclcs.server.system.mapper.SystemLogMapper;
import com.zclcs.server.system.service.SystemLogService;
import com.zclcs.server.system.utils.BaseAddressUtil;
import lombok.RequiredArgsConstructor;
import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.core.LocalVariableTableParameterNameDiscoverer;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.util.*;

/**
 * <p>
 * 用户操作日志表 服务实现类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Service
@RequiredArgsConstructor
public class SystemLogServiceImpl extends ServiceImpl<SystemLogMapper, SystemLog> implements SystemLogService {

    private final ObjectMapper objectMapper;

    @Override
    public BasePage<SystemLogVo> findLogs(BasePageAo basePageAo, SystemLogAo log) {
        BasePage<SystemLogVo> basePage = new BasePage<>();
        BaseSortUtil.handlePageSort(basePageAo, basePage, "createTime", MyConstant.ORDER_DESC, true);
        QueryWrapper<SystemLogVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(StrUtil.isNotBlank(log.getUsername()), "sl.username", log.getUsername());
        queryWrapper.eq(StrUtil.isNotBlank(log.getOperation()), "sl.operation", log.getOperation());
        queryWrapper.eq(StrUtil.isNotBlank(log.getLocation()), "sl.location", log.getLocation());
        queryWrapper.between(StrUtil.isNotBlank(log.getCreateTimeFrom()) && StrUtil.isNotBlank(log.getCreateTimeTo()),
                "sl.create_time", log.getCreateTimeFrom(), log.getCreateTimeTo());
        return this.baseMapper.findPageVo(basePage, queryWrapper);
    }

    @Override
    public void deleteLogs(List<Long> logIds) {
        this.removeByIds(logIds);
    }

    @Override
    public void saveLog(ProceedingJoinPoint point, Method method, String ip, String operation, String username, long start) {
        SystemLog log = new SystemLog();
        log.setIp(ip);

        log.setUsername(username);
        log.setTime(BigDecimal.valueOf(System.currentTimeMillis() - start));
        log.setOperation(operation);

        String className = point.getTarget().getClass().getName();
        String methodName = method.getName();
        log.setMethod(className + "." + methodName + "()");

        Object[] args = point.getArgs();
        LocalVariableTableParameterNameDiscoverer u = new LocalVariableTableParameterNameDiscoverer();
        String[] paramNames = u.getParameterNames(method);
        if (args != null && paramNames != null) {
            StringBuilder params = new StringBuilder();
            params = handleParams(params, args, Arrays.asList(paramNames));
            log.setParams(params.toString());
        }
        log.setCreateTime(new Date());
        log.setLocation(BaseAddressUtil.getCityInfo(ip));
        // 保存系统日志
        save(log);
    }

    @SuppressWarnings("all")
    private StringBuilder handleParams(StringBuilder params, Object[] args, List paramNames) {
        try {
            for (int i = 0; i < args.length; i++) {
                if (args[i] instanceof Map) {
                    Set set = ((Map) args[i]).keySet();
                    List<Object> list = new ArrayList<>();
                    List<Object> paramList = new ArrayList<>();
                    for (Object key : set) {
                        list.add(((Map) args[i]).get(key));
                        paramList.add(key);
                    }
                    return handleParams(params, list.toArray(), paramList);
                } else {
                    if (args[i] instanceof Serializable) {
                        Class<?> aClass = args[i].getClass();
                        try {
                            aClass.getDeclaredMethod("toString", new Class[]{null});
                            // 如果不抛出 NoSuchMethodException 异常则存在 toString 方法 ，安全的 writeValueAsString ，否则 走 Object的 toString方法
                            params.append(" ").append(paramNames.get(i)).append(": ").append(objectMapper.writeValueAsString(args[i]));
                        } catch (NoSuchMethodException e) {
                            params.append(" ").append(paramNames.get(i)).append(": ").append(objectMapper.writeValueAsString(args[i].toString()));
                        }
                    } else if (args[i] instanceof MultipartFile) {
                        MultipartFile file = (MultipartFile) args[i];
                        params.append(" ").append(paramNames.get(i)).append(": ").append(file.getName());
                    } else {
                        params.append(" ").append(paramNames.get(i)).append(": ").append(args[i]);
                    }
                }
            }
        } catch (Exception ignore) {
            params.append("参数解析失败");
        }
        return params;
    }
}
