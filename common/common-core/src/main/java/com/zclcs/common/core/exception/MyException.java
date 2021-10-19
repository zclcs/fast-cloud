package com.zclcs.common.core.exception;

/**
 * 系统异常
 *
 * @author zclcs
 */
public class MyException extends RuntimeException {

    private static final long serialVersionUID = -6916154462432027437L;

    public MyException(String message) {
        super(message);
    }
}
