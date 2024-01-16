package com.solinfbroker.apigeral.repository;

import com.solinfbroker.apigeral.model.OrdemCompraModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrdemCompraRepository extends JpaRepository<OrdemCompraModel,Long> {
}
