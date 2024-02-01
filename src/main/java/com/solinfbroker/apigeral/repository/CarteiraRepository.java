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

  @Query(value="SELECT ca.id_cliente, ca.id_ativo, SUM(ca.quantidade) as quantidade, at.sigla, SUM(ca.quantidade_bloqueada) as quantidade_bloqueada  " +
          "FROM carteira ca JOIN ativo at ON ca.id_ativo = at.id WHERE ca.id_cliente = :idCliente GROUP BY ca.id_cliente, ca.id_ativo, at.sigla order by at.sigla ASC", nativeQuery = true)
  List<Object[]> listarItensCarteira(@Param("idCliente") Long idCliente);

  @Query(value = "select sum(quantidade) from carteira  where id_cliente = ?1 and id_ativo = ?2", nativeQuery = true)
  int buscarQuantideCarteira(Long idCliente, Long idAtivo);

  @Query(value = "select * from carteira  where id_cliente = ?1 and id_ativo = ?2 order by quantidade_bloqueada desc", nativeQuery = true)
  List<CarteiraModel> listarItensBloqueadoCarteira(Long idCliente, Long idAtivo);

  @Query(value = "select sum(quantidade_bloqueada) from carteira  where id_cliente = ?1 and id_ativo = ?2", nativeQuery = true)
  Integer buscarQuantidadeBloqueadoCarteira(Long idCliente, Long idAtivo);

  @Query(value = "SELECT SUM(CASE WHEN (quantidade_bloqueada*-1 - quantidade ) >= :valorLimite THEN 1 ELSE 0 END) > 0 " +
          "FROM carteira " +
          "WHERE id_cliente = :idCliente AND id_ativo = :idAtivo", nativeQuery = true)
  boolean verificarDiferencaMaiorQueLimite(@Param("idCliente") Long idCliente,
                                           @Param("idAtivo") Long idAtivo,
                                           @Param("valorLimite") Integer valorLimite);

} 