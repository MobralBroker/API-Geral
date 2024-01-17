package com.solinfbroker.apigeral.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.time.LocalDate;

@Entity
@Data
@EqualsAndHashCode
@Table(name = "historico_preco")
public class HistoricoPrecoModel {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long Id;

  @Column(name = "id_ativo", nullable = false)
  private Long idAtivo;

  @Column(name = "data_valor", nullable = false)
  @JsonFormat(pattern="dd/MM/yyyy")
  private LocalDate dataValor;

  @Column(name = "valor_do_ativo", nullable = false)
  private double valorDoAtivo;

  @ManyToOne
  @JoinColumn(name = "id_ativo", referencedColumnName = "id", insertable = false, updatable = false)
  private AtivoModel ativo;
}
