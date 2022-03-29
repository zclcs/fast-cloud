package com.zclcs.common.core.base;

import com.zclcs.common.core.constant.MyConstant;

/**
 * 基础控制器
 *
 * @author zclcs
 */
public class BaseController {

    /**
     * 成功不带参
     *
     * @param <T> 数据类型
     * @return 返回json
     */
    protected <T> BaseRsp<T> success() {
        BaseRsp<T> tBaseRsp = new BaseRsp<>();
        tBaseRsp.setMsg(MyConstant.SUCCESS_MSG);
        return tBaseRsp;
    }

    /**
     * 成功数据体
     *
     * @param data 数据体
     * @param <T>  数据类型
     * @return 返回json
     */
    protected <T> BaseRsp<T> success(T data) {
        BaseRsp<T> tBaseRsp = new BaseRsp<>();
        tBaseRsp.setData(data);
        return tBaseRsp;
    }

    /**
     * 成功消息
     *
     * @param message 消息体
     * @param <T>     数据类型
     * @return 返回json
     */
    protected <T> BaseRsp<T> success(String message) {
        BaseRsp<T> tBaseRsp = new BaseRsp<>();
        tBaseRsp.setMsg(message);
        return tBaseRsp;
    }

}
