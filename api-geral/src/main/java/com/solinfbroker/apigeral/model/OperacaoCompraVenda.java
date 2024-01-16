package com.solinfbroker.apigeral.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

@Entity
@Data
@EqualsAndHashCode
@Table(name = "operacao_compra_venda") //Todo alterar este campo no banco
public class OperacaoCompraVenda {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDateTime dataExecutada;

    private enumStatusOperacao statusOperacao;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_compra")
    private OrdemCompraModel ordemCompra;

    @ManyToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "id_venda")
    private OrdemVendaModel ordemVenda;

}
