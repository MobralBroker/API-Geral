-- Trigger de Log para gerar Histórico de Preços
-- Função que é executada após uma atualização na tabela ativo, registrando o histórico de preços
CREATE OR REPLACE FUNCTION after_update_ativo()
RETURNS TRIGGER AS $$
BEGIN
    -- Verifica se o valor da coluna "valor" foi alterado
    IF NEW.valor <> OLD.valor THEN
        -- Insere um novo registro na tabela historico_preco com data e hora atual
        INSERT INTO historico_preco (id_ativo, data_valor, valor_do_ativo)
        VALUES (OLD.id, CURRENT_TIMESTAMP, OLD.valor);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
