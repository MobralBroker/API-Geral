package com.solinfbroker.apigeral.controller;

import com.solinfbroker.apigeral.config.exceptions.RecursoNaoEncontradoException;
import com.solinfbroker.apigeral.model.ClienteModel;
import com.solinfbroker.apigeral.service.ClienteService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/cliente")
public class ClienteController {

    private final ClienteService clienteService;

    @GetMapping("/{id}")
    public ResponseEntity<ClienteModel> buscarCliente(@PathVariable Long id){
        return clienteService.buscarCliente(id).map(ResponseEntity::ok)
                .orElseThrow(() -> new RecursoNaoEncontradoException("Cliente", "id", id));
    }

    @PutMapping("/adicionar-saldo/{id}")
    public ResponseEntity<ClienteModel> adicionarSaldo(@PathVariable Long id, @RequestParam(value = "valor")double valor ){
        return ResponseEntity.ok(clienteService.addSaldo(id,valor));
    }

    @PutMapping("/sacar-saldo/{id}")
    public ResponseEntity<ClienteModel> sacarSaldo(@PathVariable Long id, @RequestParam(value = "valor")double valor ){
        return ResponseEntity.ok(clienteService.sacarSaldo(id,valor));
    }

    @PutMapping("/usuario/{id}")
    public ResponseEntity<ClienteModel> atualizarUsuario(@RequestBody ClienteModel cliente, @PathVariable Long id ){
        return ResponseEntity.ok(clienteService.atualizarUsuario(cliente,id));
    }
}
