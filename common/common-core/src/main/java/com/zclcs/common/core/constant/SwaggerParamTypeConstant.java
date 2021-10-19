package com.zclcs.common.core.constant;

/**
 * swagger 文档 paramType
 * 表示参数放在哪里
 *
 * @author zclcs
 */
public interface SwaggerParamTypeConstant {

    /**
     * header-->请求参数的获取：@RequestHeader(代码中接收注解)
     */
    String HEADER = "header";

    /**
     * query-->请求参数的获取：@RequestParam(代码中接收注解)
     */
    String QUERY = "query";

    /**
     * path（用于restful接口）-->请求参数的获取：@PathVariable(代码中接收注解)
     */
    String PATH = "path";

    /**
     * body-->请求参数的获取：@RequestBody(代码中接收注解)
     */
    String BODY = "body";

    /**
     * FORM
     */
    String FORM = "form";

}
