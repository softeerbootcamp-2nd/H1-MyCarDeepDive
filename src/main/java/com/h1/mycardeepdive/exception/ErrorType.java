package com.h1.mycardeepdive.exception;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum ErrorType {
    MISSING_REQUIRED_VALUE_ERROR("COMMON-001", "필수 요청값이 누락되었습니다."),
    NOT_ALLOWED_PERMISSION_ERROR("COMMON-002", "허용되지 않은 권한입니다."),
    DUPLICATED_REQUEST_ERROR("COMMON-003", "중복된 요청입니다."),
    INVALID_REQUEST_ERROR("COMMON-004", "올바르지 않은 데이터 요청입니다."),
    ASYNC_HANDLING_ERROR("COMMON-005", "비동기 처리에서 문제가 발생했습니다."),
    NETWORK_ERROR("COMMON-006", "네트워크 처리에서 문제가 발생했습니다."),
    EMAIL_FORMAT_ERROR("USER-001", "올바르지 않은 이메일 입력 양식입니다."),
    SERVICE_BEING_CHECKED("SERVICE-001", "서비스가 점검중입니다."),
    UNEXPECTED_SERVER_ERROR("SERVER-001", "서버 관리자에게 문의하세요."),
    FONT_ERROR("FONT-001", "폰트 가져오기 실패했습니다."),
    PDF_NOT_FOUND("PDF-001", "해당 PDF ID가 존재하지 않습니다."),
    CAR_SPEC_NOT_FOUND("CAR-SPEC-001", "해당 CarSpec이 존재하지 않습니다."),
    COLOR_NOT_FOUND("COLOR-001", "해당 색상이 존재하지 않습니다."),
    TRIM_NOT_FOUND("TRIM-001", "해당 트림이 존재하지 않습니다."),
    TAG_NOT_FOUND("TAG-001", "해당 태그가 존재하지 않습니다."),
    OPTION_NOT_FOUND("OPTION-001", "해당 옵션이 존재하지 않습니다.");
    private final String code;
    private final String message;

    public String getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}
