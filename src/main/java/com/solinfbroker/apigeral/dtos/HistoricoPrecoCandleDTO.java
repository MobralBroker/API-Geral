package com.solinfbroker.apigeral.dtos;

import jakarta.persistence.Column;

import java.time.LocalDateTime;

public record HistoricoPrecoCandleDTO(
        @Column(name = "data")
        LocalDateTime data,

        @Column(name = "preco_minimo")
        double precoMinimo,
        @Column(name = "preco_maximo")
        double precoMaximo,
        @Column(name = "preco_abertura")
        double precoAbertura,
        @Column(name = "preco_fechamento")
        double precoFechamento
) {
}
