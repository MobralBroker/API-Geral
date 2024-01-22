package com.solinfbroker.apigeral.controller;

import com.solinfbroker.apigeral.config.exceptions.RecursoNaoEncontradoException;
import com.solinfbroker.apigeral.dtos.OrdemDTO;
import com.solinfbroker.apigeral.model.Ordem;
import com.solinfbroker.apigeral.service.OrdemService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/ordem")
public class OrdemController {

    private final OrdemService ordemService;

    @GetMapping
    public ResponseEntity<List<Ordem>> listarOrdem(){
        return ResponseEntity.ok(ordemService.listarOrdem());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Ordem> buscarOrdem(@PathVariable Long id){
        return ordemService.buscarOrdem(id).map(ResponseEntity::ok)
                .orElseThrow(() -> new RecursoNaoEncontradoException("Ordem", "id", id));
    }
    @GetMapping("/cliente/{id}")
    public ResponseEntity<List<Ordem>> buscarOrdemCliente(@PathVariable Long id){
        List<Ordem> ordens = ordemService.buscarOrdemCliente(id);
        if(ordens.isEmpty()){
            throw new RecursoNaoEncontradoException("Ordem", "id do cliente ", id);
        }
        return ResponseEntity.ok(ordens);
    }

    @PostMapping
    public Ordem criarOrdem(@RequestBody @Valid OrdemDTO ordem){
        return ordemService.criarOrdem(ordem);
    }

    @PutMapping("/cancelar-ordem/{id}")
    public Ordem cancelarOrdem(@RequestBody OrdemDTO ordem, @PathVariable Long id){
        return ordemService.cancelarOrdem(id);
    }

}
