package com.solinfbroker.apigeral.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

/**
 * Classe ClienteModel é uma entidade representante da tabela "cliente" no banco de dados.
 * Essa classe implementa UserDetails para fornecer autenticação e autorização para os usuários.
 *
 * Atributos:
 * - id: Identificador único do cliente.
 * - tipo: Tipo de cliente.
 * - nomeUsuario: Nome do usuário do cliente.
 * - senha: Senha da conta do cliente.
 * - email: Endereço de email do cliente.
 * - saldo: Saldo atual da conta do cliente.
 * - pessoaFisica: Conjunto de pessoas físicas associadas à conta do cliente.
 * - pessoaJuridica: Conjunto de pessoas jurídicas associadas à conta do cliente.
 * - permissoes: Conjunto de permissões que o cliente possui.
 *
 * O construtor ClientModel é usado para criar uma instância da classe com email, senha, conjunto de permissões,
 * tipo, nome do usuário e conjuntos de pessoas físicas e jurídicas.
 *
 * Método getAuthorities() retorna uma coleção de autoridades concedidas ao cliente.
 * Método getPassword() retorna a senha do cliente.
 * Método getUsername() retorna o email do cliente.
 * Método isAccountNonExpired() sempre retorna verdadeiro, representando que a conta é não expirada.
 * Método isAccountNonLocked() sempre retorna verdadeiro, representando que a conta não está bloqueada.
 * Método isCredentialsNonExpired() sempre retorna verdadeiro, representando que as credenciais são não expiradas.
 * Método isEnabled() sempre retorna verdadeiro, representando que a conta está ativada.
 */
@Entity
@Data
@Getter
@Setter
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "cliente")
public class ClienteModel{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(EnumType.STRING)
    private enumTipoPessoa tipo;

    private String nomeUsuario;

    private String senha;

    private String email;

    private double saldo;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_cliente")
    private Set<PessoaFisica> pessoaFisica = new HashSet<>();

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_cliente")
    private Set<PessoaJuridica> pessoaJuridica = new HashSet<>();


}
