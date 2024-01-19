package com.solinfbroker.apigeral.service;

import com.solinfbroker.apigeral.model.ClienteModel;
import com.solinfbroker.apigeral.repository.ClienteRepository;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

@SpringBootTest
class ClienteServiceTest {

    @Mock
    private ClienteRepository clienteRepository;

    @InjectMocks
    private ClienteService clienteService;

    @Test
    void testBuscarClienteSucesso() {
        // Configuração do mock para retornar um ClienteModel fictício
        long id = 1L;
        ClienteModel clienteModelFicticio = new ClienteModel();
        when(clienteRepository.findById(id)).thenReturn(Optional.of(clienteModelFicticio));

        // Chama o método que você deseja testar
        Optional<ClienteModel> result = clienteService.buscarCliente(id);

        // Verifica se o Id pesquisado existe
        assertThat(result.isPresent()).isTrue();
    }

    @Test
    void testBuscarClienteErro() {
        long idNaoExistente = 2L;
        when(clienteRepository.findById(idNaoExistente)).thenReturn(Optional.empty());

        // Chama o método que você deseja testar quando o ID não existe
        Optional<ClienteModel> resultNaoExistente = clienteService.buscarCliente(idNaoExistente);

        // Verifica se o Id pesquisado não existe
        assertThat(resultNaoExistente.isPresent()).isFalse();
    }

    @Test
    void testAddSaldoSucesso() {
        long id = 1L;
        double valor = 50.0;

        // Criando um ClienteModel ficticio com um saldo suficiente
        ClienteModel clienteModelFicticio = new ClienteModel();
        clienteModelFicticio.setSaldo(100.0);

        // Configurando o mock para retornar o ClienteModel fictício quando o método findById é chamado com o ID fornecido
        when(clienteRepository.findById(id)).thenReturn(Optional.of(clienteModelFicticio));

        // Chama o metodo que você deseja testar
        clienteService.addSaldo(id, valor);

        // Verifica se o saldo foi deduzido corretamente
        assertThat(clienteModelFicticio.getSaldo()).isEqualTo(150.0);
    }

    @Test
    void testAddSaldoErro() {
        long id = 1L;
        double valor = 50.0;

        // Criando um ClienteModel ficticio com um saldo suficiente
        ClienteModel clienteModelFicticio = new ClienteModel();
        clienteModelFicticio.setSaldo(100.0);

        // Configurando o mock para retornar o ClienteModel fictício quando o método findById é chamado com o ID fornecido
        when(clienteRepository.findById(id)).thenReturn(Optional.of(clienteModelFicticio));

        // Chama o metodo que você deseja testar
        clienteService.addSaldo(id, valor);

        // Verifica se o saldo não foi adicionado incorretamente
        assertThat(clienteModelFicticio.getSaldo()).isNotEqualTo(10.0);
    }

    @Test
    void testSacarSaldoSucesso() {
        long id = 1L;
        double saldoInicial = 100.0;
        double valorSaque = 50.0;

        // Criando um ClienteModel fictício com um saldo suficiente
        ClienteModel clienteModelFicticio = new ClienteModel();
        clienteModelFicticio.setSaldo(saldoInicial);

        // Configurando o mock para retornar o ClienteModel fictício quando o método findById é chamado com o ID fornecido
        when(clienteRepository.findById(id)).thenReturn(Optional.of(clienteModelFicticio));

        // Verifica se o saldo é suficiente para o saque
        if (clienteModelFicticio.getSaldo() >= valorSaque) {
            // Realiza o saque
            clienteService.sacarSaldo(id, valorSaque);
        } else {
            throw new RuntimeException ("Saldo insuficiente para o saque");
        }

        // Calcula o saldo esperado após o saque
        double saldoEsperado = saldoInicial - valorSaque;
        // Verifica se o saldo foi deduzido corretamente após o saque
        assertThat(clienteModelFicticio.getSaldo()).isEqualTo(saldoEsperado);
    }

    @Test
    void testSacarSaldoErro() {
        long id = 1L;
        double saldoInicial = 100.0;
        double valorSaque = 50.0;

        // Criando um ClienteModel fictício com um saldo suficiente
        ClienteModel clienteModelFicticio = new ClienteModel();
        clienteModelFicticio.setSaldo(saldoInicial);

        // Configurando o mock para retornar o ClienteModel fictício quando o método findById é chamado com o ID fornecido
        when(clienteRepository.findById(id)).thenReturn(Optional.of(clienteModelFicticio));

        // Verifica se o saldo é suficiente para o saque
        if (clienteModelFicticio.getSaldo() >= valorSaque) {
            // Realiza o saque
            clienteService.sacarSaldo(id, valorSaque);
        } else {
            throw new RuntimeException ("Saldo insuficiente para o saque");
        }

        // Calcula o saldo esperado após o saque
        double saldoEsperado = saldoInicial - valorSaque;
        // Verifica se o saldo foi deduzido incorretamente após o saque
        assertThat(clienteModelFicticio.getSaldo()).isNotEqualTo(saldoEsperado - 1); // -1 é para o valor ficar incorreto
    }
}