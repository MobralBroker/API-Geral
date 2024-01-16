package com.solinfbroker.apigeral.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;
import java.util.Set;

@Entity
@Data
@EqualsAndHashCode
@Table(name = "ordem_compra")
public class OrdemCompraModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private double valorCompra;
    private LocalDateTime dataCompra;
    private Integer quantidade; //TODO alterar banco
    private enumStatusOperacao status; //TODO alterar banco
    private LocalDateTime dataExecutada;

    @ManyToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "id_cliente")
    private ClienteModel cliente;

    @ManyToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "id_ativo")
    private AtivoModel ativo;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "compra_venda", joinColumns =  @JoinColumn(name="id_compra"), inverseJoinColumns = @JoinColumn(name="id_venda"))
    private Set<OrdemVendaModel> ordemVendas;
}
