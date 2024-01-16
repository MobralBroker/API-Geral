package com.solinfbroker.apigeral.model;

import com.solinfbroker.apigeral.dtos.OperacaoDTO;
import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Set;

@Entity
@Data
@Getter
@Setter
@EqualsAndHashCode
@Table(name = "ordem")
public class Ordem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "id_cliente", nullable = false)
    private Long idCliente;

    @Column(name = "id_ativo", nullable = false)
    private Long idAtivo;

    @Column(name = "tipo_ordem", nullable = false, length = 12)
    @Enumerated(EnumType.STRING)
    private enumTipoOrdem tipoOrdem;

    @Column(name = "valor_ordem", nullable = false)
    private double valorOrdem;

    @Column(name = "data_lancamento", nullable = false)
    private LocalDateTime dataLancamento;

    @Column(name = "quantidade_ordem", nullable = false)
    private Integer quantidadeOrdem;

    @Column(name = "quantidade_ordem_aberta", nullable = false)
    private Integer quantidadeAberto;

    @Column(name = "status_ordem", nullable = false, length = 10)
    @Enumerated(EnumType.STRING)
    private enumStatus statusOrdem;

    @Transient
    private List<OperacaoDTO> operacoes;

}
