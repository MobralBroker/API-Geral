package com.solinfbroker.apigeral.repository;

import com.solinfbroker.apigeral.model.ClienteModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ClienteRepository extends JpaRepository<ClienteModel,Long> {

}
