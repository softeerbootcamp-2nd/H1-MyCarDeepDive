package com.h1.mycardeepdive.global.response;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum ResponseCode {
    OK("SUCCESS-001", "응답 성공하였습니다."),
    CREATED("SUCCESS-001", "생성되었습니다."),
    UPDATED("SUCCESS-002", "갱신되었습니다.");
    private final String code;
    private final String message;

    public String getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}
