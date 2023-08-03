package com.h1.mycardeepdive.global.response;

import lombok.Getter;

@Getter
public class StatusResponse {
    private String code;
    private String message;

    public StatusResponse(ResponseCode responseCode) {
        this(responseCode.getCode(), responseCode.getMessage());
    }

    public StatusResponse(String responseCode, String message) {
        this.code = responseCode;
        this.message = message;
    }
}
