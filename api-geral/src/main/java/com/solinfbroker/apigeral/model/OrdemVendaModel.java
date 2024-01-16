package com.solinfbroker.apigeral.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;
import java.util.Set;

@Entity
@Data
@EqualsAndHashCode
@Table(name = "ordem_venda")
public class OrdemVendaModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private double valorVenda;
    private LocalDateTime dataVenda;
    private Integer quantidadeVenda; //TODO alterar banco
    private enumStatusOperacao statusOperacao; //TODO alterar banco
    private LocalDateTime dataExecucao;

    @ManyToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "id_cliente")
    private ClienteModel cliente;

    @ManyToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "id_ativo")
    private AtivoModel ativo;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "compra_venda", joinColumns =  @JoinColumn(name="id_venda"), inverseJoinColumns = @JoinColumn(name="id_compra"))
    private Set<OrdemVendaModel> ordemVendas;

}
