package com.solinfbroker.apigeral.config.exceptions;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.time.LocalDateTime;

@ControllerAdvice
public class ApiExceptionHandler {

    
    private final MessageSource messageSource;
    @ExceptionHandler(value = {ApiRequestException.class})
    public ResponseEntity<Object> handleApiRequestException(ApiRequestException apiRequestException){
        ApiException apiException = new ApiException(
                apiRequestException.getMessage(),
                HttpStatus.BAD_REQUEST,
                LocalDateTime.now()
        );
        return new ResponseEntity<>(apiException, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(RecursoNaoEncontradoException.class)
    public ResponseEntity<String> handleResourceNotFoundException(RecursoNaoEncontradoException ex) {
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(ex.getMessage());
    }

    @ExceptionHandler(RecursoNaoAceitoException.class)
    public ResponseEntity<String> handleResourceNotFoundException(RecursoNaoAceitoException ex) {
        return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body(ex.getMessage());
    }
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<String> handleConstraintViolationException(MethodArgumentNotValidException ex) {
        ApiException apiException = new ApiException();
        ex.getBindingResult().getFieldErrors().forEach( e -> {
            String mensagem = e.getField().concat(" ").concat(messageSource.getMessage(e, LocaleContextHolder.getLocale()));
            apiException.setMensagem(mensagem);
            apiException.setHttpStatus(HttpStatus.BAD_REQUEST);
            apiException.setTimeStamp(LocalDateTime.now());
        });
        return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body(apiException);

    }

}
