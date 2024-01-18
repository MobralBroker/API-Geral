package com.solinfbroker.apigeral.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode
@Table(name = "ativo")
public class CarteiraModel {
  @Column(name = "id_cliente", nullable = false)
  private Long idCliente;

  @Column(name = "id_ativo", nullable = false)
  private Long idAtivo;

  @Column(nullable = false)
  private double quantidade;

  @OneToOne
  @JoinColumn(name = "id_cliente", referencedColumnName = "id", insertable = false, updatable = false)
  private ClienteModel cliente;

  @OneToMany
  @JoinColumn(name = "id_ativo", referencedColumnName = "id", insertable = false, updatable = false)
  private AtivoModel ativo;
}
