package com.solinfbroker.apigeral.controller;


import com.solinfbroker.apigeral.model.AtivoModel;
import com.solinfbroker.apigeral.repository.AtivoRepository;

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
@RequestMapping("/ativo")
@Tag(name = "Controller Ativo")
public class AtivoController {

    private final AtivoRepository ativoRepository;

    @GetMapping
    @Operation(
        summary = "Realiza a listagem de todos os ativos que se encontram no banco de dados",
        method = "GET")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Listagem de ativos executada com suceso."),
        @ApiResponse(responseCode = "204", description = "A solicitação foi bem sucedida, porém não há conteúdo para enviar."),
        @ApiResponse(responseCode = "403", description = "A solicitação não pode ser realizada por falta de autenticação."),
        @ApiResponse(responseCode = "500", description = "Indica erro no servidor."),
    })
    public ResponseEntity<List<AtivoModel>> listarAtivos(){
        return ResponseEntity.ok(ativoRepository.findAllByOrderByAtualizacaoDesc());
    }

    @Operation(
        summary = "Realiza a listagem apenas do ativo que for passado por parâmetro id",
        method = "GET")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Listagem de ativos executada com suceso."),
        @ApiResponse(responseCode = "204", description = "A solicitação foi bem sucedida, porém não há conteúdo para enviar."),
        @ApiResponse(responseCode = "400", description = "Parametros inválidos"),
        @ApiResponse(responseCode = "403", description = "A solicitação não pode ser realizada por falta de autenticação."),
        @ApiResponse(responseCode = "404", description = "A solicitação não pode ser realizada pois o id passado não existe."),
        @ApiResponse(responseCode = "500", description = "Indica erro no servidor."),
    })
    @GetMapping("/{id}")
    public ResponseEntity<Optional<AtivoModel>> buscarAtivo(@PathVariable Long id){
        return ResponseEntity.ok(ativoRepository.findById(id));
    }

    @Operation(summary = "Realiza o cadastramento de novos ativos", method = "POST")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Cadastramento de um novo ativo foi um sucesso."),
        @ApiResponse(responseCode = "403", description = "A solicitação não pode ser realizada por falta de autenticação."),
        @ApiResponse(responseCode = "404", description = "A solicitação não pode ser realizada pois o id passado não existe."),
        @ApiResponse(responseCode = "422", description = "Dados de requisição inválida"),
        @ApiResponse(responseCode = "500", description = "Indica erro no servidor"),
    })
    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<AtivoModel> criarAtivo(@RequestBody AtivoModel ativo){
        return ResponseEntity.ok(ativoRepository.save(ativo));
    }

    @Operation(
        summary = "Realiza a listagem apenas do ativo que tem o id da empresa atrelado",
        method = "GET")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Listagem de ativos executada com suceso."),
        @ApiResponse(responseCode = "204", description = "A solicitação foi bem sucedida, porém não há conteúdo para enviar."),
        @ApiResponse(responseCode = "400", description = "Parametros inválidos"),
        @ApiResponse(responseCode = "403", description = "A solicitação não pode ser realizada por falta de autenticação."),
        @ApiResponse(responseCode = "404", description = "A solicitação não pode ser realizada pois o id passado não existe."),
        @ApiResponse(responseCode = "500", description = "Indica erro no servidor."),
    })
    @GetMapping("/empresa")
    public ResponseEntity<List<AtivoModel>> listarAtivosEmpresa(@RequestParam("idEmpresa") Long id) {
        return ResponseEntity.ok(ativoRepository.findByEmpresaId(id));
    }

    @Operation(
        summary = "Realiza a listagem apenas do ativo pela sigla passada por parâmetro",
        method = "GET")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Listagem de ativos executada com suceso."),
        @ApiResponse(responseCode = "204", description = "A solicitação foi bem sucedida, porém não há conteúdo para enviar."),
        @ApiResponse(responseCode = "400", description = "Parametros inválidos"),
        @ApiResponse(responseCode = "403", description = "A solicitação não pode ser realizada por falta de autenticação."),
        @ApiResponse(responseCode = "404", description = "A solicitação não pode ser realizada pois o parametro passado não existe."),
        @ApiResponse(responseCode = "500", description = "Indica erro no servidor."),
    })
    @GetMapping("/sigla")
    private ResponseEntity<List<AtivoModel>> listarAtivosSigla(@RequestParam("sigla") String sigla) {
        return ResponseEntity.ok(ativoRepository.findBysigla(sigla));
    }
    
}
