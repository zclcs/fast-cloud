package com.zclcs.common.core.exception;

/**
 * 系统异常
 *
 * @author zclcs
 */
public class MyMinioException extends RuntimeException {

    private static final long serialVersionUID = -6916154462432027437L;

    public MyMinioException(String message) {
        super(message);
    }
}
