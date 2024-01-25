package com.solinfbroker.apigeral;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;

@SpringBootApplication
@OpenAPIDefinition(info = @Info(
		title = "API CRUD - SolinfBroker",
		version = "1.2",
		description = "Api responsável pelas requisições HTTP resposáveis por criar, atualizar, deletar e litar ativos, carteiras, empresas, clientes e ordens de compra e venda."))
public class ApiGeralApplication {

	public static void main(String[] args) {
		SpringApplication.run(ApiGeralApplication.class, args);
	}

}
