package com.solinfbroker.apigeral.service;

import com.solinfbroker.apigeral.config.exceptions.RecursoNaoAceitoException;
import com.solinfbroker.apigeral.dtos.OrdemDTO;
import com.solinfbroker.apigeral.model.ClienteModel;
import com.solinfbroker.apigeral.model.enumTipoOrdem;
import com.solinfbroker.apigeral.repository.ClienteRepository;
import com.solinfbroker.apigeral.repository.OrdemRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class OrdemServiceTest {
    @Mock
    private OrdemRepository ordemRepository;

    @Mock
    private ClienteRepository clienteRepository;
    @InjectMocks
    private OrdemService ordemService;

//    @Test
//    void testListarOrdemSucesso() {
//        // Inicializa os mocks
//        MockitoAnnotations.openMocks(this);
//
//        List<Ordem> listaFake = Arrays.asList(
//                new Ordem()
//        );
//
//        // Configura o mock para retornar a lista fake
//        when(ordemRepository.findAll()).thenReturn(listaFake);
//
//        // Chama o método que você está testando
//        List<Ordem> listaRetornada = ordemService.listarOrdem();
//
//        // Asserts para verificar se a lista retornada é a esperada
//        assertNotNull(listaRetornada);
//        assertEquals(1, listaRetornada.size());
//    }
//
//    @Test
//    void testListarOrdemErro() {
//        // Inicializa os mocks
//        MockitoAnnotations.openMocks(this);
//
//        List<Ordem> listaFake = Arrays.asList(
//                new Ordem()
//        );
//
//        // Configura o mock para retornar a lista fake
//        when(ordemRepository.findAll()).thenReturn(listaFake);
//
//        // Chama o método que você está testando
//        List<Ordem> listaRetornada = ordemService.listarOrdem();
//
//        // Asserts para verificar se a lista retornada é a esperada
//        assertNotNull(listaRetornada);
//        assertNotEquals(0, listaRetornada.size());
//    }

    @Test
    void testBuscarOrdemSucesso() {
    }

    @Test
    void testBuscarOrdemErro() {
    }

    @Test
    void testCriarOrdemSucesso() {
    }

    @Test
    void testCriarOrdemErro() {

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
    void testCancelarOrdemSucesso() {

    }

    @Test
    void testCancelarOrdemErro() {
    }
}