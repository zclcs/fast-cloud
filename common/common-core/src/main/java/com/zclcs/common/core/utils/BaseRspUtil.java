package com.zclcs.common.core.utils;

import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.exception.MyException;
import lombok.extern.slf4j.Slf4j;

/**
 * @author zclcs
 */
@Slf4j
public abstract class BaseRspUtil {

    /**
     * 成功不带参
     *
     * @param <T> 数据类型
     * @return 返回json
     */
    public static <T> BaseRsp<T> message() {
        return new BaseRsp<>();
    }

    /**
     * 调用成功 - 消息体
     *
     * @param data 数据体
     * @return 返回json
     */
    public static <T> BaseRsp<T> message(T data) {
        BaseRsp<T> vo = new BaseRsp<>();
        vo.setData(data);
        return vo;
    }

    /**
     * 成功消息
     *
     * @param message 消息体
     * @return 返回json
     */
    public static <T> BaseRsp<T> message(String message) {
        BaseRsp<T> vo = new BaseRsp<>();
        vo.setMsg(message);
        return vo;
    }

    /**
     * 调用失败 - 异常
     *
     * @param myException 异常
     * @return 返回json
     */
    public static <T> BaseRsp<T> message(MyException myException) {
        BaseRsp<T> vo = new BaseRsp<>();
        vo.setMsg(myException.getMessage());
        return vo;
    }
}
