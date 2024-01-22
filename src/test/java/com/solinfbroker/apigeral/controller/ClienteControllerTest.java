package com.solinfbroker.apigeral.controller;

import com.solinfbroker.apigeral.config.exceptions.RecursoNaoEncontradoException;
import com.solinfbroker.apigeral.model.ClienteModel;
import com.solinfbroker.apigeral.service.ClienteService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.context.ActiveProfiles;

import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
@ActiveProfiles("test")
class ClienteControllerTest {
    @Mock
    ClienteService clienteService;

    @InjectMocks
    private ClienteController clienteController;

    @Test
    void buscarClienteSucesso() {
        Long id = 1L;
        when(clienteService.buscarCliente(id)).thenReturn(Optional.of(new ClienteModel()));
        assertThat(clienteController.buscarCliente(id)).isNotNull();
    }

    @Test
    void buscarClienteErro() {
        Long id = 1L;
        when(clienteService.buscarCliente(id)).thenReturn(Optional.empty());
        assertThrows(RecursoNaoEncontradoException.class,()->{
            clienteController.buscarCliente(id);
        });
    }

    @Test
    void adicionarSaldo() {
        Long id = 1L;
        double valor = 10;

        assertThat(clienteController.adicionarSaldo(id,valor)).isNotNull();
    }

    @Test
    void sacarSaldo() {
        Long id = 1L;
        double valor = 10;

        assertThat(clienteController.sacarSaldo(id,valor)).isNotNull();
    }

    @Test
    void atualizarUsuario() {
        Long id = 1L;

        assertThat(clienteController.atualizarUsuario(new ClienteModel(),id)).isNotNull();
    }
}