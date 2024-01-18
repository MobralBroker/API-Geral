package com.solinfbroker.apigeral.repository;

import com.solinfbroker.apigeral.model.AtivoModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AtivoRepository extends JpaRepository<AtivoModel,Long> {
}
