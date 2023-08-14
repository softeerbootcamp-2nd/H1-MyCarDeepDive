package com.h1.mycardeepdive.exception;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

public class MethodArgumentNotValidExceptionResponseTest {

    @Test
    public void testErrorType() {
        ErrorType errorType = ErrorType.MISSING_REQUIRED_VALUE_ERROR;
        assertEquals("COMMON-001", errorType.getCode());
        assertEquals("필수 요청값이 누락되었습니다.", errorType.getMessage());
    }

    @Test
    public void testMethodArgumentNotValidExceptionResponse() {
        ErrorType errorType = ErrorType.INVALID_REQUEST_ERROR;
        MethodArgumentNotValidExceptionResponse response =
                MethodArgumentNotValidExceptionResponse.of(errorType);
        assertEquals("COMMON-004", response.getErrorCode());
        assertEquals("올바르지 않은 데이터 요청입니다.", response.getMessage());

        response.addValidation("fieldName", "Error message");
        assertEquals("Error message", response.getValidation().get("fieldName"));
    }
}
