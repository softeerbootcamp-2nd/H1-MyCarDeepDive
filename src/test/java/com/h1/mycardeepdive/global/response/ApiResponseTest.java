package com.h1.mycardeepdive.global.response;

import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

@DisplayName("ApiResponse 테스트")
class ApiResponseTest {

    @DisplayName("ApiResponse 생성자 및 필드 확인")
    @Test
    void testApiResponse() {
        // given
        String responseCode = "OK";
        String message = "Success";
        String dataValue = "Hello, World!";

        // when
        ApiResponse<String> apiResponseWithData = new ApiResponse<>(dataValue);
        ApiResponse<String> apiResponseWithResponseCode = new ApiResponse<>(ResponseCode.CREATED);
        ApiResponse<String> apiResponseWithResponseCodeAndMessage =
                new ApiResponse<>(responseCode, message);

        // then
        assertNotNull(apiResponseWithData.getData());
        assertEquals(dataValue, apiResponseWithData.getData());

        StatusResponse statusResponseWithData = apiResponseWithData.getStatus();
        assertEquals(ResponseCode.OK.getCode(), statusResponseWithData.getCode());
        assertEquals(ResponseCode.OK.getMessage(), statusResponseWithData.getMessage());

        StatusResponse statusResponseWithResponseCode = apiResponseWithResponseCode.getStatus();
        assertEquals(ResponseCode.CREATED.getCode(), statusResponseWithResponseCode.getCode());
        assertEquals(
                ResponseCode.CREATED.getMessage(), statusResponseWithResponseCode.getMessage());

        StatusResponse statusResponseWithResponseCodeAndMessage =
                apiResponseWithResponseCodeAndMessage.getStatus();
        assertEquals(responseCode, statusResponseWithResponseCodeAndMessage.getCode());
        assertEquals(message, statusResponseWithResponseCodeAndMessage.getMessage());
    }
}
