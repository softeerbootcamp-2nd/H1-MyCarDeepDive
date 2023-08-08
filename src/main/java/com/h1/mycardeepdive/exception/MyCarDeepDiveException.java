package com.h1.mycardeepdive.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public class MyCarDeepDiveException extends RuntimeException {

    private final HttpStatus httpStatus;
    private final ExceptionResponse body;

    public MyCarDeepDiveException(HttpStatus httpStatus, ErrorType errorType) {
        super(errorType.getMessage());
        this.httpStatus = httpStatus;
        this.body = new ExceptionResponse(errorType.getCode(), errorType.getMessage());
    }
}
