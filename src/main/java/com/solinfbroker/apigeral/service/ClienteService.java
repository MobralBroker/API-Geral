package com.solinfbroker.apigeral.service;

import com.solinfbroker.apigeral.config.exceptions.RecursoNaoAceitoException;
import com.solinfbroker.apigeral.config.exceptions.RecursoNaoEncontradoException;
import com.solinfbroker.apigeral.model.ClienteModel;
import com.solinfbroker.apigeral.repository.ClienteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class ClienteService {

    @Autowired
    ClienteRepository clienteRepository;

    public Optional<ClienteModel> buscarCliente(Long id){
        return clienteRepository.findById(id);
    }

    public ClienteModel addSaldo(Long id, double valor){
        Optional<ClienteModel> cliente = clienteRepository.findById(id);
        ClienteModel clienteSalvo = new ClienteModel();
        if(cliente.isPresent()){
            cliente.get().setSaldo(cliente.get().getSaldo()+valor);
            clienteSalvo = clienteRepository.save(cliente.get());
        }else {
            throw new RecursoNaoEncontradoException("Cliente ", "id", id);
        }
        return clienteSalvo;
    }

    public ClienteModel sacarSaldo(Long id, double valor){
        Optional<ClienteModel> cliente = clienteRepository.findById(id);
        ClienteModel clienteSalvo = new ClienteModel();
        if(cliente.isPresent()){
            if(cliente.get().getSaldo() >= valor){
                cliente.get().setSaldo(cliente.get().getSaldo()-valor);
                clienteSalvo = clienteRepository.save(cliente.get());
            }else{
                throw new RecursoNaoAceitoException("Saque ", "possui saldo insuficiente");
            }
        }else {
            throw new RecursoNaoEncontradoException("Cliente ", "id", id);
        }
        return clienteSalvo;
    }

    public ClienteModel atualizarUsuario(ClienteModel clienteModel, Long id){
        Optional<ClienteModel> cliente = clienteRepository.findById(id);
        ClienteModel clienteSalvo = new ClienteModel();
        if(cliente.isPresent()){
                cliente.get().setNomeUsuario(clienteModel.getNomeUsuario());
                cliente.get().setEmail(clienteModel.getEmail());
                clienteSalvo = clienteRepository.save(cliente.get());
        }else {
            throw new RecursoNaoEncontradoException("Cliente ", "id", id);
        }
        return clienteSalvo;
    }
}
