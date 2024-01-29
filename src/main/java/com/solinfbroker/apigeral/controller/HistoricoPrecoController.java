package com.solinfbroker.apigeral.controller;

import com.solinfbroker.apigeral.model.HistoricoPreco;
import com.solinfbroker.apigeral.repository.HistoricoPrecoRepository;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.*;

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

    @GetMapping("/grafico-data/{id}")
    private ResponseEntity<Map<String, Object>> listarHistoricoPreco(@PathVariable Long id,
                                                                                 @RequestParam("dataInicial") LocalDateTime dataInicial,
                                                                                 @RequestParam("dataFinal") LocalDateTime dataFinal,
                                                                                 @RequestParam("periodo") String periodo){
        List<Object[]> historicoPrecos = historicoPrecoRepository.findHistoricoSimplificado(id,dataInicial,dataFinal, periodo);
        Map<String, Object> data = new HashMap<>();
        List<Map<String, Object>> dadosFormatados = new ArrayList<>();
        for (Object[] resultado : historicoPrecos) {
            Map<String, Object> dados = new HashMap<>();
            dados.put("x", resultado[0]); // data
            dados.put("y", Arrays.asList(resultado[1], resultado[2], resultado[3], resultado[4])); // valores=
            dadosFormatados.add(dados);
            data.put("data",dadosFormatados);

        }
        return ResponseEntity.ok(data);
    }

    @GetMapping("/grafico/{id}")
    private ResponseEntity<Map<String, Object>> listarHistoricoPreco(@PathVariable Long id,
                                                                     @RequestParam("escala") String escala,
                                                                     @RequestParam("periodo") long periodo){
        LocalDateTime dataFinal = LocalDateTime.now();
        LocalDateTime dataInicial = LocalDateTime.now().minusDays(periodo);
        List<Object[]> historicoPrecos = historicoPrecoRepository.findHistoricoSimplificado(id,dataInicial,dataFinal, escala);
        Map<String, Object> data = new HashMap<>();
        List<Map<String, Object>> dadosFormatados = new ArrayList<>();
        for (Object[] resultado : historicoPrecos) {
            Map<String, Object> dados = new HashMap<>();
            dados.put("x", resultado[0]); // data
            dados.put("y", Arrays.asList(resultado[3], resultado[2], resultado[1], resultado[4])); // valores=
            dadosFormatados.add(dados);
            data.put("data",dadosFormatados);

        }
        return ResponseEntity.ok(data);
    }

}
