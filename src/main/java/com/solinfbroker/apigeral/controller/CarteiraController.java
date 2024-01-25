package com.solinfbroker.apigeral.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.solinfbroker.apigeral.model.CarteiraModel;
import com.solinfbroker.apigeral.repository.CarteiraRepository;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@RestController
@RequiredArgsConstructor
@RequestMapping("/carteira")
@Tag(name = "Controller Carteira")
public class CarteiraController {

  private final CarteiraRepository carteiraRepository;

  @GetMapping
      @Operation(
        summary = "Realiza a listagem de todos os itens que se encontram na tabela Carteira no banco de dados",
        method = "GET")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Listagem de itens da Carteira executada com suceso."),
        @ApiResponse(responseCode = "204", description = "A solicitação foi bem sucedida, porém não há conteúdo para enviar."),
        @ApiResponse(responseCode = "403", description = "A solicitação não pode ser realizada por falta de autenticação."),
        @ApiResponse(responseCode = "500", description = "Indica erro no servidor."),
    })
  public ResponseEntity<List<CarteiraModel>> listarCarteiras(){
      return ResponseEntity.ok(carteiraRepository.findAll());
  }
  @Operation(
    summary = "Realiza a listagem apenas dos itens da Carteira que tem correlação com o id do cliente passado por parâmetro.",
    method = "GET")
@ApiResponses(value = {
    @ApiResponse(responseCode = "200", description = "Listagem de itens da Carteira executada com suceso."),
    @ApiResponse(responseCode = "204", description = "A solicitação foi bem sucedida, porém não há conteúdo para enviar."),
    @ApiResponse(responseCode = "400", description = "Parametros inválidos"),
    @ApiResponse(responseCode = "403", description = "A solicitação não pode ser realizada por falta de autenticação."),
    @ApiResponse(responseCode = "404", description = "A solicitação não pode ser realizada pois o id passado não existe."),
    @ApiResponse(responseCode = "500", description = "Indica erro no servidor."),
})
  @GetMapping("/cliente")
  public ResponseEntity<List<CarteiraModel>> listarCarteiraIdCliente(@RequestParam("idCliente") Long id) {
    return ResponseEntity.ok(carteiraRepository.findByClienteId(id));
  }
  @Operation(summary = "Realiza o cadastramento de novos itens da Carteira", method = "POST")
  @ApiResponses(value = {
      @ApiResponse(responseCode = "200", description = "Cadastramento de um novo item foi um sucesso."),
      @ApiResponse(responseCode = "403", description = "A solicitação não pode ser realizada por falta de autenticação."),
      @ApiResponse(responseCode = "404", description = "A solicitação não pode ser realizada pois o id passado não existe."),
      @ApiResponse(responseCode = "422", description = "Dados de requisição inválida"),
      @ApiResponse(responseCode = "500", description = "Indica erro no servidor"),
  })
  @PostMapping
  public ResponseEntity<CarteiraModel> criarCarteira(@RequestBody CarteiraModel carteira){
      return ResponseEntity.ok(carteiraRepository.save(carteira));
  }
}