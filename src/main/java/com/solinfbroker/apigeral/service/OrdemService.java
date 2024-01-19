package com.solinfbroker.apigeral.service;

import com.solinfbroker.apigeral.config.exceptions.RecursoNaoAceitoException;
import com.solinfbroker.apigeral.dtos.OperacaoDTO;
import com.solinfbroker.apigeral.dtos.OrdemDTO;
import com.solinfbroker.apigeral.model.ClienteModel;
import com.solinfbroker.apigeral.model.Ordem;
import com.solinfbroker.apigeral.model.enumStatus;
import com.solinfbroker.apigeral.model.enumTipoOrdem;
import com.solinfbroker.apigeral.repository.ClienteRepository;
import com.solinfbroker.apigeral.repository.OperacaoRepository;
import com.solinfbroker.apigeral.repository.OrdemRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.orm.ObjectOptimisticLockingFailureException;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class OrdemService {

    private final OrdemRepository ordemRepository;
    private final OperacaoRepository operacaoRepository;
    private final ClienteRepository clienteRepository;

    public List<Ordem> listarOrdem(){
        return ordemRepository.findAll();
    }

    public Optional<Ordem> buscarOrdem(Long id){
        Optional<Ordem> ordem =ordemRepository.findById(id); // Busca da Ordem
        if(ordem.isPresent()){ // Verifica se possui a ordem com este ID
            if(ordem.get().getTipoOrdem().equals(enumTipoOrdem.ORDEM_VENDA)){ // Verica se é Venda ou compra
                List<OperacaoDTO> operacoes = operacaoRepository.findByIdVenda(ordem.get().getId())// Atribui as operações de venda que pertence a esta ordem

                        .stream()
                        .filter(Optional::isPresent)
                        .map(result ->
                                new OperacaoDTO(
                                        ((BigInteger) result.get()[0]).longValue(),
                                        (Integer) result.get()[1],
                                        ((Timestamp) result.get()[2]).toLocalDateTime(),
                                        enumStatus.valueOf((String) result.get()[3]),
                                        enumTipoOrdem.valueOf((String) result.get()[4]))

                        )
                        .collect(Collectors.toList());
                ordem.get().setOperacoes(operacoes);
            }else{
                List<OperacaoDTO> operacoes = operacaoRepository.findByIdCompra(ordem.get().getId()) // Atribui as operações de compra que pertence a esta ordem
                        .stream()
                        .map(result -> new OperacaoDTO(
                                (Long) result[0],
                                (Integer)result[1],
                                ((Timestamp)result[2]).toLocalDateTime(),
                                enumStatus.valueOf((String)result[3]),
                                enumTipoOrdem.valueOf((String)result[4])
                        ))
                        .collect(Collectors.toList());
                ordem.get().setOperacoes(operacoes);
            }

        }
        return ordem; //retorna ordem para o controller
    }


    public Ordem criarOrdem(OrdemDTO ordem){
        Optional<ClienteModel> cliente = clienteRepository.findById(ordem.idCliente()); // busca o Cliente que esta fazendo a ordem
        double valorOrdem = ordem.quantidadeOrdem() * ordem.valorOrdem();
        Ordem ordemSalva = new Ordem();
        if(ordem.tipoOrdem().equals(enumTipoOrdem.ORDEM_COMPRA)){ // verifica o tipo de ordem como venda
            if(cliente.isPresent()){
                if(cliente.get().getSaldo() >= valorOrdem){ // verificar se o Cliente possui saldo para efetuar a compra
                    Ordem ordemSalvar = new Ordem();
                    BeanUtils.copyProperties(ordem,ordemSalvar);
                    ordemSalvar.setStatusOrdem(enumStatus.ABERTA);
                    ordemSalvar.setDataLancamento(LocalDateTime.now());
                    ordemSalvar.setQuantidadeAberto(ordemSalvar.getQuantidadeOrdem());
                    ordemSalva = ordemRepository.save(ordemSalvar);

                    cliente.get().setValorBloqueado(valorOrdem); // Bloqueio do saldo do cliente
                    cliente.get().setSaldo(cliente.get().getSaldo() - valorOrdem);
                    clienteRepository.save(cliente.get());
                }else{
                    throw new RecursoNaoAceitoException("Criar Ordem", "saldo Insulficiente ou bloqueado!");
                }
            }
        }else{
            if(cliente.isPresent()){
                // TODO Valida se o cara possui as ações e a quantidade dela
                Ordem ordemSalvar = new Ordem();
                BeanUtils.copyProperties(ordem,ordemSalvar);
                ordemSalvar.setStatusOrdem(enumStatus.ABERTA);
                ordemSalvar.setDataLancamento(LocalDateTime.now());
                ordemSalvar.setQuantidadeAberto(ordemSalvar.getQuantidadeOrdem());
                ordemSalva = ordemRepository.save(ordemSalvar);
            }
        }
        return ordemSalva;
    }

    public Ordem cancelarOrdem(Long id){
        Ordem ordem = ordemRepository.findById(id).get();
        if(ordem.getStatusOrdem().equals(enumStatus.EXECUTADA)){
            throw new RecursoNaoAceitoException("Cancelar Ordem ", "pois esta ordem já foi executada");
        }else{
            ordem.setStatusOrdem(enumStatus.CANCELADA);
            try {
                double valorOrdem = ordem.getQuantidadeOrdem() * ordem.getValorOrdem();
                Optional<ClienteModel> clienteModel = clienteRepository.findById(ordem.getIdCliente());
                clienteModel.get().setValorBloqueado(clienteModel.get().getValorBloqueado() - valorOrdem);
                clienteModel.get().setSaldo(clienteModel.get().getSaldo() + valorOrdem);
                clienteRepository.save(clienteModel.get());
                ordem = ordemRepository.save(ordem);
            }catch (ObjectOptimisticLockingFailureException ex){ //Verifica se não esta sendo processada em outro lugar
                throw new RecursoNaoAceitoException("Cancelar Ordem ", "pois esta ordem esta em conflido com processamento, tente novamente!");
            }
        }
//            testarConcorrencia(id);
        return ordem;
    }

//    public void testarConcorrencia(Long id) {
//
//        // Thread 1
//        new Thread(() -> {
//            Ordem ordem = ordemRepository.findById(id).get();
//            try {
//                Thread.sleep(2000);
//            } catch (InterruptedException e) {
//                e.printStackTrace();
//            }
//            ordem.setStatusOrdem(enumStatus.CANCELADA);
//            try {
//            ordemRepository.save(ordem);
//        }catch (ObjectOptimisticLockingFailureException ex){
//            System.out.println("opa");
//            throw new RecursoNaoAceitoException("Cancelar Ordem ", "pois esta ordem já foi processada");
//        }
//        }).start();
//
//        // Thread 2
//        new Thread(() -> {
//            Ordem ordem = ordemRepository.findById(id).get();
//            ordem.setStatusOrdem(enumStatus.EXECUTADA);
//            ordemRepository.save(ordem);
//        }).start();
//    }




}
