package com.solinfbroker.apigeral.repository;

import com.solinfbroker.apigeral.model.Ordem;
import com.solinfbroker.apigeral.model.enumTipoOrdem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface OrdemRepository extends JpaRepository<Ordem,Long> {

    List<Ordem> findByTipoOrdem(enumTipoOrdem tipo);

    List<Ordem> findByIdCliente(Long idCliente);

    @Query(value = "SELECT * FROM ordem o WHERE o.status_ordem = 'ABERTA' OR o.status_ordem = 'EXECUTADA_PARCIAL' order by data_lancamento desc ",nativeQuery = true)
    List<Ordem> findByStatusOrdemAberta();
}
