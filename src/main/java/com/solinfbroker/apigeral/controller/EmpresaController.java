package com.solinfbroker.apigeral.controller;

import com.solinfbroker.apigeral.model.AtivoModel;
import com.solinfbroker.apigeral.model.EmpresaModel;
import com.solinfbroker.apigeral.repository.EmpresaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;


@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/empresa")
public class EmpresaController {

    private final EmpresaRepository empresaRepository;

    @GetMapping
    private ResponseEntity listarEmpresa(){
        return ResponseEntity.ok(empresaRepository.findAll());
    }

    @GetMapping("/{id}")
    private ResponseEntity buscarEmpresa(@PathVariable Long id){
        return ResponseEntity.ok(empresaRepository.findById(id));
    }

    @PostMapping
    private ResponseEntity criarEmpresa(@RequestBody EmpresaModel empresaModel){
        return ResponseEntity.ok(empresaRepository.save(empresaModel));
    }
  
}
