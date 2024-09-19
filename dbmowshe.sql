--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Ubuntu 14.13-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.13 (Ubuntu 14.13-0ubuntu0.22.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: acc_racer; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.acc_racer (
    id integer NOT NULL,
    id_acc integer NOT NULL,
    id_racer integer NOT NULL
);


ALTER TABLE public.acc_racer OWNER TO admin;

--
-- Name: acc_racer_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.acc_racer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acc_racer_id_seq OWNER TO admin;

--
-- Name: acc_racer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.acc_racer_id_seq OWNED BY public.acc_racer.id;


--
-- Name: accounts; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.accounts (
    id integer NOT NULL,
    email text DEFAULT '@'::text NOT NULL,
    full_name text NOT NULL,
    token_uuid character varying DEFAULT '36'::character varying NOT NULL
);


ALTER TABLE public.accounts OWNER TO admin;

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO admin;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- Name: enums; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.enums (
    id integer NOT NULL,
    type character varying(15) NOT NULL,
    label text NOT NULL,
    sub_type character varying DEFAULT '15'::character varying NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.enums OWNER TO admin;

--
-- Name: enums_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.enums_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enums_id_seq OWNER TO admin;

--
-- Name: enums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.enums_id_seq OWNED BY public.enums.id;


--
-- Name: enums_types; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.enums_types (
    id character varying(15) NOT NULL,
    title text NOT NULL,
    lead_type_for_sub_type character varying DEFAULT '15'::character varying,
    lead_value_for_sub_type text NOT NULL
);


ALTER TABLE public.enums_types OWNER TO admin;

--
-- Name: enums_types_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.enums_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enums_types_id_seq OWNER TO admin;

--
-- Name: enums_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.enums_types_id_seq OWNED BY public.enums_types.id;


--
-- Name: racers; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.racers (
    id integer NOT NULL,
    nick_name text NOT NULL,
    full_name text NOT NULL,
    phone text DEFAULT '+420'::text,
    first_time boolean NOT NULL,
    days jsonb NOT NULL,
    tshirt_len integer DEFAULT 0 NOT NULL,
    kid_age integer DEFAULT 0 NOT NULL,
    transport integer NOT NULL,
    eat integer NOT NULL,
    mikina_type integer,
    mikina_len integer,
    mikina_color integer NOT NULL,
    team integer NOT NULL
);


ALTER TABLE public.racers OWNER TO admin;

--
-- Name: racers_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.racers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.racers_id_seq OWNER TO admin;

--
-- Name: racers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.racers_id_seq OWNED BY public.racers.id;


--
-- Name: setup; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.setup (
    id integer NOT NULL,
    email_subject character varying DEFAULT '200'::character varying NOT NULL,
    email_body text NOT NULL,
    "from" date NOT NULL,
    "to" date NOT NULL
);


ALTER TABLE public.setup OWNER TO admin;

--
-- Name: setup_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.setup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.setup_id_seq OWNER TO admin;

--
-- Name: setup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.setup_id_seq OWNED BY public.setup.id;


--
-- Name: acc_racer id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.acc_racer ALTER COLUMN id SET DEFAULT nextval('public.acc_racer_id_seq'::regclass);


--
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- Name: enums id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.enums ALTER COLUMN id SET DEFAULT nextval('public.enums_id_seq'::regclass);


--
-- Name: racers id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.racers ALTER COLUMN id SET DEFAULT nextval('public.racers_id_seq'::regclass);


--
-- Name: setup id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.setup ALTER COLUMN id SET DEFAULT nextval('public.setup_id_seq'::regclass);


--
-- Data for Name: acc_racer; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.acc_racer (id, id_acc, id_racer) FROM stdin;
\.


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.accounts (id, email, full_name, token_uuid) FROM stdin;
\.


--
-- Data for Name: enums; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.enums (id, type, label, sub_type, "order") FROM stdin;
\.


--
-- Data for Name: enums_types; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.enums_types (id, title, lead_type_for_sub_type, lead_value_for_sub_type) FROM stdin;
\.


--
-- Data for Name: racers; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.racers (id, nick_name, full_name, phone, first_time, days, tshirt_len, kid_age, transport, eat, mikina_type, mikina_len, mikina_color, team) FROM stdin;
\.


--
-- Data for Name: setup; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.setup (id, email_subject, email_body, "from", "to") FROM stdin;
2	Prihlaska Mowshe Mir 2025	Prihlaska Mowshe Mir 2025	2025-08-01	2025-08-08
\.


--
-- Name: acc_racer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.acc_racer_id_seq', 1, false);


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.accounts_id_seq', 1, false);


--
-- Name: enums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.enums_id_seq', 1, false);


--
-- Name: enums_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.enums_types_id_seq', 1, false);


--
-- Name: racers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.racers_id_seq', 1, false);


--
-- Name: setup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.setup_id_seq', 2, true);


--
-- Name: acc_racer acc_racer_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.acc_racer
    ADD CONSTRAINT acc_racer_pkey PRIMARY KEY (id);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: enums enums_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.enums
    ADD CONSTRAINT enums_pkey PRIMARY KEY (id);


--
-- Name: enums_types enums_types_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.enums_types
    ADD CONSTRAINT enums_types_pkey PRIMARY KEY (id);


--
-- Name: racers racers_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.racers
    ADD CONSTRAINT racers_pkey PRIMARY KEY (id);


--
-- Name: setup setup_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.setup
    ADD CONSTRAINT setup_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

