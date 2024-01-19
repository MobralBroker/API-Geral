package com.solinfbroker.apigeral.repository;

import com.solinfbroker.apigeral.model.AtivoModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface AtivoRepository extends JpaRepository<AtivoModel,Long> {
  List<AtivoModel> findByEmpresaId(@Param("idEmpresa") Long idEmpresa);
}
