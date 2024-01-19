package com.solinfbroker.apigeral.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.solinfbroker.apigeral.model.CarteiraModel;
import com.solinfbroker.apigeral.repository.CarteiraRepository;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;



@RestController
@RequiredArgsConstructor
@RequestMapping("/carteira")
public class CarteiraController {


  private final CarteiraRepository carteiraRepository;

  @GetMapping
  private ResponseEntity listarAtivos(){
      return ResponseEntity.ok(carteiraRepository.findAll());
  }
  

  // @GetMapping("/{id}")
  // private ResponseEntity buscarAtivo(@PathVariable Long id){
  //     return ResponseEntity.ok(carteiraRepository.findById(id));
  // }  
  // @PostMapping
  // private ResponseEntity criarCarteira(@RequestBody CarteiraModel carteira){
  //   return ResponseEntity.ok(carteiraRepository.save(carteira));
  // }
  
}
