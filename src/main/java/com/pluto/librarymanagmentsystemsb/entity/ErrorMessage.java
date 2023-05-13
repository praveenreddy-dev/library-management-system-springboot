package com.pluto.librarymanagmentsystemsb.entity;

import org.springframework.http.HttpStatus;
import org.springframework.web.client.HttpServerErrorException;

public class ErrorMessage {
    public ErrorMessage() {
    }

    private HttpStatus status;
    private String message;

    public HttpStatus getStatus() {
        return status;
    }

    public void setStatus(HttpStatus status) {
        this.status = status;
    }

    public ErrorMessage(HttpStatus status, String message) {
        this.status = status;
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
