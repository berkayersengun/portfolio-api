--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2 (Debian 14.2-1.pgdg110+1)

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
-- Name: holdings_capital; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.holdings_capital (
    user_id bigint NOT NULL,
    crypto numeric(20,8) NOT NULL,
    stock numeric(20,8) NOT NULL
);


ALTER TABLE public.holdings_capital OWNER TO postgres;

--
-- Name: holdings_holding; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.holdings_holding (
    id bigint NOT NULL,
    quantity numeric(20,8) NOT NULL,
    user_id bigint NOT NULL,
    symbol character varying(15) NOT NULL,
    date timestamp with time zone NOT NULL,
    type character varying(10) NOT NULL,
    purchase_price numeric(20,8) NOT NULL,
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
-- Name: token_blacklist_blacklistedtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.token_blacklist_blacklistedtoken (
    id bigint NOT NULL,
    blacklisted_at timestamp with time zone NOT NULL,
    token_id bigint NOT NULL
);


ALTER TABLE public.token_blacklist_blacklistedtoken OWNER TO postgres;

--
-- Name: token_blacklist_blacklistedtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.token_blacklist_blacklistedtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.token_blacklist_blacklistedtoken_id_seq OWNER TO postgres;

--
-- Name: token_blacklist_blacklistedtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.token_blacklist_blacklistedtoken_id_seq OWNED BY public.token_blacklist_blacklistedtoken.id;


--
-- Name: token_blacklist_outstandingtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.token_blacklist_outstandingtoken (
    id bigint NOT NULL,
    token text NOT NULL,
    created_at timestamp with time zone,
    expires_at timestamp with time zone NOT NULL,
    user_id bigint,
    jti character varying(255) NOT NULL
);


ALTER TABLE public.token_blacklist_outstandingtoken OWNER TO postgres;

--
-- Name: token_blacklist_outstandingtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.token_blacklist_outstandingtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.token_blacklist_outstandingtoken_id_seq OWNER TO postgres;

--
-- Name: token_blacklist_outstandingtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.token_blacklist_outstandingtoken_id_seq OWNED BY public.token_blacklist_outstandingtoken.id;


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
-- Name: token_blacklist_blacklistedtoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken ALTER COLUMN id SET DEFAULT nextval('public.token_blacklist_blacklistedtoken_id_seq'::regclass);


--
-- Name: token_blacklist_outstandingtoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken ALTER COLUMN id SET DEFAULT nextval('public.token_blacklist_outstandingtoken_id_seq'::regclass);


--
-- Data for Name: accounts_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_account (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, currency) FROM stdin;
5	pbkdf2_sha256$320000$XCG0LgC12NMnYvwTHcjjBZ$Glelis8NcHMHOLR8TsnoVhbeQsGDJ3bEb/uNF+E79Q8=	\N	f	demo	demo	demo	demo@demo.com	f	t	2022-02-27 22:19:00.78768+00	EUR
6	pbkdf2_sha256$320000$lts3aXPRrGtwU5JmjHGVFD$GL+3DOjoB275kyv3ljAmoQPDI/iTdMe9rG277aht/tE=	\N	f	sevim	Sevim	Ersengun	berkayersengun@gmail.com	f	t	2022-03-27 03:42:08.590988+00	EUR
2	pbkdf2_sha256$320000$AdBzo0qZGoWmpHEK757j9Q$NLfQeezcc5cyzLUTTIxki+YaNfOqgOb5Mc81mN3qYS8=	2022-04-14 10:24:11.036776+00	f	berkay	Berkay	Ersengun	berkayersengun@gmail.com	f	t	2022-02-03 22:14:31.288591+00	EUR
1	pbkdf2_sha256$320000$vDsdkxwqBwmWETrJJOcZvn$oUO74gE/bP7OkFCy3jBqPue4ubX9h1sFRA23RghMrL4=	2022-04-14 10:24:38.251101+00	t	admin				t	t	2022-02-03 21:18:55.095014+00	EUR
7	pbkdf2_sha256$320000$uTqJdcQvh9KXhlnBX8HeiV$4C2QnVjxva2n5iEApLsadmNqhiplHC1RV6eE52TmdbA=	\N	f	gokay	Goekay	Ersenguen		f	t	2022-04-15 19:24:10.801551+00	EUR
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
41	Can add capital	11	add_capital
42	Can change capital	11	change_capital
43	Can delete capital	11	delete_capital
44	Can view capital	11	view_capital
45	Can add blacklisted token	12	add_blacklistedtoken
46	Can change blacklisted token	12	change_blacklistedtoken
47	Can delete blacklisted token	12	delete_blacklistedtoken
48	Can view blacklisted token	12	view_blacklistedtoken
49	Can add outstanding token	13	add_outstandingtoken
50	Can change outstanding token	13	change_outstandingtoken
51	Can delete outstanding token	13	delete_outstandingtoken
52	Can view outstanding token	13	view_outstandingtoken
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
8f98b3ff01056b508c4f5f5d4d354b28f07ed6a4	2022-02-03 22:14:52.052555+00	2
9a64ad0c1ff33525dce195f60b4d2e1d98795123	2022-02-27 03:21:39.696547+00	1
b0bb1a6a9891712f3239b5c588053eb4afde2f95	2022-03-03 01:57:12.275786+00	5
2904009b29c242ad614c2c155619fdd6a83146d5	2022-03-27 03:42:13.369277+00	6
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
11	holdings	capital
12	token_blacklist	blacklistedtoken
13	token_blacklist	outstandingtoken
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
92	accounts	0021_delete_capital	2022-03-05 22:50:37.395102+00
93	holdings	0051_capital	2022-03-05 22:50:37.505228+00
94	accounts	0022_alter_account_managers	2022-04-02 16:43:30.614802+00
95	holdings	0052_alter_holding_purchase_price_alter_holding_quantity	2022-04-02 16:43:30.78341+00
96	holdings	0053_alter_capital_crypto_alter_capital_stock	2022-04-02 16:43:30.877626+00
97	token_blacklist	0001_initial	2022-04-12 11:06:13.102032+00
98	token_blacklist	0002_outstandingtoken_jti_hex	2022-04-12 11:06:13.13826+00
99	token_blacklist	0003_auto_20171017_2007	2022-04-12 11:06:13.184436+00
100	token_blacklist	0004_auto_20171017_2013	2022-04-12 11:06:13.246522+00
101	token_blacklist	0005_remove_outstandingtoken_jti	2022-04-12 11:06:13.289174+00
102	token_blacklist	0006_auto_20171017_2113	2022-04-12 11:06:13.32317+00
103	token_blacklist	0007_auto_20171017_2214	2022-04-12 11:06:13.443429+00
104	token_blacklist	0008_migrate_to_bigautofield	2022-04-12 11:06:13.606013+00
105	token_blacklist	0010_fix_migrate_to_bigautofield	2022-04-12 11:06:13.660526+00
106	token_blacklist	0011_linearizes_history	2022-04-12 11:06:13.671137+00
107	token_blacklist	0012_alter_outstandingtoken_user	2022-04-12 11:06:13.703704+00
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
qr9181pyh1t0ffl3lbs3ocywngxk5tf2	.eJxVjEEOwiAQRe_C2hCBoYBL9z0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnERWpx-N8L0yG0HfMd2m2Wa27pMJHdFHrTLceb8vB7u30HFXr91YWuIlTIIIWX0YMmxMxCAITityWZfbILi2aezB8xWDRjMkLx2FLR4fwDqgTe8:1nQZLL:t-XvYj3sqbmb9RognEboW27DY1ZI39y59CRV9eLnmms	2022-03-19 18:41:27.950955+00
9o7ou7layxkssi4t1wp8p188kideedlb	.eJxVjEEOwiAQRe_C2hCBoYBL9z0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnERWpx-N8L0yG0HfMd2m2Wa27pMJHdFHrTLceb8vB7u30HFXr91YWuIlTIIIWX0YMmxMxCAITityWZfbILi2aezB8xWDRjMkLx2FLR4fwDqgTe8:1nQgfG:N1PhSfXUK4NDukV_ffMBkdeyDVlAelmtJoanLVS1NSQ	2022-03-20 02:30:30.873429+00
du6346c586qa9yrf7tmt7prrni65e17i	.eJxVjEEOwiAQRe_C2hBgoAWX7j0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXEWWpx-t4T04LaDfMd2myXNbV2mJHdFHrTL65z5eTncv4OKvX5rzDQ6z8kHGMhqFXJBMsEaVgjOmABcbAEC8IYcDOA92-RGk4LSUFC8P-HAN3Y:1nQtOj:__fxJ7d4qUq_DQiJffyyd5gmGssoxYh4815jK39sh4k	2022-03-20 16:06:17.404497+00
mjt9zz3zy6rom6unvag3f0ywnj5y9axg	.eJxVjEEOwiAQRe_C2hCBoYBL9z0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnERWpx-N8L0yG0HfMd2m2Wa27pMJHdFHrTLceb8vB7u30HFXr91YWuIlTIIIWX0YMmxMxCAITityWZfbILi2aezB8xWDRjMkLx2FLR4fwDqgTe8:1nS8YX:iJnnx_x24hLgQSnBneTrbrPAdWv8pktF7n-XUph7eVU	2022-03-24 02:29:33.339578+00
mddnjigbtxdd85n3sy5zx2k6b9eo0emp	.eJxVjEEOwiAQRe_C2hCBoYBL9z0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnERWpx-N8L0yG0HfMd2m2Wa27pMJHdFHrTLceb8vB7u30HFXr91YWuIlTIIIWX0YMmxMxCAITityWZfbILi2aezB8xWDRjMkLx2FLR4fwDqgTe8:1nYK06:Cs_lQozm2kIKBTZEw6325YPeunUTJtkk5vHPLM8mCHU	2022-04-10 03:55:34.639306+00
vq6i41koyw5oh1ah9a0yvh2k5hms9oe1	.eJxVjEEOwiAQRe_C2hCBoYBL9z0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnERWpx-N8L0yG0HfMd2m2Wa27pMJHdFHrTLceb8vB7u30HFXr91YWuIlTIIIWX0YMmxMxCAITityWZfbILi2aezB8xWDRjMkLx2FLR4fwDqgTe8:1nZwB3:xoMsNKlnqgzEIwORM6j63k5koVLyeQoDYTWlbZcp_jk	2022-04-14 14:53:33.146266+00
960x75mb3a4zgvym32jjajlsmch1dw49	.eJxVjEEOwiAQRe_C2hCBoYBL9z0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnERWpx-N8L0yG0HfMd2m2Wa27pMJHdFHrTLceb8vB7u30HFXr91YWuIlTIIIWX0YMmxMxCAITityWZfbILi2aezB8xWDRjMkLx2FLR4fwDqgTe8:1naFoX:UdMxl4gszN8xwHpFGmwT2RED5ujA0jGPKMsrfMrcG3g	2022-04-15 11:51:37.757547+00
cu2jaro9pgibnlpory29i6pv25pqy2vc	.eJxVjEEOwiAQRe_C2hCBoYBL9z0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnERWpx-N8L0yG0HfMd2m2Wa27pMJHdFHrTLceb8vB7u30HFXr91YWuIlTIIIWX0YMmxMxCAITityWZfbILi2aezB8xWDRjMkLx2FLR4fwDqgTe8:1nagKG:O5aBlbUICil8-BhPUOqYy-xhg63D1jWGK8OQp6xHnNg	2022-04-16 16:10:08.645316+00
bd3lnf9n4bt8cf7e2vqo7bp5f164ie8r	.eJxVjEEOwiAQRe_C2hCBoYBL9z0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnERWpx-N8L0yG0HfMd2m2Wa27pMJHdFHrTLceb8vB7u30HFXr91YWuIlTIIIWX0YMmxMxCAITityWZfbILi2aezB8xWDRjMkLx2FLR4fwDqgTe8:1nbOmR:aBCqIXZUPxv4P1351Ob6Ga2hwgPQ3XX8e_iwCsCFdfY	2022-04-18 15:38:11.518091+00
yj8t38jkfqmmc42psbp641u29y5wwsxq	.eJxVjEEOwiAQRe_C2hBgoAWX7j0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXEWWpx-t4T04LaDfMd2myXNbV2mJHdFHrTL65z5eTncv4OKvX5rzDQ6z8kHGMhqFXJBMsEaVgjOmABcbAEC8IYcDOA92-RGk4LSUFC8P-HAN3Y:1neweU:BYB51tECWJGG6quzUPeYHfq6hwvWuEnLjyxknwkdpsQ	2022-04-28 10:24:38.259952+00
\.


--
-- Data for Name: holdings_capital; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.holdings_capital (user_id, crypto, stock) FROM stdin;
5	1000.00000000	2000.00000000
6	0.00000000	1990.00000000
2	8150.00000000	5500.00000000
7	0.00000000	0.00000000
\.


--
-- Data for Name: holdings_holding; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.holdings_holding (id, quantity, user_id, symbol, date, type, purchase_price, currency) FROM stdin;
56	1.00000000	2	HPQ	2022-02-07 01:32:47.336109+00	stock	24.43000000	EUR
39	2.00000000	2	HPQ	2022-02-06 22:32:33.790793+00	stock	25.00000000	EUR
42	2.00000000	2	AAPL	2022-02-06 22:33:40.754255+00	stock	127.92000000	EUR
43	1.00000000	2	AAPL	2022-02-06 22:34:03.515416+00	stock	126.33000000	EUR
44	4.00000000	2	INTC	2022-02-06 22:35:19.832196+00	stock	45.20000000	EUR
45	2.00000000	2	INTC	2022-02-06 22:35:34.27828+00	stock	45.10000000	EUR
46	1.00000000	2	DIS	2022-02-06 22:35:50.242298+00	stock	139.03000000	EUR
47	1.00000000	2	NVDA	2022-02-06 22:36:08.008111+00	stock	280.18000000	EUR
48	1.00000000	2	NVDA	2022-02-06 22:36:25.313859+00	stock	247.68000000	EUR
49	1.00000000	2	MSFT	2022-02-06 22:36:43.656223+00	stock	244.18000000	EUR
50	1.00000000	2	MSFT	2022-02-06 22:36:56.457141+00	stock	250.73000000	EUR
51	1.00000000	2	AMD	2022-02-06 22:37:17.774799+00	stock	125.61000000	EUR
52	1.00000000	2	AMD	2022-02-06 22:37:27.911412+00	stock	102.30000000	EUR
53	1.00000000	2	TSLA	2022-02-06 22:37:45.804564+00	stock	648.28000000	EUR
70	0.58727200	2	ETH-EUR	2022-02-09 01:55:41.33072+00	crypto	1256.00000000	EUR
74	3.22000000	2	LUNA1-EUR	2022-02-09 01:56:44.393007+00	crypto	76.94000000	EUR
76	240.04000000	2	XRP-EUR	2022-02-09 01:57:34.9407+00	crypto	0.52090000	EUR
78	3.00000000	2	VWRL.AS	2022-02-08 22:35:00+00	stock	103.20000000	EUR
79	1.00000000	2	VUSA.AS	2022-02-08 22:35:00+00	stock	74.36000000	EUR
80	1.00000000	2	IUSA.AS	2022-02-15 22:36:45.822454+00	stock	38.88000000	EUR
81	1.00000000	2	EQQQ.PA	2022-02-15 22:40:19.963053+00	stock	320.55000000	EUR
82	1.00000000	2	EQQQ.PA	2022-02-15 22:40:36.93273+00	stock	324.25000000	EUR
93	13.00000000	5	IBM	2022-03-03 01:57:33.123424+00	stock	123.00000000	EUR
94	11.00000000	5	SOL-CAD	2022-03-03 01:58:01.130864+00	crypto	123.00000000	EUR
95	1.00000000	1	IBM	2022-03-06 21:47:52.505736+00	stock	123.00000000	EUR
96	2.00000000	5	AAPL	2022-03-10 02:28:24.904198+00	stock	150.00000000	USD
97	1.00000000	5	TSLA	2022-03-10 02:28:33.19342+00	stock	900.00000000	EUR
98	100.00000000	5	AAPL	2022-03-11 17:47:12.952815+00	stock	5.00000000	EUR
99	100.00000000	5	ERIC	2022-03-11 17:48:10.056497+00	stock	10.00000000	EUR
101	2.00000000	6	INTC	2022-03-27 03:45:25.31359+00	stock	42.40000000	EUR
102	1.00000000	6	VWRL.AS	2022-02-08 03:46:00+00	stock	103.14000000	EUR
103	1.00000000	6	IUSA.AS	2022-01-12 03:48:00+00	stock	41.30000000	EUR
104	1.00000000	6	VWRL.AS	2022-01-12 03:48:00+00	stock	108.78000000	EUR
105	1.00000000	6	NVDA	2022-01-12 03:49:00+00	stock	247.26000000	EUR
106	1.00000000	6	EQQQ.PA	2022-01-12 03:49:00+00	stock	344.60000000	EUR
107	2.00000000	6	VUSA.AS	2022-01-11 03:50:00+00	stock	77.90000000	EUR
108	1.00000000	6	EQQQ.PA	2022-01-05 03:51:00+00	stock	351.00000000	EUR
109	1.00000000	6	MSFT	2022-01-04 03:51:00+00	stock	292.90000000	EUR
100	1.00000000	6	AAPL	2022-01-11 03:42:00+00	stock	154.74000000	EUR
110	3.00000000	2	IUSA.AS	2022-03-29 14:34:47.342405+00	stock	41.25000000	EUR
111	1.00000000	2	VUSA.AS	2022-03-29 14:35:18.102724+00	stock	80.89000000	EUR
112	2.00000000	2	VWRL.AS	2022-03-29 14:36:08.0405+00	stock	107.69000000	EUR
113	1.00000000	2	EQQQ.PA	2022-03-29 14:36:56.439912+00	stock	334.35000000	EUR
115	1.00000000	2	EQQQ.PA	2022-03-29 14:46:34.003219+00	stock	334.35000000	EUR
116	2.00000000	2	VWRL.AS	2022-03-29 14:48:23.893397+00	stock	107.69000000	EUR
117	3.00000000	2	VUSA.AS	2022-03-03 14:54:00+00	stock	75.50000000	EUR
75	25881143.00000000	2	SHIB-EUR	2021-10-08 15:54:00+00	crypto	0.00002341	EUR
119	0.01190734	2	BTC-EUR	2022-04-04 12:22:21.512304+00	crypto	41991.00000000	EUR
120	1.00000000	5	BTC-USD	2022-04-04 15:28:00.030679+00	crypto	100.00000000	EUR
135	0.00706042	2	BTC-EUR	2022-04-15 21:59:36.309276+00	crypto	36930.00000000	EUR
118	0.09395902	2	ETH-EUR	2022-04-04 12:21:14.699709+00	crypto	3170.00000000	EUR
69	0.07049000	2	BTC-EUR	2022-02-09 01:55:18.813527+00	crypto	28808.00000000	EUR
125	3.00000000	7	QQQ	2022-04-15 19:26:02.196473+00	stock	7.00000000	EUR
126	1.00000000	7	QQQ	2022-04-15 19:27:03.39474+00	stock	9.00000000	EUR
127	1.00000000	5	HP	2022-04-15 19:30:59.712589+00	stock	1.00000000	EUR
128	1.00000000	5	GE=F	2022-04-15 19:31:47.986188+00	stock	2.00000000	EUR
129	2.00000000	5	TT	2022-04-15 19:32:17.940076+00	stock	44.00000000	EUR
130	1.00000000	7	QQQ	2022-04-15 19:34:12.286422+00	stock	100.00000000	USD
131	1.00000000	7	QQQ	2022-04-15 19:36:27.160832+00	stock	222.00000000	USD
132	2.00000000	7	QQQ	2022-04-15 19:39:27.821074+00	stock	88766.00000000	EUR
133	0.00731307	2	BTC-EUR	2022-04-15 21:55:16.778827+00	crypto	36930.00000000	EUR
134	0.01047422	2	BTC-EUR	2022-04-15 21:55:53.952605+00	crypto	36930.00000000	EUR
136	0.01468360	2	BTC-EUR	2022-04-15 22:15:09.128818+00	crypto	34051.60000000	EUR
\.


--
-- Data for Name: token_blacklist_blacklistedtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.token_blacklist_blacklistedtoken (id, blacklisted_at, token_id) FROM stdin;
1	2022-04-12 11:07:02.771493+00	1
2	2022-04-12 11:34:24.952625+00	2
3	2022-04-12 11:51:31.125608+00	3
4	2022-04-12 13:04:13.241207+00	6
5	2022-04-13 08:43:37.927827+00	7
6	2022-04-13 12:34:00.372005+00	19
7	2022-04-13 20:56:42.268984+00	21
8	2022-04-13 20:59:07.63019+00	22
9	2022-04-13 20:59:38.755797+00	24
10	2022-04-13 21:23:36.45817+00	26
11	2022-04-14 09:50:09.865996+00	29
12	2022-04-14 09:57:48.282228+00	20
13	2022-04-14 11:47:21.613209+00	35
14	2022-04-14 12:10:24.002571+00	37
15	2022-04-14 13:12:37.515062+00	41
16	2022-04-14 15:17:11.252482+00	45
17	2022-04-16 01:42:48.020267+00	56
18	2022-04-16 01:42:56.261953+00	57
19	2022-04-16 01:43:01.439762+00	58
20	2022-04-16 01:43:10.692836+00	59
21	2022-04-16 01:44:04.911681+00	60
22	2022-04-16 01:44:51.829113+00	54
23	2022-04-16 01:45:38.173308+00	63
24	2022-04-16 02:11:41.553497+00	65
25	2022-04-16 02:14:04.904498+00	66
26	2022-04-16 02:18:53.988972+00	67
27	2022-04-16 02:18:58.570221+00	68
28	2022-04-16 02:22:39.440901+00	69
29	2022-04-16 02:22:50.258774+00	70
30	2022-04-16 02:22:59.315686+00	71
31	2022-04-16 02:24:02.785978+00	72
32	2022-04-16 02:24:19.153873+00	73
33	2022-04-16 02:25:58.614486+00	74
34	2022-04-16 02:27:04.346816+00	75
35	2022-04-16 02:27:13.658582+00	76
36	2022-04-18 01:04:59.390988+00	79
37	2022-04-18 01:10:38.361104+00	80
38	2022-04-18 01:26:53.295273+00	81
39	2022-04-18 01:26:58.412115+00	83
40	2022-04-18 01:27:57.525671+00	84
41	2022-04-18 01:28:05.568222+00	85
42	2022-04-18 01:29:15.986605+00	87
43	2022-04-18 01:29:39.827885+00	88
44	2022-04-18 01:29:50.585288+00	89
\.


--
-- Data for Name: token_blacklist_outstandingtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) FROM stdin;
1	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDE5MzYxNCwiaWF0IjoxNjQ5NzYxNjE0LCJqdGkiOiJiYjNiZmI3MThiMzM0ZGM5ODNlNTY5NGQ2NmU2M2MwOCIsInVzZXJfaWQiOjJ9.OlLI_o28nTzdLeWGNta9UWYKrWObLkdDysk4RLyzbR0	2022-04-12 11:06:54.614101+00	2022-04-17 11:06:54+00	2	bb3bfb718b334dc983e5694d66e63c08
2	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDE5MzYyNywiaWF0IjoxNjQ5NzYxNjI3LCJqdGkiOiI4YmVlNzNlMjUyOGM0MmVmODgzYmM3ZWNmZmU5ODA3YyIsInVzZXJfaWQiOjJ9.xTm4Jhlanix4S0vuOJYCCNB0yZB0fJVZkSCWVrhb77Y	2022-04-12 11:07:07.748084+00	2022-04-17 11:07:07+00	2	8bee73e2528c42ef883bc7ecffe9807c
3	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDE5NDY3MywiaWF0IjoxNjQ5NzYyNjczLCJqdGkiOiJjM2Q5YzgzMDRlOGM0ZDY4YThhMzFjNGI5MzYwYmU0MCIsInVzZXJfaWQiOjJ9.b1U4vxC9tdrkDkjbq7Kn7R_Oo6QjY1bYNrydYRYQ2EI	2022-04-12 11:24:33.343856+00	2022-04-17 11:24:33+00	2	c3d9c8304e8c4d68a8a31c4b9360be40
4	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDE5NTI3OCwiaWF0IjoxNjQ5NzYzMjc4LCJqdGkiOiI0YTdhNTE3MGFlYTE0NDMwOTliZjVmNmU1YjM5YjVkNiIsInVzZXJfaWQiOjJ9.--XoCTmYqD8U4DKcoS90wl7P2tZe-mAhb8Ff1RwfcUY	2022-04-12 11:34:38.670313+00	2022-04-17 11:34:38+00	2	4a7a5170aea1443099bf5f6e5b39b5d6
5	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDE5NjI5NSwiaWF0IjoxNjQ5NzY0Mjk1LCJqdGkiOiJmODc1Y2JlODk2MWM0ZjE5OTIwMGI5NTBkODkzNTQ0MyIsInVzZXJfaWQiOjJ9.R1B1Hhf-OGAYbNXWluvEtk2fHhxR1FzgsyMLSHL7aJw	2022-04-12 11:51:35.441244+00	2022-04-17 11:51:35+00	2	f875cbe8961c4f199200b950d8935443
6	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDIwMDYzNywiaWF0IjoxNjQ5NzY4NjM3LCJqdGkiOiJmNmFjMmQ4MWIyNjI0MDg3YmEzODNjZWVlMzRmZDYyOCIsInVzZXJfaWQiOjJ9.dw9HeCtOYD9ZeuKDuB6Iq2xztwiyBcbkQtPoO_OQibc	2022-04-12 13:03:57.02996+00	2022-04-17 13:03:57+00	2	f6ac2d81b2624087ba383ceee34fd628
7	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDIwMDY2MCwiaWF0IjoxNjQ5NzY4NjYwLCJqdGkiOiI3OTk4OTdiOTFjODY0MThkYjVjZTg1MTk2YzVjZjVhYSIsInVzZXJfaWQiOjJ9.tKoJ2cGHJ_mNNjQmcNzyy9va1oTUhD96GeBvNUzxnDo	2022-04-12 13:04:20.119386+00	2022-04-17 13:04:20+00	2	799897b91c86418db5ce85196c5cf5aa
8	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDIxMTMwMSwiaWF0IjoxNjQ5Nzc5MzAxLCJqdGkiOiI3Y2ZiNDRkNDJiMGM0NTUzYTIwYTgzZTAzYjFjNzk0NiIsInVzZXJfaWQiOjJ9.3i08_OddAkMnXPs2cBEBaU4L0qDVZZZBwb3IzgjTRFc	2022-04-12 16:01:41.938649+00	2022-04-17 16:01:41+00	2	7cfb44d42b0c4553a20a83e03b1c7946
9	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDIxMTMwMiwiaWF0IjoxNjQ5Nzc5MzAyLCJqdGkiOiI3NTM5NjUyZGVlMDI0NzE1OWY4YWNjOTk5NWM2NmI2ZCIsInVzZXJfaWQiOjJ9.dU0yYM7ITGWf5eo6W6_8EE-rvo5zooOWgI8Nu558Z2A	2022-04-12 16:01:42.629685+00	2022-04-17 16:01:42+00	2	7539652dee0247159f8acc9995c66b6d
10	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDIyNTQyMiwiaWF0IjoxNjQ5NzkzNDIyLCJqdGkiOiJhNmRiMDY5NTAyMTU0NzU5OTUxOGQyNThiNmJiNDg1NyIsInVzZXJfaWQiOjJ9.WFu0bLxf0TLETw8Dc9CAMi8iyCg1Be3BfnpvWupILFM	2022-04-12 19:57:02.434858+00	2022-04-17 19:57:02+00	2	a6db0695021547599518d258b6bb4857
11	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDIyNTQ0NCwiaWF0IjoxNjQ5NzkzNDQ0LCJqdGkiOiI4ZmU2ZGUxZDFjMmY0NjNmYTI2OTQ1ZDBmNjk5MmNjOSIsInVzZXJfaWQiOjJ9.99W2CiNpmyb-AHv4SwX3qRWcpr-aV1gUhBGQurWyv6Y	2022-04-12 19:57:24.525026+00	2022-04-17 19:57:24+00	2	8fe6de1d1c2f463fa26945d0f6992cc9
12	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDIyNTUyOCwiaWF0IjoxNjQ5NzkzNTI4LCJqdGkiOiJlZDQxYTk4N2FkMzU0YmE5YWEzZGQzZTY1OGZhMGNiNiIsInVzZXJfaWQiOjJ9.OaUpIiCwk4CYB_YvE_95xLED-7AYa3AK45ppPW6uZ6M	2022-04-12 19:58:48.600795+00	2022-04-17 19:58:48+00	2	ed41a987ad354ba9aa3dd3e658fa0cb6
13	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDIyNTUyOSwiaWF0IjoxNjQ5NzkzNTI5LCJqdGkiOiJiYzVjYjQ3ODViMzk0N2ExOWZlMTljYThkNzY1OWM4MCIsInVzZXJfaWQiOjJ9.VNTSVMagwZjdJ499QbNR5zLk_B5zNMubuy-sQeyE24M	2022-04-12 19:58:49.291856+00	2022-04-17 19:58:49+00	2	bc5cb4785b3947a19fe19ca8d7659c80
14	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDIyNTY4MiwiaWF0IjoxNjQ5NzkzNjgyLCJqdGkiOiJjNmMxMzVmMjczMjg0ZDcwYjBkZjExNDkyZGZjMzg2ZCIsInVzZXJfaWQiOjJ9.FWxNvGHb3OlhwMthshf_EIX-VgIuQQLaS3ZC3Lq5N14	2022-04-12 20:01:22.082466+00	2022-04-17 20:01:22+00	2	c6c135f273284d70b0df11492dfc386d
15	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDIyNTY5NCwiaWF0IjoxNjQ5NzkzNjk0LCJqdGkiOiI1ZjkwYzdiYTM2Nzc0MGMxYTlmODJmYzliZGZiNzcwYiIsInVzZXJfaWQiOjJ9.XC621xAW_ToU1HF86isHJy35y_u3WBDwBp6RWllkF_U	2022-04-12 20:01:34.149343+00	2022-04-17 20:01:34+00	2	5f90c7ba367740c1a9f82fc9bdfb770b
16	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDIyNzgzNywiaWF0IjoxNjQ5Nzk1ODM3LCJqdGkiOiIyY2IyYWYxYzQ2ODI0ZmQ5YmFkMzI3NTM4N2Y3NTc4OCIsInVzZXJfaWQiOjJ9.ImrvFrexUy3Q1OWLsriXeRfHSPJOjE-sGKhcjCO_0NM	2022-04-12 20:37:17.081994+00	2022-04-17 20:37:17+00	2	2cb2af1c46824fd9bad3275387f75788
17	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDIyODA3MCwiaWF0IjoxNjQ5Nzk2MDcwLCJqdGkiOiJiMjI0MWI4YWY1OWI0OWQ0OGU4NGYzZGE0NTEzNGU3YyIsInVzZXJfaWQiOjJ9.sTruTpzWQfnhPdUk4ydKhkl_b1QgHrGrpKfb4_biTGA	2022-04-12 20:41:10.09386+00	2022-04-17 20:41:10+00	2	b2241b8af59b49d48e84f3da45134e7c
18	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDI3MTQ0MywiaWF0IjoxNjQ5ODM5NDQzLCJqdGkiOiJkYWY1Yjc3MGIyYTA0Mzg5OWMwOGVkY2ZlNzhlZTk0NiIsInVzZXJfaWQiOjJ9.zmf1T4f-ISdEq33GtlkBVcxAiK1JMcWy6Z9Vc6VCplQ	2022-04-13 08:44:03.244147+00	2022-04-18 08:44:03+00	2	daf5b770b2a043899c08edcfe78ee946
19	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDI4NTIzNywiaWF0IjoxNjQ5ODUzMjM3LCJqdGkiOiI2YjM1YjdkZmQ5ZmQ0ZGJhOWFlMzQyZjg3YTNlNDAwZiIsInVzZXJfaWQiOjJ9.30nFbAo9ut8gnztSFf1Ktr_CzOuG-GXb_Mkq1OfqkmU	2022-04-13 12:33:57.568254+00	2022-04-18 12:33:57+00	2	6b35b7dfd9fd4dba9ae342f87a3e400f
20	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDI4NTI0NCwiaWF0IjoxNjQ5ODUzMjQ0LCJqdGkiOiIxNjdjNTYzY2E1ZmY0NTAwYWMyYzg1YThiZWJmN2QyMCIsInVzZXJfaWQiOjJ9.RjLMrw0HBz8TduVa57epZhjXVkTsv7ImtMH0hEm7NfM	2022-04-13 12:34:04.969933+00	2022-04-18 12:34:04+00	2	167c563ca5ff4500ac2c85a8bebf7d20
21	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDMxNTM5OSwiaWF0IjoxNjQ5ODgzMzk5LCJqdGkiOiJjOTUzMDI4M2E4MjU0MjBjOWNjYzAzYWI5YmFjMDNhZiIsInVzZXJfaWQiOjJ9.u4eOH5oc7mLb9GWF23Yv2VEsDsvF0XGWPS4rCnAbH_M	2022-04-13 20:56:39.529866+00	2022-04-18 20:56:39+00	2	c9530283a825420c9ccc03ab9bac03af
22	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDMxNTQwNSwiaWF0IjoxNjQ5ODgzNDA1LCJqdGkiOiI0NzQ5Y2ExMmM4ODI0MjAzYTM5MDc5Njk2OWMyNjdjNyIsInVzZXJfaWQiOjJ9.g_Tf6AQ-wUvFZWR3mAv5ALDvrXFn_lOssUOWyMX3vuw	2022-04-13 20:56:45.367095+00	2022-04-18 20:56:45+00	2	4749ca12c8824203a390796969c267c7
23	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDMxNTU1MCwiaWF0IjoxNjQ5ODgzNTUwLCJqdGkiOiJlZmZlYjMyOGZlOWI0OGFjODRlN2VhZjg5ZGI0OWU4MyIsInVzZXJfaWQiOjJ9.7bVa7MQj7BuBY6C-qNyIKe9qZBEG_zAQ8CNj_z9jI_Y	2022-04-13 20:59:10.510087+00	2022-04-18 20:59:10+00	2	effeb328fe9b48ac84e7eaf89db49e83
24	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDMxNTU3MywiaWF0IjoxNjQ5ODgzNTczLCJqdGkiOiI2OTg2YzRmNDgwNmY0ZTFkYjk4ZjViMzcwM2I3ZmQzNyIsInVzZXJfaWQiOjJ9._IbMZgl1XkrMlATFuld8jQ6_fCXei_ndWn_zwVfKL8k	2022-04-13 20:59:33.941451+00	2022-04-18 20:59:33+00	2	6986c4f4806f4e1db98f5b3703b7fd37
25	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDMxNTU4MSwiaWF0IjoxNjQ5ODgzNTgxLCJqdGkiOiI3N2EyN2Y4YWU5ZDQ0Mzc3OTc0NGJkODdjZDU4ZmE2YiIsInVzZXJfaWQiOjJ9.pWrVSVfoylYeNcNmuTvp0WS2-ziX8kQdnTvo07yDU3c	2022-04-13 20:59:41.735251+00	2022-04-18 20:59:41+00	2	77a27f8ae9d443779744bd87cd58fa6b
26	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDMxNzAxNCwiaWF0IjoxNjQ5ODg1MDE0LCJqdGkiOiI3ODMzZmUwNGRmYjE0ZThkYTIxZWVhZjhhMTkzNTgwOCIsInVzZXJfaWQiOjJ9.lmePr-lDvWhff05FiXCuHeHKfmYloOc5A_9xKznAv7o	2022-04-13 21:23:34.991938+00	2022-04-18 21:23:34+00	2	7833fe04dfb14e8da21eeaf8a1935808
27	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDMxNzAyNiwiaWF0IjoxNjQ5ODg1MDI2LCJqdGkiOiI1YmJlYmM3ZjU4YWM0M2I5YTYxYmY5M2E3NGRhNjcxZCIsInVzZXJfaWQiOjJ9.8W8JmWnleeyovwgHw0UX419iAsabseP5ubV-MgPp_uc	2022-04-13 21:23:46.372444+00	2022-04-18 21:23:46+00	2	5bbebc7f58ac43b9a61bf93a74da671d
28	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDMyNzkyNSwiaWF0IjoxNjQ5ODk1OTI1LCJqdGkiOiJmMzg5OWY2OWE1ZWY0YzQ5YWZlN2QzNDg1NDdjNDBkNiIsInVzZXJfaWQiOjJ9.1mEz4yseLSdddljHRGvQXISrYvnEocFu781x8lGNYro	2022-04-14 00:25:25.566863+00	2022-04-19 00:25:25+00	2	f3899f69a5ef4c49afe7d348547c40d6
29	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDM2MTgwOSwiaWF0IjoxNjQ5OTI5ODA5LCJqdGkiOiJhYjI3Yjg5OWFmMGY0YjVlYThhNTFjOTU5YWQxOTdjZCIsInVzZXJfaWQiOjJ9.zGgpbOgC4tAzyKQTHfgqXWRH_v8HJr-X72wD9Kc642Q	2022-04-14 09:50:09.258694+00	2022-04-19 09:50:09+00	2	ab27b899af0f4b5ea8a51c959ad197cd
30	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDM2MTgxMywiaWF0IjoxNjQ5OTI5ODEzLCJqdGkiOiJjOWI2OThiYzY2M2Q0ZmY0ODE0NTEyNjE4Yzg3OGQyZiIsInVzZXJfaWQiOjJ9.jHvTBFhklUVZNf4XTBZAqwtRU6u8brI3b5PQ5ITY0AE	2022-04-14 09:50:13.667358+00	2022-04-19 09:50:13+00	2	c9b698bc663d4ff4814512618c878d2f
31	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDM2Mjc0MiwiaWF0IjoxNjQ5OTMwNzQyLCJqdGkiOiIzZTQ4MjIwNDc0NDM0ZTI0YTVhMDk0Y2QzYjYzYTU4ZiIsInVzZXJfaWQiOjJ9.zJqD8wyebKlT8X_o8yB0RHTTjVSYAjp9Yt7mV-GNWn4	2022-04-14 10:05:42.969599+00	2022-04-19 10:05:42+00	2	3e48220474434e24a5a094cd3b63a58f
32	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDM2Mzk4MSwiaWF0IjoxNjQ5OTMxOTgxLCJqdGkiOiJmZTg1MDM0MDVkMWM0Njc4ODdkMzYyYTJlMTYwYjkwMiIsInVzZXJfaWQiOjZ9.694juazfeyYqeSnjnG_aiZJ7wwyMYLg6gHX-fV5cGJw	2022-04-14 10:26:21.242817+00	2022-04-19 10:26:21+00	6	fe8503405d1c467887d362a2e160b902
33	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDM2NTEwNiwiaWF0IjoxNjQ5OTMzMTA2LCJqdGkiOiJjZjZlZjU5YTRkZjI0YmI0YTM1ZmRjNmU3ZWFkMGUyMSIsInVzZXJfaWQiOjV9.0hOr4Jox67m0xnesyMKHmKbp2tn7qiCaE_3hFEiB0T4	2022-04-14 10:45:06.309927+00	2022-04-19 10:45:06+00	5	cf6ef59a4df24bb4a35fdc6e7ead0e21
34	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDM2NjAwMSwiaWF0IjoxNjQ5OTM0MDAxLCJqdGkiOiJjMzI0ODMzMWE2MTg0ODQxYTE1YzViMDJjYzk5MDk2MiIsInVzZXJfaWQiOjJ9.yRW7CFW4gBDneZzeXGOJhFxHMg9b590jYp4iXXvSgSU	2022-04-14 11:00:01.838463+00	2022-04-19 11:00:01+00	2	c3248331a6184841a15c5b02cc990962
35	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDM2ODg0MCwiaWF0IjoxNjQ5OTM2ODQwLCJqdGkiOiI1MTI0YzJhZmE5MTM0Yzc4Yjc3YTY0NjJjY2MyZTkwOCIsInVzZXJfaWQiOjJ9.EFpi9mKtKZ5k5Qx3hapsue1-2erE6KyqklsOOPjreYQ	2022-04-14 11:47:20.573378+00	2022-04-19 11:47:20+00	2	5124c2afa9134c78b77a6462ccc2e908
36	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDM2ODg1MCwiaWF0IjoxNjQ5OTM2ODUwLCJqdGkiOiIzMTZhNzg2MmJhZGM0ODZkYjExZDgyMjI5OGY5NTZhZCIsInVzZXJfaWQiOjJ9.JtCJ5Jw7hO3nf40R9wpxQ-R0n-7IG0cyfwgVMjadH3E	2022-04-14 11:47:30.240117+00	2022-04-19 11:47:30+00	2	316a7862badc486db11d822298f956ad
37	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDM3MDIyMSwiaWF0IjoxNjQ5OTM4MjIxLCJqdGkiOiJkNWMyMDE0YmM4YmY0MWRlYjlkY2Q4ZWM3NzYxYTliMiIsInVzZXJfaWQiOjJ9.lpB8GXXUecYpx2WQaNuT-EHpSU58nggwE5M5mJMzFlg	2022-04-14 12:10:21.561799+00	2022-04-19 12:10:21+00	2	d5c2014bc8bf41deb9dcd8ec7761a9b2
38	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDM3MDIyOSwiaWF0IjoxNjQ5OTM4MjI5LCJqdGkiOiI1YzdkODMxNWRiYWE0Yzg1ODgyYWU0MTBkMWM3MzBiNCIsInVzZXJfaWQiOjJ9.yTHmp3fYmb8IA33UlYVK3ldOTPHkGPRjA9z7KYf3Ufw	2022-04-14 12:10:29.042215+00	2022-04-19 12:10:29+00	2	5c7d8315dbaa4c85882ae410d1c730b4
39	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDM3MTIwOSwiaWF0IjoxNjQ5OTM5MjA5LCJqdGkiOiIzMjZjYjBjMDAzNmY0MmQzYjU2ZTA1OGE2ZmQ5NGZhZSIsInVzZXJfaWQiOjJ9.wMOe5UmRONtdKHMaCwQSO0chVjqCJNCb22Un6BMfDks	2022-04-14 12:26:49.929354+00	2022-04-19 12:26:49+00	2	326cb0c0036f42d3b56e058a6fd94fae
40	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDM3MTc1OSwiaWF0IjoxNjQ5OTM5NzU5LCJqdGkiOiIwNjc1NTY1YWViYTk0M2RmYTg3MGI5N2JmNDUxYmU2NCIsInVzZXJfaWQiOjJ9.yzck26UToAc1fQK51a6IbjcuFoPxDa5Coc_8HJzMxxA	2022-04-14 12:35:59.413893+00	2022-04-19 12:35:59+00	2	0675565aeba943dfa870b97bf451be64
41	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDM3Mzc4MCwiaWF0IjoxNjQ5OTQxNzgwLCJqdGkiOiJiNTJhOThlYjA3ZDQ0N2ZiYmNhYzg2N2FjM2JmYmFjZiIsInVzZXJfaWQiOjJ9._U10ze0lFZVa0drZ1N7_WmIM2QlOmFtPjVJhFKj8uzQ	2022-04-14 13:09:40.968287+00	2022-04-19 13:09:40+00	2	b52a98eb07d447fbbcac867ac3bfbacf
42	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDM3Mzk2MSwiaWF0IjoxNjQ5OTQxOTYxLCJqdGkiOiJjOTYxODE3Y2VlZDU0OTY5OGFmMjc0MWFhYWFiNDI0ZiIsInVzZXJfaWQiOjJ9.XYx-Uaae-uDoTCNexPrZJXYp9_NDi6M-Zjc7KZ7XCsU	2022-04-14 13:12:41.955295+00	2022-04-19 13:12:41+00	2	c961817ceed549698af2741aaaab424f
43	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDM3NDAwNSwiaWF0IjoxNjQ5OTQyMDA1LCJqdGkiOiIxMDJhZDJiMWQ1NDQ0Mjg0YTc2MTRkNjEzZGYyMDZiNCIsInVzZXJfaWQiOjJ9.NkG93BoDwYvbBgK3bRi3CkjpbW-V9t0bPMll8596AGw	2022-04-14 13:13:25.153999+00	2022-04-19 13:13:25+00	2	102ad2b1d5444284a7614d613df206b4
44	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDM3NTY1NiwiaWF0IjoxNjQ5OTQzNjU2LCJqdGkiOiI1Y2I5M2Y5YmRhNzQ0NDlhOGRjNDMwODE1YzI0ZTA5NSIsInVzZXJfaWQiOjJ9.EZkkosgxo3gn97wIyR4XCeN2l5aD2ZtRp7D8EqB8-DE	2022-04-14 13:40:56.966659+00	2022-04-19 13:40:56+00	2	5cb93f9bda74449a8dc430815c24e095
45	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDM3ODg5NCwiaWF0IjoxNjQ5OTQ2ODk0LCJqdGkiOiI5ZjlmMzc0YmUxZjM0ZGM0ODQ3NGQyZTdiOWYwNWNiMyIsInVzZXJfaWQiOjJ9.V1DBjC12sgbuoPQry2NNqX2FS6Y3kA8Zl4Eo2dNy27Y	2022-04-14 14:34:54.75933+00	2022-04-19 14:34:54+00	2	9f9f374be1f34dc48474d2e7b9f05cb3
46	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDM4MTQzNiwiaWF0IjoxNjQ5OTQ5NDM2LCJqdGkiOiJlYmM1ZDE4MjY4YWM0ZmViOGFmM2Q2OWM4ZjEwYmE2MyIsInVzZXJfaWQiOjJ9.3OtNJBVwE_DDFVg8BR7wEq2yDIoJ2Vvc4cyNTNwsS-U	2022-04-14 15:17:16.359025+00	2022-04-19 15:17:16+00	2	ebc5d18268ac4feb8af3d69c8f10ba63
47	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDM4MTU5OSwiaWF0IjoxNjQ5OTQ5NTk5LCJqdGkiOiJiYWFjODZhYjRkNDA0MWJlYTdkZDhmMmEyMzg0ZjI2NiIsInVzZXJfaWQiOjJ9.rpM_NbacyjF1gm3WT8ULkQAGrfHz1H6yqJk-RjB6MG4	2022-04-14 15:19:59.185325+00	2022-04-19 15:19:59+00	2	baac86ab4d4041bea7dd8f2a2384f266
48	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDQxNTUwNywiaWF0IjoxNjQ5OTgzNTA3LCJqdGkiOiI0YzZlNmM5ZDU0YWU0OGRjYTcxNzcyMTg4YzQ2NTU3MSIsInVzZXJfaWQiOjJ9.lkojd4g659CBMgZgul6lEZ-2UlnHsj32IZRhHBWV8eQ	2022-04-15 00:45:07.073074+00	2022-04-20 00:45:07+00	2	4c6e6c9d54ae48dca71772188c465571
49	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDQ4MjY1NywiaWF0IjoxNjUwMDUwNjU3LCJqdGkiOiI4MTRmODc0NzcwN2M0MjA4YjE0NjAwMjdmYmEwZDI5NSIsInVzZXJfaWQiOjd9.Q7O2riKHOnhoeXNwxxInJB0fqVzeJXIr4g4OZSL2jdg	2022-04-15 19:24:17.309009+00	2022-04-20 19:24:17+00	7	814f8747707c4208b1460027fba0d295
50	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDQ4MzAyMSwiaWF0IjoxNjUwMDUxMDIxLCJqdGkiOiJlMDhhOTFhMDJlOTE0NjRkYjUxOGI2NThkNTY3NWIyYSIsInVzZXJfaWQiOjV9.3lTP0konOy_ogOf5z0VcjR87hDa-ypM7cCM4wKGdJwU	2022-04-15 19:30:21.752762+00	2022-04-20 19:30:21+00	5	e08a91a02e91464db518b658d5675b2a
51	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDQ4MzA4NiwiaWF0IjoxNjUwMDUxMDg2LCJqdGkiOiI1ZjZkMjhmN2Y5NDk0ZjFlOTJlZWM1MjhiNGI3Zjg4ZCIsInVzZXJfaWQiOjV9.mavdcpf4vHCU-nyToogi0fBwN3Y_d3uG0OH3iz5bZUg	2022-04-15 19:31:26.078554+00	2022-04-20 19:31:26+00	5	5f6d28f7f9494f1e92eec528b4b7f88d
52	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDQ4MzA4NiwiaWF0IjoxNjUwMDUxMDg2LCJqdGkiOiI4Y2M2NDM5NWUxMGI0ODgxYWQzZjA4OTZjM2YxMTZlZSIsInVzZXJfaWQiOjV9.qrLaOU_oiNjHhowRZGRMUGC-9CqDzhh5Cu0PFJWUzQ0	2022-04-15 19:31:26.103027+00	2022-04-20 19:31:26+00	5	8cc64395e10b4881ad3f0896c3f116ee
53	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDQ4NTg2MCwiaWF0IjoxNjUwMDUzODYwLCJqdGkiOiIyMDdkZGU2YjNlYTI0MmY4OTkwY2FlN2M2YTEyNTM3OSIsInVzZXJfaWQiOjJ9.9Rem7Cda43WkJDwi9XJxeIRIKZ8kL9Jkzo4TR0GgckE	2022-04-15 20:17:40.682768+00	2022-04-20 20:17:40+00	2	207dde6b3ea242f8990cae7c6a125379
54	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDQ5MDUyOCwiaWF0IjoxNjUwMDU4NTI4LCJqdGkiOiI0OGMyMWU4ZDk5MGY0ZjhlODk5OGRkMWIwOTc0ODExNCIsInVzZXJfaWQiOjV9.tKc8cZgiu5TtMLuxjwNmbndd2-Ny3XxNLTy2fn3vzJM	2022-04-15 21:35:28.165664+00	2022-04-20 21:35:28+00	5	48c21e8d990f4f8e8998dd1b09748114
55	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDUwMzM4NSwiaWF0IjoxNjUwMDcxMzg1LCJqdGkiOiJkYmY1Zjk5ZmZkMzU0ZjVlYTg4MjE5NmY4ZjI4ZDIwNyIsInVzZXJfaWQiOjJ9.4uJdC41ekVTR-U2GMLWs4a24OyI_pLMJBSJVTHVJJCc	2022-04-16 01:09:45.160312+00	2022-04-21 01:09:45+00	2	dbf5f99ffd354f5ea882196f8f28d207
56	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDUwNDE3MSwiaWF0IjoxNjUwMDcyMTcxLCJqdGkiOiJiNWU4MzgwOTQwMTU0ZjczYmM5NmZlZDU1OTRlNTg2MCIsInVzZXJfaWQiOjJ9.wxBsZCSTxC7oZoiMtG_oxAocN9gb8zZ2w8Ua4Lkdq1o	2022-04-16 01:22:51.332067+00	2022-04-21 01:22:51+00	2	b5e8380940154f73bc96fed5594e5860
57	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDUwNTM3MSwiaWF0IjoxNjUwMDczMzcxLCJqdGkiOiJhNDBhMDY3OTdhOGU0YjhhYTcyMDc5Nzg1OTk1ZmU4OCIsInVzZXJfaWQiOjJ9.zhYEe4jX0zJfi0eGQ1z23FpehpbMMeCyC6NT4UbDBXo	2022-04-16 01:42:51.27878+00	2022-04-21 01:42:51+00	2	a40a06797a8e4b8aa72079785995fe88
58	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDUwNTM3OSwiaWF0IjoxNjUwMDczMzc5LCJqdGkiOiI3MmI3ODRmMDM3ZGI0N2JjOTJhNTRlOGE5ZGNiZmZhNiIsInVzZXJfaWQiOjJ9.sFbJMRt6p-nF4CO6XJ5zK3iFW1tsG_5z-OM3bAbF_v0	2022-04-16 01:42:59.211364+00	2022-04-21 01:42:59+00	2	72b784f037db47bc92a54e8a9dcbffa6
59	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDUwNTM4NCwiaWF0IjoxNjUwMDczMzg0LCJqdGkiOiI2YmE1NzhiZjY0OGU0MGUxOTJhNjg5MjZlZmI4ZDgyMiIsInVzZXJfaWQiOjJ9.uvDlmFnkKEE_2SmsXNaza-CCbLrdHvOcX0bCM52VvSQ	2022-04-16 01:43:04.191031+00	2022-04-21 01:43:04+00	2	6ba578bf648e40e192a68926efb8d822
60	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDUwNTM5OSwiaWF0IjoxNjUwMDczMzk5LCJqdGkiOiJjZjYwYWViYmM2NDI0OGFhYWQ4YTUxN2Q3NzAyOGE0ZCIsInVzZXJfaWQiOjJ9.WMP5wmBmMU0iaGRjJIkNSxMfCSDDbFn62mGa2-jDnzY	2022-04-16 01:43:19.62416+00	2022-04-21 01:43:19+00	2	cf60aebbc64248aaad8a517d77028a4d
61	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDUwNTQ0NywiaWF0IjoxNjUwMDczNDQ3LCJqdGkiOiI3N2E1N2Q0M2NmMjc0ZDVlOWYzMDA1NDBkODc3NGEyMSIsInVzZXJfaWQiOjJ9.FiM-82TNlCdkcaOnhRkc3-M9OqsZinioaDCptEpGbKw	2022-04-16 01:44:07.957569+00	2022-04-21 01:44:07+00	2	77a57d43cf274d5e9f300540d8774a21
62	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDUwNTQ5NSwiaWF0IjoxNjUwMDczNDk1LCJqdGkiOiJmYzNiZTY2ZmNhZDU0OGUyYTA1YmRhYWIxOGEzNTAzNiIsInVzZXJfaWQiOjJ9.Jl3dU6dEs4sLfdiGasT8zgscHzt9EdyymA85m4_3mjo	2022-04-16 01:44:55.152179+00	2022-04-21 01:44:55+00	2	fc3be66fcad548e2a05bdaab18a35036
63	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDUwNTUzMiwiaWF0IjoxNjUwMDczNTMyLCJqdGkiOiJiNzMzNzlhMDU3NWQ0MThhYjc0NTFmOTFhNWYzOTg4YiIsInVzZXJfaWQiOjJ9.vyjKF96T7o57jEf5mlfv3gFPoGfGikUcpHqtEw-UDsQ	2022-04-16 01:45:32.692178+00	2022-04-21 01:45:32+00	2	b73379a0575d418ab7451f91a5f3988b
64	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDUwNTU5OSwiaWF0IjoxNjUwMDczNTk5LCJqdGkiOiJlZjlkYzExNDAyMjI0YmE5OGI3NmVkNGRhNzYyYTU0MiIsInVzZXJfaWQiOjJ9.xHyBW9BkUMNTCY0OHEdoTpNO-teQCpCZSacGISQFZ1g	2022-04-16 01:46:39.494125+00	2022-04-21 01:46:39+00	2	ef9dc11402224ba98b76ed4da762a542
65	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDUwNzA5OSwiaWF0IjoxNjUwMDc1MDk5LCJqdGkiOiI3YzQ3OWYwMzNiOTE0MDhiOGFjNzM5ZmZmZmRhNzM2OCIsInVzZXJfaWQiOjJ9.6dAgEUk-SeCMEQC7A68yZFHlJ4YZp0aavvpQ0CefDrQ	2022-04-16 02:11:39.750747+00	2022-04-21 02:11:39+00	2	7c479f033b91408b8ac739ffffda7368
66	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDUwNzI0MCwiaWF0IjoxNjUwMDc1MjQwLCJqdGkiOiIzNmI5NGJlYThhODA0MjExODQ4Y2JkYjFiNzhjNDg0MCIsInVzZXJfaWQiOjJ9.WMsnOtv5uUznGADO14BNtds8ahEDKerVf-T2Y1847ZU	2022-04-16 02:14:00.358925+00	2022-04-21 02:14:00+00	2	36b94bea8a804211848cbdb1b78c4840
67	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDUwNzI2NCwiaWF0IjoxNjUwMDc1MjY0LCJqdGkiOiIwZWQ0NmNiMjkxYzQ0ZDJmYjNjZWRlMDg2ZTcyMDA2MSIsInVzZXJfaWQiOjJ9.N-_M5QlKmbgS0iciVCgwuupjB3Zi9rETQ1G1mP2JNXo	2022-04-16 02:14:24.242167+00	2022-04-21 02:14:24+00	2	0ed46cb291c44d2fb3cede086e720061
68	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDUwNzUzNywiaWF0IjoxNjUwMDc1NTM3LCJqdGkiOiI5OWU3NDM4ZTgxOGM0YjQzOWI2NTQ1NTU5M2NjNGJkOSIsInVzZXJfaWQiOjJ9.qswfy2brCGBOCwgg5GFmAEDhg2lVoR2OuFvXlshrxgw	2022-04-16 02:18:57.047838+00	2022-04-21 02:18:57+00	2	99e7438e818c4b439b65455593cc4bd9
69	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDUwNzU0NCwiaWF0IjoxNjUwMDc1NTQ0LCJqdGkiOiIxZDRiNDgxNjlmOWQ0Y2ZkYTUyNDRmNDM4YTRiZjY2ZSIsInVzZXJfaWQiOjJ9.w-BLQ63_U7cmRDhrB7Y_D3zcmqZjt2Jhqdt0-iK8UVk	2022-04-16 02:19:04.960144+00	2022-04-21 02:19:04+00	2	1d4b48169f9d4cfda5244f438a4bf66e
70	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDUwNzc2OCwiaWF0IjoxNjUwMDc1NzY4LCJqdGkiOiJkYzJhNzA1NzMyYTM0NGFkYWZjYmYyMzlkNzA1NDRlMCIsInVzZXJfaWQiOjJ9.KvSS0OsNGHmrhCtj0wnb1bZxqeQKvixUOrohtPVQCFQ	2022-04-16 02:22:48.67987+00	2022-04-21 02:22:48+00	2	dc2a705732a344adafcbf239d70544e0
71	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDUwNzc3NSwiaWF0IjoxNjUwMDc1Nzc1LCJqdGkiOiJlYzg5MTJmOGRmNzQ0NTY2YjA5MDlhNjk1YjViZDg4ZSIsInVzZXJfaWQiOjJ9.xtqmCWst7wkmzVBTPSGls1LN0D9unr6P24_eJV9ElmQ	2022-04-16 02:22:55.212115+00	2022-04-21 02:22:55+00	2	ec8912f8df744566b0909a695b5bd88e
72	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDUwNzc4NCwiaWF0IjoxNjUwMDc1Nzg0LCJqdGkiOiIwNjUyMDJhNDA4YzY0ZDdlOWE3MWQ0YjU3N2RlYmJlOSIsInVzZXJfaWQiOjJ9.YLjOE1LGOSYGqv_fsGboRRg_vDTIpiv6YlHtczVs6ns	2022-04-16 02:23:04.748279+00	2022-04-21 02:23:04+00	2	065202a408c64d7e9a71d4b577debbe9
73	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDUwNzg0NywiaWF0IjoxNjUwMDc1ODQ3LCJqdGkiOiIxMjA2YjhlYjhmNjA0MDBlYjY3Mjg3NWQ5ZGQ0YzVkNCIsInVzZXJfaWQiOjJ9.lqUdBIV7oeMD7Pj8E0PPdGhdU8_tlmCdgJG7Kmh1_J4	2022-04-16 02:24:07.405157+00	2022-04-21 02:24:07+00	2	1206b8eb8f60400eb672875d9dd4c5d4
74	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDUwNzg5NywiaWF0IjoxNjUwMDc1ODk3LCJqdGkiOiIzOTAyN2Q4M2E1ZDY0ZDEyYjg2NDc4YjlhNTk3ZGQ0NCIsInVzZXJfaWQiOjJ9.EFOzSlWn4Mjn00L1T-A9XtmQRMUdVz2WsD6ibWFIf3g	2022-04-16 02:24:57.320736+00	2022-04-21 02:24:57+00	2	39027d83a5d64d12b86478b9a597dd44
75	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDUwNzk3NiwiaWF0IjoxNjUwMDc1OTc2LCJqdGkiOiJjZmIyYjIwNTg1N2Y0M2RkODI1ZDgxM2ZlMDMzZWQzMyIsInVzZXJfaWQiOjJ9.C7zibWo91vBVFqO87Q6E0UfHn3_jDbmyWnG-lTk7LMw	2022-04-16 02:26:16.733134+00	2022-04-21 02:26:16+00	2	cfb2b205857f43dd825d813fe033ed33
76	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDUwODAyNywiaWF0IjoxNjUwMDc2MDI3LCJqdGkiOiIxYjRjOWIwNjdkZjY0ZmYxODRjODc4MzYzNDFkZTU4MSIsInVzZXJfaWQiOjJ9.LlqJ5wm5O004BNOu3o5enQBiNdc1sO-eweeCBn0qaz8	2022-04-16 02:27:07.189713+00	2022-04-21 02:27:07+00	2	1b4c9b067df64ff184c87836341de581
77	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDUwODA1NCwiaWF0IjoxNjUwMDc2MDU0LCJqdGkiOiJlZWQ3MjUzMGFjYTg0MWNiYWJiNGMzYzk0Y2U3ODE3OCIsInVzZXJfaWQiOjJ9.fS9bAOJbbOoMV8JoTZqHE0Qqu44s-jv2aP8kfyjWulg	2022-04-16 02:27:34.790879+00	2022-04-21 02:27:34+00	2	eed72530aca841cbabb4c3c94ce78178
78	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDU4NTg4MCwiaWF0IjoxNjUwMTUzODgwLCJqdGkiOiIyODRhOWEwNWVhNjQ0MTUxYTdmYTEwZGY4NGYwMDgyNyIsInVzZXJfaWQiOjJ9.KTv7rqmGK_yvOerQHttkIyfXXmNL0bGFg4-OE2Cbw-k	2022-04-17 00:04:40.87737+00	2022-04-22 00:04:40+00	2	284a9a05ea644151a7fa10df84f00827
79	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDY3NTg5OCwiaWF0IjoxNjUwMjQzODk4LCJqdGkiOiJjYzQ1ZjA5ZjY2YmE0ZDMzYjBkZThmN2VkZjU4NjMzZiIsInVzZXJfaWQiOjJ9.KoWexK99f8exkhfSEj78mukfdII3eUdD3VI0NTlX4es	2022-04-18 01:04:58.791106+00	2022-04-23 01:04:58+00	2	cc45f09f66ba4d33b0de8f7edf58633f
80	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDY3NTkwMywiaWF0IjoxNjUwMjQzOTAzLCJqdGkiOiIzMjcwMjhiNzllMGE0YzU0YTJkNTljNjBjZmEyMGY3MyIsInVzZXJfaWQiOjJ9._Zt7up-bx_fbEiJz0_BU6pftEIz48ArBlpeDFvM7O6o	2022-04-18 01:05:03.62536+00	2022-04-23 01:05:03+00	2	327028b79e0a4c54a2d59c60cfa20f73
81	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDY3NjQ2MywiaWF0IjoxNjUwMjQ0NDYzLCJqdGkiOiJiNmIyMjI5MTYzNTY0ODI2YTRmYjg1ZGYwZjZjMGU1OCIsInVzZXJfaWQiOjJ9.b9s_ZdyLWyMxeU-63Z55L6bMb1yHXZ2dETNZ3cpfPz4	2022-04-18 01:14:23.01301+00	2022-04-23 01:14:23+00	2	b6b2229163564826a4fb85df0f6c0e58
82	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDY3NzE4OSwiaWF0IjoxNjUwMjQ1MTg5LCJqdGkiOiI0ZjM5NGMzOGE3OWY0NmQ5ODE3ZWZiMTI1ZjJmMjc1ZiIsInVzZXJfaWQiOjJ9.a6mL0NPu3wnTJ7t-sTh2E86W4T67cq5_EFe19WsEgaM	2022-04-18 01:26:29.789316+00	2022-04-23 01:26:29+00	2	4f394c38a79f46d9817efb125f2f275f
83	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDY3NzIxNSwiaWF0IjoxNjUwMjQ1MjE1LCJqdGkiOiI5MDA3MjYzMDE2NmE0YzAxYWY1NDVlMmQzNDNkOTJkZCIsInVzZXJfaWQiOjJ9.Dret-jM5qVdsYNsHvjLWDt_mEuS3pt100VVM3wmgBWE	2022-04-18 01:26:55.879497+00	2022-04-23 01:26:55+00	2	90072630166a4c01af545e2d343d92dd
84	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDY3NzIzNywiaWF0IjoxNjUwMjQ1MjM3LCJqdGkiOiJiYzI5N2MwMzI2ZTU0NDViYTU2YjYzYzI1MjU4MTI3YiIsInVzZXJfaWQiOjJ9.B_Y6pf6a9YB8satvKnub1hQJ8-mEKq9Fb5xZmlxg4VU	2022-04-18 01:27:17.619844+00	2022-04-23 01:27:17+00	2	bc297c0326e5445ba56b63c25258127b
85	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDY3NzI4MSwiaWF0IjoxNjUwMjQ1MjgxLCJqdGkiOiIxMjdmYTYwZDQ5M2M0MjczOWU0OWYyNjViNmVhOTc0ZSIsInVzZXJfaWQiOjJ9.NoC2_hMCDmXDwz2i1bW7EU2pCV-aj7fm1b7ed9jf6oA	2022-04-18 01:28:01.512381+00	2022-04-23 01:28:01+00	2	127fa60d493c42739e49f265b6ea974e
86	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDY3NzMwOSwiaWF0IjoxNjUwMjQ1MzA5LCJqdGkiOiI1MTk2NGU5Y2QwNzU0NzRiOGZjNmU2MjQ1YzY5YmI5YiIsInVzZXJfaWQiOjJ9.W6Tq8pu9U9b9qQgE6X0w-plBLRfp5QH5J6u9jM7ToBo	2022-04-18 01:28:29.134874+00	2022-04-23 01:28:29+00	2	51964e9cd075474b8fc6e6245c69bb9b
87	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDY3NzM0NCwiaWF0IjoxNjUwMjQ1MzQ0LCJqdGkiOiI4MDQzYTc3Mzg0OWI0Y2UxODFkNDdmODU4NjhiN2Q3OSIsInVzZXJfaWQiOjJ9.rc0i0jOnk4OAmFR-U13bG-vyYWu2Ck1fTsl108HHLAQ	2022-04-18 01:29:04.789806+00	2022-04-23 01:29:04+00	2	8043a773849b4ce181d47f85868b7d79
88	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDY3NzM2NiwiaWF0IjoxNjUwMjQ1MzY2LCJqdGkiOiI0NDhkMmVjNDg4YzI0N2FlYmQ4YzI0MjVhNjhhZGFhNyIsInVzZXJfaWQiOjF9.diAdDznFjtKT4vWGIzbGbh50NqvYYHsvMT73mpDzSak	2022-04-18 01:29:26.349483+00	2022-04-23 01:29:26+00	1	448d2ec488c247aebd8c2425a68adaa7
89	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDY3NzM4MywiaWF0IjoxNjUwMjQ1MzgzLCJqdGkiOiIwYzRmNGJlN2E3ZTY0ZGJjYTczZThhNGY0YzQ5NjQ2ZCIsInVzZXJfaWQiOjJ9.HPbnu6Pn8kbU5hy0LCMOdlqLq9mcOYqFwt32lzgR854	2022-04-18 01:29:43.311243+00	2022-04-23 01:29:43+00	2	0c4f4be7a7e64dbca73e8a4f4c49646d
90	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MDY3NzM5MywiaWF0IjoxNjUwMjQ1MzkzLCJqdGkiOiIyOGVhYzM5ZTg1MmQ0MWYzOTFhNjRhYzgyYjhiYTAwZCIsInVzZXJfaWQiOjJ9.IL0QO13lkCz98JGxsS1kIJqVqXLTH-upif9X_tCsKA4	2022-04-18 01:29:53.062704+00	2022-04-23 01:29:53+00	2	28eac39e852d41f391a64ac82b8ba00d
\.


--
-- Name: accounts_account_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_account_groups_id_seq', 1, false);


--
-- Name: accounts_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_account_id_seq', 7, true);


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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 107, true);


--
-- Name: holdings_holding_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.holdings_holding_id_seq', 136, true);


--
-- Name: token_blacklist_blacklistedtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.token_blacklist_blacklistedtoken_id_seq', 44, true);


--
-- Name: token_blacklist_outstandingtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.token_blacklist_outstandingtoken_id_seq', 90, true);


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
-- Name: holdings_capital holdings_capital_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holdings_capital
    ADD CONSTRAINT holdings_capital_pkey PRIMARY KEY (user_id);


--
-- Name: holdings_holding holdings_holding_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holdings_holding
    ADD CONSTRAINT holdings_holding_pkey PRIMARY KEY (id);


--
-- Name: token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_pkey PRIMARY KEY (id);


--
-- Name: token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_token_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_token_id_key UNIQUE (token_id);


--
-- Name: token_blacklist_outstandingtoken token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq UNIQUE (jti);


--
-- Name: token_blacklist_outstandingtoken token_blacklist_outstandingtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outstandingtoken_pkey PRIMARY KEY (id);


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
-- Name: token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_like ON public.token_blacklist_outstandingtoken USING btree (jti varchar_pattern_ops);


--
-- Name: token_blacklist_outstandingtoken_user_id_83bc629a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX token_blacklist_outstandingtoken_user_id_83bc629a ON public.token_blacklist_outstandingtoken USING btree (user_id);


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
-- Name: holdings_capital holdings_capital_user_id_6d0903d8_fk_accounts_account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holdings_capital
    ADD CONSTRAINT holdings_capital_user_id_6d0903d8_fk_accounts_account_id FOREIGN KEY (user_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: holdings_holding holdings_holding_user_id_28ba9863_fk_accounts_account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holdings_holding
    ADD CONSTRAINT holdings_holding_user_id_28ba9863_fk_accounts_account_id FOREIGN KEY (user_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk FOREIGN KEY (token_id) REFERENCES public.token_blacklist_outstandingtoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: token_blacklist_outstandingtoken token_blacklist_outs_user_id_83bc629a_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outs_user_id_83bc629a_fk_accounts_ FOREIGN KEY (user_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

