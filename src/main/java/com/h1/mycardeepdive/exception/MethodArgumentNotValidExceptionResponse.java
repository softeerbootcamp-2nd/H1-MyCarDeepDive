package com.h1.mycardeepdive.exception;

import java.util.HashMap;
import java.util.Map;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public class MethodArgumentNotValidExceptionResponse {

    private final String errorCode;
    private final String message;
    private Map<String, String> validation = new HashMap<>();

    public void addValidation(String fieldName, String errorMessage) {
        this.validation.put(fieldName, errorMessage);
    }

    public static MethodArgumentNotValidExceptionResponse of(ErrorType errorType) {
        return new MethodArgumentNotValidExceptionResponse(
                errorType.getCode(), errorType.getMessage());
    }
}
