package com.zclcs.common.core.constant;

/**
 * 系统常量类
 *
 * @author zclcs
 */
public interface MyConstant {

    /**
     * 排序规则：降序
     */
    String ORDER_DESC = "descending";
    /**
     * 排序规则：升序
     */
    String ORDER_ASC = "ascending";

    /**
     * Gateway请求头TOKEN名称（不要有空格）
     */
    String GATEWAY_TOKEN_HEADER = "GatewayToken";
    /**
     * Gateway请求头TOKEN值
     */
    String GATEWAY_TOKEN_VALUE = "zclcs:gateway:123456";

    /**
     * 允许下载的文件类型，根据需求自己添加（小写）
     */
    String[] VALID_FILE_TYPE = {"xlsx", "zip"};

    /**
     * 异步线程池名称
     */
    String ASYNC_POOL = "MyAsyncThreadPool";

    /**
     * OAUTH2 令牌类型 https://oauth.net/2/bearer-tokens/
     */
    String OAUTH2_TOKEN_TYPE = "bearer";
    /**
     * Java默认临时目录
     */
    String JAVA_TEMP_DIR = "java.io.tmpdir";
    /**
     * utf-8
     */
    String UTF8 = "utf-8";
    /**
     * 注册用户角色ID
     */
    Long REGISTER_ROLE_ID = 2L;

    String LOCALHOST = "localhost";
    String LOCALHOST_IP = "127.0.0.1";

    /**
     * 调用成功消息
     */
    String SUCCESS_MSG = "调用成功";

    /**
     * http contentType
     */
    String JSON_UTF8 = "application/json;charset=UTF-8";

    /**
     * 根节点id
     */
    Long TOP_PARENT_ID = 0L;

    /**
     * 根节点id
     */
    Integer TOP_PARENT_LEVEL = 1;

    /**
     * 根节点code
     */
    String TOP_PARENT_CODE = "0";

    /**
     * 注释中的字典信息
     */
    String DICT_REMARK = "@@";

    /**
     * 字典是否是array
     */
    String DICT_ARRAY = "array";

    /**
     * 行政区划表名
     */
    String AREA_CODE = "area_code";

    /**
     * 字典表缓存前缀
     */
    String DICT_CACHE_PREFIX = "dict";

    /**
     * 新增
     */
    String INSERT = "INSERT";

    /**
     * 修改
     */
    String UPDATE = "UPDATE";

    /**
     * 删除
     */
    String DELETE = "DELETE";

    /**
     * 删除
     */
    String ADMIN = "admin";

}
