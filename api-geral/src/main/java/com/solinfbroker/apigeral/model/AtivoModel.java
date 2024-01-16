package com.solinfbroker.apigeral.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Data
@EqualsAndHashCode
@Table(name = "ativo")
public class AtivoModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String sigla;

    private String nome;

    @JsonFormat(pattern="dd/MM/yyyy")
    private LocalDate atualizacao;

    private Integer quantidadesPapeis;

    private double valorMax;

    private double valorMin;

    private double valor;

    @ManyToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "id_empresa")
    private EmpresaModel empresa;

}
