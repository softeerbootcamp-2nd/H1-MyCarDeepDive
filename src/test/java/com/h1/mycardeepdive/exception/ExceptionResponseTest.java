package com.h1.mycardeepdive.exception;

import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

@DisplayName("ExceptionResponse 테스트")
class ExceptionResponseTest {

    @DisplayName("ExceptionResponse 생성자와 of 메서드의 동작 확인")
    @Test
    void testExceptionResponse() {
        // given
        String errorCode = "COMMON-001";
        String errorMessage = "필수 요청값이 누락되었습니다.";

        // when
        ExceptionResponse exceptionResponse = new ExceptionResponse(errorCode, errorMessage);

        // then
        assertEquals(errorCode, exceptionResponse.getErrorCode());
        assertEquals(errorMessage, exceptionResponse.getMessage());

        // when (using of method)
        ErrorType errorType = ErrorType.MISSING_REQUIRED_VALUE_ERROR;
        ExceptionResponse exceptionResponseFromErrorType = ExceptionResponse.of(errorType);

        // then
        assertEquals(errorType.getCode(), exceptionResponseFromErrorType.getErrorCode());
        assertEquals(errorType.getMessage(), exceptionResponseFromErrorType.getMessage());
    }
}
