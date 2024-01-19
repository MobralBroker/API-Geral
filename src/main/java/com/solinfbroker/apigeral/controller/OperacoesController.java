package com.solinfbroker.apigeral.controller;

import com.solinfbroker.apigeral.model.*;
import com.solinfbroker.apigeral.repository.OperacaoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
@RequestMapping("/operacao")
public class OperacoesController {

    private final OperacaoRepository operacaoRepository;

    @GetMapping("/operacao")
    public ResponseEntity<List<Operacao>> listarOperacao(){
        return ResponseEntity.ok(operacaoRepository.findAll());
    }

    @GetMapping("/operacao/{id}")
    public ResponseEntity<Optional<Operacao>> buscarOperacao(@PathVariable Long id){
        return ResponseEntity.ok(operacaoRepository.findById(id));
    }
    @PostMapping
    public ResponseEntity<Operacao> criarOperacao(@RequestBody Operacao op){
        return ResponseEntity.ok(operacaoRepository.save(op));
    }
}
