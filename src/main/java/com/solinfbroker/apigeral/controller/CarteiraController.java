package com.solinfbroker.apigeral.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.solinfbroker.apigeral.model.CarteiraModel;
import com.solinfbroker.apigeral.repository.CarteiraRepository;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;



@RestController
@RequestMapping("/carteira")
public class CarteiraController {
  
  @Autowired
  private CarteiraRepository carteiraRepository;

  @GetMapping
  private ResponseEntity listarCarteiras(){
      return ResponseEntity.ok(carteiraRepository.findAll());
  }
  
  @GetMapping("/cliente")
  private ResponseEntity listarCarteiraIdCliente(@RequestParam("idCliente") Long id) {
    return ResponseEntity.ok(carteiraRepository.findByClienteId(id));
  }
  
  @PostMapping
  private ResponseEntity criarCarteira(@RequestBody CarteiraModel carteira){
      return ResponseEntity.ok(carteiraRepository.save(carteira));
  }
}