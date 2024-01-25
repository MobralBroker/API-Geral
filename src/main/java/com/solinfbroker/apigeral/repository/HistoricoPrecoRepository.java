package com.solinfbroker.apigeral.repository;

import com.solinfbroker.apigeral.model.HistoricoPreco;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface HistoricoPrecoRepository extends JpaRepository<HistoricoPreco,Long> {

    List<HistoricoPreco> findByIdAtivo(Long id);
}
