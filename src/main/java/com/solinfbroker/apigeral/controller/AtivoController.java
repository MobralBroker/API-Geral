package com.solinfbroker.apigeral.controller;


import com.solinfbroker.apigeral.model.AtivoModel;
import com.solinfbroker.apigeral.repository.AtivoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@RestController
@RequiredArgsConstructor
@RequestMapping("/ativo")
public class AtivoController {

    private final AtivoRepository ativoRepository;

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

    @GetMapping("/empresa")
    private ResponseEntity listarAtivosEmpresa(@RequestParam("idEmpresa") Long id) {
        return ResponseEntity.ok(ativoRepository.findByEmpresaId(id));//teste
    }

    @GetMapping("/sigla")
    private ResponseEntity listarAtivosSigla(@RequestParam("sigla") String sigla) {
        return ResponseEntity.ok(ativoRepository.findBysigla(sigla));
    }
    
}
