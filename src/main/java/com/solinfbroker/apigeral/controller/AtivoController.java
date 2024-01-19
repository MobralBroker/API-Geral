package com.solinfbroker.apigeral.controller;


import com.solinfbroker.apigeral.model.AtivoModel;
import com.solinfbroker.apigeral.repository.AtivoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;


@RestController
@RequiredArgsConstructor
@RequestMapping("/ativo")
public class AtivoController {

    private final AtivoRepository ativoRepository;

    @GetMapping
    public ResponseEntity<List<AtivoModel>> listarAtivos(){
        return ResponseEntity.ok(ativoRepository.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Optional<AtivoModel>> buscarAtivo(@PathVariable Long id){
        return ResponseEntity.ok(ativoRepository.findById(id));
    }
    @PostMapping
    public ResponseEntity<AtivoModel> criarAtivo(@RequestBody AtivoModel ativo){
        return ResponseEntity.ok(ativoRepository.save(ativo));
    }

    @GetMapping("/empresa")
    public ResponseEntity<List<AtivoModel>> listarAtivosEmpresa(@RequestParam("idEmpresa") Long id) {
        return ResponseEntity.ok(ativoRepository.findByEmpresaId(id));

    @GetMapping("/sigla")
    private ResponseEntity<List<AtivoModel>> listarAtivosSigla(@RequestParam("sigla") String sigla) {
        return ResponseEntity.ok(ativoRepository.findBysigla(sigla));
    }
    
}
