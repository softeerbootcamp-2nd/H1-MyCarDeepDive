package com.h1.mycardeepdive.exception;

import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.http.HttpStatus;

@DisplayName("MyCarDeepDiveException 테스트")
class MyCarDeepDiveExceptionTest {

    @DisplayName("MyCarDeepDiveException 생성과 필드 확인")
    @Test
    void testMyCarDeepDiveException() {
        // given
        HttpStatus httpStatus = HttpStatus.BAD_REQUEST;
        ErrorType errorType = ErrorType.MISSING_REQUIRED_VALUE_ERROR;

        // when
        MyCarDeepDiveException exception = new MyCarDeepDiveException(httpStatus, errorType);

        // then
        assertEquals(httpStatus, exception.getHttpStatus());
        assertEquals(errorType.getMessage(), exception.getMessage());
        assertEquals(errorType.getCode(), exception.getBody().getErrorCode());
        assertEquals(errorType.getMessage(), exception.getBody().getMessage());
    }
}
