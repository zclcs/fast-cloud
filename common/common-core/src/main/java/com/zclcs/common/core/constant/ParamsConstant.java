package com.zclcs.common.core.constant;

/**
 * 请求参数常量
 *
 * @author zclcs
 */
public interface ParamsConstant {

    /**
     * 验证码 key
     */
    String VALIDATE_CODE_KEY = "key";
    /**
     * 验证码 code
     */
    String VALIDATE_CODE_CODE = "code";
    /**
     * 认证类型参数 key
     */
    String GRANT_TYPE = "grant_type";
    /**
     * 登录类型
     */
    String LOGIN_TYPE = "login_type";

    /**
     * 状态关闭
     */
    String CLOSE = "0";

    /**
     * 状态开启
     */
    String OPEN = "1";

    /**
     * 默认的菜单图标
     */
    String DEFAULT_MENU_ICON = "ant-design:appstore-add-outlined";

    /**
     * 请求方法所有
     */
    String METHOD_ALL = "all";

    /**
     * 开始时间
     */
    String BEGIN_OF_DAY = "00:00:00";

    /**
     * 结束时间
     */
    String END_OF_DAY = "23:59:59";

    /**
     * 代码生成权限集合
     */
    String[] AUTHS = new String[]{"view", "add", "delete", "update"};

    /**
     * 代码生成权限集合
     */
    String AUTH_VIEW = "view";

    /**
     * 按钮文字
     */
    String[] BUTTON_TEXT = new String[]{"查看", "新增", "删除", "修改"};

    /**
     * 代码压缩包后缀
     */
    String SUFFIX = "_code.zip";

}
