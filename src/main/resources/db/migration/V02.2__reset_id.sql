SELECT setval('public.ativo_id_seq', (SELECT MAX(id) FROM ativo a));
SELECT setval('public.carteira_id_seq', (SELECT MAX(id) FROM carteira ca));
SELECT setval('public.cliente_id_seq', (SELECT MAX(id) FROM cliente c));
SELECT setval('public.empresa_id_seq', (SELECT MAX(id) FROM empresa e));
SELECT setval('public.pessoafisica_id_seq', (SELECT MAX(id) FROM pessoafisica pf));
