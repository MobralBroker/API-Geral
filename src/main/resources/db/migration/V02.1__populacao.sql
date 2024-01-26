-- POPULAR EMPRESA
-- Empresa 1
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (1, 'Itaú Unibanco Holdings', 'Itaú', '77144676000183');

-- Empresa 2
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (2, 'Petróleo Brasileiro S.A. - Petrobras', 'Petrobras', '77144676000183');

-- Empresa 3
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (3, 'Vale S.A.', 'Vale', '77144676000183');

-- Empresa 4
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (4, 'Ambev S.A.', 'Ambev', '77144676000183');

-- Empresa 5
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (5, 'Banco Bradesco S.A.', 'Bradesco', '77144676000183');

-- Empresa 6
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (6, 'Banco Santander Brasil S.A.', 'Santander', '77144676000183');

-- Empresa 7
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (7, 'B3 - Brasil Bolsa Balcão S.A.', 'B3', '77144676000183');

-- Empresa 8
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (8, 'Companhia Siderúrgica Nacional', 'CSN', '77144676000183');

-- Empresa 9
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (9, 'Lojas Americanas S.A.', 'Americanas', '77144676000183');

-- Empresa 10
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (10, 'Gerdau S.A.', 'Gerdau', '77144676000183');

-- Empresa 11
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (11, 'Magazine Luiza S.A.', 'Magalu', '77144676000183');

-- Empresa 12
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (12, 'Banco do Brasil S.A.', 'Banco do Brasil', '77144676000183');

-- Empresa 13
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (13, 'Companhia Energética de Minas Gerais', 'Cemig', '77144676000183');

-- Empresa 14
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (14, 'Via Varejo S.A.', 'Casas Bahia', '77144676000183');

-- Empresa 15
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (15, 'Eletrobras', 'Eletrobras', '77144676000183');

-- Empresa 16
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (16, 'TIM Participações S.A.', 'TIM', '77144676000183');

-- Empresa 17
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (17, 'Telefônica Brasil S.A.', 'Vivo', '77144676000183');

-- Empresa 18
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (18, 'JBS S.A.', 'JBS', '77144676000183');

-- Empresa 19
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (19, 'Cielo S.A.', 'Cielo', '77144676000183');

-- Empresa 20
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (20, 'WEG S.A.', 'WEG', '77144676000183');

-- Empresa 21
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (21, 'Embraer S.A.', 'Embraer', '77144676000183');

-- Empresa 22
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (22, 'BRF S.A.', 'BRF', '77144676000183');

-- Empresa 23
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (23, 'Raia Drogasil S.A.', 'Raia Drogasil', '77144676000183');

-- Empresa 24
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (24, 'SulAmérica S.A.', 'SulAmérica', '77144676000183');

-- Empresa 25
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (25, 'MRV Engenharia e Participações S.A.', 'MRV', '77144676000183');

-- Empresa 26
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (26, 'CCR S.A.', 'CCR', '77144676000183');

-- Empresa 27
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (27, 'Banco Inter S.A.', 'Banco Inter', '77144676000183');

-- Empresa 28
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (28, 'Oi S.A.', 'Oi', '77144676000183');

-- Empresa 29
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (29, 'Localiza Rent a Car S.A.', 'Localiza', '77144676000183');

-- Empresa 30
INSERT INTO empresa (id, razao_social, nome_fantasia, cnpj)
VALUES (30, 'Marfrig Global Foods S.A.', 'Marfrig', '77144676000183');




--POPULAR ATIVO
-- Empresa 1
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(1, 1, 'ITA01', 'Ativo Itaú Unibanco', '2022-12-31 23:59:59', 1000, 35.00, 15.00, 25.00);

-- Empresa 2
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(2, 2, 'PET01', 'Ativo Petrobras', '2022-12-31 23:59:59', 1000, 30.00, 10.00, 20.00);

-- Empresa 3
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(3, 3, 'VAL01', 'Ativo Vale', '2022-12-31 23:59:59', 1000, 45.00, 15.00, 30.00);

-- Empresa 4
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(4, 4, 'AMB01', 'Ativo Ambev', '2022-12-31 23:59:59', 1000, 40.00, 20.00, 30.00);

-- Empresa 5
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(5, 5, 'BRA01', 'Ativo Bradesco', '2022-12-31 23:59:59', 1000, 50.00, 25.00, 35.00);

-- Empresa 6
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(6, 6, 'SAN01', 'Ativo Santander', '2022-12-31 23:59:59', 1000, 32.00, 12.00, 22.00);

-- Empresa 7
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(7, 7, 'BBR01', 'Ativo B3', '2022-12-31 23:59:59', 1000, 27.00, 13.00, 20.00);

-- Empresa 8
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(8, 8, 'CSN01', 'Ativo CSN', '2022-12-31 23:59:59', 1000, 37.00, 15.00, 26.00);

-- Empresa 9
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(9, 9, 'AME01', 'Ativo Americanas', '2022-12-31 23:59:59', 1000, 40.00, 20.00, 30.00);

-- Empresa 10
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(10, 10, 'GER01', 'Ativo Gerdau', '2022-12-31 23:59:59', 1000, 42.00, 22.00, 32.00);

-- Empresa 11
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(11, 11, 'MAG01', 'Ativo Magazine Luiza', '2022-12-31 23:59:59', 1000, 55.00, 35.00, 45.00);

-- Empresa 12
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(12, 12, 'BDB01', 'Ativo Banco do Brasil', '2022-12-31 23:59:59', 1000, 50.00, 30.00, 40.00);

-- Empresa 13
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(13, 13, 'CEM01', 'Ativo Cemig', '2022-12-31 23:59:59', 1000, 35.00, 15.00, 25.00);

-- Empresa 14
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(14, 14, 'VVS01', 'Ativo Via Varejo', '2022-12-31 23:59:59', 1000, 40.00, 20.00, 30.00);

-- Empresa 15
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(15, 15, 'ETB01', 'Ativo Eletrobras', '2022-12-31 23:59:59', 1000, 60.00, 40.00, 50.00);

-- Empresa 16
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(16, 16, 'TIM01', 'Ativo TIM', '2022-12-31 23:59:59', 1000, 25.00, 15.00, 20.00);

-- Empresa 17
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(17, 17, 'VIV01', 'Ativo Vivo', '2022-12-31 23:59:59', 1000, 45.00, 25.00, 35.00);

-- Empresa 18
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(18, 18, 'JBS01', 'Ativo JBS', '2022-12-31 23:59:59', 1000, 20.00, 10.00, 15.00);

-- Empresa 19
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(19, 19, 'CLO01', 'Ativo Cielo', '2022-12-31 23:59:59', 1000, 40.00, 20.00, 30.00);

-- Empresa 20
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(20, 20, 'WEG01', 'Ativo WEG', '2022-12-31 23:59:59', 1000, 60.00, 40.00, 50.00);

-- Empresa 21
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(21, 21, 'EMB01', 'Ativo Embraer', '2022-12-31 23:59:59', 1000, 45.00, 25.00, 35.00);

-- Empresa 22
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(22, 22, 'BRF01', 'Ativo BRF', '2022-12-31 23:59:59', 1000, 30.00, 20.00, 25.00);

-- Empresa 23
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(23, 23, 'RDR01', 'Ativo Raia Drogasil', '2022-12-31 23:59:59', 1000, 35.00, 15.00, 25.00);

-- Empresa 24
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(24, 24, 'SUL01', 'Ativo SulAmérica', '2022-12-31 23:59:59', 1000, 40.00, 20.00, 30.00);

-- Empresa 25
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(25, 25, 'MRV01', 'Ativo MRV', '2022-12-31 23:59:59', 1000, 50.00, 30.00, 40.00);

-- Empresa 26
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(26, 26, 'CCR01', 'Ativo CCR', '2022-12-31 23:59:59', 1000, 52.00, 22.00, 37.00);

-- Empresa 27
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(27, 27, 'BNR01', 'Ativo Banco Inter', '2022-12-31 23:59:59', 1000, 45.00, 25.00, 35.00);

-- Empresa 28
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(28, 28, 'OISA01', 'Ativo Oi', '2022-12-31 23:59:59', 1000, 35.00, 15.00, 25.00);

-- Empresa 29
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(29, 29, 'LRC01', 'Ativo Localiza', '2022-12-31 23:59:59', 1000, 55.00, 35.00, 45.00);

-- Empresa 30
INSERT INTO ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor)
VALUES(30, 30, 'MGF01', 'Ativo Marfrig', '2022-12-31 23:59:59', 1000, 60.00, 30.00, 45.00);


-- PADRÕES DOS BOTS
-- Email: bot1@teste.com
-- Senha: teste
-- Saldo Inicial: 1000,00

INSERT INTO cliente (id, nome_usuario, senha, email, saldo, valor_bloqueado)
VALUES (1, 'Bot 1', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot1@teste.com', 1000.0, 0),
       (2, 'Bot 2', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot2@teste.com', 1000.0, 0),
       (3, 'Bot 3', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot3@teste.com', 1000.0, 0),
       (4, 'Bot 4', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot4@teste.com', 1000.0, 0),
       (5, 'Bot 5', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot5@teste.com', 1000.0, 0),
       (6, 'Bot 6', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot6@teste.com', 1000.0, 0),
       (7, 'Bot 7', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot7@teste.com', 1000.0, 0),
       (8, 'Bot 8', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot8@teste.com', 1000.0, 0),
       (9, 'Bot 9', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot9@teste.com', 1000.0, 0),
       (10, 'Bot 10', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot10@teste.com', 1000.0, 0),
       (11, 'Bot 11', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot11@teste.com', 1000.0, 0),
       (12, 'Bot 12', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot12@teste.com', 1000.0, 0),
       (13, 'Bot 13', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot13@teste.com', 1000.0, 0),
       (14, 'Bot 14', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot14@teste.com', 1000.0, 0),
       (15, 'Bot 15', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot15@teste.com', 1000.0, 0),
       (16, 'Bot 16', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot16@teste.com', 1000.0, 0),
       (17, 'Bot 17', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot17@teste.com', 1000.0, 0),
       (18, 'Bot 18', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot18@teste.com', 1000.0, 0),
       (19, 'Bot 19', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot19@teste.com', 1000.0, 0),
       (20, 'Bot 20', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot20@teste.com', 1000.0, 0),
       (21, 'Bot 21', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot21@teste.com', 1000.0, 0),
       (22, 'Bot 22', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot22@teste.com', 1000.0, 0),
       (23, 'Bot 23', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot23@teste.com', 1000.0, 0),
       (24, 'Bot 24', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot24@teste.com', 1000.0, 0),
       (25, 'Bot 25', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot25@teste.com', 1000.0, 0),
       (26, 'Bot 26', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot26@teste.com', 1000.0, 0),
       (27, 'Bot 27', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot27@teste.com', 1000.0, 0),
       (28, 'Bot 28', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot28@teste.com', 1000.0, 0),
       (29, 'Bot 29', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot29@teste.com', 1000.0, 0),
       (30, 'Bot 30', '$2a$10$0aI.phcmN0wOeS60Ohq/neYu0AJzGuQ9bWo.Vk3RLhbNWxxTLWIRK', 'bot30@teste.com', 1000.0, 0);

INSERT INTO cliente_permissao (id_cliente, id_permissao)
VALUES 	(1, 2), (2, 2), (3, 2), (4, 2), (5, 2), (6, 2), (7, 2), (8, 2), (9, 2), (10, 2),
	(11, 2), (12, 2), (13, 2), (14, 2), (15, 2), (16, 2), (17, 2), (18, 2), (19, 2), (20, 2),
	(21, 2), (22, 2), (23, 2), (24, 2), (25, 2), (26, 2), (27, 2), (28, 2), (29, 2), (30, 2);

INSERT INTO pessoafisica (id, cpf, id_cliente, nome, nascimento)
VALUES (1, '99569320001', 1, 'Bot 1', '2000-01-01'),
       (2, '99569320001', 2, 'Bot 2', '2000-01-01'),
       (3, '99569320001', 3, 'Bot 3', '2000-01-01'),
       (4, '99569320001', 4, 'Bot 4', '2000-01-01'),
       (5, '99569320001', 5, 'Bot 5', '2000-01-01'),
       (6, '99569320001', 6, 'Bot 6', '2000-01-01'),
       (7, '99569320001', 7, 'Bot 7', '2000-01-01'),
       (8, '99569320001', 8, 'Bot 8', '2000-01-01'),
       (9, '99569320001', 9, 'Bot 9', '2000-01-01'),
       (10, '99569320001', 10, 'Bot 10', '2000-01-01'),
       (11, '99569320001', 11, 'Bot 11', '2000-01-01'),
       (12, '99569320001', 12, 'Bot 12', '2000-01-01'),
       (13, '99569320001', 13, 'Bot 13', '2000-01-01'),
       (14, '99569320001', 14, 'Bot 14', '2000-01-01'),
       (15, '99569320001', 15, 'Bot 15', '2000-01-01'),
       (16, '99569320001', 16, 'Bot 16', '2000-01-01'),
       (17, '99569320001', 17, 'Bot 17', '2000-01-01'),
       (18, '99569320001', 18, 'Bot 18', '2000-01-01'),
       (19, '99569320001', 18, 'Bot 19', '2000-01-01'),
       (20, '99569320001', 20, 'Bot 20', '2000-01-01'),
       (21, '99569320001', 21, 'Bot 21', '2000-01-01'),
       (22, '99569320001', 22, 'Bot 22', '2000-01-01'),
       (23, '99569320001', 23, 'Bot 23', '2000-01-01'),
       (24, '99569320001', 24, 'Bot 24', '2000-01-01'),
       (25, '99569320001', 25, 'Bot 25', '2000-01-01'),
       (26, '99569320001', 26, 'Bot 26', '2000-01-01'),
       (27, '99569320001', 27, 'Bot 27', '2000-01-01'),
       (28, '99569320001', 28, 'Bot 28', '2000-01-01'),
       (29, '99569320001', 28, 'Bot 29', '2000-01-01'),
       (30, '99569320001', 20, 'Bot 20', '2000-01-01');

--Carteira Cliente 1
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (1, 1, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (1, 2, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (1, 3, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (1, 4, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (1, 5, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (1, 6, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (1, 7, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (1, 8, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (1, 9, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (1, 10, 50, '2021-12-31 23:59:59');

--Carteira Cliente 2
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (2, 11, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (2, 12, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (2, 13, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (2, 14, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (2, 15, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (2, 16, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (2, 17, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (2, 18, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (2, 19, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (2, 20, 50, '2021-12-31 23:59:59');

--Carteira Cliente 3
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (3, 21, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (3, 22, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (3, 23, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (3, 24, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (3, 25, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (3, 26, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (3, 27, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (3, 28, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (3, 29, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (3, 30, 50, '2021-12-31 23:59:59');

--Carteira Cliente 4
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (4, 1, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (4, 2, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (4, 3, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (4, 4, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (4, 5, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (4, 6, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (4, 7, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (4, 8, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (4, 9, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (4, 10, 50, '2021-12-31 23:59:59');

--Carteira Cliente 5
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (5, 11, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (5, 12, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (5, 13, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (5, 14, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (5, 15, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (5, 16, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (5, 17, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (5, 18, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (5, 19, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (5, 20, 50, '2021-12-31 23:59:59');

--Carteira Cliente 6
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (6, 21, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (6, 22, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (6, 23, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (6, 24, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (6, 25, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (6, 26, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (6, 27, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (6, 28, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (6, 29, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (6, 30, 50, '2021-12-31 23:59:59');

--Carteira Cliente 7
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (7, 1, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (7, 2, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (7, 3, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (7, 4, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (7, 5, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (7, 6, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (7, 7, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (7, 8, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (7, 9, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (7, 10, 50, '2021-12-31 23:59:59');

--Carteira Cliente 8
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (8, 11, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (8, 12, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (8, 13, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (8, 14, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (8, 15, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (8, 16, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (8, 17, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (8, 18, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (8, 19, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (8, 20, 50, '2021-12-31 23:59:59');

--Carteira Cliente 9
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (9, 21, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (9, 22, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (9, 23, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (9, 24, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (9, 25, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (9, 26, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (9, 27, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (9, 28, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (9, 29, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (9, 30, 50, '2021-12-31 23:59:59');

--Carteira Cliente 10
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (10, 1, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (10, 2, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (10, 3, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (10, 4, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (10, 5, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (10, 6, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (10, 7, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (10, 8, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (10, 9, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (10, 10, 50, '2021-12-31 23:59:59');

--Carteira Cliente 11
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (11, 11, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (11, 12, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (11, 13, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (11, 14, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (11, 15, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (11, 16, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (11, 17, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (11, 18, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (11, 19, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (11, 20, 50, '2021-12-31 23:59:59');

--Carteira Cliente 12
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (12, 21, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (12, 22, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (12, 23, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (12, 24, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (12, 25, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (12, 26, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (12, 27, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (12, 28, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (12, 29, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (12, 30, 50, '2021-12-31 23:59:59');

--Carteira Cliente 13
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (13, 1, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (13, 2, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (13, 3, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (13, 4, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (13, 5, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (13, 6, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (13, 7, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (13, 8, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (13, 9, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (13, 10, 50, '2021-12-31 23:59:59');

--Carteira Cliente 14
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (14, 11, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (14, 12, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (14, 13, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (14, 14, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (14, 15, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (14, 16, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (14, 17, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (14, 18, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (14, 19, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (14, 20, 50, '2021-12-31 23:59:59');

--Carteira Cliente 16
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (15, 21, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (15, 22, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (15, 23, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (15, 24, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (15, 25, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (15, 26, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (15, 27, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (15, 28, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (15, 29, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (15, 30, 50, '2021-12-31 23:59:59');

--Carteira Cliente 16
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (16, 1, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (16, 2, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (16, 3, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (16, 4, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (16, 5, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (16, 6, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (16, 7, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (16, 8, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (16, 9, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (16, 10, 50, '2021-12-31 23:59:59');

--Carteira Cliente 17
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (17, 11, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (17, 12, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (17, 13, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (17, 14, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (17, 15, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (17, 16, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (17, 17, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (17, 18, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (17, 19, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (17, 20, 50, '2021-12-31 23:59:59');

--Carteira Cliente 18
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (18, 21, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (18, 22, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (18, 23, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (18, 24, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (18, 25, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (18, 26, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (18, 27, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (18, 28, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (18, 29, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (18, 30, 50, '2021-12-31 23:59:59');

--Carteira Cliente 19
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (19, 1, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (19, 2, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (19, 3, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (19, 4, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (19, 5, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (19, 6, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (19, 7, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (19, 8, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (19, 9, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (19, 10, 50, '2021-12-31 23:59:59');

--Carteira Cliente 20
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (20, 11, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (20, 12, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (20, 13, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (20, 14, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (20, 15, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (20, 16, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (20, 17, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (20, 18, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (20, 19, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (20, 20, 50, '2021-12-31 23:59:59');

--Carteira Cliente 21
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (21, 21, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (21, 22, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (21, 23, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (21, 24, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (21, 25, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (21, 26, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (21, 27, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (21, 28, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (21, 29, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (21, 30, 50, '2021-12-31 23:59:59');

--Carteira Cliente 22
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (22, 1, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (22, 2, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (22, 3, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (22, 4, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (22, 5, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (22, 6, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (22, 7, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (22, 8, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (22, 9, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (22, 10, 50, '2021-12-31 23:59:59');

--Carteira Cliente 23
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (23, 11, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (23, 12, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (23, 13, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (23, 14, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (23, 15, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (23, 16, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (23, 17, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (23, 18, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (23, 19, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (23, 20, 50, '2021-12-31 23:59:59');

--Carteira Cliente 24
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (24, 21, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (24, 22, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (24, 23, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (24, 24, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (24, 25, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (24, 26, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (24, 27, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (24, 28, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (24, 29, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (24, 30, 50, '2021-12-31 23:59:59');

--Carteira Cliente 25
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (25, 1, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (25, 2, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (25, 3, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (25, 4, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (25, 5, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (25, 6, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (25, 7, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (25, 8, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (25, 9, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (25, 10, 50, '2021-12-31 23:59:59');

--Carteira Cliente 26
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (26, 11, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (26, 12, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (26, 13, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (26, 14, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (26, 15, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (26, 16, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (26, 17, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (26, 18, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (26, 19, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (26, 20, 50, '2021-12-31 23:59:59');

--Carteira Cliente 27
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (27, 21, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (27, 22, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (27, 23, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (27, 24, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (27, 25, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (27, 26, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (27, 27, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (27, 28, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (27, 29, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (27, 30, 50, '2021-12-31 23:59:59');

--Carteira Cliente 28
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (28, 1, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (28, 2, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (28, 3, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (28, 4, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (28, 5, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (28, 6, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (28, 7, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (28, 8, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (28, 9, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (28, 10, 50, '2021-12-31 23:59:59');

--Carteira Cliente 29
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (29, 11, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (29, 12, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (29, 13, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (29, 14, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (29, 15, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (29, 16, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (29, 17, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (29, 18, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (29, 19, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (29, 20, 50, '2021-12-31 23:59:59');

--Carteira Cliente 30
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (30, 21, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (30, 22, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (30, 23, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (30, 24, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (30, 25, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (30, 26, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (30, 27, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (30, 28, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (30, 29, 50, '2021-12-31 23:59:59');
INSERT INTO carteira (id_cliente, id_ativo, quantidade, data_compra)
VALUES (30, 30, 50, '2021-12-31 23:59:59');