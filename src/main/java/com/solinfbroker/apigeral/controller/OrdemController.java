package com.solinfbroker.apigeral.controller;

import com.solinfbroker.apigeral.config.exceptions.RecursoNaoEncontradoException;
import com.solinfbroker.apigeral.dtos.OrdemDTO;
import com.solinfbroker.apigeral.model.Ordem;
import com.solinfbroker.apigeral.service.OrdemService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/ordem")
public class OrdemController {
    @Autowired
    OrdemService ordemService;

    @GetMapping
    private ResponseEntity listarOrdem(){
        return ResponseEntity.ok(ordemService.listarOrdem());
    }

    @GetMapping("/{id}")
    private ResponseEntity<?> buscarOrdem(@PathVariable Long id){
        return ordemService.buscarOrdem(id).map(ResponseEntity::ok)
                .orElseThrow(() -> new RecursoNaoEncontradoException("Ordem", "id", id));
    }

    @PostMapping
    private Ordem criarOrdem(@RequestBody @Valid OrdemDTO ordem){
        return ordemService.criarOrdem(ordem);
    }

    @PutMapping("/cancelar-ordem/{id}")
    private Ordem cancelarOrdem(@RequestBody OrdemDTO ordem, @PathVariable Long id){
        return ordemService.cancelarOrdem(id);
    }

}
