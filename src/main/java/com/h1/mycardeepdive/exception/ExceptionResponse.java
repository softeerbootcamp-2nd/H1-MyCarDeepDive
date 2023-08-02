package com.h1.mycardeepdive.exception;

import lombok.Getter;

@Getter
public class ExceptionResponse {

    private String errorCode;
    private String message;

    public ExceptionResponse(String errorCode, String message) {
        this.errorCode = errorCode;
        this.message = message;
    }

    public static ExceptionResponse of(ErrorType errorType) {
        return new ExceptionResponse(errorType.getCode(), errorType.getMessage());
    }
}