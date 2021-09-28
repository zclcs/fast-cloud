package com.zclcs.common.core.exception;

import com.zclcs.common.core.constant.HttpStatusConstant;

/**
 * 验证码类型异常
 *
 * @author zclcs
 */
public class ValidateCodeException extends RuntimeException {

    private static final long serialVersionUID = 7514854456967620043L;

    private int code = HttpStatusConstant.WCW;

    public ValidateCodeException(String message) {
        super(message);
    }

    public ValidateCodeException(int code, String message) {
        super(message);
        this.code = code;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}
