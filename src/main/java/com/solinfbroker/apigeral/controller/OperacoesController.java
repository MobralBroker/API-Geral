package com.solinfbroker.apigeral.controller;

import com.solinfbroker.apigeral.model.*;
import com.solinfbroker.apigeral.repository.OperacaoRepository;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
@RequestMapping("/operacao")
@Tag(name = "Controller Operação")
public class OperacoesController {

    private final OperacaoRepository operacaoRepository;

    @GetMapping("/operacao")
        @Operation(
        summary = "Realiza a listagem de todas as operações que se encontram no banco de dados",
        method = "GET")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Listagem de operações foi executada com suceso."),
        @ApiResponse(responseCode = "204", description = "A solicitação foi bem sucedida, porém não há conteúdo para enviar."),
        @ApiResponse(responseCode = "403", description = "A solicitação não pode ser realizada por falta de autenticação."),
        @ApiResponse(responseCode = "500", description = "Indica erro no servidor."),
    })
    public ResponseEntity<List<Operacao>> listarOperacao(){
        return ResponseEntity.ok(operacaoRepository.findAll());
    }

    @Operation(
        summary = "Realiza a listagem apenas da operação que for passado por parâmetro id",
        method = "GET")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Listagem de operações foi executada com suceso."),
        @ApiResponse(responseCode = "204", description = "A solicitação foi bem sucedida, porém não há conteúdo para enviar."),
        @ApiResponse(responseCode = "400", description = "Parametros inválidos"),
        @ApiResponse(responseCode = "403", description = "A solicitação não pode ser realizada por falta de autenticação."),
        @ApiResponse(responseCode = "404", description = "A solicitação não pode ser realizada pois o id passado não existe."),
        @ApiResponse(responseCode = "500", description = "Indica erro no servidor."),
    })
    @GetMapping("/operacao/{id}")
    public ResponseEntity<Optional<Operacao>> buscarOperacao(@PathVariable Long id){
        return ResponseEntity.ok(operacaoRepository.findById(id));
    }

    @Operation(summary = "Realiza o cadastramento de novas operações", method = "POST")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Cadastramento de uma nova operação foi um sucesso."),
        @ApiResponse(responseCode = "403", description = "A solicitação não pode ser realizada por falta de autenticação."),
        @ApiResponse(responseCode = "422", description = "Dados de requisição inválida"),
        @ApiResponse(responseCode = "500", description = "Indica erro no servidor"),
    })
    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Operacao> criarOperacao(@RequestBody Operacao op){
        return ResponseEntity.ok(operacaoRepository.save(op));
    }
}
