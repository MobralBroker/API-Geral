package com.solinfbroker.apigeral.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.solinfbroker.apigeral.model.EmpresaModel;
import org.springframework.stereotype.Repository;

@Repository
public interface EmpresaRepository extends JpaRepository<EmpresaModel, Long>{

  
} 