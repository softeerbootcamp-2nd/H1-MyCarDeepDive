package com.h1.mycardeepdive.global.response;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ApiResponse<T> {
    private StatusResponse status = new StatusResponse(ResponseCode.OK);
    private final T data;

    public ApiResponse() {
        this.data = null;
    }

    public ApiResponse(T data) {
        this.data = data;
    }

    public ApiResponse(ResponseCode responseCode) {
        this();
        this.status = new StatusResponse(responseCode);
    }

    public ApiResponse(String responseCode, String message) {
        this();
        this.status = new StatusResponse(responseCode, message);
    }
}
