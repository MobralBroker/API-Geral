package com.solinfbroker.apigeral.controller;

import com.solinfbroker.apigeral.model.Operacao;
import com.solinfbroker.apigeral.model.Ordem;
import com.solinfbroker.apigeral.model.enumStatus;
import com.solinfbroker.apigeral.model.enumTipoOrdem;
import com.solinfbroker.apigeral.repository.OperacaoRepository;
import com.solinfbroker.apigeral.repository.OrdemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/ordem")
public class OrdemController {
    @Autowired
    OrdemRepository ordemRepository;

    @Autowired
    OperacaoRepository operacaoRepository;


    @GetMapping
    private ResponseEntity listarOrdens(){
        return ResponseEntity.ok(ordemRepository.findAll());
    }

    @GetMapping("/{id}")
    private ResponseEntity buscarOrdem(@PathVariable Long id){
        Ordem ordem =ordemRepository.findById(id).get();
        if(ordem.getTipoOrdem().equals(enumTipoOrdem.ORDEM_VENDA)){
            ordem.setOperacoes(operacaoRepository.findByIdVenda(ordem.getId()));
        }else{
            ordem.setOperacoes(operacaoRepository.findByIdCompra(ordem.getId()));
        }

        return ResponseEntity.ok(ordem);
    }

    @PostMapping
    private ResponseEntity criarOrdem(@RequestBody Ordem ordem){
        Ordem ordemSalva = ordemRepository.save(ordem);
        List<Operacao> operacaoList = new ArrayList<>();
        if(ordemSalva.getTipoOrdem().equals(enumTipoOrdem.ORDEM_VENDA)){
            Operacao operacao = new Operacao();
            operacao.setQuantidade(ordemSalva.getQuantidadeOrdem());
            operacao.setDataExecucao(LocalDateTime.now());
            operacao.setStatusOperacao(enumStatus.EXECUTADA);
//            operacao.setIdVenda(ordemSalva.getId());
//            operacao.setIdCompra(ordemRepository.findByTipoOrdem(enumTipoOrdem.ORDEM_COMPRA).get(0).getId());
            operacao.setOrdemVenda(ordemSalva);
//            Ordem oc = ;
            operacao.setOrdemCompra(ordemRepository.findByTipoOrdem(enumTipoOrdem.ORDEM_COMPRA).get(0));
            operacaoList.add(operacaoRepository.save(operacao));
        }
        return ResponseEntity.ok(operacaoList);
    }

}
