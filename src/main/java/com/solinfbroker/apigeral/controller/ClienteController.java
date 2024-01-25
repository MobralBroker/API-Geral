package com.solinfbroker.apigeral.controller;

import com.solinfbroker.apigeral.config.exceptions.RecursoNaoEncontradoException;
import com.solinfbroker.apigeral.model.ClienteModel;
import com.solinfbroker.apigeral.service.ClienteService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/cliente")
@Tag(name = "Controller Cliente")
public class ClienteController {

    private final ClienteService clienteService;

    @GetMapping("/{id}")
    @Operation(
    summary = "Realiza a listagem apenas do cliente que for passado por parâmetro id",
    method = "GET")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Listagem do cliente foi executada com suceso."),
        @ApiResponse(responseCode = "204", description = "A solicitação foi bem sucedida, porém não há conteúdo para enviar."),
        @ApiResponse(responseCode = "400", description = "Parametros inválidos"),
        @ApiResponse(responseCode = "403", description = "A solicitação não pode ser realizada por falta de autenticação."),
        @ApiResponse(responseCode = "404", description = "A solicitação não pode ser realizada pois o id passado não existe."),
        @ApiResponse(responseCode = "500", description = "Indica erro no servidor."),
    })
    public ResponseEntity<ClienteModel> buscarCliente(@PathVariable Long id){
        return clienteService.buscarCliente(id).map(ResponseEntity::ok)
                .orElseThrow(() -> new RecursoNaoEncontradoException("Cliente", "id", id));
    }

    @Operation(summary = "Realiza a adição saldo para o cliente passando o id do cliente em questão pelo parâmetro", method = "PUT")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Saldo adicionado para o cliente com sucesso."),
        @ApiResponse(responseCode = "403", description = "A solicitação não pode ser realizada por falta de autenticação."),
        @ApiResponse(responseCode = "404", description = "A solicitação não pode ser realizada pois o id passado não existe."),
        @ApiResponse(responseCode = "422", description = "Dados de requisição inválida"),
        @ApiResponse(responseCode = "500", description = "Indica erro no servidor"),
    })
    @PutMapping("/adicionar-saldo/{id}")
    public ResponseEntity<ClienteModel> adicionarSaldo(@PathVariable Long id, @RequestParam(value = "valor")double valor ){
        return ResponseEntity.ok(clienteService.addSaldo(id,valor));
    }

    @Operation(summary = "Realiza o saque do saldo para o cliente passando o id do cliente em questão pelo parâmetro", method = "PUT")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Saldo sacado para o cliente com sucesso."),
        @ApiResponse(responseCode = "403", description = "A solicitação não pode ser realizada por falta de autenticação."),
        @ApiResponse(responseCode = "404", description = "A solicitação não pode ser realizada pois o id passado não existe."),
        @ApiResponse(responseCode = "422", description = "Dados de requisição inválida"),
        @ApiResponse(responseCode = "500", description = "Indica erro no servidor"),
    })
    @PutMapping("/sacar-saldo/{id}")
    public ResponseEntity<ClienteModel> sacarSaldo(@PathVariable Long id, @RequestParam(value = "valor")double valor ){
        return ResponseEntity.ok(clienteService.sacarSaldo(id,valor));
    }

    @Operation(summary = "Realiza a atualização dos dados do cliente passando o id do cliente em questão pelo parâmetro", method = "PUT")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Dados atualizados com sucesso."),
        @ApiResponse(responseCode = "403", description = "A solicitação não pode ser realizada por falta de autenticação."),
        @ApiResponse(responseCode = "404", description = "A solicitação não pode ser realizada pois o id passado não existe."),
        @ApiResponse(responseCode = "422", description = "Dados de requisição inválida"),
        @ApiResponse(responseCode = "500", description = "Indica erro no servidor"),
    })
    @PutMapping("/usuario/{id}")
    public ResponseEntity<ClienteModel> atualizarUsuario(@RequestBody ClienteModel cliente, @PathVariable Long id ){
        return ResponseEntity.ok(clienteService.atualizarUsuario(cliente,id));
    }
}
