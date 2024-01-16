package com.solinfbroker.apigeral.controller;

import com.solinfbroker.apigeral.model.OrdemCompraModel;
import com.solinfbroker.apigeral.model.OrdemVendaModel;
import com.solinfbroker.apigeral.repository.OrdemVendaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/ordem-venda")
public class OrdemVendaController {

    @Autowired
    OrdemVendaRepository ordemVendaRepository;
    @PostMapping
    private ResponseEntity criarOrdem(@RequestBody OrdemVendaModel ordemVendaModel){
        return ResponseEntity.ok(ordemVendaRepository.save(ordemVendaModel));

    }
}
