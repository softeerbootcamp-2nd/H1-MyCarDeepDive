package com.h1.mycardeepdive.exception;

import static com.h1.mycardeepdive.exception.ErrorType.UNEXPECTED_SERVER_ERROR;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @ExceptionHandler(MyCarDeepDiveException.class)
    public ResponseEntity<ExceptionResponse> handleConnectableException(
            MyCarDeepDiveException exception) {
        return ResponseEntity.status(exception.getHttpStatus()).body(exception.getBody());
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<MethodArgumentNotValidExceptionResponse>
            handleMethodArgumentNotValidException(MethodArgumentNotValidException exception) {
        MethodArgumentNotValidExceptionResponse errorResponse =
                MethodArgumentNotValidExceptionResponse.of(ErrorType.INVALID_REQUEST_ERROR);
        for (FieldError fieldError : exception.getFieldErrors()) {
            errorResponse.addValidation(fieldError.getField(), fieldError.getDefaultMessage());
        }
        return ResponseEntity.badRequest().body(errorResponse);
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<ExceptionResponse> handleException(Exception exception) {
        String unexpectedError = ExceptionUtils.getStackTrace(exception);
        log.error(unexpectedError);
        return ResponseEntity.internalServerError()
                .body(
                        new ExceptionResponse(
                                UNEXPECTED_SERVER_ERROR.getCode(),
                                UNEXPECTED_SERVER_ERROR.getMessage()));
    }
}
