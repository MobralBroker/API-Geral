-- Tabela para armazenar informações sobre ordens de compra, com chave estrangeira referenciando a tabela cliente
CREATE TABLE ordem_compra (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    id_cliente BIGINT NOT NULL,
    id_ativo BIGINT NOT NULL,
    valor_compra DOUBLE PRECISION NOT NULL,
    data_compra DATE NOT NULL,
    quantidade INT NOT NULL,
    status VARCHAR(3) NOT NULL,
	data_executada TIMESTAMP NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_ativo) REFERENCES cliente(id) 
);

-- Tabela para armazenar informações sobre ordens de venda, com chave estrangeira referenciando a tabela cliente
CREATE TABLE ordem_venda (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    id_cliente BIGINT NOT NULL,
    id_ativo BIGINT NOT NULL, -- Adicionando a nova coluna para a chave estrangeira
    valor_venda DOUBLE PRECISION NOT NULL,
    data_venda DATE NOT NULL,
    quantidade INT NOT NULL,
    status VARCHAR(3) NOT NULL,
	data_executada TIMESTAMP NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_ativo) REFERENCES cliente(id)
);

-- Tabela para armazenar informações sobre a relação N para N entre ordens de compra e ordens de venda
CREATE TABLE compra_venda (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    id_compra BIGINT NOT NULL,
    id_venda BIGINT NOT NULL,
	quantidade INT NOT NULL,
	situacao VARCHAR(3) NOT NULL,
    data_executada TIMESTAMP NOT NULL,
    FOREIGN KEY (id_compra) REFERENCES ordem_compra(id),
    FOREIGN KEY (id_venda) REFERENCES ordem_venda(id)
);

-- Tabela para armazenar informações sobre empresas
CREATE TABLE empresa (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    razao_social VARCHAR(150) NOT NULL,
    nome_fantasia VARCHAR(150) NOT NULL,
    cnpj VARCHAR(14) NOT NULL
);

-- Tabela para armazenar informações sobre ativos, com chave estrangeira referenciando a tabela empresa
CREATE TABLE ativo (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    id_empresa BIGINT NOT NULL,
    sigla VARCHAR(10) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    atualizacao TIMESTAMP NOT NULL,
    quantidades_papeis INT NOT NULL,
    valor_max DOUBLE PRECISION NOT NULL,
    valor_min DOUBLE PRECISION NOT NULL,
    valor DOUBLE PRECISION NOT NULL,
    FOREIGN KEY (id_empresa) REFERENCES empresa(id)
);

-- Tabela para armazenar histórico de preços de ativos, com chave estrangeira referenciando a tabela ativo
CREATE TABLE IF NOT EXISTS historico_preco (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    id_ativo BIGINT NOT NULL,
    data_valor DATE NOT NULL,
    valor_do_ativo DOUBLE PRECISION NOT NULL,
    FOREIGN KEY (id_ativo) REFERENCES ativo(id)
);

-- Tabela para armazenar informações sobre a carteira de um cliente, com chaves estrangeiras referenciando as tabelas cliente e ativo
CREATE TABLE carteira (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    id_cliente BIGINT NOT NULL,
    id_ativo BIGINT NOT NULL,
    quantidade INT NOT NULL,
	data_compra DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_ativo) REFERENCES ativo(id)
);

-- Trigger de Log para gerar Histório de Preços
-- Função que é executada após uma atualização na tabela ativo, registrando o histórico de preços
CREATE OR REPLACE FUNCTION after_update_ativo()
RETURNS TRIGGER AS $$
BEGIN
    -- Verifica se o valor da coluna "valor" foi alterado
    IF NEW.valor <> OLD.valor THEN
        -- Insere um novo registro na tabela historico_preco
        INSERT INTO historico_preco (id_ativo, data_valor, valor_do_ativo)
        VALUES (OLD.id, CURRENT_DATE, OLD.valor);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger associada à função, executada após uma atualização na tabela ativo
CREATE TRIGGER after_update_ativo
AFTER UPDATE ON ativo
FOR EACH ROW
EXECUTE FUNCTION after_update_ativo();