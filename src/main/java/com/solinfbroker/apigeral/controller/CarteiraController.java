package com.solinfbroker.apigeral.controller;

import com.solinfbroker.apigeral.dtos.CarteiraGrupoDTO;
import com.solinfbroker.apigeral.model.CarteiraModel;
import com.solinfbroker.apigeral.repository.CarteiraRepository;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
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
  @GetMapping("/cliente/{id}")
  public ResponseEntity<List<CarteiraGrupoDTO>> listarCarteiraIdCliente(@PathVariable Long id) {
    List<Object[]> resultados = carteiraRepository.listarItensCarteira(id);
    List<CarteiraGrupoDTO> carteiraDTOs = new ArrayList<>();

    for (Object[] resultado : resultados) {
      carteiraDTOs.add(new CarteiraGrupoDTO(
              (Long) resultado[0],
              (Long) resultado[1],
              (Long) resultado[2],
              (String) resultado[3]
      ));
    }
    return ResponseEntity.ok(carteiraDTOs);
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