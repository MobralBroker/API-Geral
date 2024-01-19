package com.solinfbroker.apigeral.config.exceptions;

import lombok.AllArgsConstructor;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.time.LocalDateTime;

@ControllerAdvice
@AllArgsConstructor
public class ApiExceptionHandler {

    private final MessageSource messageSource;
    @ExceptionHandler(value = {ApiRequestException.class})
    public ResponseEntity<Object> handleApiRequestException(ApiRequestException apiRequestException){
        ApiExcept apiExcept = new ApiExcept(
                apiRequestException.getMessage(),
                HttpStatus.BAD_REQUEST,
                LocalDateTime.now()
        );
        return new ResponseEntity<>(apiExcept, HttpStatus.BAD_REQUEST);
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
    public ResponseEntity<ApiExcept> handleConstraintViolationException(MethodArgumentNotValidException ex) {
        ApiExcept apiExcept = new ApiExcept();
        ex.getBindingResult().getFieldErrors().forEach( e -> {
            String mensagem = e.getField().concat(" ").concat(messageSource.getMessage(e, LocaleContextHolder.getLocale()));
            apiExcept.setMensagem(mensagem);
            apiExcept.setHttpStatus(HttpStatus.BAD_REQUEST);
            apiExcept.setTimeStamp(LocalDateTime.now());
        });
        return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body(apiExcept);

    }

}
