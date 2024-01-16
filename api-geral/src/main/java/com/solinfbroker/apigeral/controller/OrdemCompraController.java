package com.solinfbroker.apigeral.controller;

import com.solinfbroker.apigeral.model.OrdemCompraModel;
import com.solinfbroker.apigeral.repository.OrdemCompraRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/ordem-compra")
public class OrdemCompraController {

    @Autowired
    OrdemCompraRepository ordemCompraRepository;
    @GetMapping
    private ResponseEntity listarOrdemCompra(){
        return ResponseEntity.ok(ordemCompraRepository.findAll());
    }

    @GetMapping("/{id}")
    private ResponseEntity buscarOrdemCompra(@PathVariable Long id){
        return ResponseEntity.ok(ordemCompraRepository.findById(id));
    }
    @PostMapping
    private ResponseEntity criarOrdem(@RequestBody OrdemCompraModel ordemCompraModel){
        return ResponseEntity.ok(ordemCompraRepository.save(ordemCompraModel));

    }
}
