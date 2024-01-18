package com.solinfbroker.apigeral.repository;

import com.solinfbroker.apigeral.model.Ordem;
import com.solinfbroker.apigeral.model.enumTipoOrdem;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrdemRepository extends JpaRepository<Ordem,Long> {

    List<Ordem> findByTipoOrdem(enumTipoOrdem tipo);
}
