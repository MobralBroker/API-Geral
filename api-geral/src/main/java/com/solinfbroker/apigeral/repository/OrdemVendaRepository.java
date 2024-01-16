package com.solinfbroker.apigeral.repository;

import com.solinfbroker.apigeral.model.OrdemVendaModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrdemVendaRepository extends JpaRepository<OrdemVendaModel,Long> {
}
