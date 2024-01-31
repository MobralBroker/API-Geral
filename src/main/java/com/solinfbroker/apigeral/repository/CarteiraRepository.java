package com.solinfbroker.apigeral.repository;

import com.solinfbroker.apigeral.model.CarteiraModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CarteiraRepository extends JpaRepository<CarteiraModel, Long>{

  List<CarteiraModel> findByClienteId(@Param("idCliente") Long idCliente);

  @Query(value="SELECT ca.id_cliente, ca.id_ativo, SUM(ca.quantidade) as quantidade, at.sigla  " +
          "FROM carteira ca JOIN ativo at ON ca.id_ativo = at.id WHERE ca.id_cliente = :idCliente GROUP BY ca.id_cliente, ca.id_ativo, at.sigla order by at.sigla ASC", nativeQuery = true)
  List<Object[]> listarItensCarteira(@Param("idCliente") Long idCliente);

  @Query(value = "select sum(quantidade) from carteira  where id_cliente = ?1 and id_ativo = ?2", nativeQuery = true)
  Integer buscarItensCarteira(Long idCliente, Long idAtivo);
} 