package com.solinfbroker.apigeral.repository;

import com.solinfbroker.apigeral.model.CarteiraModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface CarteiraRepository extends JpaRepository<CarteiraModel, Long>{
  List<CarteiraModel> findByClienteId(@Param("idCliente") Long idCliente);
} 