package com.solinfbroker.apigeral.repository;

import com.solinfbroker.apigeral.dtos.OperacaoDTO;
import com.solinfbroker.apigeral.model.Operacao;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Set;

public interface OperacaoRepository extends JpaRepository<Operacao,Long> {

    List<OperacaoDTO> findByIdVenda(Long id);
    List<OperacaoDTO> findByIdCompra(Long id);

}
