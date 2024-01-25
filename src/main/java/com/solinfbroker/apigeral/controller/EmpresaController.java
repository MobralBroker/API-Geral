package com.solinfbroker.apigeral.controller;

import com.solinfbroker.apigeral.model.EmpresaModel;
import com.solinfbroker.apigeral.repository.EmpresaRepository;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;


@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/empresa")
@Tag(name = "Controller Empresa")
public class EmpresaController {

    private final EmpresaRepository empresaRepository;

    @GetMapping
        @Operation(
        summary = "Realiza a listagem de todos as empresas que se encontram no banco de dados",
        method = "GET")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Listagem de empresas executada com suceso."),
        @ApiResponse(responseCode = "204", description = "A solicitação foi bem sucedida, porém não há conteúdo para enviar."),
        @ApiResponse(responseCode = "403", description = "A solicitação não pode ser realizada por falta de autenticação."),
        @ApiResponse(responseCode = "500", description = "Indica erro no servidor."),
    })
    public ResponseEntity<List<EmpresaModel>> listarEmpresa(){
        return ResponseEntity.ok(empresaRepository.findAll());
    }

    @Operation(
        summary = "Realiza a listagem apenas da empresa que for passado por parâmetro id",
        method = "GET")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Listagem da empresa executada com suceso."),
        @ApiResponse(responseCode = "204", description = "A solicitação foi bem sucedida, porém não há conteúdo para enviar."),
        @ApiResponse(responseCode = "400", description = "Parametros inválidos"),
        @ApiResponse(responseCode = "403", description = "A solicitação não pode ser realizada por falta de autenticação."),
        @ApiResponse(responseCode = "404", description = "A solicitação não pode ser realizada pois o id passado não existe."),
        @ApiResponse(responseCode = "500", description = "Indica erro no servidor."),
    })
    @GetMapping("/{id}")
    public ResponseEntity<Optional<EmpresaModel>> buscarEmpresa(@PathVariable Long id){
        return ResponseEntity.ok(empresaRepository.findById(id));
    }  

    @Operation(summary = "Realiza o cadastramento de novas empresas", method = "POST")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Cadastramento de uma nova empresa foi um sucesso."),
        @ApiResponse(responseCode = "403", description = "A solicitação não pode ser realizada por falta de autenticação."),
        @ApiResponse(responseCode = "422", description = "Dados de requisição inválida"),
        @ApiResponse(responseCode = "500", description = "Indica erro no servidor"),
    })
    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<EmpresaModel> criarEmpresa(@RequestBody @Valid EmpresaModel empresaModel){
        return ResponseEntity.ok(empresaRepository.save(empresaModel));
    }
  
}
