package com.solinfbroker.apigeral.dtos;

import jakarta.persistence.Column;

public record CarteiraGrupoDTO(
        @Column(name = "id_cliente")
        Long idCliente,
        @Column(name = "id_ativo")
        Long idAtivo,
        @Column(name = "quantidade")
        Long quantidade,
        @Column(name = "sigla")
        String sigla
) {

}
