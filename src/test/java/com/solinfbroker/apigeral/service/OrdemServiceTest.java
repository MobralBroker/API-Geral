package com.solinfbroker.apigeral.service;

import com.solinfbroker.apigeral.config.exceptions.RecursoNaoAceitoException;
import com.solinfbroker.apigeral.dtos.OrdemDTO;
import com.solinfbroker.apigeral.model.ClienteModel;
import com.solinfbroker.apigeral.model.Ordem;
import com.solinfbroker.apigeral.model.enumStatus;
import com.solinfbroker.apigeral.model.enumTipoOrdem;
import com.solinfbroker.apigeral.repository.ClienteRepository;
import com.solinfbroker.apigeral.repository.OperacaoRepository;
import com.solinfbroker.apigeral.repository.OrdemRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.context.ActiveProfiles;

import java.util.*;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
@ActiveProfiles("test")
class OrdemServiceTest {
    @Mock
    private OrdemRepository ordemRepository;

    @Mock
    private OperacaoRepository operacaoRepository;
    @Mock
    private ClienteRepository clienteRepository;
    @InjectMocks
    private OrdemService ordemService;

    @Test
    void testListarOrdemSucesso() {
        List<Ordem> listaFake = Arrays.asList(
                new Ordem()
        );

        // Configura o mock para retornar a lista fake
        when(ordemRepository.findAll()).thenReturn(listaFake);

        // Chama o método que você está testando
        List<Ordem> listaRetornada = ordemService.listarOrdem();

        // Asserts para verificar se a lista retornada é a esperada
        assertNotNull(listaRetornada);
        assertEquals(1, listaRetornada.size());
    }


    @Test
    void testBuscarOrdemSucessoCompra() {
        Ordem ordemMock = mock(Ordem.class);
        Optional<Ordem> ordemOpt = Optional.of(ordemMock);



        when(ordemRepository.findById(1L)).thenReturn(ordemOpt);
        when(ordemOpt.get().getTipoOrdem()).thenReturn(enumTipoOrdem.ORDEM_COMPRA);

        assertThat(ordemService.buscarOrdem(1L)).isPresent();

    }

    @Test
    void testBuscarOrdemSucessoVenda() {
        Ordem ordemMock = mock(Ordem.class);
        Optional<Ordem> ordemOpt = Optional.of(ordemMock);
        when(ordemRepository.findById(1L)).thenReturn(ordemOpt);
        when(ordemOpt.get().getTipoOrdem()).thenReturn(enumTipoOrdem.ORDEM_VENDA);

        assertThat(ordemService.buscarOrdem(1L)).isPresent();

    }
    @Test
    void testCriarOrdemSucesso() {
        OrdemDTO ordem = mock(OrdemDTO.class);
        ClienteModel clienteMock = mock(ClienteModel.class);
        Optional<ClienteModel> clienteOpt = Optional.of(clienteMock);

        when(ordem.tipoOrdem()).thenReturn(enumTipoOrdem.ORDEM_COMPRA);
        when(clienteRepository.findById(any())).thenReturn(clienteOpt);
        when(clienteMock.getSaldo()).thenReturn(10.0);
        when(ordem.valorOrdem()).thenReturn(2.0);
        when(ordem.quantidadeOrdem()).thenReturn(2);
        when(ordemRepository.save(any())).thenReturn(new Ordem());

        assertThat(ordemService.criarOrdem(ordem)).isNotNull();
    }

    @Test
    void testCriarOrdemException() {
        OrdemDTO ordem = mock(OrdemDTO.class);
        ClienteModel clienteMock = mock(ClienteModel.class);
        Optional<ClienteModel> clienteOpt = Optional.of(clienteMock);

        when(ordem.tipoOrdem()).thenReturn(enumTipoOrdem.ORDEM_COMPRA);
        when(clienteRepository.findById(any())).thenReturn(clienteOpt);
        when(clienteMock.getSaldo()).thenReturn(1.0);
        when(ordem.valorOrdem()).thenReturn(2.0);
        when(ordem.quantidadeOrdem()).thenReturn(2);

        assertThrows(RecursoNaoAceitoException.class, () -> {
            ordemService.criarOrdem(ordem);
        });
    }

    @Test
    void testCriarOrdemErro() {
        OrdemDTO ordem = mock(OrdemDTO.class);
        ClienteModel clienteMock = mock(ClienteModel.class);
        Optional<ClienteModel> clienteOpt = Optional.of(clienteMock);

        when(ordem.tipoOrdem()).thenReturn(enumTipoOrdem.ORDEM_VENDA);
        when(clienteRepository.findById(any())).thenReturn(clienteOpt);
        when(ordem.valorOrdem()).thenReturn(2.0);
        when(ordem.quantidadeOrdem()).thenReturn(2);
        when(ordemRepository.save(any())).thenReturn(new Ordem());

        assertThat(ordemService.criarOrdem(ordem)).isNotNull();
    }

    @Test
    void testCancelarOrdemException() {
        Ordem ordem = mock(Ordem.class);
        Optional<Ordem> ordemOpt = Optional.of(ordem);

        when(ordemRepository.findById(1L)).thenReturn(ordemOpt);
        when(ordem.getStatusOrdem()).thenReturn(enumStatus.EXECUTADA);
        assertThat(ordemService.cancelarOrdem(1L)).isNotNull();
        when(ordemRepository.findById(1L)).thenReturn(Optional.of(ordem));

        assertThrows(RecursoNaoAceitoException.class, () -> {
            ordemService.cancelarOrdem(1L);
        });
    }
}






























