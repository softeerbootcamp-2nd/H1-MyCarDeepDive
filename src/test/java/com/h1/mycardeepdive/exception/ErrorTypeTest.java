package com.h1.mycardeepdive.exception;

import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

@DisplayName("ErrorType 테스트")
class ErrorTypeTest {

    @DisplayName("ErrorType의 코드와 메시지가 정상적으로 설정되어 있는지 확인")
    @Test
    void testErrorType() {
        // given
        String code = "COMMON-001";
        String message = "필수 요청값이 누락되었습니다.";

        // when
        ErrorType errorType = ErrorType.MISSING_REQUIRED_VALUE_ERROR;

        // then
        assertEquals(code, errorType.getCode());
        assertEquals(message, errorType.getMessage());
    }
}
