package com.solinfbroker.apigeral.repository;

import com.solinfbroker.apigeral.model.HistoricoPreco;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.List;

public interface HistoricoPrecoRepository extends JpaRepository<HistoricoPreco,Long> {

    List<HistoricoPreco> findByIdAtivo(Long id);

     @Query(value = "SELECT " +
            " date_trunc(:periodo, historico_preco.data_valor) as data, " +
            " min(valor_do_ativo) as preco_minimo, " +
            " max(valor_do_ativo) as preco_maximo, " +
            " (array_agg(valor_do_ativo ORDER BY data_valor ASC))[1] as preco_abertura, " +
            " (array_agg(valor_do_ativo ORDER BY data_valor DESC))[1] as preco_fechamento " +
            " FROM historico_preco " +
            " WHERE id_ativo = :idAtivo  AND " +
            " data_valor BETWEEN :dataInicial AND :dataFinal" +
            " GROUP BY data" +
            " ORDER BY data;", nativeQuery = true)
    List<Object[]> findHistoricoSimplificado(@Param("idAtivo") Long idAtivo, @Param("dataInicial") LocalDateTime dataInicial, @Param("dataFinal") LocalDateTime dataFinal, @Param("periodo") String periodo);

    // QUERY POR DIA

//    SELECT
//    date_trunc('day', data_valor) as data,
//    min(valor_do_ativo) as min_price,
//    max(valor_do_ativo) as max_price,
//  (array_agg(valor_do_ativo ORDER BY data_valor ASC))[1] as open_price,
//  (array_agg(valor_do_ativo ORDER BY data_valor DESC))[1] as close_price
//    FROM
//            historico_preco
//    WHERE
//            id_ativo = 1
//    AND
//    data_valor BETWEEN '2024-01-25' AND '2024-01-31'
//    GROUP BY
//    date_trunc('day', data_valor)
//    ORDER BY
//    data;


    // QUERY POR HORA

}
