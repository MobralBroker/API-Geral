package com.solinfbroker.apigeral.config.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;
@ResponseStatus(HttpStatus.NOT_ACCEPTABLE)
public class ApiRequestException extends RuntimeException{


    public ApiRequestException (String mensagem){
        super(mensagem);
    }
    public ApiRequestException (String mensagem, Throwable causa){
        super(mensagem, causa);
    }
}
