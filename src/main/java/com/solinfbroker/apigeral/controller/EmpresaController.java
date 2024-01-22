package com.solinfbroker.apigeral.controller;

import com.solinfbroker.apigeral.model.EmpresaModel;
import com.solinfbroker.apigeral.repository.EmpresaRepository;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;


@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/empresa")
public class EmpresaController {

    private final EmpresaRepository empresaRepository;

    @GetMapping
    public ResponseEntity<List<EmpresaModel>> listarEmpresa(){
        return ResponseEntity.ok(empresaRepository.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Optional<EmpresaModel>> buscarEmpresa(@PathVariable Long id){
        return ResponseEntity.ok(empresaRepository.findById(id));
    }

    @PostMapping
    public ResponseEntity<EmpresaModel> criarEmpresa(@RequestBody @Valid EmpresaModel empresaModel){
        return ResponseEntity.ok(empresaRepository.save(empresaModel));
    }
  
}
