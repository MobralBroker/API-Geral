DO
$$
DECLARE
    ativo_id bigint;
    data_inicio timestamp;
    data_fim timestamp;
    intervalo interval;
    valor_aleatorio double precision;
BEGIN
    FOR ativo_id IN (SELECT id FROM ativo)
    LOOP
        data_inicio := NOW();
        data_fim := NOW() - INTERVAL '15 days';

        intervalo := INTERVAL '10 minutes';

        FOR i IN 1..((EXTRACT(EPOCH FROM (data_inicio - data_fim)) / 60) / 30)::int
        LOOP
            valor_aleatorio := random() * (150 - 20) + 20;

            INSERT INTO historico_preco (id_ativo, data_valor, valor_do_ativo)
            VALUES (ativo_id, data_inicio, ROUND(valor_aleatorio::numeric, 2));

            data_inicio := data_inicio - intervalo;
        END LOOP;
    END LOOP;

END;
$$;

SELECT setval('public.historico_preco_id_seq', (SELECT MAX(id) FROM historico_preco hp));