package com.solinfbroker.apigeral.controller;

import com.solinfbroker.apigeral.config.exceptions.RecursoNaoEncontradoException;
import com.solinfbroker.apigeral.dtos.OrdemDTO;
import com.solinfbroker.apigeral.model.Ordem;
import com.solinfbroker.apigeral.service.OrdemService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/ordem")
@Tag(name = "Controller Ordem")
public class OrdemController {

    private final OrdemService ordemService;

    @GetMapping
    @Operation(
        summary = "Realiza a listagem de todos os ativos que se encontram no banco de dados",
        method = "GET")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Listagem de ordens executada com suceso."),
        @ApiResponse(responseCode = "204", description = "A solicitação foi bem sucedida, porém não há conteúdo para enviar."),
        @ApiResponse(responseCode = "400", description = "Parametros inválidos"),
        @ApiResponse(responseCode = "403", description = "A solicitação não pode ser realizada por falta de autenticação."),
        @ApiResponse(responseCode = "404", description = "A solicitação não pode ser realizada pois o id passado não existe."),
        @ApiResponse(responseCode = "500", description = "Indica erro no servidor."),
    })
    public ResponseEntity<List<Ordem>> listarOrdem(){
        return ResponseEntity.ok(ordemService.listarOrdem());
    }

    @Operation(
        summary = "Realiza a listagem apenas de ordens que for passado por parâmetro id",
        method = "GET")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Listagem de ordens foi executada com suceso."),
        @ApiResponse(responseCode = "204", description = "A solicitação foi bem sucedida, porém não há conteúdo para enviar."),
        @ApiResponse(responseCode = "400", description = "Parametros inválidos"),
        @ApiResponse(responseCode = "403", description = "A solicitação não pode ser realizada por falta de autenticação."),
        @ApiResponse(responseCode = "404", description = "A solicitação não pode ser realizada pois o id passado não existe."),
        @ApiResponse(responseCode = "500", description = "Indica erro no servidor."),
    })
    @GetMapping("/{id}")
    public ResponseEntity<Ordem> buscarOrdem(@PathVariable Long id){
        return ordemService.buscarOrdem(id).map(ResponseEntity::ok)
                .orElseThrow(() -> new RecursoNaoEncontradoException("Ordem", "id", id));
    }

    @Operation(
        summary = "Realiza a listagem apenas de ordens que o cliente tem passando o id do cliente como parametro",
        method = "GET")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Listagem de ordens foi executada com suceso."),
        @ApiResponse(responseCode = "204", description = "A solicitação foi bem sucedida, porém não há conteúdo para enviar."),
        @ApiResponse(responseCode = "400", description = "Parametros inválidos"),
        @ApiResponse(responseCode = "403", description = "A solicitação não pode ser realizada por falta de autenticação."),
        @ApiResponse(responseCode = "404", description = "A solicitação não pode ser realizada pois o id passado não existe."),
        @ApiResponse(responseCode = "500", description = "Indica erro no servidor."),
    })
    @GetMapping("/cliente/{id}")
    public ResponseEntity<List<Ordem>> buscarOrdemCliente(@PathVariable Long id){
        List<Ordem> ordens = ordemService.buscarOrdemCliente(id);
        if(ordens.isEmpty()){
            throw new RecursoNaoEncontradoException("Ordem", "id do cliente ", id);
        }
        return ResponseEntity.ok(ordens);
    }

    @Operation(summary = "Realiza o cadastramento de novas ordens de compra e de venda", method = "POST")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Cadastramento de uma nova ordem foi um sucesso."),
        @ApiResponse(responseCode = "403", description = "A solicitação não pode ser realizada por falta de autenticação."),
        @ApiResponse(responseCode = "404", description = "A solicitação não pode ser realizada pois o id passado não existe."),
        @ApiResponse(responseCode = "422", description = "Dados de requisição inválida"),
        @ApiResponse(responseCode = "500", description = "Indica erro no servidor"),
    })
    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public Ordem criarOrdem(@RequestBody @Valid OrdemDTO ordem){
        return ordemService.criarOrdem(ordem);
    }

    @Operation(summary = "Realiza o cancelamento de novas ordens de compra e de venda", method = "PUT")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Cancelamento de uma nova ordem foi um sucesso."),
        @ApiResponse(responseCode = "403", description = "A solicitação não pode ser realizada por falta de autenticação."),
        @ApiResponse(responseCode = "404", description = "A solicitação não pode ser realizada pois o id passado não existe."),
        @ApiResponse(responseCode = "422", description = "Dados de requisição inválida"),
        @ApiResponse(responseCode = "500", description = "Indica erro no servidor"),
    })
    @PutMapping("/cancelar-ordem/{id}")
    public Ordem cancelarOrdem(@RequestBody OrdemDTO ordem, @PathVariable Long id){
        return ordemService.cancelarOrdem(id);
    }

}
