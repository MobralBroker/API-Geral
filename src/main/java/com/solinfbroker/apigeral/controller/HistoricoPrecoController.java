package com.solinfbroker.apigeral.controller;

import com.solinfbroker.apigeral.model.HistoricoPreco;
import com.solinfbroker.apigeral.repository.HistoricoPrecoRepository;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/historico-preco")
@Tag(name = "Controller Historico Preço")
public class HistoricoPrecoController {

    private final HistoricoPrecoRepository historicoPrecoRepository;

    @GetMapping("/{id}")
    private ResponseEntity<List<HistoricoPreco>> listarHistoricoPreco(@PathVariable Long id){
        return ResponseEntity.ok(historicoPrecoRepository.findByIdAtivo(id));
    }

}
