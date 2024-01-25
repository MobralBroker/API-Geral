--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Debian 14.10-1.pgdg110+1)
-- Dumped by pg_dump version 14.10 (Ubuntu 14.10-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: root
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO root;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: root
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: generate_cpf(); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION public.generate_cpf() RETURNS character varying
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
    d1 INT;
    d2 INT;
    digito1 INT;
    digito2 INT;
    resto INT;
    cpf VARCHAR;
BEGIN
    -- Gera os 9 primeiros dígitos do CPF
    cpf := '';
    FOR i IN 1..9 LOOP
        cpf := cpf || to_char(floor(random() * 10), 'FM9');
    END LOOP;
    
    -- Calcula o primeiro dígito verificador
    d1 := 0;
    FOR i IN 1..9 LOOP
        d1 := d1 + cast(substr(cpf, i, 1) AS INTEGER) * (11 - i);
    END LOOP;
    resto := d1 % 11;
    digito1 := CASE WHEN resto < 2 THEN 0 ELSE 11 - resto END;
    cpf := cpf || digito1;
    
    -- Calcula o segundo dígito verificador
    d2 := 0;
    FOR i IN 1..10 LOOP
        d2 := d2 + cast(substr(cpf, i, 1) AS INTEGER) * (12 - i);
    END LOOP;
    resto := d2 % 11;
    digito2 := CASE WHEN resto < 2 THEN 0 ELSE 11 - resto END;
    cpf := cpf || digito2;
    
    RETURN cpf;
END;
$$;


ALTER FUNCTION public.generate_cpf() OWNER TO root;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ativo; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.ativo (
    id bigint NOT NULL,
    id_empresa bigint NOT NULL,
    sigla character varying(10) NOT NULL,
    nome character varying(50) NOT NULL,
    atualizacao timestamp without time zone NOT NULL,
    quantidades_papeis integer NOT NULL,
    valor_max double precision NOT NULL,
    valor_min double precision NOT NULL,
    valor double precision NOT NULL
);


ALTER TABLE public.ativo OWNER TO root;

--
-- Name: ativo_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.ativo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ativo_id_seq OWNER TO root;

--
-- Name: ativo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.ativo_id_seq OWNED BY public.ativo.id;


--
-- Name: carteira; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.carteira (
    id_cliente bigint NOT NULL,
    id_ativo bigint NOT NULL,
    quantidade integer NOT NULL,
    data_compra timestamp without time zone NOT NULL,
    id bigint NOT NULL
);


ALTER TABLE public.carteira OWNER TO root;

--
-- Name: carteira_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.carteira_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carteira_id_seq OWNER TO root;

--
-- Name: carteira_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.carteira_id_seq OWNED BY public.carteira.id;


--
-- Name: cliente; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.cliente (
    id bigint NOT NULL,
    nome_usuario character varying(50) NOT NULL,
    senha character varying NOT NULL,
    email character varying(50) NOT NULL,
    saldo double precision DEFAULT 0.0,
    valor_bloqueado double precision DEFAULT 0 NOT NULL
);


ALTER TABLE public.cliente OWNER TO root;

--
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_id_seq OWNER TO root;

--
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;


--
-- Name: cliente_permissao; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.cliente_permissao (
    id_cliente bigint NOT NULL,
    id_permissao bigint NOT NULL
);


ALTER TABLE public.cliente_permissao OWNER TO root;

--
-- Name: cliente_permissao_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.cliente_permissao_id_cliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_permissao_id_cliente_seq OWNER TO root;

--
-- Name: cliente_permissao_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.cliente_permissao_id_cliente_seq OWNED BY public.cliente_permissao.id_cliente;


--
-- Name: cliente_permissao_id_permissao_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.cliente_permissao_id_permissao_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_permissao_id_permissao_seq OWNER TO root;

--
-- Name: cliente_permissao_id_permissao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.cliente_permissao_id_permissao_seq OWNED BY public.cliente_permissao.id_permissao;


--
-- Name: empresa; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.empresa (
    id bigint NOT NULL,
    razao_social character varying(150) NOT NULL,
    nome_fantasia character varying(150) NOT NULL,
    cnpj character varying(14) NOT NULL
);


ALTER TABLE public.empresa OWNER TO root;

--
-- Name: empresa_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.empresa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empresa_id_seq OWNER TO root;

--
-- Name: empresa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.empresa_id_seq OWNED BY public.empresa.id;


--
-- Name: historico_preco; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.historico_preco (
    id bigint NOT NULL,
    id_ativo bigint NOT NULL,
    data_valor timestamp without time zone NOT NULL,
    valor_do_ativo double precision NOT NULL
);


ALTER TABLE public.historico_preco OWNER TO root;

--
-- Name: historico_preco_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.historico_preco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.historico_preco_id_seq OWNER TO root;

--
-- Name: historico_preco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.historico_preco_id_seq OWNED BY public.historico_preco.id;


--
-- Name: operacao; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.operacao (
    id bigint NOT NULL,
    id_compra bigint NOT NULL,
    id_venda bigint NOT NULL,
    quantidade integer NOT NULL,
    data_execucao timestamp without time zone NOT NULL,
    status_operacao character varying(10) NOT NULL,
    valor_ativo_execucao double precision DEFAULT 0 NOT NULL
);


ALTER TABLE public.operacao OWNER TO root;

--
-- Name: operacao_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.operacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operacao_id_seq OWNER TO root;

--
-- Name: operacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.operacao_id_seq OWNED BY public.operacao.id;


--
-- Name: ordem; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.ordem (
    id bigint NOT NULL,
    id_cliente bigint NOT NULL,
    id_ativo bigint NOT NULL,
    tipo_ordem character varying(12) NOT NULL,
    valor_ordem double precision NOT NULL,
    data_lancamento timestamp without time zone NOT NULL,
    quantidade_ordem integer DEFAULT 1 NOT NULL,
    quantidade_ordem_aberta integer DEFAULT 0 NOT NULL,
    status_ordem character varying(18) NOT NULL,
    versao bigint,
    valor_cliente_bloqueado double precision DEFAULT 0 NOT NULL
);


ALTER TABLE public.ordem OWNER TO root;

--
-- Name: ordem_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.ordem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ordem_id_seq OWNER TO root;

--
-- Name: ordem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.ordem_id_seq OWNED BY public.ordem.id;


--
-- Name: permissoes; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.permissoes (
    id bigint NOT NULL,
    permissao character varying NOT NULL
);


ALTER TABLE public.permissoes OWNER TO root;

--
-- Name: permissoes_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.permissoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissoes_id_seq OWNER TO root;

--
-- Name: permissoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.permissoes_id_seq OWNED BY public.permissoes.id;


--
-- Name: pessoafisica; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.pessoafisica (
    id bigint NOT NULL,
    cpf character varying(11) NOT NULL,
    id_cliente bigint NOT NULL,
    nome character varying(150) NOT NULL,
    nascimento date NOT NULL
);


ALTER TABLE public.pessoafisica OWNER TO root;

--
-- Name: pessoafisica_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.pessoafisica_id_cliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pessoafisica_id_cliente_seq OWNER TO root;

--
-- Name: pessoafisica_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.pessoafisica_id_cliente_seq OWNED BY public.pessoafisica.id_cliente;


--
-- Name: pessoafisica_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.pessoafisica_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pessoafisica_id_seq OWNER TO root;

--
-- Name: pessoafisica_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.pessoafisica_id_seq OWNED BY public.pessoafisica.id;


--
-- Name: schema_version_api_autenticacao; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.schema_version_api_autenticacao (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.schema_version_api_autenticacao OWNER TO root;

--
-- Name: schema_version_api_geral; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.schema_version_api_geral (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.schema_version_api_geral OWNER TO root;

--
-- Name: schema_version_ms_processamento; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.schema_version_ms_processamento (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.schema_version_ms_processamento OWNER TO root;

--
-- Name: ativo id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ativo ALTER COLUMN id SET DEFAULT nextval('public.ativo_id_seq'::regclass);


--
-- Name: carteira id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.carteira ALTER COLUMN id SET DEFAULT nextval('public.carteira_id_seq'::regclass);


--
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- Name: cliente_permissao id_cliente; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cliente_permissao ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_permissao_id_cliente_seq'::regclass);


--
-- Name: cliente_permissao id_permissao; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cliente_permissao ALTER COLUMN id_permissao SET DEFAULT nextval('public.cliente_permissao_id_permissao_seq'::regclass);


--
-- Name: empresa id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.empresa ALTER COLUMN id SET DEFAULT nextval('public.empresa_id_seq'::regclass);


--
-- Name: historico_preco id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.historico_preco ALTER COLUMN id SET DEFAULT nextval('public.historico_preco_id_seq'::regclass);


--
-- Name: operacao id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.operacao ALTER COLUMN id SET DEFAULT nextval('public.operacao_id_seq'::regclass);


--
-- Name: ordem id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ordem ALTER COLUMN id SET DEFAULT nextval('public.ordem_id_seq'::regclass);


--
-- Name: permissoes id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissoes ALTER COLUMN id SET DEFAULT nextval('public.permissoes_id_seq'::regclass);


--
-- Name: pessoafisica id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.pessoafisica ALTER COLUMN id SET DEFAULT nextval('public.pessoafisica_id_seq'::regclass);


--
-- Name: pessoafisica id_cliente; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.pessoafisica ALTER COLUMN id_cliente SET DEFAULT nextval('public.pessoafisica_id_cliente_seq'::regclass);


--
-- Data for Name: ativo; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.ativo (id, id_empresa, sigla, nome, atualizacao, quantidades_papeis, valor_max, valor_min, valor) FROM stdin;
1	2	Sigla1	Nome do Ativo1	2024-01-24 15:50:23.327013	10	1000	100	50
2	3	Sigla2	Nome do Ativo2	2024-01-23 15:50:23.327013	20	2000	200	100
3	4	Sigla3	Nome do Ativo3	2024-01-22 15:50:23.327013	30	3000	300	150
4	5	Sigla4	Nome do Ativo4	2024-01-21 15:50:23.327013	40	4000	400	200
5	6	Sigla5	Nome do Ativo5	2024-01-20 15:50:23.327013	50	5000	500	250
6	7	Sigla6	Nome do Ativo6	2024-01-19 15:50:23.327013	60	6000	600	300
7	8	Sigla7	Nome do Ativo7	2024-01-18 15:50:23.327013	70	7000	700	350
8	9	Sigla8	Nome do Ativo8	2024-01-17 15:50:23.327013	80	8000	800	400
9	10	Sigla9	Nome do Ativo9	2024-01-16 15:50:23.327013	90	9000	900	450
10	1	Sigla10	Nome do Ativo10	2024-01-15 15:50:23.327013	100	10000	1000	500
11	2	Sigla11	Nome do Ativo11	2024-01-14 15:50:23.327013	110	11000	1100	550
12	3	Sigla12	Nome do Ativo12	2024-01-13 15:50:23.327013	120	12000	1200	600
13	4	Sigla13	Nome do Ativo13	2024-01-12 15:50:23.327013	130	13000	1300	650
14	5	Sigla14	Nome do Ativo14	2024-01-11 15:50:23.327013	140	14000	1400	700
15	6	Sigla15	Nome do Ativo15	2024-01-10 15:50:23.327013	150	15000	1500	750
16	7	Sigla16	Nome do Ativo16	2024-01-09 15:50:23.327013	160	16000	1600	800
17	8	Sigla17	Nome do Ativo17	2024-01-08 15:50:23.327013	170	17000	1700	850
18	9	Sigla18	Nome do Ativo18	2024-01-07 15:50:23.327013	180	18000	1800	900
19	10	Sigla19	Nome do Ativo19	2024-01-06 15:50:23.327013	190	19000	1900	950
20	1	Sigla20	Nome do Ativo20	2024-01-05 15:50:23.327013	200	20000	2000	1000
21	2	Sigla21	Nome do Ativo21	2024-01-04 15:50:23.327013	210	21000	2100	1050
22	3	Sigla22	Nome do Ativo22	2024-01-03 15:50:23.327013	220	22000	2200	1100
23	4	Sigla23	Nome do Ativo23	2024-01-02 15:50:23.327013	230	23000	2300	1150
24	5	Sigla24	Nome do Ativo24	2024-01-01 15:50:23.327013	240	24000	2400	1200
25	6	Sigla25	Nome do Ativo25	2023-12-31 15:50:23.327013	250	25000	2500	1250
26	7	Sigla26	Nome do Ativo26	2023-12-30 15:50:23.327013	260	26000	2600	1300
27	8	Sigla27	Nome do Ativo27	2023-12-29 15:50:23.327013	270	27000	2700	1350
28	9	Sigla28	Nome do Ativo28	2023-12-28 15:50:23.327013	280	28000	2800	1400
29	10	Sigla29	Nome do Ativo29	2023-12-27 15:50:23.327013	290	29000	2900	1450
30	1	Sigla30	Nome do Ativo30	2024-01-25 15:50:23.327013	300	30000	3000	1500
31	2	Sigla31	Nome do Ativo31	2024-01-24 15:50:23.327013	310	31000	3100	1550
32	3	Sigla32	Nome do Ativo32	2024-01-23 15:50:23.327013	320	32000	3200	1600
33	4	Sigla33	Nome do Ativo33	2024-01-22 15:50:23.327013	330	33000	3300	1650
34	5	Sigla34	Nome do Ativo34	2024-01-21 15:50:23.327013	340	34000	3400	1700
35	6	Sigla35	Nome do Ativo35	2024-01-20 15:50:23.327013	350	35000	3500	1750
36	7	Sigla36	Nome do Ativo36	2024-01-19 15:50:23.327013	360	36000	3600	1800
37	8	Sigla37	Nome do Ativo37	2024-01-18 15:50:23.327013	370	37000	3700	1850
38	9	Sigla38	Nome do Ativo38	2024-01-17 15:50:23.327013	380	38000	3800	1900
39	10	Sigla39	Nome do Ativo39	2024-01-16 15:50:23.327013	390	39000	3900	1950
40	1	Sigla40	Nome do Ativo40	2024-01-15 15:50:23.327013	400	40000	4000	2000
41	2	Sigla41	Nome do Ativo41	2024-01-14 15:50:23.327013	410	41000	4100	2050
42	3	Sigla42	Nome do Ativo42	2024-01-13 15:50:23.327013	420	42000	4200	2100
43	4	Sigla43	Nome do Ativo43	2024-01-12 15:50:23.327013	430	43000	4300	2150
44	5	Sigla44	Nome do Ativo44	2024-01-11 15:50:23.327013	440	44000	4400	2200
45	6	Sigla45	Nome do Ativo45	2024-01-10 15:50:23.327013	450	45000	4500	2250
46	7	Sigla46	Nome do Ativo46	2024-01-09 15:50:23.327013	460	46000	4600	2300
47	8	Sigla47	Nome do Ativo47	2024-01-08 15:50:23.327013	470	47000	4700	2350
48	9	Sigla48	Nome do Ativo48	2024-01-07 15:50:23.327013	480	48000	4800	2400
49	10	Sigla49	Nome do Ativo49	2024-01-06 15:50:23.327013	490	49000	4900	2450
50	1	Sigla50	Nome do Ativo50	2024-01-05 15:50:23.327013	500	50000	5000	2500
51	2	Sigla51	Nome do Ativo51	2024-01-04 15:50:23.327013	510	51000	5100	2550
52	3	Sigla52	Nome do Ativo52	2024-01-03 15:50:23.327013	520	52000	5200	2600
53	4	Sigla53	Nome do Ativo53	2024-01-02 15:50:23.327013	530	53000	5300	2650
54	5	Sigla54	Nome do Ativo54	2024-01-01 15:50:23.327013	540	54000	5400	2700
55	6	Sigla55	Nome do Ativo55	2023-12-31 15:50:23.327013	550	55000	5500	2750
56	7	Sigla56	Nome do Ativo56	2023-12-30 15:50:23.327013	560	56000	5600	2800
57	8	Sigla57	Nome do Ativo57	2023-12-29 15:50:23.327013	570	57000	5700	2850
58	9	Sigla58	Nome do Ativo58	2023-12-28 15:50:23.327013	580	58000	5800	2900
59	10	Sigla59	Nome do Ativo59	2023-12-27 15:50:23.327013	590	59000	5900	2950
60	1	Sigla60	Nome do Ativo60	2024-01-25 15:50:23.327013	600	60000	6000	3000
61	2	Sigla61	Nome do Ativo61	2024-01-24 15:50:23.327013	610	61000	6100	3050
62	3	Sigla62	Nome do Ativo62	2024-01-23 15:50:23.327013	620	62000	6200	3100
63	4	Sigla63	Nome do Ativo63	2024-01-22 15:50:23.327013	630	63000	6300	3150
64	5	Sigla64	Nome do Ativo64	2024-01-21 15:50:23.327013	640	64000	6400	3200
65	6	Sigla65	Nome do Ativo65	2024-01-20 15:50:23.327013	650	65000	6500	3250
66	7	Sigla66	Nome do Ativo66	2024-01-19 15:50:23.327013	660	66000	6600	3300
67	8	Sigla67	Nome do Ativo67	2024-01-18 15:50:23.327013	670	67000	6700	3350
68	9	Sigla68	Nome do Ativo68	2024-01-17 15:50:23.327013	680	68000	6800	3400
69	10	Sigla69	Nome do Ativo69	2024-01-16 15:50:23.327013	690	69000	6900	3450
70	1	Sigla70	Nome do Ativo70	2024-01-15 15:50:23.327013	700	70000	7000	3500
71	2	Sigla71	Nome do Ativo71	2024-01-14 15:50:23.327013	710	71000	7100	3550
72	3	Sigla72	Nome do Ativo72	2024-01-13 15:50:23.327013	720	72000	7200	3600
73	4	Sigla73	Nome do Ativo73	2024-01-12 15:50:23.327013	730	73000	7300	3650
74	5	Sigla74	Nome do Ativo74	2024-01-11 15:50:23.327013	740	74000	7400	3700
75	6	Sigla75	Nome do Ativo75	2024-01-10 15:50:23.327013	750	75000	7500	3750
76	7	Sigla76	Nome do Ativo76	2024-01-09 15:50:23.327013	760	76000	7600	3800
77	8	Sigla77	Nome do Ativo77	2024-01-08 15:50:23.327013	770	77000	7700	3850
78	9	Sigla78	Nome do Ativo78	2024-01-07 15:50:23.327013	780	78000	7800	3900
79	10	Sigla79	Nome do Ativo79	2024-01-06 15:50:23.327013	790	79000	7900	3950
80	1	Sigla80	Nome do Ativo80	2024-01-05 15:50:23.327013	800	80000	8000	4000
81	2	Sigla81	Nome do Ativo81	2024-01-04 15:50:23.327013	810	81000	8100	4050
82	3	Sigla82	Nome do Ativo82	2024-01-03 15:50:23.327013	820	82000	8200	4100
83	4	Sigla83	Nome do Ativo83	2024-01-02 15:50:23.327013	830	83000	8300	4150
84	5	Sigla84	Nome do Ativo84	2024-01-01 15:50:23.327013	840	84000	8400	4200
85	6	Sigla85	Nome do Ativo85	2023-12-31 15:50:23.327013	850	85000	8500	4250
86	7	Sigla86	Nome do Ativo86	2023-12-30 15:50:23.327013	860	86000	8600	4300
87	8	Sigla87	Nome do Ativo87	2023-12-29 15:50:23.327013	870	87000	8700	4350
88	9	Sigla88	Nome do Ativo88	2023-12-28 15:50:23.327013	880	88000	8800	4400
89	10	Sigla89	Nome do Ativo89	2023-12-27 15:50:23.327013	890	89000	8900	4450
90	1	Sigla90	Nome do Ativo90	2024-01-25 15:50:23.327013	900	90000	9000	4500
91	2	Sigla91	Nome do Ativo91	2024-01-24 15:50:23.327013	910	91000	9100	4550
92	3	Sigla92	Nome do Ativo92	2024-01-23 15:50:23.327013	920	92000	9200	4600
93	4	Sigla93	Nome do Ativo93	2024-01-22 15:50:23.327013	930	93000	9300	4650
94	5	Sigla94	Nome do Ativo94	2024-01-21 15:50:23.327013	940	94000	9400	4700
95	6	Sigla95	Nome do Ativo95	2024-01-20 15:50:23.327013	950	95000	9500	4750
96	7	Sigla96	Nome do Ativo96	2024-01-19 15:50:23.327013	960	96000	9600	4800
97	8	Sigla97	Nome do Ativo97	2024-01-18 15:50:23.327013	970	97000	9700	4850
98	9	Sigla98	Nome do Ativo98	2024-01-17 15:50:23.327013	980	98000	9800	4900
99	10	Sigla99	Nome do Ativo99	2024-01-16 15:50:23.327013	990	99000	9900	4950
100	1	Sigla100	Nome do Ativo100	2024-01-15 15:50:23.327013	1000	100000	10000	5000
\.


--
-- Data for Name: carteira; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.carteira (id_cliente, id_ativo, quantidade, data_compra, id) FROM stdin;
2	2	5	2024-01-24 15:50:37.555839	1
3	3	10	2024-01-23 15:50:37.555839	2
4	4	15	2024-01-22 15:50:37.555839	3
5	5	20	2024-01-21 15:50:37.555839	4
6	6	25	2024-01-20 15:50:37.555839	5
7	7	30	2024-01-19 15:50:37.555839	6
8	8	35	2024-01-18 15:50:37.555839	7
9	9	40	2024-01-17 15:50:37.555839	8
10	10	45	2024-01-16 15:50:37.555839	9
11	11	50	2024-01-15 15:50:37.555839	10
12	12	55	2024-01-14 15:50:37.555839	11
13	13	60	2024-01-13 15:50:37.555839	12
14	14	65	2024-01-12 15:50:37.555839	13
15	15	70	2024-01-11 15:50:37.555839	14
16	16	75	2024-01-10 15:50:37.555839	15
17	17	80	2024-01-09 15:50:37.555839	16
18	18	85	2024-01-08 15:50:37.555839	17
19	19	90	2024-01-07 15:50:37.555839	18
20	20	95	2024-01-06 15:50:37.555839	19
21	21	100	2024-01-05 15:50:37.555839	20
22	22	105	2024-01-04 15:50:37.555839	21
23	23	110	2024-01-03 15:50:37.555839	22
24	24	115	2024-01-02 15:50:37.555839	23
25	25	120	2024-01-01 15:50:37.555839	24
26	26	125	2023-12-31 15:50:37.555839	25
27	27	130	2023-12-30 15:50:37.555839	26
28	28	135	2023-12-29 15:50:37.555839	27
29	29	140	2023-12-28 15:50:37.555839	28
30	30	145	2023-12-27 15:50:37.555839	29
31	31	150	2024-01-25 15:50:37.555839	30
32	32	155	2024-01-24 15:50:37.555839	31
33	33	160	2024-01-23 15:50:37.555839	32
34	34	165	2024-01-22 15:50:37.555839	33
35	35	170	2024-01-21 15:50:37.555839	34
36	36	175	2024-01-20 15:50:37.555839	35
37	37	180	2024-01-19 15:50:37.555839	36
38	38	185	2024-01-18 15:50:37.555839	37
39	39	190	2024-01-17 15:50:37.555839	38
40	40	195	2024-01-16 15:50:37.555839	39
41	41	200	2024-01-15 15:50:37.555839	40
42	42	205	2024-01-14 15:50:37.555839	41
43	43	210	2024-01-13 15:50:37.555839	42
44	44	215	2024-01-12 15:50:37.555839	43
45	45	220	2024-01-11 15:50:37.555839	44
46	46	225	2024-01-10 15:50:37.555839	45
47	47	230	2024-01-09 15:50:37.555839	46
48	48	235	2024-01-08 15:50:37.555839	47
49	49	240	2024-01-07 15:50:37.555839	48
50	50	245	2024-01-06 15:50:37.555839	49
51	51	250	2024-01-05 15:50:37.555839	50
52	52	255	2024-01-04 15:50:37.555839	51
53	53	260	2024-01-03 15:50:37.555839	52
54	54	265	2024-01-02 15:50:37.555839	53
55	55	270	2024-01-01 15:50:37.555839	54
56	56	275	2023-12-31 15:50:37.555839	55
57	57	280	2023-12-30 15:50:37.555839	56
58	58	285	2023-12-29 15:50:37.555839	57
59	59	290	2023-12-28 15:50:37.555839	58
60	60	295	2023-12-27 15:50:37.555839	59
61	61	300	2024-01-25 15:50:37.555839	60
62	62	305	2024-01-24 15:50:37.555839	61
63	63	310	2024-01-23 15:50:37.555839	62
64	64	315	2024-01-22 15:50:37.555839	63
65	65	320	2024-01-21 15:50:37.555839	64
66	66	325	2024-01-20 15:50:37.555839	65
67	67	330	2024-01-19 15:50:37.555839	66
68	68	335	2024-01-18 15:50:37.555839	67
69	69	340	2024-01-17 15:50:37.555839	68
70	70	345	2024-01-16 15:50:37.555839	69
71	71	350	2024-01-15 15:50:37.555839	70
72	72	355	2024-01-14 15:50:37.555839	71
73	73	360	2024-01-13 15:50:37.555839	72
74	74	365	2024-01-12 15:50:37.555839	73
75	75	370	2024-01-11 15:50:37.555839	74
76	76	375	2024-01-10 15:50:37.555839	75
77	77	380	2024-01-09 15:50:37.555839	76
78	78	385	2024-01-08 15:50:37.555839	77
79	79	390	2024-01-07 15:50:37.555839	78
80	80	395	2024-01-06 15:50:37.555839	79
81	81	400	2024-01-05 15:50:37.555839	80
82	82	405	2024-01-04 15:50:37.555839	81
83	83	410	2024-01-03 15:50:37.555839	82
84	84	415	2024-01-02 15:50:37.555839	83
85	85	420	2024-01-01 15:50:37.555839	84
86	86	425	2023-12-31 15:50:37.555839	85
87	87	430	2023-12-30 15:50:37.555839	86
88	88	435	2023-12-29 15:50:37.555839	87
89	89	440	2023-12-28 15:50:37.555839	88
90	90	445	2023-12-27 15:50:37.555839	89
91	91	450	2024-01-25 15:50:37.555839	90
92	92	455	2024-01-24 15:50:37.555839	91
93	93	460	2024-01-23 15:50:37.555839	92
94	94	465	2024-01-22 15:50:37.555839	93
95	95	470	2024-01-21 15:50:37.555839	94
96	96	475	2024-01-20 15:50:37.555839	95
97	97	480	2024-01-19 15:50:37.555839	96
98	98	485	2024-01-18 15:50:37.555839	97
99	99	490	2024-01-17 15:50:37.555839	98
100	100	495	2024-01-16 15:50:37.555839	99
1	1	500	2024-01-15 15:50:37.555839	100
\.


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.cliente (id, nome_usuario, senha, email, saldo, valor_bloqueado) FROM stdin;
1	usuario1	senha1	usuario1@exemplo.com	583.5250482664308	20.083755385775603
2	usuario2	senha2	usuario2@exemplo.com	448.6311041850115	20.268178817907412
3	usuario3	senha3	usuario3@exemplo.com	661.1002819794364	61.30976197671494
4	usuario4	senha4	usuario4@exemplo.com	170.07158368953412	74.36272608834109
5	usuario5	senha5	usuario5@exemplo.com	237.0986885612396	91.83637927163524
6	usuario6	senha6	usuario6@exemplo.com	194.5296565797321	66.49515217495541
7	usuario7	senha7	usuario7@exemplo.com	377.94174662386837	34.40000560091683
8	usuario8	senha8	usuario8@exemplo.com	713.7965441258558	42.01048288311391
9	usuario9	senha9	usuario9@exemplo.com	44.90351394320413	61.35619814708697
10	usuario10	senha10	usuario10@exemplo.com	912.1140877041114	80.1280029585211
11	usuario11	senha11	usuario11@exemplo.com	602.0112166047013	64.38197682005757
12	usuario12	senha12	usuario12@exemplo.com	42.729197140474184	34.76077109570177
13	usuario13	senha13	usuario13@exemplo.com	589.5094602661502	77.35050935461096
14	usuario14	senha14	usuario14@exemplo.com	75.25124097287517	76.60609223760666
15	usuario15	senha15	usuario15@exemplo.com	280.9146538847713	58.181977259345175
16	usuario16	senha16	usuario16@exemplo.com	954.6756541597148	53.63295901479397
17	usuario17	senha17	usuario17@exemplo.com	424.2889279063249	20.492198735547973
18	usuario18	senha18	usuario18@exemplo.com	649.1102870536736	59.466818044706926
19	usuario19	senha19	usuario19@exemplo.com	470.06952447055284	83.48700375185167
20	usuario20	senha20	usuario20@exemplo.com	211.58467790705515	73.57883138676264
21	usuario21	senha21	usuario21@exemplo.com	423.6393991501686	2.711199356028615
22	usuario22	senha22	usuario22@exemplo.com	620.9380622784124	75.83311997728792
23	usuario23	senha23	usuario23@exemplo.com	536.4816646097452	36.69451127891996
24	usuario24	senha24	usuario24@exemplo.com	792.3960989699737	73.35082559978297
25	usuario25	senha25	usuario25@exemplo.com	311.51358884624614	59.79392218724833
26	usuario26	senha26	usuario26@exemplo.com	720.4105560414007	37.64624213056429
27	usuario27	senha27	usuario27@exemplo.com	582.9591968545813	21.975628821947524
28	usuario28	senha28	usuario28@exemplo.com	610.6271245176771	82.72227668753338
29	usuario29	senha29	usuario29@exemplo.com	716.4321771494642	87.08619096665053
30	usuario30	senha30	usuario30@exemplo.com	216.0656741374396	13.737138150638017
31	usuario31	senha31	usuario31@exemplo.com	628.9268260689837	15.319625977109652
32	usuario32	senha32	usuario32@exemplo.com	571.9711973728323	4.740945566538457
33	usuario33	senha33	usuario33@exemplo.com	359.94323568569797	38.89599471658052
34	usuario34	senha34	usuario34@exemplo.com	347.1739674929779	81.911933447061
35	usuario35	senha35	usuario35@exemplo.com	233.41790795769413	66.0407094345846
36	usuario36	senha36	usuario36@exemplo.com	35.66062614042664	75.09163617121679
37	usuario37	senha37	usuario37@exemplo.com	275.5315209649538	23.61815264697249
38	usuario38	senha38	usuario38@exemplo.com	904.5055782434588	79.93389085388394
39	usuario39	senha39	usuario39@exemplo.com	926.4857451954995	57.46650967384319
40	usuario40	senha40	usuario40@exemplo.com	713.0707695968823	40.6632384006965
41	usuario41	senha41	usuario41@exemplo.com	276.2698713711913	78.65376741863237
42	usuario42	senha42	usuario42@exemplo.com	708.803217609983	9.616357278254029
43	usuario43	senha43	usuario43@exemplo.com	27.189628734682003	8.390899476565394
44	usuario44	senha44	usuario44@exemplo.com	788.0201210425497	75.06006504146079
45	usuario45	senha45	usuario45@exemplo.com	242.04400655693092	1.8731239936787603
46	usuario46	senha46	usuario46@exemplo.com	252.3725525284135	29.19820012562404
47	usuario47	senha47	usuario47@exemplo.com	169.47520436881547	47.36206710874633
48	usuario48	senha48	usuario48@exemplo.com	575.4472008207046	0.06688207988609918
49	usuario49	senha49	usuario49@exemplo.com	180.97109057077176	49.67147254970463
50	usuario50	senha50	usuario50@exemplo.com	567.0529404840465	15.755273540635173
51	usuario51	senha51	usuario51@exemplo.com	131.68280713103542	32.99004827355425
52	usuario52	senha52	usuario52@exemplo.com	348.62172770617406	48.971563068735335
53	usuario53	senha53	usuario53@exemplo.com	434.67148254594434	85.5929151842222
54	usuario54	senha54	usuario54@exemplo.com	460.9330145049739	91.60848575273626
55	usuario55	senha55	usuario55@exemplo.com	371.0814686049062	25.19620218650296
56	usuario56	senha56	usuario56@exemplo.com	59.774102366716875	90.16882946166866
57	usuario57	senha57	usuario57@exemplo.com	843.3421612780237	78.04839738595355
58	usuario58	senha58	usuario58@exemplo.com	626.527182767262	86.52107006560179
59	usuario59	senha59	usuario59@exemplo.com	1.7403647260110233	34.690398374501186
60	usuario60	senha60	usuario60@exemplo.com	555.003798600282	27.6130700798344
61	usuario61	senha61	usuario61@exemplo.com	164.11937251992725	0.8295864995293556
62	usuario62	senha62	usuario62@exemplo.com	764.730669765072	50.93469327941129
63	usuario63	senha63	usuario63@exemplo.com	822.2135341523895	90.94996205034143
64	usuario64	senha64	usuario64@exemplo.com	541.5538205512718	8.457764124602463
65	usuario65	senha65	usuario65@exemplo.com	545.0071103223238	85.92120066015845
66	usuario66	senha66	usuario66@exemplo.com	791.7222884988462	44.57606658505249
67	usuario67	senha67	usuario67@exemplo.com	398.92775978194805	72.58770716419072
68	usuario68	senha68	usuario68@exemplo.com	4.014946608933201	97.61356340050291
69	usuario69	senha69	usuario69@exemplo.com	396.6871062475761	14.540132924830473
70	usuario70	senha70	usuario70@exemplo.com	400.08569563468654	99.47275521931083
71	usuario71	senha71	usuario71@exemplo.com	141.8275684949677	38.23466748364588
72	usuario72	senha72	usuario72@exemplo.com	985.750043191004	23.97662066243207
73	usuario73	senha73	usuario73@exemplo.com	575.8150627853454	9.380496576614306
74	usuario74	senha74	usuario74@exemplo.com	730.7714440880488	96.74891442010782
75	usuario75	senha75	usuario75@exemplo.com	770.7453666998347	80.9264173039157
76	usuario76	senha76	usuario76@exemplo.com	652.805294115737	63.72328225118871
77	usuario77	senha77	usuario77@exemplo.com	395.9469297979794	8.719498828614647
78	usuario78	senha78	usuario78@exemplo.com	679.1237099848786	2.5287104708507258
79	usuario79	senha79	usuario79@exemplo.com	564.1287917601189	4.470154639692581
80	usuario80	senha80	usuario80@exemplo.com	339.8017537654283	2.336794431402822
81	usuario81	senha81	usuario81@exemplo.com	616.0280853238121	61.339831404149336
82	usuario82	senha82	usuario82@exemplo.com	406.04713345331334	79.85721687295602
83	usuario83	senha83	usuario83@exemplo.com	306.1714218811247	86.38300100027614
84	usuario84	senha84	usuario84@exemplo.com	840.7771947445752	8.926204095919488
85	usuario85	senha85	usuario85@exemplo.com	221.41734456649687	80.15004771970986
86	usuario86	senha86	usuario86@exemplo.com	954.4907751990763	30.755606935609237
87	usuario87	senha87	usuario87@exemplo.com	904.0570495340389	48.730253099511245
88	usuario88	senha88	usuario88@exemplo.com	552.674783235787	63.91716575070028
89	usuario89	senha89	usuario89@exemplo.com	508.7067833985017	31.935177647267565
90	usuario90	senha90	usuario90@exemplo.com	481.7777533176866	25.359495321823644
91	usuario91	senha91	usuario91@exemplo.com	233.9417859958033	5.555603102103035
92	usuario92	senha92	usuario92@exemplo.com	205.15167775657517	4.338897944304776
93	usuario93	senha93	usuario93@exemplo.com	713.1374252068881	20.845612082488074
94	usuario94	senha94	usuario94@exemplo.com	509.9106872966104	43.546312339860194
95	usuario95	senha95	usuario95@exemplo.com	892.462327082832	93.58362525787136
96	usuario96	senha96	usuario96@exemplo.com	817.6072095201476	89.70106355601466
97	usuario97	senha97	usuario97@exemplo.com	176.19990240950045	44.03307079541641
98	usuario98	senha98	usuario98@exemplo.com	768.8346386604792	88.53962601907135
99	usuario99	senha99	usuario99@exemplo.com	179.9727726567042	21.488108025507202
100	usuario100	senha100	usuario100@exemplo.com	212.8068651033317	45.84887960666286
\.


--
-- Data for Name: cliente_permissao; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.cliente_permissao (id_cliente, id_permissao) FROM stdin;
4	38
65	39
30	26
50	34
90	15
53	69
32	69
79	22
80	15
12	53
72	20
1	38
58	83
30	1
95	14
98	26
8	15
30	39
14	95
6	81
88	55
54	22
4	96
35	98
92	83
41	85
31	1
69	44
42	4
3	10
13	5
17	34
53	61
42	68
82	78
87	95
85	77
10	62
73	78
61	89
1	8
18	22
88	72
25	11
36	62
3	15
8	79
35	3
73	94
49	71
67	54
47	97
33	46
82	63
46	47
30	49
81	24
27	78
68	44
82	46
51	68
90	61
48	42
100	27
19	52
42	38
64	14
32	31
39	2
31	34
10	76
18	59
6	97
2	9
91	43
54	44
80	31
16	27
42	91
68	45
87	77
80	72
47	27
57	92
79	2
45	60
52	37
50	78
5	9
22	50
95	84
7	37
44	71
73	77
74	61
83	45
17	56
56	51
18	95
36	45
\.


--
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.empresa (id, razao_social, nome_fantasia, cnpj) FROM stdin;
1	RazaoSocial1	NomeFantasia1	84104826646968
2	RazaoSocial2	NomeFantasia2	59268248290195
3	RazaoSocial3	NomeFantasia3	66174080021249
4	RazaoSocial4	NomeFantasia4	31685358259231
5	RazaoSocial5	NomeFantasia5	82237645497994
6	RazaoSocial6	NomeFantasia6	92258092037393
7	RazaoSocial7	NomeFantasia7	88620485462474
8	RazaoSocial8	NomeFantasia8	14204293506230
9	RazaoSocial9	NomeFantasia9	68464418273770
10	RazaoSocial10	NomeFantasia10	06425513650379
11	RazaoSocial11	NomeFantasia11	11684574832517
12	RazaoSocial12	NomeFantasia12	12926872592414
13	RazaoSocial13	NomeFantasia13	65033329350007
14	RazaoSocial14	NomeFantasia14	63056755507052
15	RazaoSocial15	NomeFantasia15	28104461113638
16	RazaoSocial16	NomeFantasia16	19445593902273
17	RazaoSocial17	NomeFantasia17	54808780894685
18	RazaoSocial18	NomeFantasia18	67395821596406
19	RazaoSocial19	NomeFantasia19	60668263523348
20	RazaoSocial20	NomeFantasia20	52462942346486
21	RazaoSocial21	NomeFantasia21	69778725613989
22	RazaoSocial22	NomeFantasia22	07456569930786
23	RazaoSocial23	NomeFantasia23	55154312943160
24	RazaoSocial24	NomeFantasia24	69947355543239
25	RazaoSocial25	NomeFantasia25	71038071869258
26	RazaoSocial26	NomeFantasia26	32289773231793
27	RazaoSocial27	NomeFantasia27	41379226078359
28	RazaoSocial28	NomeFantasia28	25654639249269
29	RazaoSocial29	NomeFantasia29	95617256967239
30	RazaoSocial30	NomeFantasia30	36047430185057
31	RazaoSocial31	NomeFantasia31	70994161497291
32	RazaoSocial32	NomeFantasia32	22197148820751
33	RazaoSocial33	NomeFantasia33	46590529372260
34	RazaoSocial34	NomeFantasia34	63718546204606
35	RazaoSocial35	NomeFantasia35	80080352559030
36	RazaoSocial36	NomeFantasia36	15454213762437
37	RazaoSocial37	NomeFantasia37	32632138425814
38	RazaoSocial38	NomeFantasia38	13152744371205
39	RazaoSocial39	NomeFantasia39	64793147614234
40	RazaoSocial40	NomeFantasia40	72924975904884
41	RazaoSocial41	NomeFantasia41	91219407136616
42	RazaoSocial42	NomeFantasia42	15491195260791
43	RazaoSocial43	NomeFantasia43	60324433005629
44	RazaoSocial44	NomeFantasia44	84461069684221
45	RazaoSocial45	NomeFantasia45	14700965972344
46	RazaoSocial46	NomeFantasia46	79751750009013
47	RazaoSocial47	NomeFantasia47	89894125551777
48	RazaoSocial48	NomeFantasia48	90825926636553
49	RazaoSocial49	NomeFantasia49	13210159593060
50	RazaoSocial50	NomeFantasia50	67242605415893
51	RazaoSocial51	NomeFantasia51	90502554620627
52	RazaoSocial52	NomeFantasia52	02166966809970
53	RazaoSocial53	NomeFantasia53	04724210365735
54	RazaoSocial54	NomeFantasia54	55694604430742
55	RazaoSocial55	NomeFantasia55	16499665837831
56	RazaoSocial56	NomeFantasia56	63526078591018
57	RazaoSocial57	NomeFantasia57	96328038539330
58	RazaoSocial58	NomeFantasia58	82307161221768
59	RazaoSocial59	NomeFantasia59	87939225178925
60	RazaoSocial60	NomeFantasia60	22034616689627
61	RazaoSocial61	NomeFantasia61	76879105390560
62	RazaoSocial62	NomeFantasia62	47910078477140
63	RazaoSocial63	NomeFantasia63	57034239914166
64	RazaoSocial64	NomeFantasia64	14836196976605
65	RazaoSocial65	NomeFantasia65	58790168721727
66	RazaoSocial66	NomeFantasia66	82578976854810
67	RazaoSocial67	NomeFantasia67	58223797860199
68	RazaoSocial68	NomeFantasia68	27760867771210
69	RazaoSocial69	NomeFantasia69	03616826053977
70	RazaoSocial70	NomeFantasia70	35543963847037
71	RazaoSocial71	NomeFantasia71	32374114893691
72	RazaoSocial72	NomeFantasia72	42357321282696
73	RazaoSocial73	NomeFantasia73	24685075961820
74	RazaoSocial74	NomeFantasia74	61150313002281
75	RazaoSocial75	NomeFantasia75	47002928948674
76	RazaoSocial76	NomeFantasia76	58407707469326
77	RazaoSocial77	NomeFantasia77	51312258487946
78	RazaoSocial78	NomeFantasia78	37829585702055
79	RazaoSocial79	NomeFantasia79	97234143001558
80	RazaoSocial80	NomeFantasia80	36146856841045
81	RazaoSocial81	NomeFantasia81	48516547711150
82	RazaoSocial82	NomeFantasia82	21195587773301
83	RazaoSocial83	NomeFantasia83	68118956095645
84	RazaoSocial84	NomeFantasia84	78041339947802
85	RazaoSocial85	NomeFantasia85	37792069564600
86	RazaoSocial86	NomeFantasia86	95980093378010
87	RazaoSocial87	NomeFantasia87	71223286520422
88	RazaoSocial88	NomeFantasia88	65423320714489
89	RazaoSocial89	NomeFantasia89	46927612166711
90	RazaoSocial90	NomeFantasia90	37869170111054
91	RazaoSocial91	NomeFantasia91	66764241090052
92	RazaoSocial92	NomeFantasia92	77101629655494
93	RazaoSocial93	NomeFantasia93	07408190482557
94	RazaoSocial94	NomeFantasia94	16505483304572
95	RazaoSocial95	NomeFantasia95	28428375310163
96	RazaoSocial96	NomeFantasia96	62182422577111
97	RazaoSocial97	NomeFantasia97	08164328330044
98	RazaoSocial98	NomeFantasia98	88910925432784
99	RazaoSocial99	NomeFantasia99	59231677332428
100	RazaoSocial100	NomeFantasia100	79931231904320
\.


--
-- Data for Name: historico_preco; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.historico_preco (id, id_ativo, data_valor, valor_do_ativo) FROM stdin;
1	1	2024-01-03 12:41:43.312721	40.88389301513473
2	14	2024-01-16 12:06:19.272109	16.534015143808034
3	22	2024-01-10 11:43:31.275414	222.8295723299496
4	18	2024-01-05 06:48:41.594762	818.382872059626
5	31	2024-01-04 05:44:48.624535	827.2504304272275
6	53	2024-01-06 20:56:21.297698	830.1936620895738
7	10	2023-12-26 22:49:41.891999	153.2149574807633
8	53	2024-01-14 15:18:50.17109	417.86261287724005
9	22	2024-01-04 09:05:29.954005	614.3854120439158
10	70	2024-01-12 02:16:35.593801	516.3704921521095
11	20	2023-12-28 17:17:02.164099	626.048386200388
12	45	2024-01-04 22:22:45.862003	914.9689649145749
13	37	2024-01-10 19:07:11.850289	152.560059237004
14	24	2024-01-18 03:49:23.033194	528.3878781712197
15	100	2023-12-29 11:16:14.616698	489.6256960240848
16	55	2024-01-11 08:49:38.413413	393.74610851278294
17	85	2023-12-29 19:08:40.293088	860.4940444116238
18	100	2024-01-09 15:54:51.536005	799.0323924312896
19	74	2023-12-29 23:39:42.141692	877.0667182319087
20	3	2023-12-28 12:34:29.491444	765.0146314974471
21	32	2024-01-12 01:08:09.466301	644.1567925377285
22	33	2024-01-02 16:25:19.006647	848.0417077752129
23	17	2024-01-16 20:57:30.731228	42.30069532649594
24	29	2023-12-27 01:54:41.57947	121.6127002629257
25	23	2024-01-24 11:55:56.582119	52.17661141789165
26	63	2024-01-05 13:03:29.865548	6.664797841128944
27	20	2024-01-18 18:23:53.0064	357.77175087233815
28	47	2024-01-22 04:50:15.578757	933.8296233251491
29	100	2024-01-24 20:47:11.098643	735.8854808153126
30	68	2024-01-18 15:16:43.585411	455.4859857231186
31	56	2023-12-31 12:53:11.264735	685.4625695792365
32	65	2024-01-17 07:55:13.869592	502.21830598483666
33	78	2024-01-14 14:47:45.39187	818.2616140131955
34	32	2024-01-17 13:38:18.55872	121.51594431208323
35	22	2024-01-02 13:00:23.745507	293.2569613817648
36	24	2024-01-05 07:24:01.17085	581.6047170575551
37	29	2024-01-14 16:00:29.113808	154.63679429268495
38	13	2024-01-14 09:23:55.555839	386.94389537186066
39	8	2024-01-11 00:01:01.615637	127.49026085446502
40	81	2023-12-29 11:34:39.007646	65.68698203524193
41	63	2023-12-29 21:38:52.842484	972.8000457013053
42	82	2024-01-15 18:56:50.731274	490.73630054821035
43	92	2024-01-19 17:30:10.560741	883.2471151091354
44	45	2024-01-06 02:00:39.708986	815.3918940457708
45	7	2024-01-20 05:06:51.956768	816.717484837369
46	52	2024-01-11 19:59:27.349552	280.6535984946272
47	1	2024-01-14 09:22:43.575893	296.9107018459667
48	99	2023-12-31 19:10:21.360302	349.76530707283973
49	35	2024-01-17 21:27:42.699221	564.0392806980827
50	23	2024-01-25 03:32:36.881661	31.808330629022663
51	58	2023-12-31 04:46:34.338712	77.8723569744173
52	91	2024-01-06 15:36:24.779279	153.62285758791572
53	54	2024-01-10 23:39:52.873542	942.2925854300956
54	33	2024-01-14 19:46:32.618092	682.5506262091387
55	36	2024-01-02 17:41:37.163624	102.27754068261419
56	19	2024-01-24 06:15:56.117582	733.861563529171
57	78	2024-01-17 02:53:23.309749	3.4531525810024277
58	55	2024-01-07 15:20:11.205306	452.56079793213996
59	47	2024-01-14 18:08:33.730477	912.1895945157021
60	81	2023-12-31 03:41:02.86588	452.9888859393019
61	44	2024-01-08 18:24:06.869851	424.61219367882563
62	61	2024-01-07 15:37:58.288773	164.249044625155
63	69	2024-01-02 00:07:02.303138	246.44840242395816
64	63	2024-01-19 05:28:35.605006	245.19662104482265
65	43	2024-01-20 22:56:53.109553	948.7479011637703
66	31	2024-01-04 02:46:32.487746	58.979280298618875
67	83	2024-01-01 07:31:45.754302	619.5134283606264
68	41	2024-01-03 01:54:31.55215	972.7003316238801
69	94	2023-12-26 17:07:32.507427	351.0870483625581
70	98	2024-01-23 03:47:05.984555	715.6932213830949
71	23	2024-01-20 05:01:44.141442	753.3112243473213
72	53	2023-12-28 18:59:37.547633	787.9637386678376
73	60	2023-12-27 22:11:18.172024	771.9902278304147
74	62	2024-01-25 13:44:18.834428	182.0323788628322
75	82	2024-01-10 18:20:39.585677	643.0329484814833
76	44	2024-01-09 14:48:28.365157	45.08939009383184
77	90	2024-01-05 07:05:58.889519	277.37867048929843
78	2	2024-01-07 08:38:06.440733	317.2348317556448
79	85	2024-01-20 11:40:19.54028	936.2992646357711
80	36	2024-01-14 02:58:29.856324	149.71481511120643
81	99	2024-01-10 17:45:39.029785	944.9802620632255
82	40	2024-01-20 16:52:54.245006	931.4909154687747
83	11	2024-01-19 18:12:02.948651	158.3547770934004
84	22	2024-01-17 11:10:44.208781	84.21507328418087
85	23	2024-01-09 22:49:41.937176	403.52140285256155
86	39	2024-01-16 14:47:49.301276	757.0225554842302
87	55	2024-01-21 09:48:16.032778	703.0734465763474
88	3	2023-12-29 06:03:55.256536	11.260928866317244
89	39	2024-01-10 09:15:27.74382	518.7188043989153
90	87	2023-12-31 14:53:43.789914	880.2252260946694
91	31	2024-01-21 18:16:14.272549	806.5268015549591
92	70	2023-12-26 17:09:04.080772	395.57463610929847
93	51	2024-01-20 06:46:17.807872	192.69524457078546
94	13	2024-01-04 20:46:49.427606	639.4747280222255
95	44	2024-01-10 05:22:28.283746	349.5397628779173
96	15	2024-01-07 11:48:07.829956	27.19532246923606
97	6	2024-01-23 22:12:39.946971	62.29477354737867
98	54	2024-01-02 22:16:12.897062	396.72347020774976
99	92	2024-01-12 20:09:07.528126	17.761103130631284
100	91	2023-12-27 07:37:46.519039	450.22101644817883
\.


--
-- Data for Name: operacao; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.operacao (id, id_compra, id_venda, quantidade, data_execucao, status_operacao, valor_ativo_execucao) FROM stdin;
101	45	83	4	2024-01-09 11:12:13.01927	Aberto	95.44970272586184
102	14	71	4	2023-12-30 17:52:41.521412	Aberto	402.1090609507461
103	3	65	8	2024-01-18 01:23:43.80114	Aberto	606.4779834190012
104	69	69	6	2024-01-19 20:35:50.392806	Fechado	109.44602294516059
105	66	92	8	2024-01-10 13:49:44.441319	Aberto	75.54749627076163
106	64	76	8	2024-01-16 12:35:31.703979	Fechado	843.8218980699297
107	89	26	5	2024-01-17 21:09:40.693363	Fechado	911.3724137951529
108	45	68	5	2024-01-02 17:24:12.618367	Fechado	404.7995395003561
109	15	31	9	2024-01-11 17:00:40.989475	Aberto	421.8716733123848
110	88	96	7	2023-12-31 19:37:09.565084	Aberto	945.130674437106
111	94	33	3	2024-01-09 21:01:03.726176	Aberto	478.8665784087875
112	64	12	3	2024-01-12 09:35:28.892044	Fechado	929.6185282373522
113	97	22	7	2023-12-31 11:47:36.122606	Aberto	863.665339564708
114	57	84	5	2024-01-12 19:14:55.846637	Aberto	933.7594231982074
115	54	13	3	2023-12-27 04:32:29.434477	Aberto	804.7819504194997
116	96	81	5	2023-12-29 23:55:46.527783	Aberto	415.8339204586348
117	79	17	0	2024-01-24 19:04:51.141641	Fechado	785.2790141602987
118	9	34	3	2024-01-10 14:36:36.608548	Fechado	827.7350473629746
119	99	38	7	2024-01-16 23:10:50.640372	Fechado	708.7178173826096
120	57	39	4	2024-01-22 01:14:59.2368	Fechado	919.6778725999302
121	20	39	3	2024-01-12 01:08:54.712611	Aberto	91.51440897580088
122	35	22	0	2024-01-04 21:01:36.333009	Fechado	987.5389699953097
123	72	55	4	2024-01-03 23:32:16.363796	Fechado	77.08299163543941
124	72	77	3	2024-01-10 02:09:06.268855	Fechado	238.80896149502107
125	62	28	8	2024-01-20 18:52:59.268367	Aberto	834.3178859969704
126	65	56	6	2024-01-11 19:02:50.378147	Fechado	778.2641631267744
127	29	31	1	2023-12-26 18:00:13.787576	Aberto	759.9179946215777
128	18	52	9	2024-01-13 17:35:54.67242	Fechado	786.107187074645
129	55	89	8	2024-01-20 12:23:33.07801	Aberto	910.3633876451375
130	3	9	3	2024-01-06 12:45:45.257602	Fechado	862.4989909401073
131	6	89	3	2023-12-31 04:29:12.941002	Aberto	163.95766632500752
132	84	65	1	2024-01-04 05:11:20.025312	Fechado	810.4891242963497
133	91	19	1	2023-12-27 04:28:00.523118	Aberto	784.572447486969
134	31	70	6	2023-12-28 05:59:58.972597	Aberto	126.1046152696359
135	51	10	4	2024-01-22 20:05:28.515969	Aberto	714.2669634859722
136	39	22	4	2024-01-25 10:07:44.737338	Fechado	445.9138786021804
137	21	48	0	2024-01-09 18:44:16.869812	Fechado	58.87670124940669
138	95	51	9	2023-12-27 14:28:17.373059	Fechado	189.24802396545815
139	77	2	5	2024-01-01 15:12:26.979744	Fechado	705.4155227704548
140	22	3	3	2024-01-17 06:39:36.776534	Fechado	629.3208117010743
141	1	54	2	2024-01-23 15:14:37.575745	Aberto	788.5361305616563
142	20	17	7	2024-01-22 19:56:26.274359	Aberto	873.9980551682685
143	71	97	0	2024-01-22 22:35:20.89843	Fechado	130.539377565146
144	69	34	5	2024-01-11 10:55:55.420545	Aberto	456.560316972837
145	79	95	2	2024-01-18 03:27:35.921057	Aberto	750.0840843461027
146	46	22	0	2023-12-27 02:56:42.806226	Aberto	887.4871030417033
147	77	95	10	2023-12-29 10:35:46.135189	Aberto	862.7710295697746
148	97	74	6	2024-01-16 22:02:54.384712	Aberto	42.44923629057595
149	42	98	1	2023-12-31 12:43:36.502373	Aberto	385.4779352800257
150	21	61	2	2024-01-07 23:36:53.220399	Fechado	336.0865030090814
151	17	73	9	2023-12-29 02:53:51.337272	Fechado	68.40188885867704
152	31	53	4	2024-01-12 20:14:36.428437	Aberto	416.90282255846614
153	54	59	1	2024-01-21 06:21:05.878899	Aberto	886.292041249991
154	52	33	7	2024-01-21 19:35:28.133591	Aberto	511.2389070414132
155	68	88	10	2024-01-11 06:32:02.875947	Fechado	954.7739085834799
156	39	15	4	2023-12-30 21:52:57.291376	Fechado	423.6654647617222
157	92	37	2	2024-01-10 14:31:55.409674	Aberto	839.797494220793
158	51	58	2	2024-01-11 20:03:09.932307	Fechado	681.5362720435552
159	53	53	5	2024-01-15 00:21:02.153353	Fechado	898.2800529887704
160	67	62	3	2024-01-07 20:13:00.561032	Fechado	991.4827048256534
161	55	1	9	2024-01-09 12:36:05.07106	Aberto	35.53095144082263
162	66	57	6	2024-01-24 19:19:30.816099	Aberto	388.32739688538356
163	80	91	4	2024-01-08 08:25:05.940371	Aberto	658.986049912631
164	19	83	5	2024-01-17 08:33:08.823306	Aberto	519.627388080675
165	10	51	10	2024-01-17 00:57:30.793505	Fechado	426.46265640573586
166	46	31	7	2024-01-24 20:32:43.705805	Aberto	973.5842561248625
167	29	97	2	2024-01-09 06:10:34.15956	Aberto	768.2686914439109
168	20	88	0	2024-01-18 12:44:00.197569	Fechado	460.51310163015205
169	12	75	8	2024-01-09 15:24:11.606663	Fechado	853.1315695022989
170	56	80	4	2024-01-05 21:19:51.993342	Aberto	768.9516909698817
171	62	98	2	2024-01-22 16:37:43.277225	Fechado	274.4987589081127
172	20	68	6	2024-01-24 16:34:03.107818	Aberto	491.69836741794984
173	59	59	6	2023-12-29 03:27:26.631928	Aberto	972.1233407542833
174	59	70	9	2024-01-18 17:23:27.859619	Fechado	543.8503305257392
175	44	58	5	2023-12-29 18:02:57.218675	Aberto	849.1794608537652
176	72	9	3	2024-01-21 15:03:45.891479	Fechado	947.9053692925668
177	12	7	8	2024-01-02 19:36:45.711434	Aberto	882.0246695922868
178	19	81	0	2024-01-11 06:29:52.63712	Aberto	448.19792887514257
179	39	89	9	2024-01-22 11:14:41.47074	Aberto	792.0840852111617
180	78	93	6	2024-01-16 00:04:21.597418	Aberto	430.747305864724
181	89	14	3	2024-01-09 04:18:11.212601	Fechado	210.49540906935604
182	65	46	5	2023-12-30 12:13:36.443735	Fechado	791.7596160376057
183	75	34	9	2023-12-30 23:32:59.785607	Fechado	728.8193792953343
184	78	30	10	2024-01-14 07:11:12.074726	Aberto	729.6787734552872
185	95	80	1	2024-01-14 05:45:42.29728	Fechado	915.3575844442834
186	46	68	0	2024-01-05 02:20:58.064386	Fechado	577.3328733551147
187	77	37	8	2024-01-09 22:19:26.650033	Fechado	767.8739838251438
188	52	43	6	2024-01-24 15:25:59.203835	Fechado	372.2538959303954
189	61	33	6	2024-01-06 08:46:46.69455	Aberto	760.6083085544561
190	67	13	10	2024-01-11 18:45:29.807025	Fechado	748.9183563509379
191	7	67	5	2024-01-14 00:50:22.434006	Fechado	576.5940596303558
192	69	47	9	2024-01-08 04:35:54.871533	Aberto	275.09723072067163
193	45	97	2	2024-01-11 05:44:38.766251	Fechado	355.02138890013055
194	60	26	8	2023-12-28 16:16:35.809556	Aberto	628.7230006084563
195	75	59	9	2024-01-06 20:03:11.882907	Fechado	246.66105821858153
196	5	29	4	2024-01-14 14:42:05.041434	Fechado	89.06279282139096
197	57	58	3	2024-01-11 15:11:36.404303	Fechado	786.5102338620069
198	57	20	3	2024-01-03 18:41:56.024247	Fechado	998.287158716888
199	62	12	6	2024-01-21 12:52:00.367248	Fechado	949.5293998739562
200	19	56	7	2024-01-17 10:23:27.021475	Fechado	922.8768510704804
\.


--
-- Data for Name: ordem; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.ordem (id, id_cliente, id_ativo, tipo_ordem, valor_ordem, data_lancamento, quantidade_ordem, quantidade_ordem_aberta, status_ordem, versao, valor_cliente_bloqueado) FROM stdin;
1	16	37	Compra	33.805439483654	2024-01-12 02:13:15.564787	2	0	Aberto	72	348.9085272180361
2	63	72	Venda	207.3568833223547	2024-01-10 14:36:36.300496	11	0	Aberto	33	676.5816884710922
3	81	38	Venda	13.68539404107949	2024-01-01 07:09:27.934646	11	0	Aberto	24	26.642340662334618
4	93	50	Compra	391.7832974265565	2023-12-29 18:42:45.690854	2	0	Fechado	91	778.7558011286642
5	28	59	Venda	880.6296279769264	2023-12-29 14:40:56.562617	2	0	Aberto	5	978.5423851939825
6	39	60	Compra	946.0992048940043	2024-01-15 02:08:06.623878	11	0	Fechado	62	933.0005828892247
7	7	25	Compra	809.4307185095353	2024-01-05 01:48:14.927007	5	0	Fechado	17	94.08901855026386
8	40	94	Compra	397.69487972790785	2024-01-06 23:59:01.916128	6	0	Aberto	34	696.4035453705116
9	99	50	Compra	285.975925218974	2023-12-27 12:18:58.417683	7	0	Aberto	80	513.4656131092115
10	24	19	Compra	920.8742014735449	2024-01-01 16:12:25.504624	3	0	Aberto	59	535.0229081195188
11	64	47	Compra	313.1439024500828	2024-01-11 11:07:31.997806	5	0	Aberto	61	165.83038109723702
12	90	82	Venda	864.5803461067345	2024-01-07 10:10:23.272089	9	0	Aberto	68	482.81135520563726
13	56	61	Venda	850.4499978654075	2024-01-13 23:43:04.902179	10	0	Fechado	20	586.7712115316194
14	4	31	Compra	700.1322673839852	2024-01-17 07:19:28.822516	8	0	Fechado	80	739.7061581692874
15	6	77	Compra	458.37913449119935	2024-01-03 01:33:32.491246	5	0	Fechado	28	785.1605892538629
16	46	99	Compra	376.1686916535325	2024-01-06 20:07:42.974265	11	0	Aberto	18	681.3952897625448
17	87	19	Venda	525.7572810507263	2024-01-14 22:40:06.060912	5	0	Aberto	36	73.5081677994387
18	19	46	Compra	949.4774154726499	2024-01-10 12:44:04.714655	4	0	Fechado	55	128.83880940953318
19	5	89	Venda	99.5862936508054	2023-12-31 00:07:28.443674	3	0	Aberto	0	311.828964296609
20	29	11	Venda	285.5447804376894	2024-01-03 13:05:20.949495	10	0	Fechado	68	68.16597441483552
21	29	95	Venda	757.3904080622889	2023-12-28 05:17:12.337821	6	0	Aberto	60	539.0452081255787
22	82	40	Compra	161.42528735704076	2024-01-11 04:54:22.147268	9	0	Fechado	61	946.3072414708229
23	66	42	Compra	37.96440160897774	2023-12-31 13:23:42.865802	5	0	Aberto	92	65.67467314299336
24	9	6	Venda	767.2807832040007	2023-12-31 04:18:52.897152	4	0	Aberto	25	622.9908071046531
25	33	94	Compra	797.7784883924635	2023-12-30 16:44:13.144916	10	0	Aberto	9	162.51159764603784
26	5	6	Compra	659.4957284757256	2024-01-20 00:59:05.095487	9	0	Aberto	1	982.1269706210422
27	51	86	Compra	431.5316964987978	2024-01-14 22:41:35.81229	6	0	Fechado	3	29.301498148015526
28	44	25	Compra	21.072384990489468	2023-12-31 13:04:13.825373	2	0	Aberto	36	638.887364240599
29	12	57	Compra	593.3341796798253	2024-01-16 16:43:50.46661	10	0	Aberto	74	381.62641457510205
30	71	82	Venda	45.318450054246284	2024-01-02 02:32:25.117653	3	0	Fechado	52	569.8717943341371
31	15	95	Compra	122.50411173889475	2023-12-28 15:38:06.479601	4	0	Fechado	85	233.8602363189608
32	80	6	Compra	246.2208976925524	2024-01-05 09:43:53.397189	2	0	Fechado	94	620.250992696608
33	28	78	Venda	708.8816487084664	2024-01-04 09:43:59.493742	3	0	Aberto	45	855.6038537804441
34	10	87	Venda	361.28543315266626	2024-01-08 23:24:14.578478	7	0	Aberto	44	536.8975622140262
35	51	60	Venda	217.33911066757017	2023-12-29 23:47:02.904081	6	0	Fechado	79	77.6814743017269
36	66	39	Venda	563.6792741707239	2024-01-19 02:07:02.975167	11	0	Fechado	0	58.40813034647496
37	67	57	Venda	911.9336545739394	2024-01-02 20:16:37.729884	2	0	Aberto	24	728.4155293978713
38	43	74	Compra	428.207710674279	2024-01-20 13:07:36.852558	8	0	Aberto	89	286.6201119241971
39	86	73	Compra	496.337014505972	2024-01-19 02:23:40.085168	7	0	Fechado	81	748.6478783140882
40	37	24	Venda	2.1421359778628357	2023-12-30 21:25:15.791264	3	0	Aberto	9	935.8759417581801
41	67	21	Venda	903.6544258450583	2023-12-31 00:18:40.257592	2	0	Fechado	91	588.6655080683668
42	21	76	Venda	721.216054084131	2024-01-21 18:49:12.276226	11	0	Fechado	69	260.302251791078
43	30	1	Compra	899.7549799766098	2023-12-28 02:05:25.283413	9	0	Fechado	67	982.5392849298282
44	19	84	Compra	597.158858666333	2024-01-11 22:51:15.941047	9	0	Fechado	51	130.64370064286024
45	8	28	Compra	937.6670555527334	2023-12-29 16:58:20.644293	9	0	Aberto	3	723.4789764992015
46	41	85	Compra	417.1989551114095	2024-01-13 10:50:33.161662	7	0	Fechado	88	436.590346798102
47	61	11	Compra	628.3624462335844	2023-12-31 17:37:04.589695	2	0	Aberto	17	326.4773417524367
48	38	37	Venda	828.4610694267656	2024-01-08 12:46:52.658274	10	0	Fechado	10	78.24230890522799
49	30	32	Venda	724.8351156202198	2024-01-24 17:14:43.056341	8	0	Aberto	26	26.535091826296764
50	84	98	Venda	798.4361913913815	2024-01-01 23:42:51.59243	7	0	Aberto	58	97.799884267463
51	91	32	Compra	953.7589911222319	2024-01-22 00:04:46.380549	8	0	Fechado	7	265.0157890580829
52	60	74	Venda	182.22316400725447	2023-12-29 19:43:17.317044	6	0	Aberto	19	740.0307261754442
53	15	93	Venda	672.5884084136134	2023-12-31 13:04:40.285527	6	0	Fechado	24	284.72774318664307
54	97	49	Venda	460.4262613404657	2024-01-08 18:14:33.734271	4	0	Aberto	89	93.1891721378868
55	57	68	Compra	6.21892667846069	2024-01-05 17:36:33.714982	4	0	Aberto	43	272.969256934843
56	92	82	Venda	854.043205965354	2024-01-14 04:04:55.584297	3	0	Fechado	95	336.8222060169011
57	84	5	Compra	570.2175399371292	2024-01-16 13:50:23.324955	6	0	Fechado	36	89.57873049748599
58	51	71	Compra	943.5101300521537	2023-12-27 05:23:07.769	2	0	Fechado	71	234.8138688893222
59	43	80	Compra	897.0794357018867	2024-01-21 11:19:17.840424	8	0	Aberto	76	490.9742397986747
60	26	18	Compra	177.8933938150118	2024-01-10 05:23:09.855429	2	0	Fechado	74	481.6444081000775
61	41	32	Compra	803.9016293246526	2024-01-21 10:26:59.610663	7	0	Aberto	41	619.7453041831195
62	100	98	Compra	699.6761071518947	2023-12-30 23:49:33.042754	6	0	Aberto	49	197.78017233928225
63	23	94	Compra	43.633417691953724	2024-01-05 11:21:17.509666	5	0	Aberto	67	74.88226392639774
64	100	33	Venda	589.620733046587	2024-01-18 10:29:51.300096	4	0	Fechado	90	406.1459920095807
65	81	55	Venda	892.2532751872545	2024-01-11 09:44:27.821759	5	0	Fechado	87	356.6721699905244
66	19	67	Compra	195.43034185569041	2024-01-14 22:19:49.362612	8	0	Fechado	95	493.69401724064585
67	13	64	Compra	455.1322859225486	2024-01-23 19:29:42.516687	10	0	Fechado	14	786.8737463119544
68	8	20	Compra	14.881192820368483	2024-01-21 13:59:40.274017	4	0	Aberto	38	372.12351050969164
69	77	90	Compra	978.1851935658175	2024-01-01 20:05:45.955077	6	0	Fechado	70	29.176008591726088
70	33	37	Venda	431.99843244004654	2024-01-17 13:11:31.327761	2	0	Fechado	32	326.84536134705763
71	9	70	Compra	669.980550448205	2024-01-01 08:29:03.487182	8	0	Aberto	69	403.75321722449087
72	51	91	Venda	855.3910238625235	2024-01-20 22:16:02.265648	3	0	Fechado	12	121.1666205331845
73	70	30	Compra	127.36903720862003	2024-01-19 04:14:35.01047	4	0	Aberto	38	852.6823528836403
74	69	45	Venda	994.1750694500583	2023-12-30 20:39:16.892892	10	0	Aberto	11	713.3033888796411
75	28	47	Venda	620.7709468838125	2024-01-21 10:45:12.259445	7	0	Fechado	39	485.9690068253144
76	75	13	Venda	969.4286272271739	2023-12-28 23:44:37.694086	7	0	Fechado	31	197.95213137889434
77	89	36	Venda	177.03911414568196	2024-01-03 15:16:21.789852	6	0	Aberto	9	318.74936926531205
78	64	16	Venda	693.2745267478069	2024-01-24 04:09:45.782425	6	0	Fechado	97	382.88804162757015
79	62	27	Compra	762.8489403798291	2023-12-30 18:45:46.912896	10	0	Fechado	20	839.8447405855478
80	7	30	Compra	578.5959556293108	2023-12-27 22:12:31.506373	3	0	Aberto	84	120.82852410545897
81	76	3	Venda	89.08735756487474	2024-01-19 03:05:59.776967	5	0	Fechado	75	299.8247651978474
82	41	5	Venda	987.8942444348766	2024-01-08 04:18:35.654423	3	0	Aberto	29	135.30851374511954
83	25	77	Compra	604.1164608263223	2024-01-13 05:55:41.395142	4	0	Aberto	6	116.29261153731818
84	18	73	Compra	149.55146250052564	2024-01-07 17:36:46.388599	3	0	Fechado	83	929.7176163918657
85	27	6	Compra	504.1212713092556	2024-01-08 07:09:35.575621	2	0	Fechado	36	227.92975653397463
86	84	32	Venda	204.250775270701	2024-01-12 22:57:45.802715	2	0	Aberto	85	380.1280291691462
87	67	24	Venda	292.41952146174197	2024-01-22 06:33:10.513846	1	0	Fechado	10	813.5009620885825
88	46	91	Compra	403.9836512730517	2023-12-29 23:54:45.255773	2	0	Fechado	40	456.8393256998853
89	4	47	Compra	512.358998410786	2023-12-28 12:16:48.691694	3	0	Fechado	22	264.8118369420658
90	59	75	Compra	456.97105395257864	2024-01-17 17:26:13.434752	4	0	Aberto	94	154.25917297352854
91	85	77	Venda	78.87075123615617	2024-01-17 05:20:45.547019	8	0	Fechado	12	20.977776735207954
92	78	55	Compra	500.35688115737287	2024-01-07 20:57:08.270417	3	0	Fechado	32	409.2843129191799
93	100	81	Venda	674.9854464525491	2024-01-05 10:19:23.298784	7	0	Fechado	92	151.3450607435871
94	97	63	Venda	428.33635902359646	2023-12-28 12:47:59.921148	2	0	Aberto	86	532.1730824009201
95	96	16	Venda	410.71864398375976	2023-12-27 12:43:42.634522	5	0	Fechado	95	480.73882201369145
96	26	47	Venda	545.4058183446762	2024-01-15 15:33:40.70914	8	0	Fechado	49	771.0879813028236
97	11	65	Venda	496.0858657097838	2024-01-12 01:01:10.778669	3	0	Aberto	68	267.4967421333392
98	1	30	Compra	401.6205327313358	2023-12-29 05:04:57.630597	8	0	Aberto	16	777.8017322672532
99	60	83	Venda	698.8983071957939	2024-01-04 18:49:44.194583	1	0	Aberto	10	511.83093395391666
100	41	35	Venda	261.08334563768665	2024-01-08 03:59:24.30019	3	0	Fechado	50	201.3931739091781
\.


--
-- Data for Name: permissoes; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.permissoes (id, permissao) FROM stdin;
1	Permissao1
2	Permissao2
3	Permissao3
4	Permissao4
5	Permissao5
6	Permissao6
7	Permissao7
8	Permissao8
9	Permissao9
10	Permissao10
11	Permissao11
12	Permissao12
13	Permissao13
14	Permissao14
15	Permissao15
16	Permissao16
17	Permissao17
18	Permissao18
19	Permissao19
20	Permissao20
21	Permissao21
22	Permissao22
23	Permissao23
24	Permissao24
25	Permissao25
26	Permissao26
27	Permissao27
28	Permissao28
29	Permissao29
30	Permissao30
31	Permissao31
32	Permissao32
33	Permissao33
34	Permissao34
35	Permissao35
36	Permissao36
37	Permissao37
38	Permissao38
39	Permissao39
40	Permissao40
41	Permissao41
42	Permissao42
43	Permissao43
44	Permissao44
45	Permissao45
46	Permissao46
47	Permissao47
48	Permissao48
49	Permissao49
50	Permissao50
51	Permissao51
52	Permissao52
53	Permissao53
54	Permissao54
55	Permissao55
56	Permissao56
57	Permissao57
58	Permissao58
59	Permissao59
60	Permissao60
61	Permissao61
62	Permissao62
63	Permissao63
64	Permissao64
65	Permissao65
66	Permissao66
67	Permissao67
68	Permissao68
69	Permissao69
70	Permissao70
71	Permissao71
72	Permissao72
73	Permissao73
74	Permissao74
75	Permissao75
76	Permissao76
77	Permissao77
78	Permissao78
79	Permissao79
80	Permissao80
81	Permissao81
82	Permissao82
83	Permissao83
84	Permissao84
85	Permissao85
86	Permissao86
87	Permissao87
88	Permissao88
89	Permissao89
90	Permissao90
91	Permissao91
92	Permissao92
93	Permissao93
94	Permissao94
95	Permissao95
96	Permissao96
97	Permissao97
98	Permissao98
99	Permissao99
100	Permissao100
\.


--
-- Data for Name: pessoafisica; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.pessoafisica (id, cpf, id_cliente, nome, nascimento) FROM stdin;
101	11953558232	11	Nome1	1353-06-18
102	12995923339	19	Nome2	1765-11-30
103	46042358995	87	Nome3	1595-02-12
104	94086493705	21	Nome4	1779-03-06
105	47745303605	80	Nome5	1875-12-01
106	48907547769	65	Nome6	0993-08-21
107	28463006400	30	Nome7	1445-12-02
108	75295253791	82	Nome8	1006-01-10
109	53909454925	47	Nome9	1512-12-15
110	99434575893	70	Nome10	1477-03-25
111	30286416239	55	Nome11	1259-05-22
112	32393048995	96	Nome12	1370-08-12
113	25749865550	44	Nome13	1350-05-11
114	67210540199	72	Nome14	1770-06-13
115	17565798061	64	Nome15	1584-05-21
116	65739161401	14	Nome16	1622-02-15
117	68526191845	22	Nome17	1400-03-19
118	29123166185	57	Nome18	1484-06-23
119	16384036789	81	Nome19	1624-03-06
120	86411507066	41	Nome20	1510-12-05
121	86903983090	54	Nome21	1090-01-02
122	35868640276	96	Nome22	1165-06-19
123	20985782960	68	Nome23	0976-10-08
124	67961573623	21	Nome24	1135-05-15
125	85250204511	35	Nome25	1132-02-18
126	70568483545	66	Nome26	1567-08-30
127	41619520079	26	Nome27	1339-08-29
128	11787854248	14	Nome28	1524-05-27
129	22124515551	1	Nome29	1401-11-03
130	74082529403	32	Nome30	1237-07-12
131	99369543007	17	Nome31	1798-05-18
132	95388133168	50	Nome32	1877-04-27
133	26258812597	23	Nome33	1969-04-16
134	08603661200	63	Nome34	1505-08-12
135	72240938072	39	Nome35	1189-09-22
136	51715571878	93	Nome36	1952-09-30
137	66863724804	4	Nome37	1679-11-11
138	43474427261	11	Nome38	1041-10-11
139	39604993704	18	Nome39	1138-02-12
140	43354341203	48	Nome40	1084-02-12
141	11882382218	46	Nome41	1000-01-16
142	68077438237	16	Nome42	1614-05-20
143	08496793540	17	Nome43	1081-02-23
144	30729362183	98	Nome44	1963-05-18
145	45819266536	24	Nome45	1480-06-14
146	93932801008	55	Nome46	1829-08-29
147	81765088372	9	Nome47	1595-12-10
148	07130595248	57	Nome48	1465-10-24
149	44994798435	80	Nome49	0946-01-18
150	09131583725	93	Nome50	1006-01-30
151	88535894187	74	Nome51	0944-10-01
152	83817220634	96	Nome52	1805-06-17
153	62692131002	63	Nome53	1930-06-17
154	07008360045	73	Nome54	1048-10-28
155	86340909221	76	Nome55	1702-09-19
156	94671613387	57	Nome56	1754-07-06
157	71359471006	35	Nome57	2009-11-04
158	76288302856	87	Nome58	1666-09-30
159	87740913952	3	Nome59	1305-02-01
160	65027171102	80	Nome60	1802-11-15
161	73922069312	27	Nome61	1493-04-09
162	77243136605	92	Nome62	1071-08-03
163	16628514994	59	Nome63	1380-04-13
164	47832077557	45	Nome64	1951-07-05
165	11962986616	65	Nome65	1864-04-24
166	21932278109	39	Nome66	1775-08-22
167	23928489127	9	Nome67	1830-05-01
168	32549311060	38	Nome68	1931-08-11
169	45652437413	69	Nome69	1582-03-29
170	44362452338	69	Nome70	1116-02-17
171	35053897140	54	Nome71	1304-11-02
172	81014046432	64	Nome72	1989-01-05
173	89472777384	94	Nome73	1482-06-05
174	76486832533	95	Nome74	1845-02-21
175	91166198626	26	Nome75	1598-09-18
176	42536587177	88	Nome76	1070-11-01
177	06828226712	83	Nome77	1093-06-08
178	91061805077	73	Nome78	1653-06-27
179	81653480009	16	Nome79	2010-01-13
180	39249775695	69	Nome80	1060-06-28
181	75509236124	40	Nome81	1122-08-17
182	04524259309	13	Nome82	1051-10-15
183	45938894565	56	Nome83	1230-06-03
184	29262660499	75	Nome84	1702-07-29
185	58395901267	57	Nome85	1791-02-21
186	14021598545	40	Nome86	1836-07-17
187	76092092875	15	Nome87	1148-10-26
188	55693724905	85	Nome88	1316-06-05
189	70821163140	70	Nome89	1581-01-14
190	52852760207	62	Nome90	1353-08-13
191	85389496833	55	Nome91	1996-01-27
192	16477524180	31	Nome92	0964-07-07
193	13395049795	26	Nome93	1219-10-18
194	91138837717	97	Nome94	1143-07-03
195	28628001557	77	Nome95	1683-12-22
196	12737397286	79	Nome96	1248-06-02
197	54763537393	65	Nome97	1436-04-11
198	57184101278	25	Nome98	1647-03-24
199	48169306981	70	Nome99	1322-12-22
200	40809243300	29	Nome100	1613-05-06
\.


--
-- Data for Name: schema_version_api_autenticacao; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.schema_version_api_autenticacao (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	Version1	Description1	Type1	Script1	1234	User1	2024-01-24 15:48:58.945601	100	f
2	Version2	Description2	Type2	Script2	2468	User2	2024-01-23 15:48:58.945601	200	t
3	Version3	Description3	Type3	Script3	3702	User3	2024-01-22 15:48:58.945601	300	f
4	Version4	Description4	Type4	Script4	4936	User4	2024-01-21 15:48:58.945601	400	t
5	Version5	Description5	Type5	Script5	6170	User5	2024-01-20 15:48:58.945601	500	f
6	Version6	Description6	Type6	Script6	7404	User6	2024-01-19 15:48:58.945601	600	t
7	Version7	Description7	Type7	Script7	8638	User7	2024-01-18 15:48:58.945601	700	f
8	Version8	Description8	Type8	Script8	9872	User8	2024-01-17 15:48:58.945601	800	t
9	Version9	Description9	Type9	Script9	11106	User9	2024-01-16 15:48:58.945601	900	f
10	Version10	Description10	Type10	Script10	12340	User10	2024-01-15 15:48:58.945601	1000	t
11	Version11	Description11	Type11	Script11	13574	User11	2024-01-14 15:48:58.945601	1100	f
12	Version12	Description12	Type12	Script12	14808	User12	2024-01-13 15:48:58.945601	1200	t
13	Version13	Description13	Type13	Script13	16042	User13	2024-01-12 15:48:58.945601	1300	f
14	Version14	Description14	Type14	Script14	17276	User14	2024-01-11 15:48:58.945601	1400	t
15	Version15	Description15	Type15	Script15	18510	User15	2024-01-10 15:48:58.945601	1500	f
16	Version16	Description16	Type16	Script16	19744	User16	2024-01-09 15:48:58.945601	1600	t
17	Version17	Description17	Type17	Script17	20978	User17	2024-01-08 15:48:58.945601	1700	f
18	Version18	Description18	Type18	Script18	22212	User18	2024-01-07 15:48:58.945601	1800	t
19	Version19	Description19	Type19	Script19	23446	User19	2024-01-06 15:48:58.945601	1900	f
20	Version20	Description20	Type20	Script20	24680	User20	2024-01-05 15:48:58.945601	2000	t
21	Version21	Description21	Type21	Script21	25914	User21	2024-01-04 15:48:58.945601	2100	f
22	Version22	Description22	Type22	Script22	27148	User22	2024-01-03 15:48:58.945601	2200	t
23	Version23	Description23	Type23	Script23	28382	User23	2024-01-02 15:48:58.945601	2300	f
24	Version24	Description24	Type24	Script24	29616	User24	2024-01-01 15:48:58.945601	2400	t
25	Version25	Description25	Type25	Script25	30850	User25	2023-12-31 15:48:58.945601	2500	f
26	Version26	Description26	Type26	Script26	32084	User26	2023-12-30 15:48:58.945601	2600	t
27	Version27	Description27	Type27	Script27	33318	User27	2023-12-29 15:48:58.945601	2700	f
28	Version28	Description28	Type28	Script28	34552	User28	2023-12-28 15:48:58.945601	2800	t
29	Version29	Description29	Type29	Script29	35786	User29	2023-12-27 15:48:58.945601	2900	f
30	Version30	Description30	Type30	Script30	37020	User30	2024-01-25 15:48:58.945601	3000	t
31	Version31	Description31	Type31	Script31	38254	User31	2024-01-24 15:48:58.945601	3100	f
32	Version32	Description32	Type32	Script32	39488	User32	2024-01-23 15:48:58.945601	3200	t
33	Version33	Description33	Type33	Script33	40722	User33	2024-01-22 15:48:58.945601	3300	f
34	Version34	Description34	Type34	Script34	41956	User34	2024-01-21 15:48:58.945601	3400	t
35	Version35	Description35	Type35	Script35	43190	User35	2024-01-20 15:48:58.945601	3500	f
36	Version36	Description36	Type36	Script36	44424	User36	2024-01-19 15:48:58.945601	3600	t
37	Version37	Description37	Type37	Script37	45658	User37	2024-01-18 15:48:58.945601	3700	f
38	Version38	Description38	Type38	Script38	46892	User38	2024-01-17 15:48:58.945601	3800	t
39	Version39	Description39	Type39	Script39	48126	User39	2024-01-16 15:48:58.945601	3900	f
40	Version40	Description40	Type40	Script40	49360	User40	2024-01-15 15:48:58.945601	4000	t
41	Version41	Description41	Type41	Script41	50594	User41	2024-01-14 15:48:58.945601	4100	f
42	Version42	Description42	Type42	Script42	51828	User42	2024-01-13 15:48:58.945601	4200	t
43	Version43	Description43	Type43	Script43	53062	User43	2024-01-12 15:48:58.945601	4300	f
44	Version44	Description44	Type44	Script44	54296	User44	2024-01-11 15:48:58.945601	4400	t
45	Version45	Description45	Type45	Script45	55530	User45	2024-01-10 15:48:58.945601	4500	f
46	Version46	Description46	Type46	Script46	56764	User46	2024-01-09 15:48:58.945601	4600	t
47	Version47	Description47	Type47	Script47	57998	User47	2024-01-08 15:48:58.945601	4700	f
48	Version48	Description48	Type48	Script48	59232	User48	2024-01-07 15:48:58.945601	4800	t
49	Version49	Description49	Type49	Script49	60466	User49	2024-01-06 15:48:58.945601	4900	f
50	Version50	Description50	Type50	Script50	61700	User50	2024-01-05 15:48:58.945601	5000	t
51	Version51	Description51	Type51	Script51	62934	User51	2024-01-04 15:48:58.945601	5100	f
52	Version52	Description52	Type52	Script52	64168	User52	2024-01-03 15:48:58.945601	5200	t
53	Version53	Description53	Type53	Script53	65402	User53	2024-01-02 15:48:58.945601	5300	f
54	Version54	Description54	Type54	Script54	66636	User54	2024-01-01 15:48:58.945601	5400	t
55	Version55	Description55	Type55	Script55	67870	User55	2023-12-31 15:48:58.945601	5500	f
56	Version56	Description56	Type56	Script56	69104	User56	2023-12-30 15:48:58.945601	5600	t
57	Version57	Description57	Type57	Script57	70338	User57	2023-12-29 15:48:58.945601	5700	f
58	Version58	Description58	Type58	Script58	71572	User58	2023-12-28 15:48:58.945601	5800	t
59	Version59	Description59	Type59	Script59	72806	User59	2023-12-27 15:48:58.945601	5900	f
60	Version60	Description60	Type60	Script60	74040	User60	2024-01-25 15:48:58.945601	6000	t
61	Version61	Description61	Type61	Script61	75274	User61	2024-01-24 15:48:58.945601	6100	f
62	Version62	Description62	Type62	Script62	76508	User62	2024-01-23 15:48:58.945601	6200	t
63	Version63	Description63	Type63	Script63	77742	User63	2024-01-22 15:48:58.945601	6300	f
64	Version64	Description64	Type64	Script64	78976	User64	2024-01-21 15:48:58.945601	6400	t
65	Version65	Description65	Type65	Script65	80210	User65	2024-01-20 15:48:58.945601	6500	f
66	Version66	Description66	Type66	Script66	81444	User66	2024-01-19 15:48:58.945601	6600	t
67	Version67	Description67	Type67	Script67	82678	User67	2024-01-18 15:48:58.945601	6700	f
68	Version68	Description68	Type68	Script68	83912	User68	2024-01-17 15:48:58.945601	6800	t
69	Version69	Description69	Type69	Script69	85146	User69	2024-01-16 15:48:58.945601	6900	f
70	Version70	Description70	Type70	Script70	86380	User70	2024-01-15 15:48:58.945601	7000	t
71	Version71	Description71	Type71	Script71	87614	User71	2024-01-14 15:48:58.945601	7100	f
72	Version72	Description72	Type72	Script72	88848	User72	2024-01-13 15:48:58.945601	7200	t
73	Version73	Description73	Type73	Script73	90082	User73	2024-01-12 15:48:58.945601	7300	f
74	Version74	Description74	Type74	Script74	91316	User74	2024-01-11 15:48:58.945601	7400	t
75	Version75	Description75	Type75	Script75	92550	User75	2024-01-10 15:48:58.945601	7500	f
76	Version76	Description76	Type76	Script76	93784	User76	2024-01-09 15:48:58.945601	7600	t
77	Version77	Description77	Type77	Script77	95018	User77	2024-01-08 15:48:58.945601	7700	f
78	Version78	Description78	Type78	Script78	96252	User78	2024-01-07 15:48:58.945601	7800	t
79	Version79	Description79	Type79	Script79	97486	User79	2024-01-06 15:48:58.945601	7900	f
80	Version80	Description80	Type80	Script80	98720	User80	2024-01-05 15:48:58.945601	8000	t
81	Version81	Description81	Type81	Script81	99954	User81	2024-01-04 15:48:58.945601	8100	f
82	Version82	Description82	Type82	Script82	101188	User82	2024-01-03 15:48:58.945601	8200	t
83	Version83	Description83	Type83	Script83	102422	User83	2024-01-02 15:48:58.945601	8300	f
84	Version84	Description84	Type84	Script84	103656	User84	2024-01-01 15:48:58.945601	8400	t
85	Version85	Description85	Type85	Script85	104890	User85	2023-12-31 15:48:58.945601	8500	f
86	Version86	Description86	Type86	Script86	106124	User86	2023-12-30 15:48:58.945601	8600	t
87	Version87	Description87	Type87	Script87	107358	User87	2023-12-29 15:48:58.945601	8700	f
88	Version88	Description88	Type88	Script88	108592	User88	2023-12-28 15:48:58.945601	8800	t
89	Version89	Description89	Type89	Script89	109826	User89	2023-12-27 15:48:58.945601	8900	f
90	Version90	Description90	Type90	Script90	111060	User90	2024-01-25 15:48:58.945601	9000	t
91	Version91	Description91	Type91	Script91	112294	User91	2024-01-24 15:48:58.945601	9100	f
92	Version92	Description92	Type92	Script92	113528	User92	2024-01-23 15:48:58.945601	9200	t
93	Version93	Description93	Type93	Script93	114762	User93	2024-01-22 15:48:58.945601	9300	f
94	Version94	Description94	Type94	Script94	115996	User94	2024-01-21 15:48:58.945601	9400	t
95	Version95	Description95	Type95	Script95	117230	User95	2024-01-20 15:48:58.945601	9500	f
96	Version96	Description96	Type96	Script96	118464	User96	2024-01-19 15:48:58.945601	9600	t
97	Version97	Description97	Type97	Script97	119698	User97	2024-01-18 15:48:58.945601	9700	f
98	Version98	Description98	Type98	Script98	120932	User98	2024-01-17 15:48:58.945601	9800	t
99	Version99	Description99	Type99	Script99	122166	User99	2024-01-16 15:48:58.945601	9900	f
100	Version100	Description100	Type100	Script100	123400	User100	2024-01-15 15:48:58.945601	10000	t
\.


--
-- Data for Name: schema_version_api_geral; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.schema_version_api_geral (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	Version1	Description1	Type1	Script1	1234	User1	2024-01-24 15:49:35.206767	100	f
2	Version2	Description2	Type2	Script2	2468	User2	2024-01-23 15:49:35.206767	200	t
3	Version3	Description3	Type3	Script3	3702	User3	2024-01-22 15:49:35.206767	300	f
4	Version4	Description4	Type4	Script4	4936	User4	2024-01-21 15:49:35.206767	400	t
5	Version5	Description5	Type5	Script5	6170	User5	2024-01-20 15:49:35.206767	500	f
6	Version6	Description6	Type6	Script6	7404	User6	2024-01-19 15:49:35.206767	600	t
7	Version7	Description7	Type7	Script7	8638	User7	2024-01-18 15:49:35.206767	700	f
8	Version8	Description8	Type8	Script8	9872	User8	2024-01-17 15:49:35.206767	800	t
9	Version9	Description9	Type9	Script9	11106	User9	2024-01-16 15:49:35.206767	900	f
10	Version10	Description10	Type10	Script10	12340	User10	2024-01-15 15:49:35.206767	1000	t
11	Version11	Description11	Type11	Script11	13574	User11	2024-01-14 15:49:35.206767	1100	f
12	Version12	Description12	Type12	Script12	14808	User12	2024-01-13 15:49:35.206767	1200	t
13	Version13	Description13	Type13	Script13	16042	User13	2024-01-12 15:49:35.206767	1300	f
14	Version14	Description14	Type14	Script14	17276	User14	2024-01-11 15:49:35.206767	1400	t
15	Version15	Description15	Type15	Script15	18510	User15	2024-01-10 15:49:35.206767	1500	f
16	Version16	Description16	Type16	Script16	19744	User16	2024-01-09 15:49:35.206767	1600	t
17	Version17	Description17	Type17	Script17	20978	User17	2024-01-08 15:49:35.206767	1700	f
18	Version18	Description18	Type18	Script18	22212	User18	2024-01-07 15:49:35.206767	1800	t
19	Version19	Description19	Type19	Script19	23446	User19	2024-01-06 15:49:35.206767	1900	f
20	Version20	Description20	Type20	Script20	24680	User20	2024-01-05 15:49:35.206767	2000	t
21	Version21	Description21	Type21	Script21	25914	User21	2024-01-04 15:49:35.206767	2100	f
22	Version22	Description22	Type22	Script22	27148	User22	2024-01-03 15:49:35.206767	2200	t
23	Version23	Description23	Type23	Script23	28382	User23	2024-01-02 15:49:35.206767	2300	f
24	Version24	Description24	Type24	Script24	29616	User24	2024-01-01 15:49:35.206767	2400	t
25	Version25	Description25	Type25	Script25	30850	User25	2023-12-31 15:49:35.206767	2500	f
26	Version26	Description26	Type26	Script26	32084	User26	2023-12-30 15:49:35.206767	2600	t
27	Version27	Description27	Type27	Script27	33318	User27	2023-12-29 15:49:35.206767	2700	f
28	Version28	Description28	Type28	Script28	34552	User28	2023-12-28 15:49:35.206767	2800	t
29	Version29	Description29	Type29	Script29	35786	User29	2023-12-27 15:49:35.206767	2900	f
30	Version30	Description30	Type30	Script30	37020	User30	2024-01-25 15:49:35.206767	3000	t
31	Version31	Description31	Type31	Script31	38254	User31	2024-01-24 15:49:35.206767	3100	f
32	Version32	Description32	Type32	Script32	39488	User32	2024-01-23 15:49:35.206767	3200	t
33	Version33	Description33	Type33	Script33	40722	User33	2024-01-22 15:49:35.206767	3300	f
34	Version34	Description34	Type34	Script34	41956	User34	2024-01-21 15:49:35.206767	3400	t
35	Version35	Description35	Type35	Script35	43190	User35	2024-01-20 15:49:35.206767	3500	f
36	Version36	Description36	Type36	Script36	44424	User36	2024-01-19 15:49:35.206767	3600	t
37	Version37	Description37	Type37	Script37	45658	User37	2024-01-18 15:49:35.206767	3700	f
38	Version38	Description38	Type38	Script38	46892	User38	2024-01-17 15:49:35.206767	3800	t
39	Version39	Description39	Type39	Script39	48126	User39	2024-01-16 15:49:35.206767	3900	f
40	Version40	Description40	Type40	Script40	49360	User40	2024-01-15 15:49:35.206767	4000	t
41	Version41	Description41	Type41	Script41	50594	User41	2024-01-14 15:49:35.206767	4100	f
42	Version42	Description42	Type42	Script42	51828	User42	2024-01-13 15:49:35.206767	4200	t
43	Version43	Description43	Type43	Script43	53062	User43	2024-01-12 15:49:35.206767	4300	f
44	Version44	Description44	Type44	Script44	54296	User44	2024-01-11 15:49:35.206767	4400	t
45	Version45	Description45	Type45	Script45	55530	User45	2024-01-10 15:49:35.206767	4500	f
46	Version46	Description46	Type46	Script46	56764	User46	2024-01-09 15:49:35.206767	4600	t
47	Version47	Description47	Type47	Script47	57998	User47	2024-01-08 15:49:35.206767	4700	f
48	Version48	Description48	Type48	Script48	59232	User48	2024-01-07 15:49:35.206767	4800	t
49	Version49	Description49	Type49	Script49	60466	User49	2024-01-06 15:49:35.206767	4900	f
50	Version50	Description50	Type50	Script50	61700	User50	2024-01-05 15:49:35.206767	5000	t
51	Version51	Description51	Type51	Script51	62934	User51	2024-01-04 15:49:35.206767	5100	f
52	Version52	Description52	Type52	Script52	64168	User52	2024-01-03 15:49:35.206767	5200	t
53	Version53	Description53	Type53	Script53	65402	User53	2024-01-02 15:49:35.206767	5300	f
54	Version54	Description54	Type54	Script54	66636	User54	2024-01-01 15:49:35.206767	5400	t
55	Version55	Description55	Type55	Script55	67870	User55	2023-12-31 15:49:35.206767	5500	f
56	Version56	Description56	Type56	Script56	69104	User56	2023-12-30 15:49:35.206767	5600	t
57	Version57	Description57	Type57	Script57	70338	User57	2023-12-29 15:49:35.206767	5700	f
58	Version58	Description58	Type58	Script58	71572	User58	2023-12-28 15:49:35.206767	5800	t
59	Version59	Description59	Type59	Script59	72806	User59	2023-12-27 15:49:35.206767	5900	f
60	Version60	Description60	Type60	Script60	74040	User60	2024-01-25 15:49:35.206767	6000	t
61	Version61	Description61	Type61	Script61	75274	User61	2024-01-24 15:49:35.206767	6100	f
62	Version62	Description62	Type62	Script62	76508	User62	2024-01-23 15:49:35.206767	6200	t
63	Version63	Description63	Type63	Script63	77742	User63	2024-01-22 15:49:35.206767	6300	f
64	Version64	Description64	Type64	Script64	78976	User64	2024-01-21 15:49:35.206767	6400	t
65	Version65	Description65	Type65	Script65	80210	User65	2024-01-20 15:49:35.206767	6500	f
66	Version66	Description66	Type66	Script66	81444	User66	2024-01-19 15:49:35.206767	6600	t
67	Version67	Description67	Type67	Script67	82678	User67	2024-01-18 15:49:35.206767	6700	f
68	Version68	Description68	Type68	Script68	83912	User68	2024-01-17 15:49:35.206767	6800	t
69	Version69	Description69	Type69	Script69	85146	User69	2024-01-16 15:49:35.206767	6900	f
70	Version70	Description70	Type70	Script70	86380	User70	2024-01-15 15:49:35.206767	7000	t
71	Version71	Description71	Type71	Script71	87614	User71	2024-01-14 15:49:35.206767	7100	f
72	Version72	Description72	Type72	Script72	88848	User72	2024-01-13 15:49:35.206767	7200	t
73	Version73	Description73	Type73	Script73	90082	User73	2024-01-12 15:49:35.206767	7300	f
74	Version74	Description74	Type74	Script74	91316	User74	2024-01-11 15:49:35.206767	7400	t
75	Version75	Description75	Type75	Script75	92550	User75	2024-01-10 15:49:35.206767	7500	f
76	Version76	Description76	Type76	Script76	93784	User76	2024-01-09 15:49:35.206767	7600	t
77	Version77	Description77	Type77	Script77	95018	User77	2024-01-08 15:49:35.206767	7700	f
78	Version78	Description78	Type78	Script78	96252	User78	2024-01-07 15:49:35.206767	7800	t
79	Version79	Description79	Type79	Script79	97486	User79	2024-01-06 15:49:35.206767	7900	f
80	Version80	Description80	Type80	Script80	98720	User80	2024-01-05 15:49:35.206767	8000	t
81	Version81	Description81	Type81	Script81	99954	User81	2024-01-04 15:49:35.206767	8100	f
82	Version82	Description82	Type82	Script82	101188	User82	2024-01-03 15:49:35.206767	8200	t
83	Version83	Description83	Type83	Script83	102422	User83	2024-01-02 15:49:35.206767	8300	f
84	Version84	Description84	Type84	Script84	103656	User84	2024-01-01 15:49:35.206767	8400	t
85	Version85	Description85	Type85	Script85	104890	User85	2023-12-31 15:49:35.206767	8500	f
86	Version86	Description86	Type86	Script86	106124	User86	2023-12-30 15:49:35.206767	8600	t
87	Version87	Description87	Type87	Script87	107358	User87	2023-12-29 15:49:35.206767	8700	f
88	Version88	Description88	Type88	Script88	108592	User88	2023-12-28 15:49:35.206767	8800	t
89	Version89	Description89	Type89	Script89	109826	User89	2023-12-27 15:49:35.206767	8900	f
90	Version90	Description90	Type90	Script90	111060	User90	2024-01-25 15:49:35.206767	9000	t
91	Version91	Description91	Type91	Script91	112294	User91	2024-01-24 15:49:35.206767	9100	f
92	Version92	Description92	Type92	Script92	113528	User92	2024-01-23 15:49:35.206767	9200	t
93	Version93	Description93	Type93	Script93	114762	User93	2024-01-22 15:49:35.206767	9300	f
94	Version94	Description94	Type94	Script94	115996	User94	2024-01-21 15:49:35.206767	9400	t
95	Version95	Description95	Type95	Script95	117230	User95	2024-01-20 15:49:35.206767	9500	f
96	Version96	Description96	Type96	Script96	118464	User96	2024-01-19 15:49:35.206767	9600	t
97	Version97	Description97	Type97	Script97	119698	User97	2024-01-18 15:49:35.206767	9700	f
98	Version98	Description98	Type98	Script98	120932	User98	2024-01-17 15:49:35.206767	9800	t
99	Version99	Description99	Type99	Script99	122166	User99	2024-01-16 15:49:35.206767	9900	f
100	Version100	Description100	Type100	Script100	123400	User100	2024-01-15 15:49:35.206767	10000	t
\.


--
-- Data for Name: schema_version_ms_processamento; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.schema_version_ms_processamento (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	Version1	Description1	Type1	Script1	1234	User1	2024-01-24 15:49:54.065663	100	f
2	Version2	Description2	Type2	Script2	2468	User2	2024-01-23 15:49:54.065663	200	t
3	Version3	Description3	Type3	Script3	3702	User3	2024-01-22 15:49:54.065663	300	f
4	Version4	Description4	Type4	Script4	4936	User4	2024-01-21 15:49:54.065663	400	t
5	Version5	Description5	Type5	Script5	6170	User5	2024-01-20 15:49:54.065663	500	f
6	Version6	Description6	Type6	Script6	7404	User6	2024-01-19 15:49:54.065663	600	t
7	Version7	Description7	Type7	Script7	8638	User7	2024-01-18 15:49:54.065663	700	f
8	Version8	Description8	Type8	Script8	9872	User8	2024-01-17 15:49:54.065663	800	t
9	Version9	Description9	Type9	Script9	11106	User9	2024-01-16 15:49:54.065663	900	f
10	Version10	Description10	Type10	Script10	12340	User10	2024-01-15 15:49:54.065663	1000	t
11	Version11	Description11	Type11	Script11	13574	User11	2024-01-14 15:49:54.065663	1100	f
12	Version12	Description12	Type12	Script12	14808	User12	2024-01-13 15:49:54.065663	1200	t
13	Version13	Description13	Type13	Script13	16042	User13	2024-01-12 15:49:54.065663	1300	f
14	Version14	Description14	Type14	Script14	17276	User14	2024-01-11 15:49:54.065663	1400	t
15	Version15	Description15	Type15	Script15	18510	User15	2024-01-10 15:49:54.065663	1500	f
16	Version16	Description16	Type16	Script16	19744	User16	2024-01-09 15:49:54.065663	1600	t
17	Version17	Description17	Type17	Script17	20978	User17	2024-01-08 15:49:54.065663	1700	f
18	Version18	Description18	Type18	Script18	22212	User18	2024-01-07 15:49:54.065663	1800	t
19	Version19	Description19	Type19	Script19	23446	User19	2024-01-06 15:49:54.065663	1900	f
20	Version20	Description20	Type20	Script20	24680	User20	2024-01-05 15:49:54.065663	2000	t
21	Version21	Description21	Type21	Script21	25914	User21	2024-01-04 15:49:54.065663	2100	f
22	Version22	Description22	Type22	Script22	27148	User22	2024-01-03 15:49:54.065663	2200	t
23	Version23	Description23	Type23	Script23	28382	User23	2024-01-02 15:49:54.065663	2300	f
24	Version24	Description24	Type24	Script24	29616	User24	2024-01-01 15:49:54.065663	2400	t
25	Version25	Description25	Type25	Script25	30850	User25	2023-12-31 15:49:54.065663	2500	f
26	Version26	Description26	Type26	Script26	32084	User26	2023-12-30 15:49:54.065663	2600	t
27	Version27	Description27	Type27	Script27	33318	User27	2023-12-29 15:49:54.065663	2700	f
28	Version28	Description28	Type28	Script28	34552	User28	2023-12-28 15:49:54.065663	2800	t
29	Version29	Description29	Type29	Script29	35786	User29	2023-12-27 15:49:54.065663	2900	f
30	Version30	Description30	Type30	Script30	37020	User30	2024-01-25 15:49:54.065663	3000	t
31	Version31	Description31	Type31	Script31	38254	User31	2024-01-24 15:49:54.065663	3100	f
32	Version32	Description32	Type32	Script32	39488	User32	2024-01-23 15:49:54.065663	3200	t
33	Version33	Description33	Type33	Script33	40722	User33	2024-01-22 15:49:54.065663	3300	f
34	Version34	Description34	Type34	Script34	41956	User34	2024-01-21 15:49:54.065663	3400	t
35	Version35	Description35	Type35	Script35	43190	User35	2024-01-20 15:49:54.065663	3500	f
36	Version36	Description36	Type36	Script36	44424	User36	2024-01-19 15:49:54.065663	3600	t
37	Version37	Description37	Type37	Script37	45658	User37	2024-01-18 15:49:54.065663	3700	f
38	Version38	Description38	Type38	Script38	46892	User38	2024-01-17 15:49:54.065663	3800	t
39	Version39	Description39	Type39	Script39	48126	User39	2024-01-16 15:49:54.065663	3900	f
40	Version40	Description40	Type40	Script40	49360	User40	2024-01-15 15:49:54.065663	4000	t
41	Version41	Description41	Type41	Script41	50594	User41	2024-01-14 15:49:54.065663	4100	f
42	Version42	Description42	Type42	Script42	51828	User42	2024-01-13 15:49:54.065663	4200	t
43	Version43	Description43	Type43	Script43	53062	User43	2024-01-12 15:49:54.065663	4300	f
44	Version44	Description44	Type44	Script44	54296	User44	2024-01-11 15:49:54.065663	4400	t
45	Version45	Description45	Type45	Script45	55530	User45	2024-01-10 15:49:54.065663	4500	f
46	Version46	Description46	Type46	Script46	56764	User46	2024-01-09 15:49:54.065663	4600	t
47	Version47	Description47	Type47	Script47	57998	User47	2024-01-08 15:49:54.065663	4700	f
48	Version48	Description48	Type48	Script48	59232	User48	2024-01-07 15:49:54.065663	4800	t
49	Version49	Description49	Type49	Script49	60466	User49	2024-01-06 15:49:54.065663	4900	f
50	Version50	Description50	Type50	Script50	61700	User50	2024-01-05 15:49:54.065663	5000	t
51	Version51	Description51	Type51	Script51	62934	User51	2024-01-04 15:49:54.065663	5100	f
52	Version52	Description52	Type52	Script52	64168	User52	2024-01-03 15:49:54.065663	5200	t
53	Version53	Description53	Type53	Script53	65402	User53	2024-01-02 15:49:54.065663	5300	f
54	Version54	Description54	Type54	Script54	66636	User54	2024-01-01 15:49:54.065663	5400	t
55	Version55	Description55	Type55	Script55	67870	User55	2023-12-31 15:49:54.065663	5500	f
56	Version56	Description56	Type56	Script56	69104	User56	2023-12-30 15:49:54.065663	5600	t
57	Version57	Description57	Type57	Script57	70338	User57	2023-12-29 15:49:54.065663	5700	f
58	Version58	Description58	Type58	Script58	71572	User58	2023-12-28 15:49:54.065663	5800	t
59	Version59	Description59	Type59	Script59	72806	User59	2023-12-27 15:49:54.065663	5900	f
60	Version60	Description60	Type60	Script60	74040	User60	2024-01-25 15:49:54.065663	6000	t
61	Version61	Description61	Type61	Script61	75274	User61	2024-01-24 15:49:54.065663	6100	f
62	Version62	Description62	Type62	Script62	76508	User62	2024-01-23 15:49:54.065663	6200	t
63	Version63	Description63	Type63	Script63	77742	User63	2024-01-22 15:49:54.065663	6300	f
64	Version64	Description64	Type64	Script64	78976	User64	2024-01-21 15:49:54.065663	6400	t
65	Version65	Description65	Type65	Script65	80210	User65	2024-01-20 15:49:54.065663	6500	f
66	Version66	Description66	Type66	Script66	81444	User66	2024-01-19 15:49:54.065663	6600	t
67	Version67	Description67	Type67	Script67	82678	User67	2024-01-18 15:49:54.065663	6700	f
68	Version68	Description68	Type68	Script68	83912	User68	2024-01-17 15:49:54.065663	6800	t
69	Version69	Description69	Type69	Script69	85146	User69	2024-01-16 15:49:54.065663	6900	f
70	Version70	Description70	Type70	Script70	86380	User70	2024-01-15 15:49:54.065663	7000	t
71	Version71	Description71	Type71	Script71	87614	User71	2024-01-14 15:49:54.065663	7100	f
72	Version72	Description72	Type72	Script72	88848	User72	2024-01-13 15:49:54.065663	7200	t
73	Version73	Description73	Type73	Script73	90082	User73	2024-01-12 15:49:54.065663	7300	f
74	Version74	Description74	Type74	Script74	91316	User74	2024-01-11 15:49:54.065663	7400	t
75	Version75	Description75	Type75	Script75	92550	User75	2024-01-10 15:49:54.065663	7500	f
76	Version76	Description76	Type76	Script76	93784	User76	2024-01-09 15:49:54.065663	7600	t
77	Version77	Description77	Type77	Script77	95018	User77	2024-01-08 15:49:54.065663	7700	f
78	Version78	Description78	Type78	Script78	96252	User78	2024-01-07 15:49:54.065663	7800	t
79	Version79	Description79	Type79	Script79	97486	User79	2024-01-06 15:49:54.065663	7900	f
80	Version80	Description80	Type80	Script80	98720	User80	2024-01-05 15:49:54.065663	8000	t
81	Version81	Description81	Type81	Script81	99954	User81	2024-01-04 15:49:54.065663	8100	f
82	Version82	Description82	Type82	Script82	101188	User82	2024-01-03 15:49:54.065663	8200	t
83	Version83	Description83	Type83	Script83	102422	User83	2024-01-02 15:49:54.065663	8300	f
84	Version84	Description84	Type84	Script84	103656	User84	2024-01-01 15:49:54.065663	8400	t
85	Version85	Description85	Type85	Script85	104890	User85	2023-12-31 15:49:54.065663	8500	f
86	Version86	Description86	Type86	Script86	106124	User86	2023-12-30 15:49:54.065663	8600	t
87	Version87	Description87	Type87	Script87	107358	User87	2023-12-29 15:49:54.065663	8700	f
88	Version88	Description88	Type88	Script88	108592	User88	2023-12-28 15:49:54.065663	8800	t
89	Version89	Description89	Type89	Script89	109826	User89	2023-12-27 15:49:54.065663	8900	f
90	Version90	Description90	Type90	Script90	111060	User90	2024-01-25 15:49:54.065663	9000	t
91	Version91	Description91	Type91	Script91	112294	User91	2024-01-24 15:49:54.065663	9100	f
92	Version92	Description92	Type92	Script92	113528	User92	2024-01-23 15:49:54.065663	9200	t
93	Version93	Description93	Type93	Script93	114762	User93	2024-01-22 15:49:54.065663	9300	f
94	Version94	Description94	Type94	Script94	115996	User94	2024-01-21 15:49:54.065663	9400	t
95	Version95	Description95	Type95	Script95	117230	User95	2024-01-20 15:49:54.065663	9500	f
96	Version96	Description96	Type96	Script96	118464	User96	2024-01-19 15:49:54.065663	9600	t
97	Version97	Description97	Type97	Script97	119698	User97	2024-01-18 15:49:54.065663	9700	f
98	Version98	Description98	Type98	Script98	120932	User98	2024-01-17 15:49:54.065663	9800	t
99	Version99	Description99	Type99	Script99	122166	User99	2024-01-16 15:49:54.065663	9900	f
100	Version100	Description100	Type100	Script100	123400	User100	2024-01-15 15:49:54.065663	10000	t
\.


--
-- Name: ativo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.ativo_id_seq', 100, true);


--
-- Name: carteira_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.carteira_id_seq', 100, true);


--
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.cliente_id_seq', 100, true);


--
-- Name: cliente_permissao_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.cliente_permissao_id_cliente_seq', 1, false);


--
-- Name: cliente_permissao_id_permissao_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.cliente_permissao_id_permissao_seq', 1, false);


--
-- Name: empresa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.empresa_id_seq', 100, true);


--
-- Name: historico_preco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.historico_preco_id_seq', 100, true);


--
-- Name: operacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.operacao_id_seq', 200, true);


--
-- Name: ordem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.ordem_id_seq', 100, true);


--
-- Name: permissoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.permissoes_id_seq', 100, true);


--
-- Name: pessoafisica_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.pessoafisica_id_cliente_seq', 1, false);


--
-- Name: pessoafisica_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.pessoafisica_id_seq', 200, true);


--
-- Name: ativo ativo_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ativo
    ADD CONSTRAINT ativo_pkey PRIMARY KEY (id);


--
-- Name: carteira carteira_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.carteira
    ADD CONSTRAINT carteira_pkey PRIMARY KEY (id);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- Name: empresa empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (id);


--
-- Name: historico_preco historico_preco_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.historico_preco
    ADD CONSTRAINT historico_preco_pkey PRIMARY KEY (id);


--
-- Name: operacao operacao_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.operacao
    ADD CONSTRAINT operacao_pkey PRIMARY KEY (id);


--
-- Name: ordem ordem_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ordem
    ADD CONSTRAINT ordem_pkey PRIMARY KEY (id);


--
-- Name: permissoes permissoes_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissoes
    ADD CONSTRAINT permissoes_pkey PRIMARY KEY (id);


--
-- Name: pessoafisica pessoafisica_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.pessoafisica
    ADD CONSTRAINT pessoafisica_pkey PRIMARY KEY (id);


--
-- Name: schema_version_api_autenticacao schema_version_api_autenticacao_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.schema_version_api_autenticacao
    ADD CONSTRAINT schema_version_api_autenticacao_pk PRIMARY KEY (installed_rank);


--
-- Name: schema_version_api_geral schema_version_api_geral_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.schema_version_api_geral
    ADD CONSTRAINT schema_version_api_geral_pk PRIMARY KEY (installed_rank);


--
-- Name: schema_version_ms_processamento schema_version_ms_processamento_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.schema_version_ms_processamento
    ADD CONSTRAINT schema_version_ms_processamento_pk PRIMARY KEY (installed_rank);


--
-- Name: schema_version_api_autenticacao_s_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX schema_version_api_autenticacao_s_idx ON public.schema_version_api_autenticacao USING btree (success);


--
-- Name: schema_version_api_geral_s_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX schema_version_api_geral_s_idx ON public.schema_version_api_geral USING btree (success);


--
-- Name: schema_version_ms_processamento_s_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX schema_version_ms_processamento_s_idx ON public.schema_version_ms_processamento USING btree (success);


--
-- Name: ativo ativo_id_empresa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ativo
    ADD CONSTRAINT ativo_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES public.empresa(id);


--
-- Name: carteira carteira_id_ativo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.carteira
    ADD CONSTRAINT carteira_id_ativo_fkey FOREIGN KEY (id_ativo) REFERENCES public.ativo(id);


--
-- Name: carteira carteira_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.carteira
    ADD CONSTRAINT carteira_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id);


--
-- Name: cliente_permissao cliente_permissao_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cliente_permissao
    ADD CONSTRAINT cliente_permissao_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id);


--
-- Name: cliente_permissao cliente_permissao_id_permissao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cliente_permissao
    ADD CONSTRAINT cliente_permissao_id_permissao_fkey FOREIGN KEY (id_permissao) REFERENCES public.permissoes(id);


--
-- Name: historico_preco historico_preco_id_ativo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.historico_preco
    ADD CONSTRAINT historico_preco_id_ativo_fkey FOREIGN KEY (id_ativo) REFERENCES public.ativo(id);


--
-- Name: operacao operacao_id_compra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.operacao
    ADD CONSTRAINT operacao_id_compra_fkey FOREIGN KEY (id_compra) REFERENCES public.ordem(id);


--
-- Name: operacao operacao_id_venda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.operacao
    ADD CONSTRAINT operacao_id_venda_fkey FOREIGN KEY (id_venda) REFERENCES public.ordem(id);


--
-- Name: ordem ordem_id_ativo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ordem
    ADD CONSTRAINT ordem_id_ativo_fkey FOREIGN KEY (id_ativo) REFERENCES public.ativo(id);


--
-- Name: ordem ordem_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ordem
    ADD CONSTRAINT ordem_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id);


--
-- Name: pessoafisica pessoafisica_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.pessoafisica
    ADD CONSTRAINT pessoafisica_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id);


--
-- PostgreSQL database dump complete
--

