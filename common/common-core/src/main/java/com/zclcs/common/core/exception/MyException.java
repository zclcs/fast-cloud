package com.zclcs.common.core.exception;

/**
 * FEBS系统异常
 *
 * @author MrBird
 */
public class MyException extends RuntimeException {

    private static final long serialVersionUID = -6916154462432027437L;

    public MyException(String message) {
        super(message);
    }
}
