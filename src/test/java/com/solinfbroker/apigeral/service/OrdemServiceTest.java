package com.solinfbroker.apigeral.service;

import com.solinfbroker.apigeral.config.exceptions.RecursoNaoAceitoException;
import com.solinfbroker.apigeral.dtos.OrdemDTO;
import com.solinfbroker.apigeral.model.*;
import com.solinfbroker.apigeral.repository.CarteiraRepository;
import com.solinfbroker.apigeral.repository.ClienteRepository;
import com.solinfbroker.apigeral.repository.OperacaoRepository;
import com.solinfbroker.apigeral.repository.OrdemRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.context.ActiveProfiles;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyLong;
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

    @Mock
    private CarteiraRepository carteiraRepository;
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
    void testCriarOrdemCompraException() {
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
    void testCriarOrdemVendaErroSemAcaoDisponivel() {
        OrdemDTO ordem = mock(OrdemDTO.class);
        ClienteModel clienteMock = mock(ClienteModel.class);
        Optional<ClienteModel> clienteOpt = Optional.of(clienteMock);

        when(ordem.tipoOrdem()).thenReturn(enumTipoOrdem.ORDEM_VENDA);
        when(clienteRepository.findById(any())).thenReturn(clienteOpt);
        when(ordem.valorOrdem()).thenReturn(2.0);
        when(ordem.quantidadeOrdem()).thenReturn(2);
        when(carteiraRepository.buscarQuantideCarteira(anyLong(),anyLong())).thenReturn(1);
        when(carteiraRepository.buscarQuantidadeBloqueadoCarteira(anyLong(),anyLong())).thenReturn(1);

        assertThrows( RecursoNaoAceitoException.class,() ->{
            ordemService.criarOrdem(ordem);
        });
    }

    @Test
    void testCriarOrdemVendaErroQuantidadeMaiorQueDisponivel() {
        OrdemDTO ordem = mock(OrdemDTO.class);
        ClienteModel clienteMock = mock(ClienteModel.class);
        Optional<ClienteModel> clienteOpt = Optional.of(clienteMock);

        when(ordem.tipoOrdem()).thenReturn(enumTipoOrdem.ORDEM_VENDA);
        when(clienteRepository.findById(any())).thenReturn(clienteOpt);
        when(ordem.valorOrdem()).thenReturn(2.0);
        when(ordem.quantidadeOrdem()).thenReturn(3);
        when(carteiraRepository.buscarQuantideCarteira(anyLong(),anyLong())).thenReturn(2);
        when(carteiraRepository.buscarQuantidadeBloqueadoCarteira(anyLong(),anyLong())).thenReturn(1);

        assertThrows( RecursoNaoAceitoException.class,() ->{
            ordemService.criarOrdem(ordem);
        });
    }

    @Test
    void testCriarOrdemVendaSucesso() {
        OrdemDTO ordem = mock(OrdemDTO.class);
        ClienteModel clienteMock = mock(ClienteModel.class);
        Optional<ClienteModel> clienteOpt = Optional.of(clienteMock);

        when(ordem.tipoOrdem()).thenReturn(enumTipoOrdem.ORDEM_VENDA);
        when(clienteRepository.findById(any())).thenReturn(clienteOpt);
        when(ordem.valorOrdem()).thenReturn(2.0);
        when(ordem.quantidadeOrdem()).thenReturn(1);
        when(ordemRepository.save(any())).thenReturn(new Ordem());
        when(carteiraRepository.buscarQuantideCarteira(anyLong(),anyLong())).thenReturn(2);
        when(carteiraRepository.buscarQuantidadeBloqueadoCarteira(anyLong(),anyLong())).thenReturn(1);

        assertThat(ordemService.criarOrdem(ordem)).isNotNull();
    }

    @Test
    void testCancelarOrdemSemSucessoOrdemJaExecutada() {
        Ordem ordem = mock(Ordem.class);
        Optional<Ordem> ordemOpt = Optional.of(ordem);

        when(ordemRepository.findById(1L)).thenReturn(ordemOpt);
        when(ordem.getStatusOrdem()).thenReturn(enumStatus.EXECUTADA);

        assertThrows(RecursoNaoAceitoException.class, () -> {
            ordemService.cancelarOrdem(1L);
        });
    }

    @Test
    void testCancelarOrdemCompraComSucesso() {
        Ordem ordem = mock(Ordem.class);
        Optional<Ordem> ordemOpt = Optional.of(ordem);
        ClienteModel cliente = mock(ClienteModel.class);
        Optional<ClienteModel> clienteOpt = Optional.of(cliente);

        when(ordemRepository.findById(1L)).thenReturn(ordemOpt);
        when(ordem.getStatusOrdem()).thenReturn(enumStatus.ABERTA);
        when(ordem.getTipoOrdem()).thenReturn(enumTipoOrdem.ORDEM_COMPRA);
        when(ordem.getIdCliente()).thenReturn(1L);
        when(clienteRepository.findById(1L)).thenReturn(clienteOpt);
        when(ordemRepository.save(ordem)).thenReturn(ordem);
        assertThat(ordemService.cancelarOrdem(1L)).isNotNull();
    }

    @Test
    void testCancelarOrdemVendaComSucesso() {
        Ordem ordem = mock(Ordem.class);
        Optional<Ordem> ordemOpt = Optional.of(ordem);
        ordem.setQuantidadeOrdem(1);
        CarteiraModel carteiraModel = mock(CarteiraModel.class);
        carteiraModel.setQuantidadeBloqueada(2);
        List<CarteiraModel> carteiraModelList = List.of(carteiraModel);

        when(ordemRepository.findById(1L)).thenReturn(ordemOpt);
        when(ordem.getStatusOrdem()).thenReturn(enumStatus.ABERTA);
        when(ordem.getTipoOrdem()).thenReturn(enumTipoOrdem.ORDEM_VENDA);
        when(ordemRepository.save(ordem)).thenReturn(ordem);
        when(carteiraModel.getQuantidadeBloqueada()).thenReturn(2);
        when(ordem.getQuantidadeOrdem()).thenReturn(1);
        when(carteiraRepository.listarItensBloqueadoCarteira(anyLong(),anyLong())).thenReturn(carteiraModelList);
//        when(carteiraRepository.save(any())).thenReturn(new CarteiraModel());

        assertThat(ordemService.cancelarOrdem(1L)).isNotNull();
    }

}






























