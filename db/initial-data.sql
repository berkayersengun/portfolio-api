--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Ubuntu 14.2-1.pgdg21.10+1)
-- Dumped by pg_dump version 14.2 (Ubuntu 14.2-1.pgdg21.10+1)
--CREATE DATABASE portfolio;

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
-- Name: accounts_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_account (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    currency character varying(15) NOT NULL
);


ALTER TABLE public.accounts_account OWNER TO postgres;

--
-- Name: accounts_account_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_account_groups (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_account_groups OWNER TO postgres;

--
-- Name: accounts_account_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_account_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_account_groups_id_seq OWNER TO postgres;

--
-- Name: accounts_account_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_account_groups_id_seq OWNED BY public.accounts_account_groups.id;


--
-- Name: accounts_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_account_id_seq OWNER TO postgres;

--
-- Name: accounts_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_account_id_seq OWNED BY public.accounts_account.id;


--
-- Name: accounts_account_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_account_user_permissions (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.accounts_account_user_permissions OWNER TO postgres;

--
-- Name: accounts_account_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_account_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_account_user_permissions_id_seq OWNER TO postgres;

--
-- Name: accounts_account_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_account_user_permissions_id_seq OWNED BY public.accounts_account_user_permissions.id;


--
-- Name: accounts_capital; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_capital (
    crypto integer NOT NULL,
    stock integer NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.accounts_capital OWNER TO postgres;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: holdings_holding; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.holdings_holding (
    id bigint NOT NULL,
    quantity double precision NOT NULL,
    user_id bigint NOT NULL,
    symbol character varying(15) NOT NULL,
    date timestamp with time zone NOT NULL,
    type character varying(10) NOT NULL,
    purchase_price double precision NOT NULL,
    currency character varying(15) NOT NULL
);


ALTER TABLE public.holdings_holding OWNER TO postgres;

--
-- Name: holdings_holding_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.holdings_holding_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.holdings_holding_id_seq OWNER TO postgres;

--
-- Name: holdings_holding_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.holdings_holding_id_seq OWNED BY public.holdings_holding.id;


--
-- Name: accounts_account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_account ALTER COLUMN id SET DEFAULT nextval('public.accounts_account_id_seq'::regclass);


--
-- Name: accounts_account_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_account_groups ALTER COLUMN id SET DEFAULT nextval('public.accounts_account_groups_id_seq'::regclass);


--
-- Name: accounts_account_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_account_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.accounts_account_user_permissions_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: holdings_holding id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holdings_holding ALTER COLUMN id SET DEFAULT nextval('public.holdings_holding_id_seq'::regclass);


--
-- Data for Name: accounts_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_account (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, currency) FROM stdin;
2	pbkdf2_sha256$320000$AdBzo0qZGoWmpHEK757j9Q$NLfQeezcc5cyzLUTTIxki+YaNfOqgOb5Mc81mN3qYS8=	2022-02-06 22:10:22.182304+00	f	berkay	Berkay	Ersengun	berkayersengun@gmail.com	f	t	2022-02-03 22:14:31.288591+00	EUR
1	pbkdf2_sha256$320000$vDsdkxwqBwmWETrJJOcZvn$oUO74gE/bP7OkFCy3jBqPue4ubX9h1sFRA23RghMrL4=	2022-02-27 22:18:30.492902+00	t	admin				t	t	2022-02-03 21:18:55.095014+00	EUR
5	pbkdf2_sha256$320000$XCG0LgC12NMnYvwTHcjjBZ$Glelis8NcHMHOLR8TsnoVhbeQsGDJ3bEb/uNF+E79Q8=	\N	f	demo	demo	demo	demo@demo.com	f	t	2022-02-27 22:19:00.78768+00	EUR
\.


--
-- Data for Name: accounts_account_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_account_groups (id, account_id, group_id) FROM stdin;
\.


--
-- Data for Name: accounts_account_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_account_user_permissions (id, account_id, permission_id) FROM stdin;
\.


--
-- Data for Name: accounts_capital; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_capital (crypto, stock, user_id) FROM stdin;
7500	4000	2
0	0	1
1000	1000	5
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add Token	6	add_token
22	Can change Token	6	change_token
23	Can delete Token	6	delete_token
24	Can view Token	6	view_token
25	Can add token	7	add_tokenproxy
26	Can change token	7	change_tokenproxy
27	Can delete token	7	delete_tokenproxy
28	Can view token	7	view_tokenproxy
29	Can add holding	8	add_holding
30	Can change holding	8	change_holding
31	Can delete holding	8	delete_holding
32	Can view holding	8	view_holding
33	Can add user	9	add_account
34	Can change user	9	change_account
35	Can delete user	9	delete_account
36	Can view user	9	view_account
37	Can add capital	10	add_capital
38	Can change capital	10	change_capital
39	Can delete capital	10	delete_capital
40	Can view capital	10	view_capital
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
8f98b3ff01056b508c4f5f5d4d354b28f07ed6a4	2022-02-03 22:14:52.052555+00	2
9a64ad0c1ff33525dce195f60b4d2e1d98795123	2022-02-27 03:21:39.696547+00	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	authtoken	token
7	authtoken	tokenproxy
8	holdings	holding
9	accounts	account
10	accounts	capital
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-02-03 21:18:40.868383+00
2	contenttypes	0002_remove_content_type_name	2022-02-03 21:18:40.87454+00
3	auth	0001_initial	2022-02-03 21:18:40.947415+00
4	auth	0002_alter_permission_name_max_length	2022-02-03 21:18:40.959566+00
5	auth	0003_alter_user_email_max_length	2022-02-03 21:18:40.972101+00
6	auth	0004_alter_user_username_opts	2022-02-03 21:18:40.983614+00
7	auth	0005_alter_user_last_login_null	2022-02-03 21:18:40.995699+00
8	auth	0006_require_contenttypes_0002	2022-02-03 21:18:40.99873+00
9	auth	0007_alter_validators_add_error_messages	2022-02-03 21:18:41.007275+00
10	auth	0008_alter_user_username_max_length	2022-02-03 21:18:41.015355+00
11	auth	0009_alter_user_last_name_max_length	2022-02-03 21:18:41.021209+00
12	auth	0010_alter_group_name_max_length	2022-02-03 21:18:41.026195+00
13	auth	0011_update_proxy_permissions	2022-02-03 21:18:41.030526+00
14	auth	0012_alter_user_first_name_max_length	2022-02-03 21:18:41.035103+00
15	holdings	0001_initial	2022-02-03 21:18:41.041971+00
16	holdings	0002_crypto_alter_stock_sector	2022-02-03 21:18:41.050454+00
17	holdings	0003_crypto_quantity_stock_quantity	2022-02-03 21:18:41.055649+00
18	accounts	0001_initial	2022-02-03 21:18:41.109099+00
19	accounts	0002_remove_account_crypto_remove_account_stock_holding_and_more	2022-02-03 21:18:41.223941+00
20	accounts	0003_remove_account_holding_delete_holding	2022-02-03 21:18:41.243718+00
21	accounts	0004_delete_account	2022-02-03 21:18:41.250264+00
22	accounts	0005_initial	2022-02-03 21:18:41.299461+00
23	accounts	0006_alter_account_managers	2022-02-03 21:18:41.304919+00
24	accounts	0007_alter_account_managers	2022-02-03 21:18:41.311312+00
25	accounts	0008_capital	2022-02-03 21:18:41.318284+00
26	accounts	0009_account_capital	2022-02-03 21:18:41.330407+00
27	accounts	0010_remove_account_capital_account_capitalinit_and_more	2022-02-03 21:18:41.34282+00
28	accounts	0011_remove_account_capitalinit	2022-02-03 21:18:41.35301+00
29	accounts	0012_capital_account_capital	2022-02-03 21:18:41.366899+00
30	accounts	0013_remove_account_capital_capital_user	2022-02-03 21:18:41.386493+00
31	accounts	0014_rename_user_capital_account	2022-02-03 21:18:41.395845+00
32	accounts	0015_alter_capital_account	2022-02-03 21:18:41.401438+00
33	accounts	0016_alter_capital_account	2022-02-03 21:18:41.407081+00
34	accounts	0017_alter_capital_account	2022-02-03 21:18:41.41637+00
35	accounts	0018_remove_capital_id_alter_capital_account	2022-02-03 21:18:41.435729+00
36	accounts	0019_rename_account_capital_user	2022-02-03 21:18:41.448482+00
37	admin	0001_initial	2022-02-03 21:18:41.468666+00
38	admin	0002_logentry_remove_auto_add	2022-02-03 21:18:41.478288+00
39	admin	0003_logentry_add_action_flag_choices	2022-02-03 21:18:41.486196+00
40	authtoken	0001_initial	2022-02-03 21:18:41.503807+00
41	authtoken	0002_auto_20160226_1747	2022-02-03 21:18:41.525133+00
42	authtoken	0003_tokenproxy	2022-02-03 21:18:41.527809+00
43	holdings	0004_crypto_user_stock_user	2022-02-03 21:18:41.55265+00
44	holdings	0005_alter_crypto_symbol_alter_stock_symbol	2022-02-03 21:18:41.577794+00
45	holdings	0006_alter_crypto_unique_together_and_more	2022-02-03 21:18:41.597173+00
46	holdings	0007_alter_crypto_unique_together_and_more	2022-02-03 21:18:41.66832+00
47	holdings	0008_holding_remove_stock_user_delete_crypto_delete_stock	2022-02-03 21:18:41.714102+00
48	holdings	0009_alter_holding_currency_alter_holding_symbol_and_more	2022-02-03 21:18:41.741503+00
49	holdings	0010_remove_holding_currency_remove_holding_exchange_and_more	2022-02-03 21:18:41.793813+00
50	holdings	0011_assettemplate_cryptotemplate_stocktemplate	2022-02-03 21:18:41.812404+00
51	holdings	0012_remove_assettemplate_type	2022-02-03 21:18:41.816488+00
52	holdings	0013_assettemplate_shortname	2022-02-03 21:18:41.821023+00
53	holdings	0014_holding_template	2022-02-03 21:18:41.837067+00
54	holdings	0015_remove_holding_template_holding_name	2022-02-03 21:18:41.863912+00
55	holdings	0016_rename_name_holding_symbol	2022-02-03 21:18:41.874602+00
56	holdings	0017_alter_holding_quantity	2022-02-03 21:18:41.883124+00
57	holdings	0018_assettype_alter_holding_type	2022-02-03 21:18:41.909244+00
58	holdings	0019_assettemplate_type	2022-02-03 21:18:41.926688+00
59	holdings	0020_remove_holding_type	2022-02-03 21:18:41.937389+00
60	holdings	0021_rename_symbol_holding_template	2022-02-03 21:18:41.949769+00
61	holdings	0022_rename_template_holding_symbol	2022-02-03 21:18:41.963787+00
62	holdings	0023_alter_assettemplate_type_delete_assettype	2022-02-03 21:18:41.976642+00
63	holdings	0024_holding_date_holding_type	2022-02-03 21:18:41.995435+00
64	holdings	0025_alter_holding_date	2022-02-03 21:18:42.003245+00
65	holdings	0026_alter_holding_date	2022-02-03 21:18:42.012366+00
66	holdings	0027_capital	2022-02-03 21:18:42.02956+00
67	holdings	0028_delete_capital	2022-02-03 21:18:42.032338+00
68	holdings	0029_holding_action	2022-02-03 21:18:42.044299+00
69	holdings	0030_alter_assettemplate_type_alter_holding_type	2022-02-03 21:18:42.054994+00
70	holdings	0031_alter_holding_date	2022-02-03 21:18:42.062966+00
71	holdings	0032_remove_stocktemplate_sector	2022-02-03 21:18:42.067307+00
72	holdings	0033_alter_stocktemplate_longname	2022-02-03 21:18:42.073167+00
73	holdings	0034_remove_cryptotemplate_assettemplate_ptr_and_more	2022-02-03 21:18:42.12084+00
74	holdings	0035_remove_holding_currency	2022-02-03 21:18:42.128522+00
75	holdings	0036_alter_holding_date_alter_holding_type	2022-02-03 21:18:42.14354+00
76	holdings	0037_alter_holding_type	2022-02-03 21:18:42.151678+00
77	holdings	0038_alter_holding_quantity	2022-02-03 21:18:42.16653+00
78	holdings	0039_alter_holding_action	2022-02-03 21:18:42.174918+00
79	holdings	0040_remove_holding_action_alter_holding_symbol	2022-02-03 21:18:42.191777+00
80	sessions	0001_initial	2022-02-03 21:18:42.207635+00
81	holdings	0041_alter_holding_symbol	2022-02-04 01:06:45.979484+00
82	holdings	0042_holding_price	2022-02-04 21:24:13.514931+00
83	holdings	0043_holding_currency	2022-02-05 01:27:58.576718+00
84	holdings	0044_alter_holding_type	2022-02-05 01:30:37.550442+00
85	holdings	0045_alter_holding_currency_alter_holding_type	2022-02-05 01:31:37.445699+00
86	holdings	0046_alter_holding_currency_alter_holding_type	2022-02-05 01:48:51.966163+00
87	holdings	0047_rename_price_holding_purchase_price	2022-02-05 14:49:58.426764+00
88	holdings	0048_alter_holding_type	2022-02-06 01:44:57.384976+00
89	holdings	0049_alter_holding_currency	2022-02-06 02:20:00.574492+00
90	holdings	0050_alter_holding_currency	2022-02-06 02:40:22.989542+00
91	accounts	0020_account_currency	2022-02-06 22:10:02.259348+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
esp79qnrnqarimlj0k8si14v3922g11e	.eJxVjMEOwiAQRP-FsyHuggU8eu83kAUWqRqalPZk_HdL0oMeZ96beQtP21r81njxUxJXgeL02wWKT64dpAfV-yzjXNdlCrIr8qBNjnPi1-1w_w4KtbKvzwpgMEzOZSDWLpg9GnVJqB0oSqzAWspDZxZ11pgAQzRo2WFkFp8vxS03gQ:1nG68U:AGmlWsqqz8XLOaMAuHnEgAXt0pU9IS_HzrsHKta490U	2022-02-18 21:28:54.920731+00
nxpofe1eylfgwur33tigdq8ozj7ebgks	.eJxVjMEOwiAQRP-FsyHuggU8eu83kAUWqRqalPZk_HdL0oMeZ96beQtP21r81njxUxJXgeL02wWKT64dpAfV-yzjXNdlCrIr8qBNjnPi1-1w_w4KtbKvzwpgMEzOZSDWLpg9GnVJqB0oSqzAWspDZxZ11pgAQzRo2WFkFp8vxS03gQ:1nG9m2:jpuzZCQwQ_rNr5fSXoVGpWcBVMvZYM4fYyMFee-VTew	2022-02-19 01:21:58.197285+00
z3hmpktjzyvhinv1zr3igrpp5byp2tlg	.eJxVjMEOwiAQRP-FsyHuggU8eu83kAUWqRqalPZk_HdL0oMeZ96beQtP21r81njxUxJXgeL02wWKT64dpAfV-yzjXNdlCrIr8qBNjnPi1-1w_w4KtbKvzwpgMEzOZSDWLpg9GnVJqB0oSqzAWspDZxZ11pgAQzRo2WFkFp8vxS03gQ:1nGpji:Ybi7W_9N73rd0zqJ-TvomL6VmkhNrSQZ8Zs25t1X_xA	2022-02-20 22:10:22.187094+00
41i2a7f9tjz8df7scsdonzwhrnlbsov8	.eJxVjEEOwiAQRe_C2hBgoAWX7j0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXEWWpx-t4T04LaDfMd2myXNbV2mJHdFHrTL65z5eTncv4OKvX5rzDQ6z8kHGMhqFXJBMsEaVgjOmABcbAEC8IYcDOA92-RGk4LSUFC8P-HAN3Y:1nLS8B:pb-GVmuwQep8oilfeZCtXSux6fVeaZ8SjVlNgLm2r6Q	2022-03-05 15:58:43.208993+00
rzdi5z632ku2bsuus3xzsjrqimiwlj10	.eJxVjEEOwiAQRe_C2hBgoAWX7j0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXEWWpx-t4T04LaDfMd2myXNbV2mJHdFHrTL65z5eTncv4OKvX5rzDQ6z8kHGMhqFXJBMsEaVgjOmABcbAEC8IYcDOA92-RGk4LSUFC8P-HAN3Y:1nNLgR:M5TilmFtMhbHdrT8bZE2QdYyOFUkUyun5P2LmXsFX_Q	2022-03-10 21:29:55.677078+00
qtwr3snvpb2d5hjicqra6ckgl6dp6l1q	.eJxVjEEOwiAQRe_C2hBgoAWX7j0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXEWWpx-t4T04LaDfMd2myXNbV2mJHdFHrTL65z5eTncv4OKvX5rzDQ6z8kHGMhqFXJBMsEaVgjOmABcbAEC8IYcDOA92-RGk4LSUFC8P-HAN3Y:1nOA8t:PJ5m7H_ddK-2x2fNPioRHQf9Cy_B6UMIdzJb0ESF9ac	2022-03-13 03:22:39.915752+00
qlfzhh1l3e7ub26gl93t5eibllc81x19	.eJxVjEEOwiAQRe_C2hBgoAWX7j0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXEWWpx-t4T04LaDfMd2myXNbV2mJHdFHrTL65z5eTncv4OKvX5rzDQ6z8kHGMhqFXJBMsEaVgjOmABcbAEC8IYcDOA92-RGk4LSUFC8P-HAN3Y:1nORs6:x_UsVqt-65rMMz8dG_5pPn9ZEhn7HcjgBwipdgzQ5T4	2022-03-13 22:18:30.494965+00
\.


--
-- Data for Name: holdings_holding; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.holdings_holding (id, quantity, user_id, symbol, date, type, purchase_price, currency) FROM stdin;
56	1	2	HPQ	2022-02-07 01:32:47.336109+00	stock	24.43	EUR
39	2	2	HPQ	2022-02-06 22:32:33.790793+00	stock	25	EUR
42	2	2	AAPL	2022-02-06 22:33:40.754255+00	stock	127.92	EUR
43	1	2	AAPL	2022-02-06 22:34:03.515416+00	stock	126.33	EUR
44	4	2	INTC	2022-02-06 22:35:19.832196+00	stock	45.2	EUR
45	2	2	INTC	2022-02-06 22:35:34.27828+00	stock	45.1	EUR
46	1	2	DIS	2022-02-06 22:35:50.242298+00	stock	139.03	EUR
47	1	2	NVDA	2022-02-06 22:36:08.008111+00	stock	280.18	EUR
48	1	2	NVDA	2022-02-06 22:36:25.313859+00	stock	247.68	EUR
49	1	2	MSFT	2022-02-06 22:36:43.656223+00	stock	244.18	EUR
50	1	2	MSFT	2022-02-06 22:36:56.457141+00	stock	250.73	EUR
51	1	2	AMD	2022-02-06 22:37:17.774799+00	stock	125.61	EUR
52	1	2	AMD	2022-02-06 22:37:27.911412+00	stock	102.3	EUR
53	1	2	TSLA	2022-02-06 22:37:45.804564+00	stock	648.28	EUR
69	0.085145	2	BTC-EUR	2022-02-09 01:55:18.813527+00	crypto	28808	EUR
70	0.587272	2	ETH-EUR	2022-02-09 01:55:41.33072+00	crypto	1256	EUR
71	21.18	2	DOT-EUR	2022-02-09 01:56:06.093055+00	crypto	24.84	EUR
72	4.55	2	SOL-EUR	2022-02-09 01:56:18.968153+00	crypto	114.11	EUR
73	309.97	2	ADA-EUR	2022-02-09 01:56:32.271233+00	crypto	2.12	EUR
74	3.22	2	LUNA1-EUR	2022-02-09 01:56:44.393007+00	crypto	76.94	EUR
76	240.04	2	XRP-EUR	2022-02-09 01:57:34.9407+00	crypto	0.5209	EUR
75	25881143	2	SHIB-EUR	2022-02-09 01:57:07.889571+00	crypto	6.2e-05	EUR
78	3	2	VWRL.AS	2022-02-08 22:35:00+00	stock	103.2	EUR
79	1	2	VUSA.AS	2022-02-08 22:35:00+00	stock	74.36	EUR
80	1	2	IUSA.AS	2022-02-15 22:36:45.822454+00	stock	38.88	EUR
81	1	2	EQQQ.PA	2022-02-15 22:40:19.963053+00	stock	320.55	EUR
82	1	2	EQQQ.PA	2022-02-15 22:40:36.93273+00	stock	324.25	EUR
\.


--
-- Name: accounts_account_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_account_groups_id_seq', 1, false);


--
-- Name: accounts_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_account_id_seq', 5, true);


--
-- Name: accounts_account_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_account_user_permissions_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 91, true);


--
-- Name: holdings_holding_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.holdings_holding_id_seq', 92, true);


--
-- Name: accounts_account_groups accounts_account_groups_account_id_group_id_f64165b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_account_groups
    ADD CONSTRAINT accounts_account_groups_account_id_group_id_f64165b0_uniq UNIQUE (account_id, group_id);


--
-- Name: accounts_account_groups accounts_account_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_account_groups
    ADD CONSTRAINT accounts_account_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_account accounts_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_account
    ADD CONSTRAINT accounts_account_pkey PRIMARY KEY (id);


--
-- Name: accounts_account_user_permissions accounts_account_user_pe_account_id_permission_id_9af93c14_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_account_user_permissions
    ADD CONSTRAINT accounts_account_user_pe_account_id_permission_id_9af93c14_uniq UNIQUE (account_id, permission_id);


--
-- Name: accounts_account_user_permissions accounts_account_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_account_user_permissions
    ADD CONSTRAINT accounts_account_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: accounts_account accounts_account_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_account
    ADD CONSTRAINT accounts_account_username_key UNIQUE (username);


--
-- Name: accounts_capital accounts_capital_account_id_91c1e740_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_capital
    ADD CONSTRAINT accounts_capital_account_id_91c1e740_pk PRIMARY KEY (user_id);


--
-- Name: accounts_capital accounts_capital_account_id_91c1e740_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_capital
    ADD CONSTRAINT accounts_capital_account_id_91c1e740_uniq UNIQUE (user_id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: holdings_holding holdings_holding_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holdings_holding
    ADD CONSTRAINT holdings_holding_pkey PRIMARY KEY (id);


--
-- Name: accounts_account_groups_account_id_52f14852; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_account_groups_account_id_52f14852 ON public.accounts_account_groups USING btree (account_id);


--
-- Name: accounts_account_groups_group_id_7c6a6bd1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_account_groups_group_id_7c6a6bd1 ON public.accounts_account_groups USING btree (group_id);


--
-- Name: accounts_account_user_permissions_account_id_816f9bde; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_account_user_permissions_account_id_816f9bde ON public.accounts_account_user_permissions USING btree (account_id);


--
-- Name: accounts_account_user_permissions_permission_id_24620205; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_account_user_permissions_permission_id_24620205 ON public.accounts_account_user_permissions USING btree (permission_id);


--
-- Name: accounts_account_username_b5f69a28_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_account_username_b5f69a28_like ON public.accounts_account USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: holdings_holding_user_id_28ba9863; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX holdings_holding_user_id_28ba9863 ON public.holdings_holding USING btree (user_id);


--
-- Name: accounts_account_groups accounts_account_gro_account_id_52f14852_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_account_groups
    ADD CONSTRAINT accounts_account_gro_account_id_52f14852_fk_accounts_ FOREIGN KEY (account_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_account_groups accounts_account_groups_group_id_7c6a6bd1_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_account_groups
    ADD CONSTRAINT accounts_account_groups_group_id_7c6a6bd1_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_account_user_permissions accounts_account_use_account_id_816f9bde_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_account_user_permissions
    ADD CONSTRAINT accounts_account_use_account_id_816f9bde_fk_accounts_ FOREIGN KEY (account_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_account_user_permissions accounts_account_use_permission_id_24620205_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_account_user_permissions
    ADD CONSTRAINT accounts_account_use_permission_id_24620205_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_capital accounts_capital_user_id_5a40ca1f_fk_accounts_account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_capital
    ADD CONSTRAINT accounts_capital_user_id_5a40ca1f_fk_accounts_account_id FOREIGN KEY (user_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_accounts_account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_accounts_account_id FOREIGN KEY (user_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_account_id FOREIGN KEY (user_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: holdings_holding holdings_holding_user_id_28ba9863_fk_accounts_account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holdings_holding
    ADD CONSTRAINT holdings_holding_user_id_28ba9863_fk_accounts_account_id FOREIGN KEY (user_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

