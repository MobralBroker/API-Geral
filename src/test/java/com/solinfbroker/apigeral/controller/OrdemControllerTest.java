package com.solinfbroker.apigeral.controller;

import com.solinfbroker.apigeral.config.exceptions.RecursoNaoEncontradoException;
import com.solinfbroker.apigeral.model.Ordem;
import com.solinfbroker.apigeral.service.OrdemService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.context.ActiveProfiles;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
@ActiveProfiles("test")
class OrdemControllerTest {

    @Mock
    OrdemService ordemService;
    @InjectMocks
    private OrdemController ordemController;

    @Test
    void listarOrdem() {
        List<Ordem> ordems = new ArrayList<>();
        when(ordemService.listarOrdem()).thenReturn(ordems);

        assertThat(ordemController.listarOrdem()).isNotNull();
    }

    @Test
    void buscarOrdemSucesso() {
        Long id = 1L;
        when(ordemService.buscarOrdem(id)).thenReturn(Optional.of(new Ordem()));
        assertThat(ordemController.buscarOrdem(id)).isNotNull();
    }

    @Test
    void buscarOrdemErro() {
        Long id = 1L;
        when(ordemService.buscarOrdem(id)).thenReturn(Optional.empty());
        assertThrows(RecursoNaoEncontradoException.class,() ->{
            ordemController.buscarOrdem(id);
                });
    }

    @Test
    void criarOrdem() {
        when(ordemService.criarOrdem(any())).thenReturn(new Ordem());
        assertThat(ordemController.criarOrdem(any())).isNotNull();
    }

    @Test
    void cancelarOrdem() {
        Long id = 1L;
        when(ordemService.cancelarOrdem(id)).thenReturn(new Ordem());
        assertThat(ordemController.cancelarOrdem(any(),id)).isNotNull();
    }
}