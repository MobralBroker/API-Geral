package com.solinfbroker.apigeral.model;

import java.sql.Date;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity
@Data
@EqualsAndHashCode
@Table(name = "ativo")
public class Ativo {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(name = "id_empresa", nullable = false)
  private long idEmpresa;

  @Column(name = "sigla", nullable = false, length = 10)
  private String sigla;

  @Column(name = "nome", nullable = false, length = 50)
  private String nome;

  @Column(name = "atualizacao", nullable = false)
  private Date atualizacao;

  @Column(name = "quantidades_papeis", nullable = false)
  private int quantidadesPapeis;

  @Column(name = "valor_max", nullable = false)
  private double valorMax;

  @Column(name = "valor_min", nullable = false)
  private double valorMin;

  @Column(name = "valor", nullable = false)
  private double valor;

  @ManyToOne
  @JoinColumn(name = "id_empresa", referencedColumnName = "id", insertable = false, updatable = false)
  private EmpresaModel empresa;
}