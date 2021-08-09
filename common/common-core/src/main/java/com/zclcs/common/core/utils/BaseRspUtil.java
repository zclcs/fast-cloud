package com.zclcs.common.core.utils;

import cn.hutool.json.JSONUtil;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.common.core.exception.MyException;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author zclcs
 */
@Slf4j
public abstract class BaseRspUtil {

    private BaseRspUtil() {

    }

    /**
     * 往 response 写出 json
     *
     * @param response 响应
     * @param data     返回数据
     */
    public static void renderJson(HttpServletResponse response, Object data) {
        try {
            response.setContentType("application/json;charset=UTF-8");
            response.setStatus(HttpServletResponse.SC_OK);
            JSONUtil.toJsonStr(JSONUtil.parseObj(BaseRspUtil.failure(data)), response.getWriter());
        } catch (IOException e) {
            log.error("Response写出JSON异常，", e);
        }
    }

    /**
     * 往 response 写出 json
     *
     * @param response 响应
     * @param msg      消息
     */
    public static void renderJson(HttpServletResponse response, String msg) {
        try {
            response.setContentType(MyConstant.JSON_UTF8);
            response.setStatus(HttpServletResponse.SC_OK);
            JSONUtil.toJsonStr(JSONUtil.parseObj(BaseRspUtil.success(msg)), response.getWriter());
        } catch (IOException e) {
            log.error("Response写出JSON异常，", e);
        }
    }

    /**
     * 往 response 写出 json
     *
     * @param response    响应
     * @param myException 异常
     */
    public static void renderJson(HttpServletResponse response, MyException myException) {
        try {
            response.setContentType(MyConstant.JSON_UTF8);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            JSONUtil.toJsonStr(JSONUtil.parseObj(BaseRspUtil.failure(myException)), response.getWriter());
        } catch (IOException e) {
            log.error("Response写出JSON异常，", e);
        }
    }

    /**
     * 成功不带参
     *
     * @param <T> 数据类型
     * @return 返回json
     */
    public static <T> BaseRsp<T> success() {
        return new BaseRsp<>();
    }

    /**
     * 调用成功 - 消息体
     *
     * @param data 数据体
     * @return 返回json
     */
    public static <T> BaseRsp<T> success(T data) {
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
    public static <T> BaseRsp<T> success(String message) {
        BaseRsp<T> vo = new BaseRsp<>();
        vo.setMsg(message);
        return vo;
    }

    /**
     * 调用失败 - 消息
     *
     * @param message 消息体
     * @return 返回json
     */
    public static <T> BaseRsp<T> failure(String message) {
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
    public static <T> BaseRsp<T> failure(MyException myException) {
        BaseRsp<T> vo = new BaseRsp<>();
        vo.setMsg(myException.getMessage());
        return vo;
    }

    /**
     * 调用失败 - 消息体
     *
     * @param data 数据体
     * @return 返回json
     */
    public static <T> BaseRsp<T> failure(T data) {
        BaseRsp<T> vo = new BaseRsp<>();
        vo.setMsg(MyConstant.SUCCESS_MSG);
        vo.setData(data);
        return vo;
    }
}
