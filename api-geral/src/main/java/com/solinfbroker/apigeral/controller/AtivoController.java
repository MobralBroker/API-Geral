package com.solinfbroker.apigeral.controller;


import com.solinfbroker.apigeral.model.AtivoModel;
import com.solinfbroker.apigeral.repository.AtivoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/ativo")
public class AtivoController {

    @Autowired
    private AtivoRepository ativoRepository;

    @GetMapping
    private ResponseEntity listarAtivos(){
        return ResponseEntity.ok(ativoRepository.findAll());
    }

    @GetMapping("/{id}")
    private ResponseEntity buscarAtivo(@PathVariable Long id){
        return ResponseEntity.ok(ativoRepository.findById(id));
    }
    @PostMapping
    private ResponseEntity criarAtivo(@RequestBody AtivoModel ativo){
        return ResponseEntity.ok(ativoRepository.save(ativo));
    }

    //TODO criar um método para retornar os ativos do mercado

}
