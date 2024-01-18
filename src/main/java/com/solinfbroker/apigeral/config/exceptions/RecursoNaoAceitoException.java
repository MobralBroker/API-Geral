package com.solinfbroker.apigeral.config.exceptions;

public class RecursoNaoAceitoException extends RuntimeException{
    public RecursoNaoAceitoException(String recursoNome, String motivo) {
        super(String.format("%s não aceito, pois %s", recursoNome, motivo));
    }
}
