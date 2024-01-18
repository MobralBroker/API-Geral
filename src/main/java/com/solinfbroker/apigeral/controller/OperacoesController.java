package com.solinfbroker.apigeral.controller;

import com.solinfbroker.apigeral.model.*;
import com.solinfbroker.apigeral.repository.OperacaoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/operacao")
public class OperacoesController {

    @Autowired
    OperacaoRepository operacaoRepository;

    @GetMapping("/operacao")
    private ResponseEntity listarOperacao(){
        return ResponseEntity.ok(operacaoRepository.findAll());
    }

    @GetMapping("/operacao/{id}")
    private ResponseEntity buscarOperacao(@PathVariable Long id){
        return ResponseEntity.ok(operacaoRepository.findById(id));
    }
    @PostMapping
    private ResponseEntity criarOperacao(@RequestBody Operacao op){
        return ResponseEntity.ok(operacaoRepository.save(op));
    }
}
