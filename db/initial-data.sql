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
-- Name: django_apscheduler_djangojob; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_apscheduler_djangojob (
    id character varying(255) NOT NULL,
    next_run_time timestamp with time zone,
    job_state bytea NOT NULL
);


ALTER TABLE public.django_apscheduler_djangojob OWNER TO postgres;

--
-- Name: django_apscheduler_djangojobexecution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_apscheduler_djangojobexecution (
    id bigint NOT NULL,
    status character varying(50) NOT NULL,
    run_time timestamp with time zone NOT NULL,
    duration numeric(15,2),
    finished numeric(15,2),
    exception character varying(1000),
    traceback text,
    job_id character varying(255) NOT NULL
);


ALTER TABLE public.django_apscheduler_djangojobexecution OWNER TO postgres;

--
-- Name: django_apscheduler_djangojobexecution_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_apscheduler_djangojobexecution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_apscheduler_djangojobexecution_id_seq OWNER TO postgres;

--
-- Name: django_apscheduler_djangojobexecution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_apscheduler_djangojobexecution_id_seq OWNED BY public.django_apscheduler_djangojobexecution.id;


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
-- Name: holdings_portfoliosnapshot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.holdings_portfoliosnapshot (
    id bigint NOT NULL,
    date timestamp with time zone NOT NULL,
    portfolio jsonb NOT NULL,
    user_id bigint NOT NULL,
    snapshot_hook character varying(10) NOT NULL
);


ALTER TABLE public.holdings_portfoliosnapshot OWNER TO postgres;

--
-- Name: holdings_portfoliosnapshot_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.holdings_portfoliosnapshot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.holdings_portfoliosnapshot_id_seq OWNER TO postgres;

--
-- Name: holdings_portfoliosnapshot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.holdings_portfoliosnapshot_id_seq OWNED BY public.holdings_portfoliosnapshot.id;


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
-- Name: django_apscheduler_djangojobexecution id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_apscheduler_djangojobexecution ALTER COLUMN id SET DEFAULT nextval('public.django_apscheduler_djangojobexecution_id_seq'::regclass);


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
-- Name: holdings_portfoliosnapshot id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holdings_portfoliosnapshot ALTER COLUMN id SET DEFAULT nextval('public.holdings_portfoliosnapshot_id_seq'::regclass);


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
1	pbkdf2_sha256$320000$vDsdkxwqBwmWETrJJOcZvn$oUO74gE/bP7OkFCy3jBqPue4ubX9h1sFRA23RghMrL4=	2022-04-14 10:24:38.251101+00	t	admin				t	t	2022-02-03 21:18:55.095014+00	EUR
7	pbkdf2_sha256$320000$uTqJdcQvh9KXhlnBX8HeiV$4C2QnVjxva2n5iEApLsadmNqhiplHC1RV6eE52TmdbA=	\N	f	gokay	Goekay	Ersenguen		f	t	2022-04-15 19:24:10.801551+00	EUR
2	pbkdf2_sha256$320000$AdBzo0qZGoWmpHEK757j9Q$NLfQeezcc5cyzLUTTIxki+YaNfOqgOb5Mc81mN3qYS8=	2022-05-04 12:07:52.182971+00	f	berkay	Berkay	Ersengun	berkayersengun@gmail.com	f	t	2022-02-03 22:14:31.288591+00	EUR
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
53	Can add portfolio snapshot	14	add_portfoliosnapshot
54	Can change portfolio snapshot	14	change_portfoliosnapshot
55	Can delete portfolio snapshot	14	delete_portfoliosnapshot
56	Can view portfolio snapshot	14	view_portfoliosnapshot
57	Can add django job	15	add_djangojob
58	Can change django job	15	change_djangojob
59	Can delete django job	15	delete_djangojob
60	Can view django job	15	view_djangojob
61	Can add django job execution	16	add_djangojobexecution
62	Can change django job execution	16	change_djangojobexecution
63	Can delete django job execution	16	delete_djangojobexecution
64	Can view django job execution	16	view_djangojobexecution
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
-- Data for Name: django_apscheduler_djangojob; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_apscheduler_djangojob (id, next_run_time, job_state) FROM stdin;
delete_old_job_executions	2022-05-09 23:00:00+00	\\x80059566040000000000007d94288c0776657273696f6e944b018c026964948c1964656c6574655f6f6c645f6a6f625f657865637574696f6e73948c0466756e63948c407363686564756c65722e6d616e6167656d656e742e636f6d6d616e64732e7363686564756c653a64656c6574655f6f6c645f6a6f625f657865637574696f6e73948c0774726967676572948c1961707363686564756c65722e74726967676572732e63726f6e948c0b43726f6e547269676765729493942981947d942868014b028c0874696d657a6f6e65948c1b7079747a5f6465707265636174696f6e5f7368696d2e5f696d706c948c09777261705f7a6f6e659493948c086461746574696d65948c0874696d657a6f6e6594939468108c0974696d6564656c74619493944b004b004b0087945294859452948c0355544394869452948c0a73746172745f64617465944e8c08656e645f64617465944e8c066669656c6473945d94288c2061707363686564756c65722e74726967676572732e63726f6e2e6669656c6473948c09426173654669656c649493942981947d94288c046e616d65948c0479656172948c0a69735f64656661756c7494888c0b65787072657373696f6e73945d948c2561707363686564756c65722e74726967676572732e63726f6e2e65787072657373696f6e73948c0d416c6c45787072657373696f6e9493942981947d948c0473746570944e736261756268208c0a4d6f6e74684669656c649493942981947d942868258c056d6f6e74689468278868285d94682c2981947d94682f4e736261756268208c0f4461794f664d6f6e74684669656c649493942981947d942868258c036461799468278868285d94682c2981947d94682f4e736261756268208c095765656b4669656c649493942981947d942868258c047765656b9468278868285d94682c2981947d94682f4e736261756268208c0e4461794f665765656b4669656c649493942981947d942868258c0b6461795f6f665f7765656b9468278968285d94682a8c165765656b64617952616e676545787072657373696f6e9493942981947d9428682f4e8c056669727374944b008c046c617374944b00756261756268222981947d942868258c04686f75729468278968285d94682a8c0f52616e676545787072657373696f6e9493942981947d9428682f4e68524b1768534b17756261756268222981947d942868258c066d696e7574659468278968285d9468592981947d9428682f4e68524b0068534b00756261756268222981947d942868258c067365636f6e649468278868285d9468592981947d9428682f4e68524b0068534b007562617562658c066a6974746572944e75628c086578656375746f72948c0764656661756c74948c046172677394298c066b7761726773947d94682568038c126d6973666972655f67726163655f74696d65944b018c08636f616c6573636594888c0d6d61785f696e7374616e636573944b018c0d6e6578745f72756e5f74696d659468108c086461746574696d65949394430a07e6050917000000000094681b86945294752e
createSnapshots	2022-05-06 23:00:00+00	\\x8005955a040000000000007d94288c0776657273696f6e944b018c026964948c0f637265617465536e617073686f7473948c0466756e63948c207363686564756c65722e7461736b733a6372656174655f736e617073686f7473948c0774726967676572948c1961707363686564756c65722e74726967676572732e63726f6e948c0b43726f6e547269676765729493942981947d942868014b028c0874696d657a6f6e65948c1b7079747a5f6465707265636174696f6e5f7368696d2e5f696d706c948c09777261705f7a6f6e659493948c086461746574696d65948c0874696d657a6f6e6594939468108c0974696d6564656c74619493944b004b004b0087945294859452948c0355544394869452948c0a73746172745f64617465944e8c08656e645f64617465944e8c066669656c6473945d94288c2061707363686564756c65722e74726967676572732e63726f6e2e6669656c6473948c09426173654669656c649493942981947d94288c046e616d65948c0479656172948c0a69735f64656661756c7494888c0b65787072657373696f6e73945d948c2561707363686564756c65722e74726967676572732e63726f6e2e65787072657373696f6e73948c0d416c6c45787072657373696f6e9493942981947d948c0473746570944e736261756268208c0a4d6f6e74684669656c649493942981947d942868258c056d6f6e74689468278868285d94682c2981947d94682f4e736261756268208c0f4461794f664d6f6e74684669656c649493942981947d942868258c036461799468278868285d94682c2981947d94682f4e736261756268208c095765656b4669656c649493942981947d942868258c047765656b9468278868285d94682c2981947d94682f4e736261756268208c0e4461794f665765656b4669656c649493942981947d942868258c0b6461795f6f665f7765656b9468278868285d94682c2981947d94682f4e736261756268222981947d942868258c04686f75729468278968285d94682a8c0f52616e676545787072657373696f6e9493942981947d9428682f4e8c056669727374944b178c046c617374944b17756261756268222981947d942868258c066d696e7574659468278968285d9468552981947d9428682f4e68584b0068594b00756261756268222981947d942868258c067365636f6e649468278868285d9468552981947d9428682f4e68584b0068594b007562617562658c066a6974746572944e75628c086578656375746f72948c0764656661756c74948c0461726773948c106163636f756e74732e63686f69636573948c0c536e617073686f74486f6f6b9493948c056461696c79948594529485948c066b7761726773947d9468258c106372656174655f736e617073686f7473948c126d6973666972655f67726163655f74696d65944b018c08636f616c6573636594888c0d6d61785f696e7374616e636573944b018c0d6e6578745f72756e5f74696d659468108c086461746574696d65949394430a07e6050617000000000094681b86945294752e
\.


--
-- Data for Name: django_apscheduler_djangojobexecution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_apscheduler_djangojobexecution (id, status, run_time, duration, finished, exception, traceback, job_id) FROM stdin;
1	Executed	2022-05-04 23:00:00+00	3.25	1651705203.25	\N	\N	createSnapshots
2	Executed	2022-05-05 23:00:00+00	3.17	1651791603.17	\N	\N	createSnapshots
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
14	holdings	portfoliosnapshot
15	django_apscheduler	djangojob
16	django_apscheduler	djangojobexecution
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
108	django_apscheduler	0001_initial	2022-05-04 01:58:19.31351+00
109	django_apscheduler	0002_auto_20180412_0758	2022-05-04 01:58:19.336637+00
110	django_apscheduler	0003_auto_20200716_1632	2022-05-04 01:58:19.464414+00
111	django_apscheduler	0004_auto_20200717_1043	2022-05-04 01:58:19.63364+00
112	django_apscheduler	0005_migrate_name_to_id	2022-05-04 01:58:19.711175+00
113	django_apscheduler	0006_remove_djangojob_name	2022-05-04 01:58:19.733601+00
114	django_apscheduler	0007_auto_20200717_1404	2022-05-04 01:58:19.799493+00
115	django_apscheduler	0008_remove_djangojobexecution_started	2022-05-04 01:58:19.821642+00
116	django_apscheduler	0009_djangojobexecution_unique_job_executions	2022-05-04 01:58:19.85229+00
117	holdings	0002_portfoliosnapshot	2022-05-04 01:58:19.948978+00
118	holdings	0003_alter_portfoliosnapshot_date	2022-05-04 01:58:19.986722+00
119	holdings	0004_portfoliosnapshot_snapshot_hook	2022-05-04 01:58:20.031217+00
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
mjcb388ie4a0410yaewm2216dx43h0bq	.eJxVjEEOwiAQRe_C2hCBoYBL9z0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnERWpx-N8L0yG0HfMd2m2Wa27pMJHdFHrTLceb8vB7u30HFXr91YWuIlTIIIWX0YMmxMxCAITityWZfbILi2aezB8xWDRjMkLx2FLR4fwDqgTe8:1nmDnM:q-ERcw6-e1qBkcnnkPZUef_NU9kwHaVlEDTNASWPaoY	2022-05-18 12:07:52.191135+00
\.


--
-- Data for Name: holdings_capital; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.holdings_capital (user_id, crypto, stock) FROM stdin;
5	1000.00000000	2000.00000000
6	0.00000000	1990.00000000
7	0.00000000	0.00000000
2	8550.00000000	6250.00000000
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
137	5.00000000	2	TWTR	2022-05-03 09:53:00+00	stock	49.20910000	USD
138	6.00000000	2	VUSA.AS	2022-05-03 09:55:00+00	stock	74.87300000	EUR
136	0.01321524	2	BTC-EUR	2022-04-15 22:15:09.128818+00	crypto	34051.60000000	EUR
74	2.07115000	2	LUNA1-EUR	2022-02-09 01:56:44.393007+00	crypto	76.94000000	EUR
139	0.20662637	2	ETH-EUR	2022-05-03 10:07:00+00	crypto	2654.89000000	EUR
140	1.00000000	2	VUSA.AS	2022-05-05 13:39:25.471596+00	stock	76.37100000	EUR
\.


--
-- Data for Name: holdings_portfoliosnapshot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.holdings_portfoliosnapshot (id, date, portfolio, user_id, snapshot_hook) FROM stdin;
1	2022-05-04 23:00:00.880664+00	"{'holdings_data': [{'symbol': 'IBM', 'type': 'stock', 'name': 'International Business Machines', 'exchange': 'NYSE', 'entities': [HoldingData(symbol='IBM', name='International Business Machines', exchange='NYSE', quantity=Decimal('13.00000000'), price=Price(purchase=Decimal('123.00000000'), current=Decimal('129.5269870514491908581171837')), change_24H=Change(value=Decimal('59.80476870477161643154058414'), percentage=3.68246), gain=Change(value=Decimal('84.85083166883948115552338810'), percentage=Decimal('5.306493537763569803347303821')), value=Price(purchase=Decimal('1599.0000000000000000'), current=Decimal('1683.850831668839481155523388')), date='03-Mar-22, 01:57', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='IBM', name='International Business Machines', exchange='NYSE', quantity=Decimal('13.00000000'), price=Price(purchase=Decimal('123.00000000'), current=Decimal('129.5269870514491908581171837')), change_24H=Change(value=Decimal('59.80476870477161643154058414'), percentage=3.68246), gain=Change(value=Decimal('84.85083166883948115552338810'), percentage=Decimal('5.306493537763569803347303821')), value=Price(purchase=Decimal('1599.0000000000000000'), current=Decimal('1683.850831668839481155523388')), date='03-Mar-22, 01:57', type='stock', currency=Currency.EUR)}, {'symbol': 'SOL-CAD', 'type': 'crypto', 'name': 'Solana CAD', 'exchange': 'CCC', 'entities': [HoldingData(symbol='SOL-CAD', name='Solana CAD', exchange='CCC', quantity=Decimal('11.00000000'), price=Price(purchase=Decimal('123.00000000'), current=Decimal('110.7151058633303770951084104')), change_24H=Change(value=Decimal('76.43825050707836442957295559'), percentage=6.696719), gain=Change(value=Decimal('-135.1338355033658519538074856'), percentage=Decimal('-9.987718810300506426741129756')), value=Price(purchase=Decimal('1353.0000000000000000'), current=Decimal('1217.866164496634148046192514')), date='03-Mar-22, 01:58', type='crypto', currency=Currency.EUR)], 'average': HoldingData(symbol='SOL-CAD', name='Solana CAD', exchange='CCC', quantity=Decimal('11.00000000'), price=Price(purchase=Decimal('123.00000000'), current=Decimal('110.7151058633303770951084104')), change_24H=Change(value=Decimal('76.43825050707836442957295559'), percentage=6.696719), gain=Change(value=Decimal('-135.1338355033658519538074856'), percentage=Decimal('-9.987718810300506426741129756')), value=Price(purchase=Decimal('1353.0000000000000000'), current=Decimal('1217.866164496634148046192514')), date='03-Mar-22, 01:58', type='crypto', currency=Currency.EUR)}, {'symbol': 'AAPL', 'type': 'stock', 'name': 'Apple Inc.', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='AAPL', name='Apple Inc.', exchange='NasdaqGS', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('141.4050076980886304579561091'), current=Decimal('156.5070625202445058363987195')), change_24H=Change(value=Decimal('12.33053269717420082117174275'), percentage=4.100833), gain=Change(value=Decimal('30.20410964431175075688522080'), percentage=Decimal('10.68000000000000682121026332')), value=Price(purchase=Decimal('282.8100153961772609159122182'), current=Decimal('313.0141250404890116727974390')), date='10-Mar-22, 02:28', type='stock', currency=Currency.EUR), HoldingData(symbol='AAPL', name='Apple Inc.', exchange='NasdaqGS', quantity=Decimal('100.00000000'), price=Price(purchase=Decimal('5.00000000'), current=Decimal('156.5070625202445058363987195')), change_24H=Change(value=Decimal('616.5266348587100410585871374'), percentage=4.100833), gain=Change(value=Decimal('15150.70625202445058363987195'), percentage=Decimal('3030.141250404890116727974390')), value=Price(purchase=Decimal('500.0000000000000000'), current=Decimal('15650.70625202445058363987195')), date='11-Mar-22, 17:47', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='AAPL', name='Apple Inc.', exchange='NasdaqGS', quantity=Decimal('102.00000000'), price=Price(purchase=Decimal('7.674607994080169224665806061'), current=Decimal('156.5070625202445058363987195')), change_24H=Change(value=Decimal('628.8571675558842418797588802'), percentage=4.100833), gain=Change(value=Decimal('15180.91036166876233439675717'), percentage=Decimal('1939.284125534055616863669661')), value=Price(purchase=Decimal('495.7413728509054364885472984'), current=Decimal('15963.72037706493959531266939')), date='10-Mar-22, 02:28', type='stock', currency=Currency.EUR)}, {'symbol': 'TSLA', 'type': 'stock', 'name': 'Tesla, Inc.', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='TSLA', name='Tesla, Inc.', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('900.00000000'), current=Decimal('898.0349228890212785992911678')), change_24H=Change(value=Decimal('40.88489651227377220756354621'), percentage=4.7698646), gain=Change(value=Decimal('-1.965077110978721400708832200'), percentage=Decimal('-0.2183419012198579334120924667')), value=Price(purchase=Decimal('900.0000000000000000'), current=Decimal('898.0349228890212785992911678')), date='10-Mar-22, 02:28', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='TSLA', name='Tesla, Inc.', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('900.00000000'), current=Decimal('898.0349228890212785992911678')), change_24H=Change(value=Decimal('40.88489651227377220756354621'), percentage=4.7698646), gain=Change(value=Decimal('-1.965077110978721400708832200'), percentage=Decimal('-0.2183419012198579334120924667')), value=Price(purchase=Decimal('900.0000000000000000'), current=Decimal('898.0349228890212785992911678')), date='10-Mar-22, 02:28', type='stock', currency=Currency.EUR)}, {'symbol': 'ERIC', 'type': 'stock', 'name': 'Ericsson', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='ERIC', name='Ericsson', exchange='NasdaqGS', quantity=Decimal('100.00000000'), price=Price(purchase=Decimal('10.00000000'), current=Decimal('7.937534432119375056057068911')), change_24H=Change(value=Decimal('20.73942658195438457975556625'), percentage=2.6829302), gain=Change(value=Decimal('-206.2465567880624943942931089'), percentage=Decimal('-20.62465567880624943942931089')), value=Price(purchase=Decimal('1000.0000000000000000'), current=Decimal('793.7534432119375056057068911')), date='11-Mar-22, 17:48', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='ERIC', name='Ericsson', exchange='NasdaqGS', quantity=Decimal('100.00000000'), price=Price(purchase=Decimal('10.00000000'), current=Decimal('7.937534432119375056057068911')), change_24H=Change(value=Decimal('20.73942658195438457975556625'), percentage=2.6829302), gain=Change(value=Decimal('-206.2465567880624943942931089'), percentage=Decimal('-20.62465567880624943942931089')), value=Price(purchase=Decimal('1000.0000000000000000'), current=Decimal('793.7534432119375056057068911')), date='11-Mar-22, 17:48', type='stock', currency=Currency.EUR)}, {'symbol': 'BTC-USD', 'type': 'crypto', 'name': 'Bitcoin USD', 'exchange': 'CCC', 'entities': [HoldingData(symbol='BTC-USD', name='Bitcoin USD', exchange='CCC', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('100.00000000'), current=Decimal('37435.83512100686782187699299')), change_24H=Change(value=Decimal('1825.144600760872313399593371'), percentage=5.12527), gain=Change(value=Decimal('37335.83512100686782187699299'), percentage=Decimal('37335.83512100686782187699299')), value=Price(purchase=Decimal('100.0000000000000000'), current=Decimal('37435.83512100686782187699299')), date='04-Apr-22, 15:28', type='crypto', currency=Currency.EUR)], 'average': HoldingData(symbol='BTC-USD', name='Bitcoin USD', exchange='CCC', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('100.00000000'), current=Decimal('37435.83512100686782187699299')), change_24H=Change(value=Decimal('1825.144600760872313399593371'), percentage=5.12527), gain=Change(value=Decimal('37335.83512100686782187699299'), percentage=Decimal('37335.83512100686782187699299')), value=Price(purchase=Decimal('100.0000000000000000'), current=Decimal('37435.83512100686782187699299')), date='04-Apr-22, 15:28', type='crypto', currency=Currency.EUR)}, {'symbol': 'HP', 'type': 'stock', 'name': 'Helmerich & Payne, Inc.', 'exchange': 'NYSE', 'entities': [HoldingData(symbol='HP', name='Helmerich & Payne, Inc.', exchange='NYSE', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('1.00000000'), current=Decimal('47.63463359322945771866269216')), change_24H=Change(value=Decimal('2.686695146263684062429750256'), percentage=5.97735), gain=Change(value=Decimal('46.63463359322945771866269216'), percentage=Decimal('4663.463359322945771866269216')), value=Price(purchase=Decimal('1.0000000000000000'), current=Decimal('47.63463359322945771866269216')), date='15-Apr-22, 19:30', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='HP', name='Helmerich & Payne, Inc.', exchange='NYSE', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('1.00000000'), current=Decimal('47.63463359322945771866269216')), change_24H=Change(value=Decimal('2.686695146263684062429750256'), percentage=5.97735), gain=Change(value=Decimal('46.63463359322945771866269216'), percentage=Decimal('4663.463359322945771866269216')), value=Price(purchase=Decimal('1.0000000000000000'), current=Decimal('47.63463359322945771866269216')), date='15-Apr-22, 19:30', type='stock', currency=Currency.EUR)}, {'symbol': 'GE=F', 'type': 'stock', 'name': 'Eurodollar Futures,Jun-2022', 'exchange': 'CME', 'entities': [HoldingData(symbol='GE=F', name='Eurodollar Futures,Jun-2022', exchange='CME', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('2.00000000'), current=Decimal('92.53072353737259788906375680')), change_24H=Change(value=Decimal('0.004710911036641997447488818633'), percentage=0.005091445), gain=Change(value=Decimal('90.53072353737259788906375680'), percentage=Decimal('4526.536176868629894453187840')), value=Price(purchase=Decimal('2.0000000000000000'), current=Decimal('92.53072353737259788906375680')), date='15-Apr-22, 19:31', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='GE=F', name='Eurodollar Futures,Jun-2022', exchange='CME', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('2.00000000'), current=Decimal('92.53072353737259788906375680')), change_24H=Change(value=Decimal('0.004710911036641997447488818633'), percentage=0.005091445), gain=Change(value=Decimal('90.53072353737259788906375680'), percentage=Decimal('4526.536176868629894453187840')), value=Price(purchase=Decimal('2.0000000000000000'), current=Decimal('92.53072353737259788906375680')), date='15-Apr-22, 19:31', type='stock', currency=Currency.EUR)}, {'symbol': 'TT', 'type': 'stock', 'name': 'Trane Technologies plc', 'exchange': 'NYSE', 'entities': [HoldingData(symbol='TT', name='Trane Technologies plc', exchange='NYSE', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('44.00000000'), current=Decimal('133.1186742469806442152010239')), change_24H=Change(value=Decimal('3.224053029517447242792333722'), percentage=1.22581), gain=Change(value=Decimal('178.2373484939612884304020478'), percentage=Decimal('202.5424414704105550345477816')), value=Price(purchase=Decimal('88.0000000000000000'), current=Decimal('266.2373484939612884304020478')), date='15-Apr-22, 19:32', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='TT', name='Trane Technologies plc', exchange='NYSE', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('44.00000000'), current=Decimal('133.1186742469806442152010239')), change_24H=Change(value=Decimal('3.224053029517447242792333722'), percentage=1.22581), gain=Change(value=Decimal('178.2373484939612884304020478'), percentage=Decimal('202.5424414704105550345477816')), value=Price(purchase=Decimal('88.0000000000000000'), current=Decimal('266.2373484939612884304020478')), date='15-Apr-22, 19:32', type='stock', currency=Currency.EUR)}], 'overview': Overview(capital=Sum(crypto=Decimal('1000.00000000'), stock=Decimal('2000.00000000'), total=Decimal('3000.00000000')), current=Sum(crypto=Decimal('38653.70128550350196992318550'), stock=Decimal('19745.76228045930120471131934'), total=Decimal('58399.46356596280317463450484')), purchase=Sum(crypto=Decimal('1453.0000000000000000'), stock=Decimal('4372.810015396177260915912218'), total=Decimal('5825.810015396177260915912218')), change_purchase=ChangeOverview(crypto=Change(value=Decimal('37200.70128550350196992318550'), percentage=Decimal('2560.268498658190087400081590')), stock=Change(value=Decimal('15372.95226506312394379540712'), percentage=Decimal('351.5577445838412922854912998')), total=Change(value=Decimal('52573.65355056662591371859262'), percentage=Decimal('902.4265022653921424738442918'))), change_capital=ChangeOverview(crypto=Change(value=Decimal('37653.70128550350196992318550'), percentage=Decimal('3765.370128550350196992318550')), stock=Change(value=Decimal('17745.76228045930120471131934'), percentage=Decimal('887.2881140229650602355659670')), total=Change(value=Decimal('55399.46356596280317463450484'), percentage=Decimal('1846.648785532093439154483495'))), change_daily=ChangeOverview(crypto=Change(value=Decimal('1901.582851267950677829166327'), percentage=Decimal('5.174076848578548725076199910')), stock=Change(value=Decimal('756.2017184417017884012881496'), percentage=Decimal('3.982197039115459153014646176')), total=Change(value=Decimal('2657.784569709652466230454476'), percentage=Decimal('4.768038239193160423493320677')))), 'user': 'demo', 'currency': 'EUR'}"	5	daily
2	2022-05-04 23:00:01.547556+00	"{'holdings_data': [{'symbol': 'INTC', 'type': 'stock', 'name': 'Intel Corporation', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='INTC', name='Intel Corporation', exchange='NasdaqGS', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('42.40000000'), current=Decimal('43.87326038846029827296077396')), change_24H=Change(value=Decimal('2.790391209208897488519333848'), percentage=3.2845085), gain=Change(value=Decimal('2.946520776920596545921547920'), percentage=Decimal('3.474670727500703473964089528')), value=Price(purchase=Decimal('84.8000000000000000'), current=Decimal('87.74652077692059654592154792')), date='27-Mar-22, 03:45', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='INTC', name='Intel Corporation', exchange='NasdaqGS', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('42.40000000'), current=Decimal('43.87326038846029827296077396')), change_24H=Change(value=Decimal('2.790391209208897488519333848'), percentage=3.2845085), gain=Change(value=Decimal('2.946520776920596545921547920'), percentage=Decimal('3.474670727500703473964089528')), value=Price(purchase=Decimal('84.8000000000000000'), current=Decimal('87.74652077692059654592154792')), date='27-Mar-22, 03:45', type='stock', currency=Currency.EUR)}, {'symbol': 'VWRL.AS', 'type': 'stock', 'name': 'Vanguard FTSE All-World UCITS E', 'exchange': 'Amsterdam', 'entities': [HoldingData(symbol='VWRL.AS', name='Vanguard FTSE All-World UCITS E', exchange='Amsterdam', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('103.14000000'), current=Decimal('101.659999999999996589394868351519107818603515625')), change_24H=Change(value=Decimal('-1.379997300000000093334051599'), percentage=-1.339283), gain=Change(value=Decimal('-1.480000000000003410605131648'), percentage=Decimal('-1.434942796199344008730978910')), value=Price(purchase=Decimal('103.1400000000000000'), current=Decimal('101.6599999999999965893948684')), date='08-Feb-22, 03:46', type='stock', currency=Currency.EUR), HoldingData(symbol='VWRL.AS', name='Vanguard FTSE All-World UCITS E', exchange='Amsterdam', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('108.78000000'), current=Decimal('101.659999999999996589394868351519107818603515625')), change_24H=Change(value=Decimal('-1.379997300000000093334051599'), percentage=-1.339283), gain=Change(value=Decimal('-7.120000000000003410605131648'), percentage=Decimal('-6.545320831035119884726173605')), value=Price(purchase=Decimal('108.7800000000000000'), current=Decimal('101.6599999999999965893948684')), date='12-Jan-22, 03:48', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='VWRL.AS', name='Vanguard FTSE All-World UCITS E', exchange='Amsterdam', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('105.96000000'), current=Decimal('101.659999999999996589394868351519107818603515625')), change_24H=Change(value=Decimal('-2.759994600000000186668103198'), percentage=-1.339283), gain=Change(value=Decimal('-8.600000000000006821210263296'), percentage=Decimal('-4.058135145337866563425001555')), value=Price(purchase=Decimal('105.9600000000000000'), current=Decimal('203.3199999999999931787897368')), date='08-Feb-22, 03:46', type='stock', currency=Currency.EUR)}, {'symbol': 'IUSA.AS', 'type': 'stock', 'name': 'iShares Core S&P 500 UCITS ETF ', 'exchange': 'Amsterdam', 'entities': [HoldingData(symbol='IUSA.AS', name='iShares Core S&P 500 UCITS ETF ', exchange='Amsterdam', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('41.30000000'), current=Decimal('39.1779999999999972715158946812152862548828125')), change_24H=Change(value=Decimal('-0.500000000'), percentage=-1.2601441), gain=Change(value=Decimal('-2.122000000000002728484105319'), percentage=Decimal('-5.138014527845042926111635155')), value=Price(purchase=Decimal('41.3000000000000000'), current=Decimal('39.17799999999999727151589468')), date='12-Jan-22, 03:48', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='IUSA.AS', name='iShares Core S&P 500 UCITS ETF ', exchange='Amsterdam', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('41.30000000'), current=Decimal('39.1779999999999972715158946812152862548828125')), change_24H=Change(value=Decimal('-0.500000000'), percentage=-1.2601441), gain=Change(value=Decimal('-2.122000000000002728484105319'), percentage=Decimal('-5.138014527845042926111635155')), value=Price(purchase=Decimal('41.3000000000000000'), current=Decimal('39.17799999999999727151589468')), date='12-Jan-22, 03:48', type='stock', currency=Currency.EUR)}, {'symbol': 'NVDA', 'type': 'stock', 'name': 'NVIDIA Corporation', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='NVDA', name='NVIDIA Corporation', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('247.26000000'), current=Decimal('191.6886284355289506639829341')), change_24H=Change(value=Decimal('6.900556834066314652689038431'), percentage=3.734309), gain=Change(value=Decimal('-55.57137156447104933601706590'), percentage=Decimal('-22.47487323646002157082304695')), value=Price(purchase=Decimal('247.2600000000000000'), current=Decimal('191.6886284355289506639829341')), date='12-Jan-22, 03:49', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='NVDA', name='NVIDIA Corporation', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('247.26000000'), current=Decimal('191.6886284355289506639829341')), change_24H=Change(value=Decimal('6.900556834066314652689038431'), percentage=3.734309), gain=Change(value=Decimal('-55.57137156447104933601706590'), percentage=Decimal('-22.47487323646002157082304695')), value=Price(purchase=Decimal('247.2600000000000000'), current=Decimal('191.6886284355289506639829341')), date='12-Jan-22, 03:49', type='stock', currency=Currency.EUR)}, {'symbol': 'EQQQ.PA', 'type': 'stock', 'name': 'Invesco EQQQ Nasdaq-100 UCITS E', 'exchange': 'Paris', 'entities': [HoldingData(symbol='EQQQ.PA', name='Invesco EQQQ Nasdaq-100 UCITS E', exchange='Paris', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('344.60000000'), current=Decimal('298.8500000000000227373675443232059478759765625')), change_24H=Change(value=Decimal('-6.00000000'), percentage=-1.9681809), gain=Change(value=Decimal('-45.74999999999997726263245568'), percentage=Decimal('-13.27626233313986571753698656')), value=Price(purchase=Decimal('344.6000000000000000'), current=Decimal('298.8500000000000227373675443')), date='12-Jan-22, 03:49', type='stock', currency=Currency.EUR), HoldingData(symbol='EQQQ.PA', name='Invesco EQQQ Nasdaq-100 UCITS E', exchange='Paris', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('351.00000000'), current=Decimal('298.8500000000000227373675443232059478759765625')), change_24H=Change(value=Decimal('-6.00000000'), percentage=-1.9681809), gain=Change(value=Decimal('-52.14999999999997726263245568'), percentage=Decimal('-14.85754985754985107197505860')), value=Price(purchase=Decimal('351.0000000000000000'), current=Decimal('298.8500000000000227373675443')), date='05-Jan-22, 03:51', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='EQQQ.PA', name='Invesco EQQQ Nasdaq-100 UCITS E', exchange='Paris', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('347.80000000'), current=Decimal('298.8500000000000227373675443232059478759765625')), change_24H=Change(value=Decimal('-12.00000000'), percentage=-1.9681809), gain=Change(value=Decimal('-97.89999999999995452526491136'), percentage=Decimal('-14.07418056354225913244176414')), value=Price(purchase=Decimal('347.8000000000000000'), current=Decimal('597.7000000000000454747350886')), date='12-Jan-22, 03:49', type='stock', currency=Currency.EUR)}, {'symbol': 'VUSA.AS', 'type': 'stock', 'name': 'Vanguard S&P 500 UCITS ETF', 'exchange': 'Amsterdam', 'entities': [HoldingData(symbol='VUSA.AS', name='Vanguard S&P 500 UCITS ETF', exchange='Amsterdam', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('77.90000000'), current=Decimal('74.576999999999998181010596454143524169921875')), change_24H=Change(value=Decimal('-1.973999000000000059173999034'), percentage=-1.3061768), gain=Change(value=Decimal('-6.646000000000003637978807092'), percentage=Decimal('-4.265725288831838021809247171')), value=Price(purchase=Decimal('155.8000000000000000'), current=Decimal('149.1539999999999963620211929')), date='11-Jan-22, 03:50', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='VUSA.AS', name='Vanguard S&P 500 UCITS ETF', exchange='Amsterdam', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('77.90000000'), current=Decimal('74.576999999999998181010596454143524169921875')), change_24H=Change(value=Decimal('-1.973999000000000059173999034'), percentage=-1.3061768), gain=Change(value=Decimal('-6.646000000000003637978807092'), percentage=Decimal('-4.265725288831838021809247171')), value=Price(purchase=Decimal('155.8000000000000000'), current=Decimal('149.1539999999999963620211929')), date='11-Jan-22, 03:50', type='stock', currency=Currency.EUR)}, {'symbol': 'MSFT', 'type': 'stock', 'name': 'Microsoft Corporation', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='MSFT', name='Microsoft Corporation', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('292.90000000'), current=Decimal('273.3641608819449575489347908')), change_24H=Change(value=Decimal('7.730151733229460215616039866'), percentage=2.9100761), gain=Change(value=Decimal('-19.53583911805504245106520920'), percentage=Decimal('-6.669798264955630744645001434')), value=Price(purchase=Decimal('292.9000000000000000'), current=Decimal('273.3641608819449575489347908')), date='04-Jan-22, 03:51', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='MSFT', name='Microsoft Corporation', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('292.90000000'), current=Decimal('273.3641608819449575489347908')), change_24H=Change(value=Decimal('7.730151733229460215616039866'), percentage=2.9100761), gain=Change(value=Decimal('-19.53583911805504245106520920'), percentage=Decimal('-6.669798264955630744645001434')), value=Price(purchase=Decimal('292.9000000000000000'), current=Decimal('273.3641608819449575489347908')), date='04-Jan-22, 03:51', type='stock', currency=Currency.EUR)}, {'symbol': 'AAPL', 'type': 'stock', 'name': 'Apple Inc.', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='AAPL', name='Apple Inc.', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('154.74000000'), current=Decimal('156.5070625202445058363987195')), change_24H=Change(value=Decimal('6.165266348587100410585871374'), percentage=4.100833), gain=Change(value=Decimal('1.767062520244505836398719500'), percentage=Decimal('1.141955874527921569341294752')), value=Price(purchase=Decimal('154.7400000000000000'), current=Decimal('156.5070625202445058363987195')), date='11-Jan-22, 03:42', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='AAPL', name='Apple Inc.', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('154.74000000'), current=Decimal('156.5070625202445058363987195')), change_24H=Change(value=Decimal('6.165266348587100410585871374'), percentage=4.100833), gain=Change(value=Decimal('1.767062520244505836398719500'), percentage=Decimal('1.141955874527921569341294752')), value=Price(purchase=Decimal('154.7400000000000000'), current=Decimal('156.5070625202445058363987195')), date='11-Jan-22, 03:42', type='stock', currency=Currency.EUR)}], 'overview': Overview(capital=Sum(crypto=Decimal('0E-8'), stock=Decimal('1990.00000000'), total=Decimal('1990.00000000')), current=Sum(crypto=Decimal('0'), stock=Decimal('1698.658372614639042882299906'), total=Decimal('1698.658372614639042882299906')), purchase=Sum(crypto=Decimal('0'), stock=Decimal('1884.3200000000000000'), total=Decimal('1884.3200000000000000')), change_purchase=ChangeOverview(crypto=Change(value=0, percentage=0), stock=Change(value=Decimal('-185.661627385360957117700094'), percentage=Decimal('-9.852977593262341699801524900')), total=Change(value=Decimal('-185.661627385360957117700094'), percentage=Decimal('-9.852977593262341699801524900'))), change_capital=ChangeOverview(crypto=Change(value=0, percentage=0), stock=Change(value=Decimal('-291.341627385360957117700094'), percentage=Decimal('-14.64028278318396769435678864')), total=Change(value=Decimal('-291.341627385360957117700094'), percentage=Decimal('-14.64028278318396769435678864'))), change_daily=ChangeOverview(crypto=Change(value=0, percentage=0), stock=Change(value=Decimal('6.352372525091772521568181287'), percentage=Decimal('0.3753678427397669726741355207')), total=Change(value=Decimal('6.352372525091772521568181287'), percentage=Decimal('0.3753678427397669726741355207')))), 'user': 'sevim', 'currency': 'EUR'}"	6	daily
3	2022-05-04 23:00:01.722988+00	"{'holdings_data': [{'symbol': 'IBM', 'type': 'stock', 'name': 'International Business Machines', 'exchange': 'NYSE', 'entities': [HoldingData(symbol='IBM', name='International Business Machines', exchange='NYSE', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('123.00000000'), current=Decimal('129.5269870514491908581171837')), change_24H=Change(value=Decimal('4.600366823443970494733891088'), percentage=3.68246), gain=Change(value=Decimal('6.526987051449190858117183700'), percentage=Decimal('5.306493537763569803347303821')), value=Price(purchase=Decimal('123.0000000000000000'), current=Decimal('129.5269870514491908581171837')), date='06-Mar-22, 21:47', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='IBM', name='International Business Machines', exchange='NYSE', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('123.00000000'), current=Decimal('129.5269870514491908581171837')), change_24H=Change(value=Decimal('4.600366823443970494733891088'), percentage=3.68246), gain=Change(value=Decimal('6.526987051449190858117183700'), percentage=Decimal('5.306493537763569803347303821')), value=Price(purchase=Decimal('123.0000000000000000'), current=Decimal('129.5269870514491908581171837')), date='06-Mar-22, 21:47', type='stock', currency=Currency.EUR)}], 'overview': Overview(capital=Sum(crypto=Decimal('0'), stock=Decimal('0'), total=Decimal('0')), current=Sum(crypto=Decimal('0'), stock=Decimal('129.5269870514491908581171837'), total=Decimal('129.5269870514491908581171837')), purchase=Sum(crypto=Decimal('0'), stock=Decimal('123.0000000000000000'), total=Decimal('123.0000000000000000')), change_purchase=ChangeOverview(crypto=Change(value=0, percentage=0), stock=Change(value=Decimal('6.5269870514491908581171837'), percentage=Decimal('5.306493537763569803347303821')), total=Change(value=Decimal('6.5269870514491908581171837'), percentage=Decimal('5.306493537763569803347303821'))), change_capital=ChangeOverview(crypto=Change(value=0, percentage=0), stock=Change(value=Decimal('129.5269870514491908581171837'), percentage=0), total=Change(value=Decimal('129.5269870514491908581171837'), percentage=0)), change_daily=ChangeOverview(crypto=Change(value=0, percentage=0), stock=Change(value=Decimal('4.600366823443970494733891088'), percentage=Decimal('3.682455200539148821893793872')), total=Change(value=Decimal('4.600366823443970494733891088'), percentage=Decimal('3.682455200539148821893793872')))), 'user': 'admin', 'currency': 'EUR'}"	1	daily
4	2022-05-04 23:00:01.916283+00	"{'holdings_data': [{'symbol': 'QQQ', 'type': 'stock', 'name': 'Invesco QQQ Trust, Series 1', 'exchange': 'NasdaqGM', 'entities': [HoldingData(symbol='QQQ', name='Invesco QQQ Trust, Series 1', exchange='NasdaqGM', quantity=Decimal('3.00000000'), price=Price(purchase=Decimal('7.00000000'), current=Decimal('310.7139369152667720941331080')), change_24H=Change(value=Decimal('30.48691683160775507297674518'), percentage=3.3812177), gain=Change(value=Decimal('911.1418107458003162823993240'), percentage=Decimal('4338.770527360953887059044400')), value=Price(purchase=Decimal('21.0000000000000000'), current=Decimal('932.1418107458003162823993240')), date='15-Apr-22, 19:26', type='stock', currency=Currency.EUR), HoldingData(symbol='QQQ', name='Invesco QQQ Trust, Series 1', exchange='NasdaqGM', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('9.00000000'), current=Decimal('310.7139369152667720941331080')), change_24H=Change(value=Decimal('10.16230561053591835765891506'), percentage=3.3812177), gain=Change(value=Decimal('301.7139369152667720941331080'), percentage=Decimal('3352.377076836297467712590089')), value=Price(purchase=Decimal('9.0000000000000000'), current=Decimal('310.7139369152667720941331080')), date='15-Apr-22, 19:27', type='stock', currency=Currency.EUR), HoldingData(symbol='QQQ', name='Invesco QQQ Trust, Series 1', exchange='NasdaqGM', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('94.27000513205908697197073940'), current=Decimal('310.7139369152667720941331080')), change_24H=Change(value=Decimal('10.16230561053591835765891506'), percentage=3.3812177), gain=Change(value=Decimal('216.4439317832076851221623686'), percentage=Decimal('229.6000000000000227373675443')), value=Price(purchase=Decimal('94.27000513205908697197073940'), current=Decimal('310.7139369152667720941331080')), date='15-Apr-22, 19:34', type='stock', currency=Currency.EUR), HoldingData(symbol='QQQ', name='Invesco QQQ Trust, Series 1', exchange='NasdaqGM', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('209.2794113931711730777750415'), current=Decimal('310.7139369152667720941331080')), change_24H=Change(value=Decimal('10.16230561053591835765891506'), percentage=3.3812177), gain=Change(value=Decimal('101.4345255220955990163580665'), percentage=Decimal('48.46846846846847871052592085')), value=Price(purchase=Decimal('209.2794113931711730777750415'), current=Decimal('310.7139369152667720941331080')), date='15-Apr-22, 19:36', type='stock', currency=Currency.EUR), HoldingData(symbol='QQQ', name='Invesco QQQ Trust, Series 1', exchange='NasdaqGM', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('88766.00000000'), current=Decimal('310.7139369152667720941331080')), change_24H=Change(value=Decimal('20.32461122107183671531783012'), percentage=3.3812177), gain=Change(value=Decimal('-176910.5721261694664558117338'), percentage=Decimal('-99.64996289467220921062779318')), value=Price(purchase=Decimal('177532.0000000000000000'), current=Decimal('621.4278738305335441882662160')), date='15-Apr-22, 19:39', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='QQQ', name='Invesco QQQ Trust, Series 1', exchange='NasdaqGM', quantity=Decimal('8.00000000'), price=Price(purchase=Decimal('22233.19367706565378250621822'), current=Decimal('310.7139369152667720941331080')), change_24H=Change(value=Decimal('81.29844488428734686127132048'), percentage=3.3812177), gain=Change(value=Decimal('-175379.8379212030960832966809'), percentage=Decimal('-98.60247726247363429759249246')), value=Price(purchase=Decimal('44429.94367706565378250621822'), current=Decimal('2485.711495322134176753064864')), date='15-Apr-22, 19:26', type='stock', currency=Currency.EUR)}], 'overview': Overview(capital=Sum(crypto=Decimal('0E-8'), stock=Decimal('0E-8'), total=Decimal('0E-8')), current=Sum(crypto=Decimal('0'), stock=Decimal('2485.711495322134176753064864'), total=Decimal('2485.711495322134176753064864')), purchase=Sum(crypto=Decimal('0'), stock=Decimal('177865.5494165252302600497458'), total=Decimal('177865.5494165252302600497458')), change_purchase=ChangeOverview(crypto=Change(value=0, percentage=0), stock=Change(value=Decimal('-175379.8379212030960832966809'), percentage=Decimal('-98.60247726247363429759249245')), total=Change(value=Decimal('-175379.8379212030960832966809'), percentage=Decimal('-98.60247726247363429759249245'))), change_capital=ChangeOverview(crypto=Change(value=0, percentage=0), stock=Change(value=Decimal('2485.711495322134176753064864'), percentage=0), total=Change(value=Decimal('2485.711495322134176753064864'), percentage=0)), change_daily=ChangeOverview(crypto=Change(value=0, percentage=0), stock=Change(value=Decimal('81.29844488428734686127132048'), percentage=Decimal('3.381217918006342187984183836')), total=Change(value=Decimal('81.29844488428734686127132048'), percentage=Decimal('3.381217918006342187984183836')))), 'user': 'gokay', 'currency': 'EUR'}"	7	daily
5	2022-05-04 23:00:03.233159+00	"{'holdings_data': [{'symbol': 'HPQ', 'type': 'stock', 'name': 'HP Inc.', 'exchange': 'NYSE', 'entities': [HoldingData(symbol='HPQ', name='HP Inc.', exchange='NYSE', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('24.43000000'), current=Decimal('37.13295502151807489412221302')), change_24H=Change(value=Decimal('1.385769075441268553369394614'), percentage=3.87659), gain=Change(value=Decimal('12.70295502151807489412221302'), percentage=Decimal('51.99735989160079776554323790')), value=Price(purchase=Decimal('24.4300000000000000'), current=Decimal('37.13295502151807489412221302')), date='07-Feb-22, 01:32', type='stock', currency=Currency.EUR), HoldingData(symbol='HPQ', name='HP Inc.', exchange='NYSE', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('25.00000000'), current=Decimal('37.13295502151807489412221302')), change_24H=Change(value=Decimal('2.771538150882537106738789228'), percentage=3.87659), gain=Change(value=Decimal('24.26591004303614978824442604'), percentage=Decimal('48.53182008607229957648885208')), value=Price(purchase=Decimal('50.0000000000000000'), current=Decimal('74.26591004303614978824442604')), date='06-Feb-22, 22:32', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='HPQ', name='HP Inc.', exchange='NYSE', quantity=Decimal('3.00000000'), price=Price(purchase=Decimal('24.81000000'), current=Decimal('37.13295502151807489412221302')), change_24H=Change(value=Decimal('4.157307226323805660108183842'), percentage=3.87659), gain=Change(value=Decimal('36.96886506455422468236663906'), percentage=Decimal('49.66930681788825027860625965')), value=Price(purchase=Decimal('41.47666666666666666666666667'), current=Decimal('111.3988650645542246823666391')), date='07-Feb-22, 01:32', type='stock', currency=Currency.EUR)}, {'symbol': 'AAPL', 'type': 'stock', 'name': 'Apple Inc.', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='AAPL', name='Apple Inc.', exchange='NasdaqGS', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('127.92000000'), current=Decimal('156.5070625202445058363987195')), change_24H=Change(value=Decimal('12.33053269717420082117174275'), percentage=4.100833), gain=Change(value=Decimal('57.17412504048901167279743900'), percentage=Decimal('22.34760985009733101657185702')), value=Price(purchase=Decimal('255.8400000000000000'), current=Decimal('313.0141250404890116727974390')), date='06-Feb-22, 22:33', type='stock', currency=Currency.EUR), HoldingData(symbol='AAPL', name='Apple Inc.', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('126.33000000'), current=Decimal('156.5070625202445058363987195')), change_24H=Change(value=Decimal('6.165266348587100410585871374'), percentage=4.100833), gain=Change(value=Decimal('30.17706252024450583639871950'), percentage=Decimal('23.88748715288886712293098987')), value=Price(purchase=Decimal('126.3300000000000000'), current=Decimal('156.5070625202445058363987195')), date='06-Feb-22, 22:34', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='AAPL', name='Apple Inc.', exchange='NasdaqGS', quantity=Decimal('3.00000000'), price=Price(purchase=Decimal('127.39000000'), current=Decimal('156.5070625202445058363987195')), change_24H=Change(value=Decimal('18.49579904576130123175761412'), percentage=4.100833), gain=Change(value=Decimal('87.35118756073351750919615850'), percentage=Decimal('22.85663122713282505408487283')), value=Price(purchase=Decimal('212.6700000000000000'), current=Decimal('469.5211875607335175091961585')), date='06-Feb-22, 22:33', type='stock', currency=Currency.EUR)}, {'symbol': 'INTC', 'type': 'stock', 'name': 'Intel Corporation', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='INTC', name='Intel Corporation', exchange='NasdaqGS', quantity=Decimal('4.00000000'), price=Price(purchase=Decimal('45.20000000'), current=Decimal('43.87326038846029827296077396')), change_24H=Change(value=Decimal('5.580782418417794977038667696'), percentage=3.2845085), gain=Change(value=Decimal('-5.306958446158806908156904160'), percentage=Decimal('-2.935264627300225059821296549')), value=Price(purchase=Decimal('180.8000000000000000'), current=Decimal('175.4930415538411930918430958')), date='06-Feb-22, 22:35', type='stock', currency=Currency.EUR), HoldingData(symbol='INTC', name='Intel Corporation', exchange='NasdaqGS', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('45.10000000'), current=Decimal('43.87326038846029827296077396')), change_24H=Change(value=Decimal('2.790391209208897488519333848'), percentage=3.2845085), gain=Change(value=Decimal('-2.453479223079403454078452080'), percentage=Decimal('-2.720043484566966135341964612')), value=Price(purchase=Decimal('90.2000000000000000'), current=Decimal('87.74652077692059654592154792')), date='06-Feb-22, 22:35', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='INTC', name='Intel Corporation', exchange='NasdaqGS', quantity=Decimal('6.00000000'), price=Price(purchase=Decimal('45.16666666666666666666666667'), current=Decimal('43.87326038846029827296077396')), change_24H=Change(value=Decimal('8.371173627626692465558001544'), percentage=3.2845085), gain=Change(value=Decimal('-7.760437669238210362235356260'), percentage=Decimal('-2.863630136250262126286109321')), value=Price(purchase=Decimal('150.6000000000000000'), current=Decimal('263.2395623307617896377646437')), date='06-Feb-22, 22:35', type='stock', currency=Currency.EUR)}, {'symbol': 'DIS', 'type': 'stock', 'name': 'Walt Disney Company (The)', 'exchange': 'NYSE', 'entities': [HoldingData(symbol='DIS', name='Walt Disney Company (The)', exchange='NYSE', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('139.03000000'), current=Decimal('109.5323189629394510092810470')), change_24H=Change(value=Decimal('2.488727569866329309321473925'), percentage=2.3249664), gain=Change(value=Decimal('-29.49768103706054899071895300'), percentage=Decimal('-21.21677410419373443912749263')), value=Price(purchase=Decimal('139.0300000000000000'), current=Decimal('109.5323189629394510092810470')), date='06-Feb-22, 22:35', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='DIS', name='Walt Disney Company (The)', exchange='NYSE', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('139.03000000'), current=Decimal('109.5323189629394510092810470')), change_24H=Change(value=Decimal('2.488727569866329309321473925'), percentage=2.3249664), gain=Change(value=Decimal('-29.49768103706054899071895300'), percentage=Decimal('-21.21677410419373443912749263')), value=Price(purchase=Decimal('139.0300000000000000'), current=Decimal('109.5323189629394510092810470')), date='06-Feb-22, 22:35', type='stock', currency=Currency.EUR)}, {'symbol': 'NVDA', 'type': 'stock', 'name': 'NVIDIA Corporation', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='NVDA', name='NVIDIA Corporation', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('280.18000000'), current=Decimal('191.6886284355289506639829341')), change_24H=Change(value=Decimal('6.900556834066314652689038431'), percentage=3.734309), gain=Change(value=Decimal('-88.49137156447104933601706590'), percentage=Decimal('-31.58375742896389797131025266')), value=Price(purchase=Decimal('280.1800000000000000'), current=Decimal('191.6886284355289506639829341')), date='06-Feb-22, 22:36', type='stock', currency=Currency.EUR), HoldingData(symbol='NVDA', name='NVIDIA Corporation', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('247.68000000'), current=Decimal('191.6886284355289506639829341')), change_24H=Change(value=Decimal('6.900556834066314652689038431'), percentage=3.734309), gain=Change(value=Decimal('-55.99137156447104933601706590'), percentage=Decimal('-22.60633541847183839470973268')), value=Price(purchase=Decimal('247.6800000000000000'), current=Decimal('191.6886284355289506639829341')), date='06-Feb-22, 22:36', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='NVDA', name='NVIDIA Corporation', exchange='NasdaqGS', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('263.93000000'), current=Decimal('191.6886284355289506639829341')), change_24H=Change(value=Decimal('13.80111366813262930537807686'), percentage=3.734309), gain=Change(value=Decimal('-144.4827431289420986720341318'), percentage=Decimal('-27.37141346738568913576215887')), value=Price(purchase=Decimal('263.9300000000000000'), current=Decimal('383.3772568710579013279658682')), date='06-Feb-22, 22:36', type='stock', currency=Currency.EUR)}, {'symbol': 'MSFT', 'type': 'stock', 'name': 'Microsoft Corporation', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='MSFT', name='Microsoft Corporation', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('244.18000000'), current=Decimal('273.3641608819449575489347908')), change_24H=Change(value=Decimal('7.730151733229460215616039866'), percentage=2.9100761), gain=Change(value=Decimal('29.18416088194495754893479080'), percentage=Decimal('11.95190469405559732530706479')), value=Price(purchase=Decimal('244.1800000000000000'), current=Decimal('273.3641608819449575489347908')), date='06-Feb-22, 22:36', type='stock', currency=Currency.EUR), HoldingData(symbol='MSFT', name='Microsoft Corporation', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('250.73000000'), current=Decimal('273.3641608819449575489347908')), change_24H=Change(value=Decimal('7.730151733229460215616039866'), percentage=2.9100761), gain=Change(value=Decimal('22.63416088194495754893479080'), percentage=Decimal('9.027304623278011226791684601')), value=Price(purchase=Decimal('250.7300000000000000'), current=Decimal('273.3641608819449575489347908')), date='06-Feb-22, 22:36', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='MSFT', name='Microsoft Corporation', exchange='NasdaqGS', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('247.45500000'), current=Decimal('273.3641608819449575489347908')), change_24H=Change(value=Decimal('15.46030346645892043123207973'), percentage=2.9100761), gain=Change(value=Decimal('51.81832176388991509786958160'), percentage=Decimal('10.47025151318217758741378869')), value=Price(purchase=Decimal('247.4550000000000000'), current=Decimal('546.7283217638899150978695816')), date='06-Feb-22, 22:36', type='stock', currency=Currency.EUR)}, {'symbol': 'AMD', 'type': 'stock', 'name': 'Advanced Micro Devices, Inc.', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='AMD', name='Advanced Micro Devices, Inc.', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('125.61000000'), current=Decimal('93.72323910229314587512212543')), change_24H=Change(value=Decimal('7.814984368147749795827374333'), percentage=9.096896), gain=Change(value=Decimal('-31.88676089770685412487787457'), percentage=Decimal('-25.38552734472323391838060232')), value=Price(purchase=Decimal('125.6100000000000000'), current=Decimal('93.72323910229314587512212543')), date='06-Feb-22, 22:37', type='stock', currency=Currency.EUR), HoldingData(symbol='AMD', name='Advanced Micro Devices, Inc.', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('102.30000000'), current=Decimal('93.72323910229314587512212543')), change_24H=Change(value=Decimal('7.814984368147749795827374333'), percentage=9.096896), gain=Change(value=Decimal('-8.576760897706854124877874570'), percentage=Decimal('-8.383930496292135019430962434')), value=Price(purchase=Decimal('102.3000000000000000'), current=Decimal('93.72323910229314587512212543')), date='06-Feb-22, 22:37', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='AMD', name='Advanced Micro Devices, Inc.', exchange='NasdaqGS', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('113.95500000'), current=Decimal('93.72323910229314587512212543')), change_24H=Change(value=Decimal('15.62996873629549959165474867'), percentage=9.096896), gain=Change(value=Decimal('-40.46352179541370824975574914'), percentage=Decimal('-17.75416690597767024253246858')), value=Price(purchase=Decimal('113.9550000000000000'), current=Decimal('187.4464782045862917502442509')), date='06-Feb-22, 22:37', type='stock', currency=Currency.EUR)}, {'symbol': 'TSLA', 'type': 'stock', 'name': 'Tesla, Inc.', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='TSLA', name='Tesla, Inc.', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('648.28000000'), current=Decimal('898.0349228890212785992911678')), change_24H=Change(value=Decimal('40.88489651227377220756354621'), percentage=4.7698646), gain=Change(value=Decimal('249.7549228890212785992911678'), percentage=Decimal('38.52577943003351616574492007')), value=Price(purchase=Decimal('648.2800000000000000'), current=Decimal('898.0349228890212785992911678')), date='06-Feb-22, 22:37', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='TSLA', name='Tesla, Inc.', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('648.28000000'), current=Decimal('898.0349228890212785992911678')), change_24H=Change(value=Decimal('40.88489651227377220756354621'), percentage=4.7698646), gain=Change(value=Decimal('249.7549228890212785992911678'), percentage=Decimal('38.52577943003351616574492007')), value=Price(purchase=Decimal('648.2800000000000000'), current=Decimal('898.0349228890212785992911678')), date='06-Feb-22, 22:37', type='stock', currency=Currency.EUR)}, {'symbol': 'ETH-EUR', 'type': 'crypto', 'name': 'Ethereum EUR', 'exchange': 'CCC', 'entities': [HoldingData(symbol='ETH-EUR', name='Ethereum EUR', exchange='CCC', quantity=Decimal('0.58727200'), price=Price(purchase=Decimal('1256.00000000'), current=Decimal('2760.53609999999980573193170130252838134765625')), change_24H=Change(value=Decimal('66.54841215063999953531492793'), percentage=4.280643), gain=Change(value=Decimal('883.5719245191998859118029939'), percentage=Decimal('119.7879060509553985455359635')), value=Price(purchase=Decimal('737.6136320000000000'), current=Decimal('1621.185556519199885911802994')), date='09-Feb-22, 01:55', type='crypto', currency=Currency.EUR), HoldingData(symbol='ETH-EUR', name='Ethereum EUR', exchange='CCC', quantity=Decimal('0.09395902'), price=Price(purchase=Decimal('3170.00000000'), current=Decimal('2760.53609999999980573193170130252838134765625')), change_24H=Change(value=Decimal('10.64723601368739992565394914'), percentage=4.280643), gain=Change(value=Decimal('-38.47282676937801825323731464'), percentage=Decimal('-12.91684227129338152265199680')), value=Price(purchase=Decimal('297.8500934000000000'), current=Decimal('259.3772666306219817467626854')), date='04-Apr-22, 12:21', type='crypto', currency=Currency.EUR), HoldingData(symbol='ETH-EUR', name='Ethereum EUR', exchange='CCC', quantity=Decimal('0.20662637'), price=Price(purchase=Decimal('2654.89000000'), current=Decimal('2760.53609999999980573193170130252838134765625')), change_24H=Change(value=Decimal('23.41446013423189983650473778'), percentage=4.280643), gain=Change(value=Decimal('21.82927014765695985909424053'), percentage=Decimal('3.979302343976579283206901277')), value=Price(purchase=Decimal('548.5702834493000000'), current=Decimal('570.3995535969569598590942405')), date='03-May-22, 10:07', type='crypto', currency=Currency.EUR)], 'average': HoldingData(symbol='ETH-EUR', name='Ethereum EUR', exchange='CCC', quantity=Decimal('0.88785739'), price=Price(purchase=Decimal('1784.108604253775485272471517'), current=Decimal('2760.53609999999980573193170130252838134765625')), change_24H=Change(value=Decimal('100.6101082985592992974736148'), percentage=4.280643), gain=Change(value=Decimal('866.9283678974788275176599200'), percentage=Decimal('54.72915120851774959516643615')), value=Price(purchase=Decimal('647.0798448089466327931335910'), current=Decimal('2450.962376746778827517659920')), date='09-Feb-22, 01:55', type='crypto', currency=Currency.EUR)}, {'symbol': 'XRP-EUR', 'type': 'crypto', 'name': 'XRP EUR', 'exchange': 'CCC', 'entities': [HoldingData(symbol='XRP-EUR', name='XRP EUR', exchange='CCC', quantity=Decimal('240.04000000'), price=Price(purchase=Decimal('0.52090000'), current=Decimal('0.608707499999999956941110212937928736209869384765625')), change_24H=Change(value=Decimal('8.405441073400000743520710245'), percentage=6.1037774), gain=Change(value=Decimal('21.07731229999998966414409551'), percentage=Decimal('16.85688231906315164928205278')), value=Price(purchase=Decimal('125.0368360000000000'), current=Decimal('146.1141482999999896641440955')), date='09-Feb-22, 01:57', type='crypto', currency=Currency.EUR)], 'average': HoldingData(symbol='XRP-EUR', name='XRP EUR', exchange='CCC', quantity=Decimal('240.04000000'), price=Price(purchase=Decimal('0.52090000'), current=Decimal('0.608707499999999956941110212937928736209869384765625')), change_24H=Change(value=Decimal('8.405441073400000743520710245'), percentage=6.1037774), gain=Change(value=Decimal('21.07731229999998966414409551'), percentage=Decimal('16.85688231906315164928205278')), value=Price(purchase=Decimal('125.0368360000000000'), current=Decimal('146.1141482999999896641440955')), date='09-Feb-22, 01:57', type='crypto', currency=Currency.EUR)}, {'symbol': 'VWRL.AS', 'type': 'stock', 'name': 'Vanguard FTSE All-World UCITS E', 'exchange': 'Amsterdam', 'entities': [HoldingData(symbol='VWRL.AS', name='Vanguard FTSE All-World UCITS E', exchange='Amsterdam', quantity=Decimal('3.00000000'), price=Price(purchase=Decimal('103.20000000'), current=Decimal('101.659999999999996589394868351519107818603515625')), change_24H=Change(value=Decimal('-4.139991900000000280002154796'), percentage=-1.339283), gain=Change(value=Decimal('-4.620000000000010231815394944'), percentage=Decimal('-1.492248062015507180818926016')), value=Price(purchase=Decimal('309.6000000000000000'), current=Decimal('304.9799999999999897681846051')), date='08-Feb-22, 22:35', type='stock', currency=Currency.EUR), HoldingData(symbol='VWRL.AS', name='Vanguard FTSE All-World UCITS E', exchange='Amsterdam', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('107.69000000'), current=Decimal('101.659999999999996589394868351519107818603515625')), change_24H=Change(value=Decimal('-2.759994600000000186668103197'), percentage=-1.339283), gain=Change(value=Decimal('-12.06000000000000682121026330'), percentage=Decimal('-5.599405701550750683076545313')), value=Price(purchase=Decimal('215.3800000000000000'), current=Decimal('203.3199999999999931787897367')), date='29-Mar-22, 14:36', type='stock', currency=Currency.EUR), HoldingData(symbol='VWRL.AS', name='Vanguard FTSE All-World UCITS E', exchange='Amsterdam', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('107.69000000'), current=Decimal('101.659999999999996589394868351519107818603515625')), change_24H=Change(value=Decimal('-2.759994600000000186668103197'), percentage=-1.339283), gain=Change(value=Decimal('-12.06000000000000682121026330'), percentage=Decimal('-5.599405701550750683076545313')), value=Price(purchase=Decimal('215.3800000000000000'), current=Decimal('203.3199999999999931787897367')), date='29-Mar-22, 14:48', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='VWRL.AS', name='Vanguard FTSE All-World UCITS E', exchange='Amsterdam', quantity=Decimal('7.00000000'), price=Price(purchase=Decimal('105.7657142857142857142857143'), current=Decimal('101.659999999999996589394868351519107818603515625')), change_24H=Change(value=Decimal('-9.659981100000000653338361190'), percentage=-1.339283), gain=Change(value=Decimal('-28.74000000000002387423592164'), percentage=Decimal('-3.881895294181212366178064946')), value=Price(purchase=Decimal('255.7600000000000000'), current=Decimal('711.6199999999999761257640785')), date='08-Feb-22, 22:35', type='stock', currency=Currency.EUR)}, {'symbol': 'VUSA.AS', 'type': 'stock', 'name': 'Vanguard S&P 500 UCITS ETF', 'exchange': 'Amsterdam', 'entities': [HoldingData(symbol='VUSA.AS', name='Vanguard S&P 500 UCITS ETF', exchange='Amsterdam', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('74.36000000'), current=Decimal('74.576999999999998181010596454143524169921875')), change_24H=Change(value=Decimal('-0.9869995000000000295869995171'), percentage=-1.3061768), gain=Change(value=Decimal('0.2169999999999981810105964541'), percentage=Decimal('0.2918235610543278389061275607')), value=Price(purchase=Decimal('74.3600000000000000'), current=Decimal('74.57699999999999818101059645')), date='08-Feb-22, 22:35', type='stock', currency=Currency.EUR), HoldingData(symbol='VUSA.AS', name='Vanguard S&P 500 UCITS ETF', exchange='Amsterdam', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('80.89000000'), current=Decimal('74.576999999999998181010596454143524169921875')), change_24H=Change(value=Decimal('-0.9869995000000000295869995171'), percentage=-1.3061768), gain=Change(value=Decimal('-6.313000000000001818989403546'), percentage=Decimal('-7.804425763382373369995553895')), value=Price(purchase=Decimal('80.8900000000000000'), current=Decimal('74.57699999999999818101059645')), date='29-Mar-22, 14:35', type='stock', currency=Currency.EUR), HoldingData(symbol='VUSA.AS', name='Vanguard S&P 500 UCITS ETF', exchange='Amsterdam', quantity=Decimal('3.00000000'), price=Price(purchase=Decimal('75.50000000'), current=Decimal('74.576999999999998181010596454143524169921875')), change_24H=Change(value=Decimal('-2.960998500000000088760998551'), percentage=-1.3061768), gain=Change(value=Decimal('-2.769000000000005456968210638'), percentage=Decimal('-1.222516556291393137734309332')), value=Price(purchase=Decimal('226.5000000000000000'), current=Decimal('223.7309999999999945430317894')), date='03-Mar-22, 14:54', type='stock', currency=Currency.EUR), HoldingData(symbol='VUSA.AS', name='Vanguard S&P 500 UCITS ETF', exchange='Amsterdam', quantity=Decimal('6.00000000'), price=Price(purchase=Decimal('74.87300000'), current=Decimal('74.576999999999998181010596454143524169921875')), change_24H=Change(value=Decimal('-5.921997000000000177521997102'), percentage=-1.3061768), gain=Change(value=Decimal('-1.776000000000010913936421275'), percentage=Decimal('-0.3953361024668462850285196879')), value=Price(purchase=Decimal('449.2380000000000000'), current=Decimal('447.4619999999999890860635787')), date='03-May-22, 09:55', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='VUSA.AS', name='Vanguard S&P 500 UCITS ETF', exchange='Amsterdam', quantity=Decimal('11.00000000'), price=Price(purchase=Decimal('75.54436363636363636363636364'), current=Decimal('74.576999999999998181010596454143524169921875')), change_24H=Change(value=Decimal('-10.85699450000000032545699469'), percentage=-1.3061768), gain=Change(value=Decimal('-10.64100000000002000888343904'), percentage=Decimal('-1.280523906482406485879873000')), value=Price(purchase=Decimal('320.9252727272727272727272727'), current=Decimal('820.3469999999999799911165610')), date='08-Feb-22, 22:35', type='stock', currency=Currency.EUR)}, {'symbol': 'IUSA.AS', 'type': 'stock', 'name': 'iShares Core S&P 500 UCITS ETF ', 'exchange': 'Amsterdam', 'entities': [HoldingData(symbol='IUSA.AS', name='iShares Core S&P 500 UCITS ETF ', exchange='Amsterdam', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('38.88000000'), current=Decimal('39.1779999999999972715158946812152862548828125')), change_24H=Change(value=Decimal('-0.500000000'), percentage=-1.2601441), gain=Change(value=Decimal('0.2979999999999972715158946812'), percentage=Decimal('0.7664609053497872209770953735')), value=Price(purchase=Decimal('38.8800000000000000'), current=Decimal('39.17799999999999727151589468')), date='15-Feb-22, 22:36', type='stock', currency=Currency.EUR), HoldingData(symbol='IUSA.AS', name='iShares Core S&P 500 UCITS ETF ', exchange='Amsterdam', quantity=Decimal('3.00000000'), price=Price(purchase=Decimal('41.25000000'), current=Decimal('39.1779999999999972715158946812152862548828125')), change_24H=Change(value=Decimal('-1.500000000'), percentage=-1.2601441), gain=Change(value=Decimal('-6.216000000000008185452315957'), percentage=Decimal('-5.023030303030309644809952288')), value=Price(purchase=Decimal('123.7500000000000000'), current=Decimal('117.5339999999999918145476840')), date='29-Mar-22, 14:34', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='IUSA.AS', name='iShares Core S&P 500 UCITS ETF ', exchange='Amsterdam', quantity=Decimal('4.00000000'), price=Price(purchase=Decimal('40.65750000'), current=Decimal('39.1779999999999972715158946812152862548828125')), change_24H=Change(value=Decimal('-2.000000000'), percentage=-1.2601441), gain=Change(value=Decimal('-5.918000000000010913936421276'), percentage=Decimal('-3.638935005841487372524393578')), value=Price(purchase=Decimal('102.5325000000000000'), current=Decimal('156.7119999999999890860635787')), date='15-Feb-22, 22:36', type='stock', currency=Currency.EUR)}, {'symbol': 'EQQQ.PA', 'type': 'stock', 'name': 'Invesco EQQQ Nasdaq-100 UCITS E', 'exchange': 'Paris', 'entities': [HoldingData(symbol='EQQQ.PA', name='Invesco EQQQ Nasdaq-100 UCITS E', exchange='Paris', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('320.55000000'), current=Decimal('298.8500000000000227373675443232059478759765625')), change_24H=Change(value=Decimal('-6.00000000'), percentage=-1.9681809), gain=Change(value=Decimal('-21.69999999999997726263245568'), percentage=Decimal('-6.769614724691928642218828788')), value=Price(purchase=Decimal('320.5500000000000000'), current=Decimal('298.8500000000000227373675443')), date='15-Feb-22, 22:40', type='stock', currency=Currency.EUR), HoldingData(symbol='EQQQ.PA', name='Invesco EQQQ Nasdaq-100 UCITS E', exchange='Paris', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('324.25000000'), current=Decimal('298.8500000000000227373675443232059478759765625')), change_24H=Change(value=Decimal('-6.00000000'), percentage=-1.9681809), gain=Change(value=Decimal('-25.39999999999997726263245568'), percentage=Decimal('-7.833461835003848037820340996')), value=Price(purchase=Decimal('324.2500000000000000'), current=Decimal('298.8500000000000227373675443')), date='15-Feb-22, 22:40', type='stock', currency=Currency.EUR), HoldingData(symbol='EQQQ.PA', name='Invesco EQQQ Nasdaq-100 UCITS E', exchange='Paris', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('334.35000000'), current=Decimal('298.8500000000000227373675443232059478759765625')), change_24H=Change(value=Decimal('-6.00000000'), percentage=-1.9681809), gain=Change(value=Decimal('-35.49999999999997726263245568'), percentage=Decimal('-10.61761627037534836627260526')), value=Price(purchase=Decimal('334.3500000000000000'), current=Decimal('298.8500000000000227373675443')), date='29-Mar-22, 14:36', type='stock', currency=Currency.EUR), HoldingData(symbol='EQQQ.PA', name='Invesco EQQQ Nasdaq-100 UCITS E', exchange='Paris', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('334.35000000'), current=Decimal('298.8500000000000227373675443232059478759765625')), change_24H=Change(value=Decimal('-6.00000000'), percentage=-1.9681809), gain=Change(value=Decimal('-35.49999999999997726263245568'), percentage=Decimal('-10.61761627037534836627260526')), value=Price(purchase=Decimal('334.3500000000000000'), current=Decimal('298.8500000000000227373675443')), date='29-Mar-22, 14:46', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='EQQQ.PA', name='Invesco EQQQ Nasdaq-100 UCITS E', exchange='Paris', quantity=Decimal('4.00000000'), price=Price(purchase=Decimal('328.37500000'), current=Decimal('298.8500000000000227373675443232059478759765625')), change_24H=Change(value=Decimal('-24.00000000'), percentage=-1.9681809), gain=Change(value=Decimal('-118.0999999999999090505298227'), percentage=Decimal('-8.991244765892646292389023427')), value=Price(purchase=Decimal('328.3750000000000000'), current=Decimal('1195.400000000000090949470177')), date='15-Feb-22, 22:40', type='stock', currency=Currency.EUR)}, {'symbol': 'SHIB-EUR', 'type': 'crypto', 'name': 'SHIBA INU EUR', 'exchange': 'CCC', 'entities': [HoldingData(symbol='SHIB-EUR', name='SHIBA INU EUR', exchange='CCC', quantity=Decimal('25881143.00000000'), price=Price(purchase=Decimal('0.00002341'), current=Decimal('0.000020252978999999999946968198827335072564892470836639404296875')), change_24H=Change(value=Decimal('25.42445211496489827281338727'), percentage=5.097673), gain=Change(value=Decimal('-81.70731195500300137252362971'), percentage=Decimal('-13.48577958137548079039641680')), value=Price(purchase=Decimal('605.8775576300000000'), current=Decimal('524.1702456749969986274763703')), date='08-Oct-21, 15:54', type='crypto', currency=Currency.EUR)], 'average': HoldingData(symbol='SHIB-EUR', name='SHIBA INU EUR', exchange='CCC', quantity=Decimal('25881143.00000000'), price=Price(purchase=Decimal('0.00002341'), current=Decimal('0.000020252978999999999946968198827335072564892470836639404296875')), change_24H=Change(value=Decimal('25.42445211496489827281338727'), percentage=5.097673), gain=Change(value=Decimal('-81.70731195500300137252362971'), percentage=Decimal('-13.48577958137548079039641680')), value=Price(purchase=Decimal('605.8775576300000000'), current=Decimal('524.1702456749969986274763703')), date='08-Oct-21, 15:54', type='crypto', currency=Currency.EUR)}, {'symbol': 'BTC-EUR', 'type': 'crypto', 'name': 'Bitcoin EUR', 'exchange': 'CCC', 'entities': [HoldingData(symbol='BTC-EUR', name='Bitcoin EUR', exchange='CCC', quantity=Decimal('0.01190734'), price=Price(purchase=Decimal('41991.00000000'), current=Decimal('37444.6500000000014551915228366851806640625')), change_24H=Change(value=Decimal('18.69494293836800037687225995'), percentage=4.376447), gain=Change(value=Decimal('-54.13493520899998267253977246'), percentage=Decimal('-10.82696292062584493060055051')), value=Price(purchase=Decimal('500.0011139400000000'), current=Decimal('445.8661787310000173274602275')), date='04-Apr-22, 12:22', type='crypto', currency=Currency.EUR), HoldingData(symbol='BTC-EUR', name='Bitcoin EUR', exchange='CCC', quantity=Decimal('0.00706042'), price=Price(purchase=Decimal('36930.00000000'), current=Decimal('37444.6500000000014551915228366851806640625')), change_24H=Change(value=Decimal('11.08510792678400022346522746'), percentage=4.376447), gain=Change(value=Decimal('3.633645153000010274263331667'), percentage=Decimal('1.393582453290012063881729858')), value=Price(purchase=Decimal('260.7413106000000000'), current=Decimal('264.3749557530000102742633317')), date='15-Apr-22, 21:59', type='crypto', currency=Currency.EUR), HoldingData(symbol='BTC-EUR', name='Bitcoin EUR', exchange='CCC', quantity=Decimal('0.07049000'), price=Price(purchase=Decimal('28808.00000000'), current=Decimal('37444.6500000000014551915228366851806640625')), change_24H=Change(value=Decimal('110.6717812480000022310377972'), percentage=4.376447), gain=Change(value=Decimal('608.7974585000001025764504448'), percentage=Decimal('29.98004026659261821435546667')), value=Price(purchase=Decimal('2030.6759200000000000'), current=Decimal('2639.473378500000102576450445')), date='09-Feb-22, 01:55', type='crypto', currency=Currency.EUR), HoldingData(symbol='BTC-EUR', name='Bitcoin EUR', exchange='CCC', quantity=Decimal('0.00731307'), price=Price(purchase=Decimal('36930.00000000'), current=Decimal('37444.6500000000014551915228366851806640625')), change_24H=Change(value=Decimal('11.48177732006400023146170497'), percentage=4.376447), gain=Change(value=Decimal('3.763671475500010641917469911'), percentage=Decimal('1.393582453290012063881729858')), value=Price(purchase=Decimal('270.0716751000000000'), current=Decimal('273.8353465755000106419174699')), date='15-Apr-22, 21:55', type='crypto', currency=Currency.EUR), HoldingData(symbol='BTC-EUR', name='Bitcoin EUR', exchange='CCC', quantity=Decimal('0.01047422'), price=Price(purchase=Decimal('36930.00000000'), current=Decimal('37444.6500000000014551915228366851806640625')), change_24H=Change(value=Decimal('16.44489409254400033151341631'), percentage=4.376447), gain=Change(value=Decimal('5.390557323000015241996152327'), percentage=Decimal('1.393582453290012063881729858')), value=Price(purchase=Decimal('386.8129446000000000'), current=Decimal('392.2035019230000152419961523')), date='15-Apr-22, 21:55', type='crypto', currency=Currency.EUR), HoldingData(symbol='BTC-EUR', name='Bitcoin EUR', exchange='CCC', quantity=Decimal('0.01321524'), price=Price(purchase=Decimal('34051.60000000'), current=Decimal('37444.6500000000014551915228366851806640625')), change_24H=Change(value=Decimal('20.74839197644800041826783854'), percentage=4.376447), gain=Change(value=Decimal('44.83997008200001923070522026'), percentage=Decimal('9.964436326046357455131397165')), value=Price(purchase=Decimal('450.0000663840000000'), current=Decimal('494.8400364660000192307052203')), date='15-Apr-22, 22:15', type='crypto', currency=Currency.EUR)], 'average': HoldingData(symbol='BTC-EUR', name='Bitcoin EUR', exchange='CCC', quantity=Decimal('0.12046029'), price=Price(purchase=Decimal('32361.72709383316277920300541'), current=Decimal('37444.6500000000014551915228366851806640625')), change_24H=Change(value=Decimal('189.1268955022080038126182444'), percentage=4.376447), gain=Change(value=Decimal('612.2903673245001752927928459'), percentage=Decimal('15.70658726411248411247113709')), value=Price(purchase=Decimal('1352.399598672234914593016504'), current=Decimal('4510.593397948500175292792846')), date='04-Apr-22, 12:22', type='crypto', currency=Currency.EUR)}, {'symbol': 'TWTR', 'type': 'stock', 'name': 'Twitter, Inc.', 'exchange': 'NYSE', 'entities': [HoldingData(symbol='TWTR', name='Twitter, Inc.', exchange='NYSE', quantity=Decimal('5.00000000'), price=Price(purchase=Decimal('46.38942109544008816712405312'), current=Decimal('46.24886451778819021190059984')), change_24H=Change(value=Decimal('0.8955744757550745520363308235'), percentage=0.388792), gain=Change(value=Decimal('-0.7027828882594897761172664000'), percentage=Decimal('-0.3029927391478359211268760618')), value=Price(purchase=Decimal('231.9471054772004408356202656'), current=Decimal('231.2443225889409510595029992')), date='03-May-22, 09:53', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='TWTR', name='Twitter, Inc.', exchange='NYSE', quantity=Decimal('5.00000000'), price=Price(purchase=Decimal('46.38942109544008816712405312'), current=Decimal('46.24886451778819021190059984')), change_24H=Change(value=Decimal('0.8955744757550745520363308235'), percentage=0.388792), gain=Change(value=Decimal('-0.7027828882594897761172664000'), percentage=Decimal('-0.3029927391478359211268760618')), value=Price(purchase=Decimal('231.9471054772004408356202656'), current=Decimal('231.2443225889409510595029992')), date='03-May-22, 09:53', type='stock', currency=Currency.EUR)}, {'symbol': 'LUNA1-EUR', 'type': 'crypto', 'name': 'Terra EUR', 'exchange': 'CCC', 'entities': [HoldingData(symbol='LUNA1-EUR', name='Terra EUR', exchange='CCC', quantity=Decimal('2.07115000'), price=Price(purchase=Decimal('76.94000000'), current=Decimal('81.0353850000000051068127504549920558929443359375')), change_24H=Change(value=Decimal('5.198243310445000152308914210'), percentage=3.1962032), gain=Change(value=Decimal('8.482156642750010576975228105'), percentage=Decimal('5.322829477514953349119769242')), value=Price(purchase=Decimal('159.3542810000000000'), current=Decimal('167.8364376427500105769752281')), date='09-Feb-22, 01:56', type='crypto', currency=Currency.EUR)], 'average': HoldingData(symbol='LUNA1-EUR', name='Terra EUR', exchange='CCC', quantity=Decimal('2.07115000'), price=Price(purchase=Decimal('76.94000000'), current=Decimal('81.0353850000000051068127504549920558929443359375')), change_24H=Change(value=Decimal('5.198243310445000152308914210'), percentage=3.1962032), gain=Change(value=Decimal('8.482156642750010576975228105'), percentage=Decimal('5.322829477514953349119769242')), value=Price(purchase=Decimal('159.3542810000000000'), current=Decimal('167.8364376427500105769752281')), date='09-Feb-22, 01:56', type='crypto', currency=Currency.EUR)}], 'overview': Overview(capital=Sum(crypto=Decimal('8550.00000000'), stock=Decimal('6250.00000000'), total=Decimal('14800.00000000')), current=Sum(crypto=Decimal('7799.676606313026001679048460'), stock=Decimal('6084.602236236485356825896752'), total=Decimal('13884.27884254951135850494521')), purchase=Sum(crypto=Decimal('6372.6057141033000000'), stock=Decimal('6045.015105477200440835620266'), total=Decimal('12417.62081958050044083562027')), change_purchase=ChangeOverview(crypto=Change(value=Decimal('1427.070892209726001679048460'), percentage=Decimal('22.39383630861479607260461644')), stock=Change(value=Decimal('39.587130759284915990276486'), percentage=Decimal('0.6548723215499700953175627847')), total=Change(value=Decimal('1466.65802296901091766932494'), percentage=Decimal('11.81110330455845280001388492'))), change_capital=ChangeOverview(crypto=Change(value=Decimal('-750.323393686973998320951540'), percentage=Decimal('-8.775712206865192962818146667')), stock=Change(value=Decimal('-165.397763763514643174103248'), percentage=Decimal('-2.646364220216234290785651968')), total=Change(value=Decimal('-915.72115745048864149505479'), percentage=Decimal('-6.187305117908707037128748581'))), change_daily=ChangeOverview(crypto=Change(value=Decimal('328.7651402995772022787348709'), percentage=Decimal('4.400602815268128008541774734')), stock=Change(value=Decimal('73.66788872849402377581469983'), percentage=Decimal('1.225564687111167700537315682')), total=Change(value=Decimal('402.4330290280712260545495707'), percentage=Decimal('2.984999491868215157954412609')))), 'user': 'berkay', 'currency': 'EUR'}"	2	daily
6	2022-05-05 23:00:00.842885+00	"{'holdings_data': [{'symbol': 'IBM', 'type': 'stock', 'name': 'International Business Machines', 'exchange': 'NYSE', 'entities': [HoldingData(symbol='IBM', name='International Business Machines', exchange='NYSE', quantity=Decimal('13.00000000'), price=Price(purchase=Decimal('123.00000000'), current=Decimal('128.7977912581247034462891247')), change_24H=Change(value=Decimal('-18.23177092414499741982473051'), percentage=-1.0771439), gain=Change(value=Decimal('75.37128635562114480175862110'), percentage=Decimal('4.713651429369677598609044472')), value=Price(purchase=Decimal('1599.0000000000000000'), current=Decimal('1674.371286355621144801758621')), date='03-Mar-22, 01:57', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='IBM', name='International Business Machines', exchange='NYSE', quantity=Decimal('13.00000000'), price=Price(purchase=Decimal('123.00000000'), current=Decimal('128.7977912581247034462891247')), change_24H=Change(value=Decimal('-18.23177092414499741982473051'), percentage=-1.0771439), gain=Change(value=Decimal('75.37128635562114480175862110'), percentage=Decimal('4.713651429369677598609044472')), value=Price(purchase=Decimal('1599.0000000000000000'), current=Decimal('1674.371286355621144801758621')), date='03-Mar-22, 01:57', type='stock', currency=Currency.EUR)}, {'symbol': 'SOL-CAD', 'type': 'crypto', 'name': 'Solana CAD', 'exchange': 'CCC', 'entities': [HoldingData(symbol='SOL-CAD', name='Solana CAD', exchange='CCC', quantity=Decimal('11.00000000'), price=Price(purchase=Decimal('123.00000000'), current=Decimal('102.0291622003120249796921733')), change_24H=Change(value=Decimal('-115.8131999921159535223031231'), percentage=-9.353849), gain=Change(value=Decimal('-230.6792157965677252233860937'), percentage=Decimal('-17.04946162576258131732343634')), value=Price(purchase=Decimal('1353.0000000000000000'), current=Decimal('1122.320784203432274776613906')), date='03-Mar-22, 01:58', type='crypto', currency=Currency.EUR)], 'average': HoldingData(symbol='SOL-CAD', name='Solana CAD', exchange='CCC', quantity=Decimal('11.00000000'), price=Price(purchase=Decimal('123.00000000'), current=Decimal('102.0291622003120249796921733')), change_24H=Change(value=Decimal('-115.8131999921159535223031231'), percentage=-9.353849), gain=Change(value=Decimal('-230.6792157965677252233860937'), percentage=Decimal('-17.04946162576258131732343634')), value=Price(purchase=Decimal('1353.0000000000000000'), current=Decimal('1122.320784203432274776613906')), date='03-Mar-22, 01:58', type='crypto', currency=Currency.EUR)}, {'symbol': 'AAPL', 'type': 'stock', 'name': 'Apple Inc.', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='AAPL', name='Apple Inc.', exchange='NasdaqGS', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('142.1399991812735969282117494'), current=Decimal('148.5552511443217549652399188')), change_24H=Change(value=Decimal('-17.53059989902374362114611576'), percentage=-5.5716176), gain=Change(value=Decimal('12.83050392609631607405633880'), percentage=Decimal('4.513333333333340154543596659')), value=Price(purchase=Decimal('284.2799983625471938564234988'), current=Decimal('297.1105022886435099304798376')), date='10-Mar-22, 02:28', type='stock', currency=Currency.EUR), HoldingData(symbol='AAPL', name='Apple Inc.', exchange='NasdaqGS', quantity=Decimal('100.00000000'), price=Price(purchase=Decimal('5.00000000'), current=Decimal('148.5552511443217549652399188')), change_24H=Change(value=Decimal('-876.5299949511871810573057881'), percentage=-5.5716176), gain=Change(value=Decimal('14355.52511443217549652399188'), percentage=Decimal('2871.105022886435099304798376')), value=Price(purchase=Decimal('500.0000000000000000'), current=Decimal('14855.52511443217549652399188')), date='11-Mar-22, 17:47', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='AAPL', name='Apple Inc.', exchange='NasdaqGS', quantity=Decimal('102.00000000'), price=Price(purchase=Decimal('7.689019591789678371141406851'), current=Decimal('148.5552511443217549652399188')), change_24H=Change(value=Decimal('-894.0605948502109246784519039'), percentage=-5.5716176), gain=Change(value=Decimal('14368.35561835827181259804821'), percentage=Decimal('1832.044123062825740230372608')), value=Price(purchase=Decimal('495.7701960463244547814985'), current=Decimal('15152.63561672081900645447172')), date='10-Mar-22, 02:28', type='stock', currency=Currency.EUR)}, {'symbol': 'TSLA', 'type': 'stock', 'name': 'Tesla, Inc.', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='TSLA', name='Tesla, Inc.', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('900.00000000'), current=Decimal('827.5201232334840189813431439')), change_24H=Change(value=Decimal('-75.18255134854850389150767033'), percentage=-8.328607), gain=Change(value=Decimal('-72.47987676651598101865685610'), percentage=Decimal('-8.053319640723997890961872900')), value=Price(purchase=Decimal('900.0000000000000000'), current=Decimal('827.5201232334840189813431439')), date='10-Mar-22, 02:28', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='TSLA', name='Tesla, Inc.', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('900.00000000'), current=Decimal('827.5201232334840189813431439')), change_24H=Change(value=Decimal('-75.18255134854850389150767033'), percentage=-8.328607), gain=Change(value=Decimal('-72.47987676651598101865685610'), percentage=Decimal('-8.053319640723997890961872900')), value=Price(purchase=Decimal('900.0000000000000000'), current=Decimal('827.5201232334840189813431439')), date='10-Mar-22, 02:28', type='stock', currency=Currency.EUR)}, {'symbol': 'ERIC', 'type': 'stock', 'name': 'Ericsson', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='ERIC', name='Ericsson', exchange='NasdaqGS', quantity=Decimal('100.00000000'), price=Price(purchase=Decimal('10.00000000'), current=Decimal('7.561847956443755760567040586')), change_24H=Change(value=Decimal('-41.69440544544022482788332609'), percentage=-5.225654), gain=Change(value=Decimal('-243.8152043556244239432959414'), percentage=Decimal('-24.38152043556244239432959414')), value=Price(purchase=Decimal('1000.0000000000000000'), current=Decimal('756.1847956443755760567040586')), date='11-Mar-22, 17:48', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='ERIC', name='Ericsson', exchange='NasdaqGS', quantity=Decimal('100.00000000'), price=Price(purchase=Decimal('10.00000000'), current=Decimal('7.561847956443755760567040586')), change_24H=Change(value=Decimal('-41.69440544544022482788332609'), percentage=-5.225654), gain=Change(value=Decimal('-243.8152043556244239432959414'), percentage=Decimal('-24.38152043556244239432959414')), value=Price(purchase=Decimal('1000.0000000000000000'), current=Decimal('756.1847956443755760567040586')), date='11-Mar-22, 17:48', type='stock', currency=Currency.EUR)}, {'symbol': 'BTC-USD', 'type': 'crypto', 'name': 'Bitcoin USD', 'exchange': 'CCC', 'entities': [HoldingData(symbol='BTC-USD', name='Bitcoin USD', exchange='CCC', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('100.00000000'), current=Decimal('34400.67806465209373146309086')), change_24H=Change(value=Decimal('-3229.739174996701971672516974'), percentage=-8.58279), gain=Change(value=Decimal('34300.67806465209373146309086'), percentage=Decimal('34300.67806465209373146309086')), value=Price(purchase=Decimal('100.0000000000000000'), current=Decimal('34400.67806465209373146309086')), date='04-Apr-22, 15:28', type='crypto', currency=Currency.EUR)], 'average': HoldingData(symbol='BTC-USD', name='Bitcoin USD', exchange='CCC', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('100.00000000'), current=Decimal('34400.67806465209373146309086')), change_24H=Change(value=Decimal('-3229.739174996701971672516974'), percentage=-8.58279), gain=Change(value=Decimal('34300.67806465209373146309086'), percentage=Decimal('34300.67806465209373146309086')), value=Price(purchase=Decimal('100.0000000000000000'), current=Decimal('34400.67806465209373146309086')), date='04-Apr-22, 15:28', type='crypto', currency=Currency.EUR)}, {'symbol': 'HP', 'type': 'stock', 'name': 'Helmerich & Payne, Inc.', 'exchange': 'NYSE', 'entities': [HoldingData(symbol='HP', name='Helmerich & Payne, Inc.', exchange='NYSE', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('1.00000000'), current=Decimal('45.87331573576969561674213446')), change_24H=Change(value=Decimal('-2.008911040828672263304356337'), percentage=-4.1955256), gain=Change(value=Decimal('44.87331573576969561674213446'), percentage=Decimal('4487.331573576969561674213446')), value=Price(purchase=Decimal('1.0000000000000000'), current=Decimal('45.87331573576969561674213446')), date='15-Apr-22, 19:30', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='HP', name='Helmerich & Payne, Inc.', exchange='NYSE', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('1.00000000'), current=Decimal('45.87331573576969561674213446')), change_24H=Change(value=Decimal('-2.008911040828672263304356337'), percentage=-4.1955256), gain=Change(value=Decimal('44.87331573576969561674213446'), percentage=Decimal('4487.331573576969561674213446')), value=Price(purchase=Decimal('1.0000000000000000'), current=Decimal('45.87331573576969561674213446')), date='15-Apr-22, 19:30', type='stock', currency=Currency.EUR)}, {'symbol': 'GE=F', 'type': 'stock', 'name': 'Eurodollar Futures,Jun-2022', 'exchange': 'CME', 'entities': [HoldingData(symbol='GE=F', name='Eurodollar Futures,Jun-2022', exchange='CME', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('2.00000000'), current=Decimal('93.33859946236966198285904879')), change_24H=Change(value=Decimal('0.004735397294564111558853058466'), percentage=0.005073611), gain=Change(value=Decimal('91.33859946236966198285904879'), percentage=Decimal('4566.929973118483099142952440')), value=Price(purchase=Decimal('2.0000000000000000'), current=Decimal('93.33859946236966198285904879')), date='15-Apr-22, 19:31', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='GE=F', name='Eurodollar Futures,Jun-2022', exchange='CME', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('2.00000000'), current=Decimal('93.33859946236966198285904879')), change_24H=Change(value=Decimal('0.004735397294564111558853058466'), percentage=0.005073611), gain=Change(value=Decimal('91.33859946236966198285904879'), percentage=Decimal('4566.929973118483099142952440')), value=Price(purchase=Decimal('2.0000000000000000'), current=Decimal('93.33859946236966198285904879')), date='15-Apr-22, 19:31', type='stock', currency=Currency.EUR)}, {'symbol': 'TT', 'type': 'stock', 'name': 'Trane Technologies plc', 'exchange': 'NYSE', 'entities': [HoldingData(symbol='TT', name='Trane Technologies plc', exchange='NYSE', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('44.00000000'), current=Decimal('129.5274432539219176061888241')), change_24H=Change(value=Decimal('-8.566303950658087966901210398'), percentage=-3.20091), gain=Change(value=Decimal('171.0548865078438352123776482'), percentage=Decimal('194.3805528498225400140655093')), value=Price(purchase=Decimal('88.0000000000000000'), current=Decimal('259.0548865078438352123776482')), date='15-Apr-22, 19:32', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='TT', name='Trane Technologies plc', exchange='NYSE', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('44.00000000'), current=Decimal('129.5274432539219176061888241')), change_24H=Change(value=Decimal('-8.566303950658087966901210398'), percentage=-3.20091), gain=Change(value=Decimal('171.0548865078438352123776482'), percentage=Decimal('194.3805528498225400140655093')), value=Price(purchase=Decimal('88.0000000000000000'), current=Decimal('259.0548865078438352123776482')), date='15-Apr-22, 19:32', type='stock', currency=Currency.EUR)}], 'overview': Overview(capital=Sum(crypto=Decimal('1000.00000000'), stock=Decimal('2000.00000000'), total=Decimal('3000.00000000')), current=Sum(crypto=Decimal('35522.99884885552600623970477'), stock=Decimal('18808.97862366028293910625637'), total=Decimal('54331.97747251580894534596114')), purchase=Sum(crypto=Decimal('1453.0000000000000000'), stock=Decimal('4374.279998362547193856423499'), total=Decimal('5827.279998362547193856423499')), change_purchase=ChangeOverview(crypto=Change(value=Decimal('34069.99884885552600623970477'), percentage=Decimal('2344.803774869616380333083604')), stock=Change(value=Decimal('14434.69862529773574524983287'), percentage=Decimal('329.9902756728232023157045335')), total=Change(value=Decimal('48504.69747415326175148953764'), percentage=Decimal('832.3728650036204642143333557'))), change_capital=ChangeOverview(crypto=Change(value=Decimal('34522.99884885552600623970477'), percentage=Decimal('3452.299884885552600623970477')), stock=Change(value=Decimal('16808.97862366028293910625637'), percentage=Decimal('840.4489311830141469553128185')), total=Change(value=Decimal('51331.97747251580894534596114'), percentage=Decimal('1711.065915750526964844865371'))), change_daily=ChangeOverview(crypto=Change(value=Decimal('-3345.552374988817925194820097'), percentage=Decimal('-8.607350337607777125770849425')), stock=Change(value=Decimal('-1039.739802162536846936314344'), percentage=Decimal('-5.238322091414498446700177080')), total=Change(value=Decimal('-4385.292177151354772131134441'), percentage=Decimal('-7.468487896858829180262663007')))), 'user': 'demo', 'currency': 'EUR'}"	5	daily
7	2022-05-05 23:00:01.469276+00	"{'holdings_data': [{'symbol': 'INTC', 'type': 'stock', 'name': 'Intel Corporation', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='INTC', name='Intel Corporation', exchange='NasdaqGS', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('42.40000000'), current=Decimal('42.26295975656535083327554522')), change_24H=Change(value=Decimal('-2.984941498966736761845215468'), percentage=-3.4109383), gain=Change(value=Decimal('-0.2740804868692983334489095600'), percentage=Decimal('-0.3232081213081348271803178774')), value=Price(purchase=Decimal('84.8000000000000000'), current=Decimal('84.52591951313070166655109044')), date='27-Mar-22, 03:45', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='INTC', name='Intel Corporation', exchange='NasdaqGS', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('42.40000000'), current=Decimal('42.26295975656535083327554522')), change_24H=Change(value=Decimal('-2.984941498966736761845215468'), percentage=-3.4109383), gain=Change(value=Decimal('-0.2740804868692983334489095600'), percentage=Decimal('-0.3232081213081348271803178774')), value=Price(purchase=Decimal('84.8000000000000000'), current=Decimal('84.52591951313070166655109044')), date='27-Mar-22, 03:45', type='stock', currency=Currency.EUR)}, {'symbol': 'VWRL.AS', 'type': 'stock', 'name': 'Vanguard FTSE All-World UCITS E', 'exchange': 'Amsterdam', 'entities': [HoldingData(symbol='VWRL.AS', name='Vanguard FTSE All-World UCITS E', exchange='Amsterdam', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('103.14000000'), current=Decimal('101.7399999999999948840923025272786617279052734375')), change_24H=Change(value=Decimal('0.07999420000000000141593403669'), percentage=0.07868798), gain=Change(value=Decimal('-1.400000000000005115907697473'), percentage=Decimal('-1.357378320729111029578919404')), value=Price(purchase=Decimal('103.1400000000000000'), current=Decimal('101.7399999999999948840923025')), date='08-Feb-22, 03:46', type='stock', currency=Currency.EUR), HoldingData(symbol='VWRL.AS', name='Vanguard FTSE All-World UCITS E', exchange='Amsterdam', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('108.78000000'), current=Decimal('101.7399999999999948840923025272786617279052734375')), change_24H=Change(value=Decimal('0.07999420000000000141593403669'), percentage=0.07868798), gain=Change(value=Decimal('-7.040000000000005115907697473'), percentage=Decimal('-6.471777900349333623743057063')), value=Price(purchase=Decimal('108.7800000000000000'), current=Decimal('101.7399999999999948840923025')), date='12-Jan-22, 03:48', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='VWRL.AS', name='Vanguard FTSE All-World UCITS E', exchange='Amsterdam', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('105.96000000'), current=Decimal('101.7399999999999948840923025272786617279052734375')), change_24H=Change(value=Decimal('0.1599884000000000028318680734'), percentage=0.07868798), gain=Change(value=Decimal('-8.440000000000010231815394946'), percentage=Decimal('-3.982634956587396296628631062')), value=Price(purchase=Decimal('105.9600000000000000'), current=Decimal('203.4799999999999897681846050')), date='08-Feb-22, 03:46', type='stock', currency=Currency.EUR)}, {'symbol': 'IUSA.AS', 'type': 'stock', 'name': 'iShares Core S&P 500 UCITS ETF ', 'exchange': 'Amsterdam', 'entities': [HoldingData(symbol='IUSA.AS', name='iShares Core S&P 500 UCITS ETF ', exchange='Amsterdam', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('41.30000000'), current=Decimal('39.4200000000000017053025658242404460906982421875')), change_24H=Change(value=Decimal('0.2419967699999999999338484713'), percentage=0.6176853), gain=Change(value=Decimal('-1.879999999999998294697434176'), percentage=Decimal('-4.552058111380141149388460475')), value=Price(purchase=Decimal('41.3000000000000000'), current=Decimal('39.42000000000000170530256582')), date='12-Jan-22, 03:48', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='IUSA.AS', name='iShares Core S&P 500 UCITS ETF ', exchange='Amsterdam', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('41.30000000'), current=Decimal('39.4200000000000017053025658242404460906982421875')), change_24H=Change(value=Decimal('0.2419967699999999999338484713'), percentage=0.6176853), gain=Change(value=Decimal('-1.879999999999998294697434176'), percentage=Decimal('-4.552058111380141149388460475')), value=Price(purchase=Decimal('41.3000000000000000'), current=Decimal('39.42000000000000170530256582')), date='12-Jan-22, 03:48', type='stock', currency=Currency.EUR)}, {'symbol': 'NVDA', 'type': 'stock', 'name': 'NVIDIA Corporation', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='NVDA', name='NVIDIA Corporation', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('247.26000000'), current=Decimal('178.5657429714613085464218777')), change_24H=Change(value=Decimal('-14.11923423307320958585869844'), percentage=-7.3276258), gain=Change(value=Decimal('-68.69425702853869145357812230'), percentage=Decimal('-27.78219567602470737425306248')), value=Price(purchase=Decimal('247.2600000000000000'), current=Decimal('178.5657429714613085464218777')), date='12-Jan-22, 03:49', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='NVDA', name='NVIDIA Corporation', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('247.26000000'), current=Decimal('178.5657429714613085464218777')), change_24H=Change(value=Decimal('-14.11923423307320958585869844'), percentage=-7.3276258), gain=Change(value=Decimal('-68.69425702853869145357812230'), percentage=Decimal('-27.78219567602470737425306248')), value=Price(purchase=Decimal('247.2600000000000000'), current=Decimal('178.5657429714613085464218777')), date='12-Jan-22, 03:49', type='stock', currency=Currency.EUR)}, {'symbol': 'EQQQ.PA', 'type': 'stock', 'name': 'Invesco EQQQ Nasdaq-100 UCITS E', 'exchange': 'Paris', 'entities': [HoldingData(symbol='EQQQ.PA', name='Invesco EQQQ Nasdaq-100 UCITS E', exchange='Paris', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('344.60000000'), current=Decimal('300.80000000000001136868377216160297393798828125')), change_24H=Change(value=Decimal('1.949981699999999928962779450'), percentage=0.65249515), gain=Change(value=Decimal('-43.79999999999998863131622784'), percentage=Decimal('-12.71038885664538265563442479')), value=Price(purchase=Decimal('344.6000000000000000'), current=Decimal('300.8000000000000113686837722')), date='12-Jan-22, 03:49', type='stock', currency=Currency.EUR), HoldingData(symbol='EQQQ.PA', name='Invesco EQQQ Nasdaq-100 UCITS E', exchange='Paris', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('351.00000000'), current=Decimal('300.80000000000001136868377216160297393798828125')), change_24H=Change(value=Decimal('1.949981699999999928962779450'), percentage=0.65249515), gain=Change(value=Decimal('-50.19999999999998863131622784'), percentage=Decimal('-14.30199430199429875536074867')), value=Price(purchase=Decimal('351.0000000000000000'), current=Decimal('300.8000000000000113686837722')), date='05-Jan-22, 03:51', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='EQQQ.PA', name='Invesco EQQQ Nasdaq-100 UCITS E', exchange='Paris', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('347.80000000'), current=Decimal('300.80000000000001136868377216160297393798828125')), change_24H=Change(value=Decimal('3.899963399999999857925558900'), percentage=0.65249515), gain=Change(value=Decimal('-93.99999999999997726263245568'), percentage=Decimal('-13.51351351351351024477177339')), value=Price(purchase=Decimal('347.8000000000000000'), current=Decimal('601.6000000000000227373675444')), date='12-Jan-22, 03:49', type='stock', currency=Currency.EUR)}, {'symbol': 'VUSA.AS', 'type': 'stock', 'name': 'Vanguard S&P 500 UCITS ETF', 'exchange': 'Amsterdam', 'entities': [HoldingData(symbol='VUSA.AS', name='Vanguard S&P 500 UCITS ETF', exchange='Amsterdam', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('77.90000000'), current=Decimal('75.0619999999999976125764078460633754730224609375')), change_24H=Change(value=Decimal('0.9699859600000000359187879440'), percentage=0.6503251), gain=Change(value=Decimal('-5.676000000000004774847184308'), percentage=Decimal('-3.643132220795895234176626642')), value=Price(purchase=Decimal('155.8000000000000000'), current=Decimal('150.1239999999999952251528157')), date='11-Jan-22, 03:50', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='VUSA.AS', name='Vanguard S&P 500 UCITS ETF', exchange='Amsterdam', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('77.90000000'), current=Decimal('75.0619999999999976125764078460633754730224609375')), change_24H=Change(value=Decimal('0.9699859600000000359187879440'), percentage=0.6503251), gain=Change(value=Decimal('-5.676000000000004774847184308'), percentage=Decimal('-3.643132220795895234176626642')), value=Price(purchase=Decimal('155.8000000000000000'), current=Decimal('150.1239999999999952251528157')), date='11-Jan-22, 03:50', type='stock', currency=Currency.EUR)}, {'symbol': 'MSFT', 'type': 'stock', 'name': 'Microsoft Corporation', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='MSFT', name='Microsoft Corporation', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('292.90000000'), current=Decimal('262.8168584861749022661928856')), change_24H=Change(value=Decimal('-11.96819266906321013174678676'), percentage=-4.355474), gain=Change(value=Decimal('-30.08314151382509773380711440'), percentage=Decimal('-10.27078918191365576435886460')), value=Price(purchase=Decimal('292.9000000000000000'), current=Decimal('262.8168584861749022661928856')), date='04-Jan-22, 03:51', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='MSFT', name='Microsoft Corporation', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('292.90000000'), current=Decimal('262.8168584861749022661928856')), change_24H=Change(value=Decimal('-11.96819266906321013174678676'), percentage=-4.355474), gain=Change(value=Decimal('-30.08314151382509773380711440'), percentage=Decimal('-10.27078918191365576435886460')), value=Price(purchase=Decimal('292.9000000000000000'), current=Decimal('262.8168584861749022661928856')), date='04-Jan-22, 03:51', type='stock', currency=Currency.EUR)}, {'symbol': 'AAPL', 'type': 'stock', 'name': 'Apple Inc.', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='AAPL', name='Apple Inc.', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('154.74000000'), current=Decimal('148.5552511443217549652399188')), change_24H=Change(value=Decimal('-8.765299949511871810573057881'), percentage=-5.5716176), gain=Change(value=Decimal('-6.184748855678245034760081200'), percentage=Decimal('-3.996864970711028198759261471')), value=Price(purchase=Decimal('154.7400000000000000'), current=Decimal('148.5552511443217549652399188')), date='11-Jan-22, 03:42', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='AAPL', name='Apple Inc.', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('154.74000000'), current=Decimal('148.5552511443217549652399188')), change_24H=Change(value=Decimal('-8.765299949511871810573057881'), percentage=-5.5716176), gain=Change(value=Decimal('-6.184748855678245034760081200'), percentage=Decimal('-3.996864970711028198759261471')), value=Price(purchase=Decimal('154.7400000000000000'), current=Decimal('148.5552511443217549652399188')), date='11-Jan-22, 03:42', type='stock', currency=Currency.EUR)}], 'overview': Overview(capital=Sum(crypto=Decimal('0E-8'), stock=Decimal('1990.00000000'), total=Decimal('1990.00000000')), current=Sum(crypto=Decimal('0'), stock=Decimal('1669.087772115088676880413304'), total=Decimal('1669.087772115088676880413304')), purchase=Sum(crypto=Decimal('0'), stock=Decimal('1884.3200000000000000'), total=Decimal('1884.3200000000000000')), change_purchase=ChangeOverview(crypto=Change(value=0, percentage=0), stock=Change(value=Decimal('-215.232227884911323119586696'), percentage=Decimal('-11.42227582814550199114729430')), total=Change(value=Decimal('-215.232227884911323119586696'), percentage=Decimal('-11.42227582814550199114729430'))), change_capital=ChangeOverview(crypto=Change(value=0, percentage=0), stock=Change(value=Decimal('-320.912227884911323119586696'), percentage=Decimal('-16.12624260728197603616013548')), total=Change(value=Decimal('-320.912227884911323119586696'), percentage=Decimal('-16.12624260728197603616013548'))), change_daily=ChangeOverview(crypto=Change(value=0, percentage=0), stock=Change(value=Decimal('-32.56573382061502839341369516'), percentage=Decimal('-1.913769971796215461437235024')), total=Change(value=Decimal('-32.56573382061502839341369516'), percentage=Decimal('-1.913769971796215461437235024')))), 'user': 'sevim', 'currency': 'EUR'}"	6	daily
8	2022-05-05 23:00:01.613519+00	"{'holdings_data': [{'symbol': 'IBM', 'type': 'stock', 'name': 'International Business Machines', 'exchange': 'NYSE', 'entities': [HoldingData(symbol='IBM', name='International Business Machines', exchange='NYSE', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('123.00000000'), current=Decimal('128.7977912581247034462891247')), change_24H=Change(value=Decimal('-1.402443917241922878448056193'), percentage=-1.0771439), gain=Change(value=Decimal('5.797791258124703446289124700'), percentage=Decimal('4.713651429369677598609044472')), value=Price(purchase=Decimal('123.0000000000000000'), current=Decimal('128.7977912581247034462891247')), date='06-Mar-22, 21:47', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='IBM', name='International Business Machines', exchange='NYSE', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('123.00000000'), current=Decimal('128.7977912581247034462891247')), change_24H=Change(value=Decimal('-1.402443917241922878448056193'), percentage=-1.0771439), gain=Change(value=Decimal('5.797791258124703446289124700'), percentage=Decimal('4.713651429369677598609044472')), value=Price(purchase=Decimal('123.0000000000000000'), current=Decimal('128.7977912581247034462891247')), date='06-Mar-22, 21:47', type='stock', currency=Currency.EUR)}], 'overview': Overview(capital=Sum(crypto=Decimal('0'), stock=Decimal('0'), total=Decimal('0')), current=Sum(crypto=Decimal('0'), stock=Decimal('128.7977912581247034462891247'), total=Decimal('128.7977912581247034462891247')), purchase=Sum(crypto=Decimal('0'), stock=Decimal('123.0000000000000000'), total=Decimal('123.0000000000000000')), change_purchase=ChangeOverview(crypto=Change(value=0, percentage=0), stock=Change(value=Decimal('5.7977912581247034462891247'), percentage=Decimal('4.713651429369677598609044472')), total=Change(value=Decimal('5.7977912581247034462891247'), percentage=Decimal('4.713651429369677598609044472'))), change_capital=ChangeOverview(crypto=Change(value=0, percentage=0), stock=Change(value=Decimal('128.7977912581247034462891247'), percentage=0), total=Change(value=Decimal('128.7977912581247034462891247'), percentage=0)), change_daily=ChangeOverview(crypto=Change(value=0, percentage=0), stock=Change(value=Decimal('-1.402443917241922878448056193'), percentage=Decimal('-1.077143920172626358915021291')), total=Change(value=Decimal('-1.402443917241922878448056193'), percentage=Decimal('-1.077143920172626358915021291')))), 'user': 'admin', 'currency': 'EUR'}"	1	daily
9	2022-05-05 23:00:01.776791+00	"{'holdings_data': [{'symbol': 'QQQ', 'type': 'stock', 'name': 'Invesco QQQ Trust, Series 1', 'exchange': 'NasdaqGM', 'entities': [HoldingData(symbol='QQQ', name='Invesco QQQ Trust, Series 1', exchange='NasdaqGM', quantity=Decimal('3.00000000'), price=Price(purchase=Decimal('7.00000000'), current=Decimal('296.5987982915909055902018505')), change_24H=Change(value=Decimal('-47.19049678498273730719730682'), percentage=-5.0364094), gain=Change(value=Decimal('868.7963948747727167706055515'), percentage=Decimal('4137.125689879870079860026436')), value=Price(purchase=Decimal('21.0000000000000000'), current=Decimal('889.7963948747727167706055515')), date='15-Apr-22, 19:26', type='stock', currency=Currency.EUR), HoldingData(symbol='QQQ', name='Invesco QQQ Trust, Series 1', exchange='NasdaqGM', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('9.00000000'), current=Decimal('296.5987982915909055902018505')), change_24H=Change(value=Decimal('-15.73016559499424576906576894'), percentage=-5.0364094), gain=Change(value=Decimal('287.5987982915909055902018505'), percentage=Decimal('3195.542203239898951002242783')), value=Price(purchase=Decimal('9.0000000000000000'), current=Decimal('296.5987982915909055902018505')), date='15-Apr-22, 19:27', type='stock', currency=Currency.EUR), HoldingData(symbol='QQQ', name='Invesco QQQ Trust, Series 1', exchange='NasdaqGM', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('94.75999945418239795214116628'), current=Decimal('296.5987982915909055902018505')), change_24H=Change(value=Decimal('-15.73016559499424576906576894'), percentage=-5.0364094), gain=Change(value=Decimal('201.8387988374085076380606842'), percentage=Decimal('213.0000000000000000000000000')), value=Price(purchase=Decimal('94.75999945418239795214116628'), current=Decimal('296.5987982915909055902018505')), date='15-Apr-22, 19:34', type='stock', currency=Currency.EUR), HoldingData(symbol='QQQ', name='Invesco QQQ Trust, Series 1', exchange='NasdaqGM', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('210.3671987882849234537533892'), current=Decimal('296.5987982915909055902018505')), change_24H=Change(value=Decimal('-15.73016559499424576906576894'), percentage=-5.0364094), gain=Change(value=Decimal('86.23159950330598213644846130'), percentage=Decimal('40.99099099099099099099099097')), value=Price(purchase=Decimal('210.3671987882849234537533892'), current=Decimal('296.5987982915909055902018505')), date='15-Apr-22, 19:36', type='stock', currency=Currency.EUR), HoldingData(symbol='QQQ', name='Invesco QQQ Trust, Series 1', exchange='NasdaqGM', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('88766.00000000'), current=Decimal('296.5987982915909055902018505')), change_24H=Change(value=Decimal('-31.46033118998849153813153788'), percentage=-5.0364094), gain=Change(value=Decimal('-176938.8024034168181888195963'), percentage=Decimal('-99.66586440946804981007344946')), value=Price(purchase=Decimal('177532.0000000000000000'), current=Decimal('593.1975965831818111804037010')), date='15-Apr-22, 19:39', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='QQQ', name='Invesco QQQ Trust, Series 1', exchange='NasdaqGM', quantity=Decimal('8.00000000'), price=Price(purchase=Decimal('22233.39089978030841517573682'), current=Decimal('296.5987982915909055902018505')), change_24H=Change(value=Decimal('-125.8413247599539661525261515'), percentage=-5.0364094), gain=Change(value=Decimal('-175494.3368119097400766842798'), percentage=Decimal('-98.66597587552638385748349372')), value=Price(purchase=Decimal('44430.14089978030841517573682'), current=Decimal('2372.790386332727244721614803')), date='15-Apr-22, 19:26', type='stock', currency=Currency.EUR)}], 'overview': Overview(capital=Sum(crypto=Decimal('0E-8'), stock=Decimal('0E-8'), total=Decimal('0E-8')), current=Sum(crypto=Decimal('0'), stock=Decimal('2372.790386332727244721614803'), total=Decimal('2372.790386332727244721614803')), purchase=Sum(crypto=Decimal('0'), stock=Decimal('177867.1271982424673214058946'), total=Decimal('177867.1271982424673214058946')), change_purchase=ChangeOverview(crypto=Change(value=0, percentage=0), stock=Change(value=Decimal('-175494.3368119097400766842798'), percentage=Decimal('-98.66597587552638385748349372')), total=Change(value=Decimal('-175494.3368119097400766842798'), percentage=Decimal('-98.66597587552638385748349372'))), change_capital=ChangeOverview(crypto=Change(value=0, percentage=0), stock=Change(value=Decimal('2372.790386332727244721614803'), percentage=0), total=Change(value=Decimal('2372.790386332727244721614803'), percentage=0)), change_daily=ChangeOverview(crypto=Change(value=0, percentage=0), stock=Change(value=Decimal('-125.8413247599539661525261515'), percentage=Decimal('-5.036409495696429222471133720')), total=Change(value=Decimal('-125.8413247599539661525261515'), percentage=Decimal('-5.036409495696429222471133720')))), 'user': 'gokay', 'currency': 'EUR'}"	7	daily
10	2022-05-05 23:00:03.154313+00	"{'holdings_data': [{'symbol': 'HPQ', 'type': 'stock', 'name': 'HP Inc.', 'exchange': 'NYSE', 'entities': [HoldingData(symbol='HPQ', name='HP Inc.', exchange='NYSE', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('24.43000000'), current=Decimal('35.92351579308054383176731200')), change_24H=Change(value=Decimal('-1.402447518121902135720141814'), percentage=-3.7572975), gain=Change(value=Decimal('11.49351579308054383176731200'), percentage=Decimal('47.04672858403824736703770774')), value=Price(purchase=Decimal('24.4300000000000000'), current=Decimal('35.92351579308054383176731200')), date='07-Feb-22, 01:32', type='stock', currency=Currency.EUR), HoldingData(symbol='HPQ', name='HP Inc.', exchange='NYSE', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('25.00000000'), current=Decimal('35.92351579308054383176731200')), change_24H=Change(value=Decimal('-2.804895036243804271440283628'), percentage=-3.7572975), gain=Change(value=Decimal('21.84703158616108766353462400'), percentage=Decimal('43.69406317232217532706924800')), value=Price(purchase=Decimal('50.0000000000000000'), current=Decimal('71.84703158616108766353462400')), date='06-Feb-22, 22:32', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='HPQ', name='HP Inc.', exchange='NYSE', quantity=Decimal('3.00000000'), price=Price(purchase=Decimal('24.81000000'), current=Decimal('35.92351579308054383176731200')), change_24H=Change(value=Decimal('-4.207342554365706407160425442'), percentage=-3.7572975), gain=Change(value=Decimal('33.34054737924163149530193600'), percentage=Decimal('44.79450138283169621832854494')), value=Price(purchase=Decimal('41.47666666666666666666666667'), current=Decimal('107.7705473792416314953019360')), date='07-Feb-22, 01:32', type='stock', currency=Currency.EUR)}, {'symbol': 'AAPL', 'type': 'stock', 'name': 'Apple Inc.', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='AAPL', name='Apple Inc.', exchange='NasdaqGS', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('127.92000000'), current=Decimal('148.5552511443217549652399188')), change_24H=Change(value=Decimal('-17.53059989902374362114611576'), percentage=-5.5716176), gain=Change(value=Decimal('41.27050228864350993047983760'), percentage=Decimal('16.13137206404139693968098718')), value=Price(purchase=Decimal('255.8400000000000000'), current=Decimal('297.1105022886435099304798376')), date='06-Feb-22, 22:33', type='stock', currency=Currency.EUR), HoldingData(symbol='AAPL', name='Apple Inc.', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('126.33000000'), current=Decimal('148.5552511443217549652399188')), change_24H=Change(value=Decimal('-8.765299949511871810573057881'), percentage=-5.5716176), gain=Change(value=Decimal('22.22525114432175496523991880'), percentage=Decimal('17.59301127548623047988594855')), value=Price(purchase=Decimal('126.3300000000000000'), current=Decimal('148.5552511443217549652399188')), date='06-Feb-22, 22:34', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='AAPL', name='Apple Inc.', exchange='NasdaqGS', quantity=Decimal('3.00000000'), price=Price(purchase=Decimal('127.39000000'), current=Decimal('148.5552511443217549652399188')), change_24H=Change(value=Decimal('-26.29589984853561543171917364'), percentage=-5.5716176), gain=Change(value=Decimal('63.49575343296526489571975640'), percentage=Decimal('16.61453108118514401855712285')), value=Price(purchase=Decimal('212.6700000000000000'), current=Decimal('445.6657534329652648957197564')), date='06-Feb-22, 22:33', type='stock', currency=Currency.EUR)}, {'symbol': 'INTC', 'type': 'stock', 'name': 'Intel Corporation', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='INTC', name='Intel Corporation', exchange='NasdaqGS', quantity=Decimal('4.00000000'), price=Price(purchase=Decimal('45.20000000'), current=Decimal('42.26295975656535083327554522')), change_24H=Change(value=Decimal('-5.969882997933473523690430936'), percentage=-3.4109383), gain=Change(value=Decimal('-11.74816097373859666689781912'), percentage=Decimal('-6.497876644766922935231094646')), value=Price(purchase=Decimal('180.8000000000000000'), current=Decimal('169.0518390262614033331021809')), date='06-Feb-22, 22:35', type='stock', currency=Currency.EUR), HoldingData(symbol='INTC', name='Intel Corporation', exchange='NasdaqGS', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('45.10000000'), current=Decimal('42.26295975656535083327554522')), change_24H=Change(value=Decimal('-2.984941498966736761845215468'), percentage=-3.4109383), gain=Change(value=Decimal('-5.674080486869298333448909560'), percentage=Decimal('-6.290554863491461567016529446')), value=Price(purchase=Decimal('90.2000000000000000'), current=Decimal('84.52591951313070166655109044')), date='06-Feb-22, 22:35', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='INTC', name='Intel Corporation', exchange='NasdaqGS', quantity=Decimal('6.00000000'), price=Price(purchase=Decimal('45.16666666666666666666666667'), current=Decimal('42.26295975656535083327554522')), change_24H=Change(value=Decimal('-8.954824496900210285535646404'), percentage=-3.4109383), gain=Change(value=Decimal('-17.42224146060789500034672870'), percentage=Decimal('-6.428871387678190037028313173')), value=Price(purchase=Decimal('150.6000000000000000'), current=Decimal('253.5777585393921049996532713')), date='06-Feb-22, 22:35', type='stock', currency=Currency.EUR)}, {'symbol': 'DIS', 'type': 'stock', 'name': 'Walt Disney Company (The)', 'exchange': 'NYSE', 'entities': [HoldingData(symbol='DIS', name='Walt Disney Company (The)', exchange='NYSE', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('139.03000000'), current=Decimal('106.7092353853547977952579333')), change_24H=Change(value=Decimal('-3.392409686139719822734608091'), percentage=-3.0811617), gain=Change(value=Decimal('-32.32076461464520220474206670'), percentage=Decimal('-23.24733123401079062414016162')), value=Price(purchase=Decimal('139.0300000000000000'), current=Decimal('106.7092353853547977952579333')), date='06-Feb-22, 22:35', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='DIS', name='Walt Disney Company (The)', exchange='NYSE', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('139.03000000'), current=Decimal('106.7092353853547977952579333')), change_24H=Change(value=Decimal('-3.392409686139719822734608091'), percentage=-3.0811617), gain=Change(value=Decimal('-32.32076461464520220474206670'), percentage=Decimal('-23.24733123401079062414016162')), value=Price(purchase=Decimal('139.0300000000000000'), current=Decimal('106.7092353853547977952579333')), date='06-Feb-22, 22:35', type='stock', currency=Currency.EUR)}, {'symbol': 'NVDA', 'type': 'stock', 'name': 'NVIDIA Corporation', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='NVDA', name='NVIDIA Corporation', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('280.18000000'), current=Decimal('178.5657429714613085464218777')), change_24H=Change(value=Decimal('-14.11923423307320958585869844'), percentage=-7.3276258), gain=Change(value=Decimal('-101.6142570285386914535781223'), percentage=Decimal('-36.26749126580722801541085099')), value=Price(purchase=Decimal('280.1800000000000000'), current=Decimal('178.5657429714613085464218777')), date='06-Feb-22, 22:36', type='stock', currency=Currency.EUR), HoldingData(symbol='NVDA', name='NVIDIA Corporation', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('247.68000000'), current=Decimal('178.5657429714613085464218777')), change_24H=Change(value=Decimal('-14.11923423307320958585869844'), percentage=-7.3276258), gain=Change(value=Decimal('-69.11425702853869145357812230'), percentage=Decimal('-27.90465803800819260884129615')), value=Price(purchase=Decimal('247.6800000000000000'), current=Decimal('178.5657429714613085464218777')), date='06-Feb-22, 22:36', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='NVDA', name='NVIDIA Corporation', exchange='NasdaqGS', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('263.93000000'), current=Decimal('178.5657429714613085464218777')), change_24H=Change(value=Decimal('-28.23846846614641917171739688'), percentage=-7.3276258), gain=Change(value=Decimal('-170.7285140570773829071562446'), percentage=Decimal('-32.34352177794820272556288497')), value=Price(purchase=Decimal('263.9300000000000000'), current=Decimal('357.1314859429226170928437554')), date='06-Feb-22, 22:36', type='stock', currency=Currency.EUR)}, {'symbol': 'MSFT', 'type': 'stock', 'name': 'Microsoft Corporation', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='MSFT', name='Microsoft Corporation', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('244.18000000'), current=Decimal('262.8168584861749022661928856')), change_24H=Change(value=Decimal('-11.96819266906321013174678676'), percentage=-4.355474), gain=Change(value=Decimal('18.63685848617490226619288560'), percentage=Decimal('7.632426278227087503560031780')), value=Price(purchase=Decimal('244.1800000000000000'), current=Decimal('262.8168584861749022661928856')), date='06-Feb-22, 22:36', type='stock', currency=Currency.EUR), HoldingData(symbol='MSFT', name='Microsoft Corporation', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('250.73000000'), current=Decimal('262.8168584861749022661928856')), change_24H=Change(value=Decimal('-11.96819266906321013174678676'), percentage=-4.355474), gain=Change(value=Decimal('12.08685848617490226619288560'), percentage=Decimal('4.820667046693615549073858573')), value=Price(purchase=Decimal('250.7300000000000000'), current=Decimal('262.8168584861749022661928856')), date='06-Feb-22, 22:36', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='MSFT', name='Microsoft Corporation', exchange='NasdaqGS', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('247.45500000'), current=Decimal('262.8168584861749022661928856')), change_24H=Change(value=Decimal('-23.93638533812642026349357352'), percentage=-4.355474), gain=Change(value=Decimal('30.72371697234980453238577120'), percentage=Decimal('6.207940225970338957060025298')), value=Price(purchase=Decimal('247.4550000000000000'), current=Decimal('525.6337169723498045323857712')), date='06-Feb-22, 22:36', type='stock', currency=Currency.EUR)}, {'symbol': 'AMD', 'type': 'stock', 'name': 'Advanced Micro Devices, Inc.', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='AMD', name='Advanced Micro Devices, Inc.', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('125.61000000'), current=Decimal('88.95121148764102126686078497')), change_24H=Change(value=Decimal('-5.259175610747148426304831158'), percentage=-5.582373), gain=Change(value=Decimal('-36.65878851235897873313921503'), percentage=Decimal('-29.18460991350925780840634904')), value=Price(purchase=Decimal('125.6100000000000000'), current=Decimal('88.95121148764102126686078497')), date='06-Feb-22, 22:37', type='stock', currency=Currency.EUR), HoldingData(symbol='AMD', name='Advanced Micro Devices, Inc.', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('102.30000000'), current=Decimal('88.95121148764102126686078497')), change_24H=Change(value=Decimal('-5.259175610747148426304831158'), percentage=-5.582373), gain=Change(value=Decimal('-13.34878851235897873313921503'), percentage=Decimal('-13.04866912254054617120157872')), value=Price(purchase=Decimal('102.3000000000000000'), current=Decimal('88.95121148764102126686078497')), date='06-Feb-22, 22:37', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='AMD', name='Advanced Micro Devices, Inc.', exchange='NasdaqGS', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('113.95500000'), current=Decimal('88.95121148764102126686078497')), change_24H=Change(value=Decimal('-10.51835122149429685260966232'), percentage=-5.582373), gain=Change(value=Decimal('-50.00757702471795746627843006'), percentage=Decimal('-21.94180905827649399599773159')), value=Price(purchase=Decimal('113.9550000000000000'), current=Decimal('177.9024229752820425337215699')), date='06-Feb-22, 22:37', type='stock', currency=Currency.EUR)}, {'symbol': 'TSLA', 'type': 'stock', 'name': 'Tesla, Inc.', 'exchange': 'NasdaqGS', 'entities': [HoldingData(symbol='TSLA', name='Tesla, Inc.', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('648.28000000'), current=Decimal('827.5201232334840189813431439')), change_24H=Change(value=Decimal('-75.18255134854850389150767033'), percentage=-8.328607), gain=Change(value=Decimal('179.2401232334840189813431439'), percentage=Decimal('27.64856593346764036856653667')), value=Price(purchase=Decimal('648.2800000000000000'), current=Decimal('827.5201232334840189813431439')), date='06-Feb-22, 22:37', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='TSLA', name='Tesla, Inc.', exchange='NasdaqGS', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('648.28000000'), current=Decimal('827.5201232334840189813431439')), change_24H=Change(value=Decimal('-75.18255134854850389150767033'), percentage=-8.328607), gain=Change(value=Decimal('179.2401232334840189813431439'), percentage=Decimal('27.64856593346764036856653667')), value=Price(purchase=Decimal('648.2800000000000000'), current=Decimal('827.5201232334840189813431439')), date='06-Feb-22, 22:37', type='stock', currency=Currency.EUR)}, {'symbol': 'ETH-EUR', 'type': 'crypto', 'name': 'Ethereum EUR', 'exchange': 'CCC', 'entities': [HoldingData(symbol='ETH-EUR', name='Ethereum EUR', exchange='CCC', quantity=Decimal('0.58727200'), price=Price(purchase=Decimal('1256.00000000'), current=Decimal('2595.11720000000013897079043090343475341796875')), change_24H=Change(value=Decimal('-117.6706100595199935050914064'), percentage=-7.167559), gain=Change(value=Decimal('786.4260362784000816136540380'), percentage=Decimal('106.6176114649681639307954165')), value=Price(purchase=Decimal('737.6136320000000000'), current=Decimal('1524.039668278400081613654038')), date='09-Feb-22, 01:55', type='crypto', currency=Currency.EUR), HoldingData(symbol='ETH-EUR', name='Ethereum EUR', exchange='CCC', quantity=Decimal('0.09395902'), price=Price(purchase=Decimal('3170.00000000'), current=Decimal('2595.11720000000013897079043090343475341796875')), change_24H=Change(value=Decimal('-18.82639595280319896086439257'), percentage=-7.167559), gain=Change(value=Decimal('-54.01542450285598694244072249'), percentage=Decimal('-18.13510410094636785581102742')), value=Price(purchase=Decimal('297.8500934000000000'), current=Decimal('243.8346688971440130575592775')), date='04-Apr-22, 12:21', type='crypto', currency=Currency.EUR), HoldingData(symbol='ETH-EUR', name='Ethereum EUR', exchange='CCC', quantity=Decimal('0.20662637'), price=Price(purchase=Decimal('2654.89000000'), current=Decimal('2595.11720000000013897079043090343475341796875')), change_24H=Change(value=Decimal('-41.40134556437919771482484066'), percentage=-7.167559), gain=Change(value=Decimal('-12.35063668873597128497003723'), percentage=Decimal('-2.251422846144279462772829349')), value=Price(purchase=Decimal('548.5702834493000000'), current=Decimal('536.2196467605640287150299628')), date='03-May-22, 10:07', type='crypto', currency=Currency.EUR)], 'average': HoldingData(symbol='ETH-EUR', name='Ethereum EUR', exchange='CCC', quantity=Decimal('0.88785739'), price=Price(purchase=Decimal('1784.108604253775485272471517'), current=Decimal('2595.11720000000013897079043090343475341796875')), change_24H=Change(value=Decimal('-177.8983515767023901807806397'), percentage=-7.167559), gain=Change(value=Decimal('720.0599750868081233862432783'), percentage=Decimal('45.45735578050410144618700287')), value=Price(purchase=Decimal('647.0798448089466327931335910'), current=Decimal('2304.093983936108123386243279')), date='09-Feb-22, 01:55', type='crypto', currency=Currency.EUR)}, {'symbol': 'XRP-EUR', 'type': 'crypto', 'name': 'XRP EUR', 'exchange': 'CCC', 'entities': [HoldingData(symbol='XRP-EUR', name='XRP EUR', exchange='CCC', quantity=Decimal('240.04000000'), price=Price(purchase=Decimal('0.52090000'), current=Decimal('0.56086329999999995354897919241921044886112213134765625')), change_24H=Change(value=Decimal('-13.31936592440000005049816068'), percentage=-9.002675), gain=Change(value=Decimal('9.592790531999988849896965348'), percentage=Decimal('7.671971587636773574386483475')), value=Price(purchase=Decimal('125.0368360000000000'), current=Decimal('134.6296265319999888498969653')), date='09-Feb-22, 01:57', type='crypto', currency=Currency.EUR)], 'average': HoldingData(symbol='XRP-EUR', name='XRP EUR', exchange='CCC', quantity=Decimal('240.04000000'), price=Price(purchase=Decimal('0.52090000'), current=Decimal('0.56086329999999995354897919241921044886112213134765625')), change_24H=Change(value=Decimal('-13.31936592440000005049816068'), percentage=-9.002675), gain=Change(value=Decimal('9.592790531999988849896965348'), percentage=Decimal('7.671971587636773574386483475')), value=Price(purchase=Decimal('125.0368360000000000'), current=Decimal('134.6296265319999888498969653')), date='09-Feb-22, 01:57', type='crypto', currency=Currency.EUR)}, {'symbol': 'VWRL.AS', 'type': 'stock', 'name': 'Vanguard FTSE All-World UCITS E', 'exchange': 'Amsterdam', 'entities': [HoldingData(symbol='VWRL.AS', name='Vanguard FTSE All-World UCITS E', exchange='Amsterdam', quantity=Decimal('3.00000000'), price=Price(purchase=Decimal('103.20000000'), current=Decimal('101.7399999999999948840923025272786617279052734375')), change_24H=Change(value=Decimal('0.2399826000000000042478021101'), percentage=0.07868798), gain=Change(value=Decimal('-4.380000000000015347723092419'), percentage=Decimal('-1.414728682170547592933815381')), value=Price(purchase=Decimal('309.6000000000000000'), current=Decimal('305.2199999999999846522769076')), date='08-Feb-22, 22:35', type='stock', currency=Currency.EUR), HoldingData(symbol='VWRL.AS', name='Vanguard FTSE All-World UCITS E', exchange='Amsterdam', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('107.69000000'), current=Decimal('101.7399999999999948840923025272786617279052734375')), change_24H=Change(value=Decimal('0.1599884000000000028318680734'), percentage=0.07868798), gain=Change(value=Decimal('-11.90000000000001023181539495'), percentage=Decimal('-5.525118395394191768880766527')), value=Price(purchase=Decimal('215.3800000000000000'), current=Decimal('203.4799999999999897681846051')), date='29-Mar-22, 14:36', type='stock', currency=Currency.EUR), HoldingData(symbol='VWRL.AS', name='Vanguard FTSE All-World UCITS E', exchange='Amsterdam', quantity=Decimal('2.00000000'), price=Price(purchase=Decimal('107.69000000'), current=Decimal('101.7399999999999948840923025272786617279052734375')), change_24H=Change(value=Decimal('0.1599884000000000028318680734'), percentage=0.07868798), gain=Change(value=Decimal('-11.90000000000001023181539495'), percentage=Decimal('-5.525118395394191768880766527')), value=Price(purchase=Decimal('215.3800000000000000'), current=Decimal('203.4799999999999897681846051')), date='29-Mar-22, 14:48', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='VWRL.AS', name='Vanguard FTSE All-World UCITS E', exchange='Amsterdam', quantity=Decimal('7.00000000'), price=Price(purchase=Decimal('105.7657142857142857142857143'), current=Decimal('101.7399999999999948840923025272786617279052734375')), change_24H=Change(value=Decimal('0.5599594000000000099115382569'), percentage=0.07868798), gain=Change(value=Decimal('-28.18000000000003581135388241'), percentage=Decimal('-3.806256415797724865113442434')), value=Price(purchase=Decimal('255.7600000000000000'), current=Decimal('712.1799999999999641886461178')), date='08-Feb-22, 22:35', type='stock', currency=Currency.EUR)}, {'symbol': 'VUSA.AS', 'type': 'stock', 'name': 'Vanguard S&P 500 UCITS ETF', 'exchange': 'Amsterdam', 'entities': [HoldingData(symbol='VUSA.AS', name='Vanguard S&P 500 UCITS ETF', exchange='Amsterdam', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('74.36000000'), current=Decimal('75.0619999999999976125764078460633754730224609375')), change_24H=Change(value=Decimal('0.4849929800000000179593939720'), percentage=0.6503251), gain=Change(value=Decimal('0.7019999999999976125764078461'), percentage=Decimal('0.9440559440559408453152337898')), value=Price(purchase=Decimal('74.3600000000000000'), current=Decimal('75.06199999999999761257640785')), date='08-Feb-22, 22:35', type='stock', currency=Currency.EUR), HoldingData(symbol='VUSA.AS', name='Vanguard S&P 500 UCITS ETF', exchange='Amsterdam', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('80.89000000'), current=Decimal('75.0619999999999976125764078460633754730224609375')), change_24H=Change(value=Decimal('0.4849929800000000179593939720'), percentage=0.6503251), gain=Change(value=Decimal('-5.828000000000002387423592154'), percentage=Decimal('-7.204846087279023844014825261')), value=Price(purchase=Decimal('80.8900000000000000'), current=Decimal('75.06199999999999761257640785')), date='29-Mar-22, 14:35', type='stock', currency=Currency.EUR), HoldingData(symbol='VUSA.AS', name='Vanguard S&P 500 UCITS ETF', exchange='Amsterdam', quantity=Decimal('3.00000000'), price=Price(purchase=Decimal('75.50000000'), current=Decimal('75.0619999999999976125764078460633754730224609375')), change_24H=Change(value=Decimal('1.454978940000000053878181916'), percentage=0.6503251), gain=Change(value=Decimal('-1.314000000000007162270776462'), percentage=Decimal('-0.5801324503311289899650227204')), value=Price(purchase=Decimal('226.5000000000000000'), current=Decimal('225.1859999999999928377292235')), date='03-Mar-22, 14:54', type='stock', currency=Currency.EUR), HoldingData(symbol='VUSA.AS', name='Vanguard S&P 500 UCITS ETF', exchange='Amsterdam', quantity=Decimal('6.00000000'), price=Price(purchase=Decimal('74.87300000'), current=Decimal('75.0619999999999976125764078460633754730224609375')), change_24H=Change(value=Decimal('2.909957880000000107756363832'), percentage=0.6503251), gain=Change(value=Decimal('1.133999999999985675458447077'), percentage=Decimal('0.2524274438048396786243476902')), value=Price(purchase=Decimal('449.2380000000000000'), current=Decimal('450.3719999999999856754584471')), date='03-May-22, 09:55', type='stock', currency=Currency.EUR), HoldingData(symbol='VUSA.AS', name='Vanguard S&P 500 UCITS ETF', exchange='Amsterdam', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('76.37100000'), current=Decimal('75.0619999999999976125764078460633754730224609375')), change_24H=Change(value=Decimal('0.4849929800000000179593939720'), percentage=0.6503251), gain=Change(value=Decimal('-1.309000000000002387423592154'), percentage=Decimal('-1.714001387961402086424941606')), value=Price(purchase=Decimal('76.3710000000000000'), current=Decimal('75.06199999999999761257640785')), date='05-May-22, 13:39', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='VUSA.AS', name='Vanguard S&P 500 UCITS ETF', exchange='Amsterdam', quantity=Decimal('12.00000000'), price=Price(purchase=Decimal('75.61325000'), current=Decimal('75.0619999999999976125764078460633754730224609375')), change_24H=Change(value=Decimal('5.819915760000000215512727664'), percentage=0.6503251), gain=Change(value=Decimal('-6.615000000000028649083105847'), percentage=Decimal('-0.7290388919931392810434575341')), value=Price(purchase=Decimal('300.5457500000000000'), current=Decimal('900.7439999999999713509168942')), date='08-Feb-22, 22:35', type='stock', currency=Currency.EUR)}, {'symbol': 'IUSA.AS', 'type': 'stock', 'name': 'iShares Core S&P 500 UCITS ETF ', 'exchange': 'Amsterdam', 'entities': [HoldingData(symbol='IUSA.AS', name='iShares Core S&P 500 UCITS ETF ', exchange='Amsterdam', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('38.88000000'), current=Decimal('39.4200000000000017053025658242404460906982421875')), change_24H=Change(value=Decimal('0.2419967699999999999338484713'), percentage=0.6176853), gain=Change(value=Decimal('0.5400000000000017053025658242'), percentage=Decimal('1.388888888888893274955159013')), value=Price(purchase=Decimal('38.8800000000000000'), current=Decimal('39.42000000000000170530256582')), date='15-Feb-22, 22:36', type='stock', currency=Currency.EUR), HoldingData(symbol='IUSA.AS', name='iShares Core S&P 500 UCITS ETF ', exchange='Amsterdam', quantity=Decimal('3.00000000'), price=Price(purchase=Decimal('41.25000000'), current=Decimal('39.4200000000000017053025658242404460906982421875')), change_24H=Change(value=Decimal('0.7259903099999999998015454139'), percentage=0.6176853), gain=Change(value=Decimal('-5.489999999999994884092302528'), percentage=Decimal('-4.436363636363632229569537396')), value=Price(purchase=Decimal('123.7500000000000000'), current=Decimal('118.2600000000000051159076975')), date='29-Mar-22, 14:34', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='IUSA.AS', name='iShares Core S&P 500 UCITS ETF ', exchange='Amsterdam', quantity=Decimal('4.00000000'), price=Price(purchase=Decimal('40.65750000'), current=Decimal('39.4200000000000017053025658242404460906982421875')), change_24H=Change(value=Decimal('0.9679870799999999997353938852'), percentage=0.6176853), gain=Change(value=Decimal('-4.949999999999993178789736704'), percentage=Decimal('-3.043718871056996359091026689')), value=Price(purchase=Decimal('102.5325000000000000'), current=Decimal('157.6800000000000068212102633')), date='15-Feb-22, 22:36', type='stock', currency=Currency.EUR)}, {'symbol': 'EQQQ.PA', 'type': 'stock', 'name': 'Invesco EQQQ Nasdaq-100 UCITS E', 'exchange': 'Paris', 'entities': [HoldingData(symbol='EQQQ.PA', name='Invesco EQQQ Nasdaq-100 UCITS E', exchange='Paris', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('320.55000000'), current=Decimal('300.80000000000001136868377216160297393798828125')), change_24H=Change(value=Decimal('1.949981699999999928962779450'), percentage=0.65249515), gain=Change(value=Decimal('-19.74999999999998863131622784'), percentage=Decimal('-6.161285290906251327816636356')), value=Price(purchase=Decimal('320.5500000000000000'), current=Decimal('300.8000000000000113686837722')), date='15-Feb-22, 22:40', type='stock', currency=Currency.EUR), HoldingData(symbol='EQQQ.PA', name='Invesco EQQQ Nasdaq-100 UCITS E', exchange='Paris', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('324.25000000'), current=Decimal('300.80000000000001136868377216160297393798828125')), change_24H=Change(value=Decimal('1.949981699999999928962779450'), percentage=0.65249515), gain=Change(value=Decimal('-23.44999999999998863131622784'), percentage=Decimal('-7.232074016962217002718960012')), value=Price(purchase=Decimal('324.2500000000000000'), current=Decimal('300.8000000000000113686837722')), date='15-Feb-22, 22:40', type='stock', currency=Currency.EUR), HoldingData(symbol='EQQQ.PA', name='Invesco EQQQ Nasdaq-100 UCITS E', exchange='Paris', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('334.35000000'), current=Decimal('300.80000000000001136868377216160297393798828125')), change_24H=Change(value=Decimal('1.949981699999999928962779450'), percentage=0.65249515), gain=Change(value=Decimal('-33.54999999999998863131622784'), percentage=Decimal('-10.03439509496036746861559080')), value=Price(purchase=Decimal('334.3500000000000000'), current=Decimal('300.8000000000000113686837722')), date='29-Mar-22, 14:36', type='stock', currency=Currency.EUR), HoldingData(symbol='EQQQ.PA', name='Invesco EQQQ Nasdaq-100 UCITS E', exchange='Paris', quantity=Decimal('1.00000000'), price=Price(purchase=Decimal('334.35000000'), current=Decimal('300.80000000000001136868377216160297393798828125')), change_24H=Change(value=Decimal('1.949981699999999928962779450'), percentage=0.65249515), gain=Change(value=Decimal('-33.54999999999998863131622784'), percentage=Decimal('-10.03439509496036746861559080')), value=Price(purchase=Decimal('334.3500000000000000'), current=Decimal('300.8000000000000113686837722')), date='29-Mar-22, 14:46', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='EQQQ.PA', name='Invesco EQQQ Nasdaq-100 UCITS E', exchange='Paris', quantity=Decimal('4.00000000'), price=Price(purchase=Decimal('328.37500000'), current=Decimal('300.80000000000001136868377216160297393798828125')), change_24H=Change(value=Decimal('7.799926799999999715851117800'), percentage=0.65249515), gain=Change(value=Decimal('-110.2999999999999545252649114'), percentage=Decimal('-8.397411496003041836716019137')), value=Price(purchase=Decimal('328.3750000000000000'), current=Decimal('1203.200000000000045474735089')), date='15-Feb-22, 22:40', type='stock', currency=Currency.EUR)}, {'symbol': 'SHIB-EUR', 'type': 'crypto', 'name': 'SHIBA INU EUR', 'exchange': 'CCC', 'entities': [HoldingData(symbol='SHIB-EUR', name='SHIBA INU EUR', exchange='CCC', quantity=Decimal('25881143.00000000'), price=Price(purchase=Decimal('0.00002341'), current=Decimal('0.0000190476110000000004788926755150413328010472469031810760498046875')), change_24H=Change(value=Decimal('-37.77863196989959954278303412'), percentage=-7.117938), gain=Change(value=Decimal('-112.9036135306269876057101833'), percentage=Decimal('-18.63472447671934865915132202')), value=Price(purchase=Decimal('605.8775576300000000'), current=Decimal('492.9739440993730123942898167')), date='08-Oct-21, 15:54', type='crypto', currency=Currency.EUR)], 'average': HoldingData(symbol='SHIB-EUR', name='SHIBA INU EUR', exchange='CCC', quantity=Decimal('25881143.00000000'), price=Price(purchase=Decimal('0.00002341'), current=Decimal('0.0000190476110000000004788926755150413328010472469031810760498046875')), change_24H=Change(value=Decimal('-37.77863196989959954278303412'), percentage=-7.117938), gain=Change(value=Decimal('-112.9036135306269876057101833'), percentage=Decimal('-18.63472447671934865915132202')), value=Price(purchase=Decimal('605.8775576300000000'), current=Decimal('492.9739440993730123942898167')), date='08-Oct-21, 15:54', type='crypto', currency=Currency.EUR)}, {'symbol': 'BTC-EUR', 'type': 'crypto', 'name': 'Bitcoin EUR', 'exchange': 'CCC', 'entities': [HoldingData(symbol='BTC-EUR', name='Bitcoin EUR', exchange='CCC', quantity=Decimal('0.01190734'), price=Price(purchase=Decimal('41991.00000000'), current=Decimal('34413.8199999999997089616954326629638671875')), change_24H=Change(value=Decimal('-41.68815579424599789471358235'), percentage=-9.233969), gain=Change(value=Decimal('-90.22405850120000346549204550'), percentage=Decimal('-18.04477149865447427076827074')), value=Price(purchase=Decimal('500.0011139400000000'), current=Decimal('409.7770554387999965345079545')), date='04-Apr-22, 12:22', type='crypto', currency=Currency.EUR), HoldingData(symbol='BTC-EUR', name='Bitcoin EUR', exchange='CCC', quantity=Decimal('0.00706042'), price=Price(purchase=Decimal('36930.00000000'), current=Decimal('34413.8199999999997089616954326629638671875')), change_24H=Change(value=Decimal('-24.71886155369799875167700520'), percentage=-9.233969), gain=Change(value=Decimal('-17.76528759560000205485266633'), percentage=Decimal('-6.813376658543190606656660079')), value=Price(purchase=Decimal('260.7413106000000000'), current=Decimal('242.9760230043999979451473337')), date='15-Apr-22, 21:59', type='crypto', currency=Currency.EUR), HoldingData(symbol='BTC-EUR', name='Bitcoin EUR', exchange='CCC', quantity=Decimal('0.07049000'), price=Price(purchase=Decimal('28808.00000000'), current=Decimal('34413.8199999999997089616954326629638671875')), change_24H=Change(value=Decimal('-246.7887959809999875369612710'), percentage=-9.233969), gain=Change(value=Decimal('395.1542517999999794847099111'), percentage=Decimal('19.45924743126909090864237515')), value=Price(purchase=Decimal('2030.6759200000000000'), current=Decimal('2425.830171799999979484709911')), date='09-Feb-22, 01:55', type='crypto', currency=Currency.EUR), HoldingData(symbol='BTC-EUR', name='Bitcoin EUR', exchange='CCC', quantity=Decimal('0.00731307'), price=Price(purchase=Decimal('36930.00000000'), current=Decimal('34413.8199999999997089616954326629638671875')), change_24H=Change(value=Decimal('-25.60340105298299870700702741'), percentage=-9.233969), gain=Change(value=Decimal('-18.40100047260000212838349398'), percentage=Decimal('-6.813376658543190606656660079')), value=Price(purchase=Decimal('270.0716751000000000'), current=Decimal('251.6706746273999978716165060')), date='15-Apr-22, 21:55', type='crypto', currency=Currency.EUR), HoldingData(symbol='BTC-EUR', name='Bitcoin EUR', exchange='CCC', quantity=Decimal('0.01047422'), price=Price(purchase=Decimal('36930.00000000'), current=Decimal('34413.8199999999997089616954326629638671875')), change_24H=Change(value=Decimal('-36.67073546091799814809746749'), percentage=-9.233969), gain=Change(value=Decimal('-26.35502287960000304839923046'), percentage=Decimal('-6.813376658543190606656660079')), value=Price(purchase=Decimal('386.8129446000000000'), current=Decimal('360.4579217203999969516007695')), date='15-Apr-22, 21:55', type='crypto', currency=Currency.EUR), HoldingData(symbol='BTC-EUR', name='Bitcoin EUR', exchange='CCC', quantity=Decimal('0.01321524'), price=Price(purchase=Decimal('34051.60000000'), current=Decimal('34413.8199999999997089616954326629638671875')), change_24H=Change(value=Decimal('-46.26717503475599766346931574'), percentage=-9.233969), gain=Change(value=Decimal('4.786824232799996153858955950'), percentage=Decimal('1.063738561477286556172677445')), value=Price(purchase=Decimal('450.0000663840000000'), current=Decimal('454.7868906167999961538589559')), date='15-Apr-22, 22:15', type='crypto', currency=Currency.EUR)], 'average': HoldingData(symbol='BTC-EUR', name='Bitcoin EUR', exchange='CCC', quantity=Decimal('0.12046029'), price=Price(purchase=Decimal('32361.72709383316277920300541'), current=Decimal('34413.8199999999997089616954326629638671875')), change_24H=Change(value=Decimal('-421.7371248776009787019256692'), percentage=-9.233969), gain=Change(value=Decimal('247.1957065837999649414414302'), percentage=Decimal('6.341110597146970250161500036')), value=Price(purchase=Decimal('1352.399598672234914593016504'), current=Decimal('4145.498737207799964941441430')), date='04-Apr-22, 12:22', type='crypto', currency=Currency.EUR)}, {'symbol': 'TWTR', 'type': 'stock', 'name': 'Twitter, Inc.', 'exchange': 'NYSE', 'entities': [HoldingData(symbol='TWTR', name='Twitter, Inc.', exchange='NYSE', quantity=Decimal('5.00000000'), price=Price(purchase=Decimal('46.63054289140807039066709866'), current=Decimal('47.72113572512625507005005732')), change_24H=Change(value=Decimal('6.159399964521856077298642225'), percentage=2.64982), gain=Change(value=Decimal('5.452964168590923396914793300'), percentage=Decimal('2.338795060263242838348621274')), value=Price(purchase=Decimal('233.1527144570403519533354933'), current=Decimal('238.6056786256312753502502866')), date='03-May-22, 09:53', type='stock', currency=Currency.EUR)], 'average': HoldingData(symbol='TWTR', name='Twitter, Inc.', exchange='NYSE', quantity=Decimal('5.00000000'), price=Price(purchase=Decimal('46.63054289140807039066709866'), current=Decimal('47.72113572512625507005005732')), change_24H=Change(value=Decimal('6.159399964521856077298642225'), percentage=2.64982), gain=Change(value=Decimal('5.452964168590923396914793300'), percentage=Decimal('2.338795060263242838348621274')), value=Price(purchase=Decimal('233.1527144570403519533354933'), current=Decimal('238.6056786256312753502502866')), date='03-May-22, 09:53', type='stock', currency=Currency.EUR)}, {'symbol': 'LUNA1-EUR', 'type': 'crypto', 'name': 'Terra EUR', 'exchange': 'CCC', 'entities': [HoldingData(symbol='LUNA1-EUR', name='Terra EUR', exchange='CCC', quantity=Decimal('2.07115000'), price=Price(purchase=Decimal('76.94000000'), current=Decimal('78.1679299999999983583620632998645305633544921875')), change_24H=Change(value=Decimal('-8.046580128159999628922882664'), percentage=-4.7348356), gain=Change(value=Decimal('2.543227219499996599921587404'), percentage=Decimal('1.595957889264359706735200546')), value=Price(purchase=Decimal('159.3542810000000000'), current=Decimal('161.8975082194999965999215874')), date='09-Feb-22, 01:56', type='crypto', currency=Currency.EUR)], 'average': HoldingData(symbol='LUNA1-EUR', name='Terra EUR', exchange='CCC', quantity=Decimal('2.07115000'), price=Price(purchase=Decimal('76.94000000'), current=Decimal('78.1679299999999983583620632998645305633544921875')), change_24H=Change(value=Decimal('-8.046580128159999628922882664'), percentage=-4.7348356), gain=Change(value=Decimal('2.543227219499996599921587404'), percentage=Decimal('1.595957889264359706735200546')), value=Price(purchase=Decimal('159.3542810000000000'), current=Decimal('161.8975082194999965999215874')), date='09-Feb-22, 01:56', type='crypto', currency=Currency.EUR)}], 'overview': Overview(capital=Sum(crypto=Decimal('8550.00000000'), stock=Decimal('6250.00000000'), total=Decimal('14800.00000000')), current=Sum(crypto=Decimal('7239.093799994781086171793078'), stock=Decimal('6014.320722486623545511985788'), total=Decimal('13253.41452248140463168377887')), purchase=Sum(crypto=Decimal('6372.6057141033000000'), stock=Decimal('6122.591714457040351953335493'), total=Decimal('12495.19742856034035195333549')), change_purchase=ChangeOverview(crypto=Change(value=Decimal('866.488085891481086171793078'), percentage=Decimal('13.59707668676008888809733610')), stock=Change(value=Decimal('-108.270991970416806441349705'), percentage=Decimal('-1.768384975185601172798887842')), total=Change(value=Decimal('758.21709392106427973044338'), percentage=Decimal('6.068068137827125218354530314'))), change_capital=ChangeOverview(crypto=Change(value=Decimal('-1310.906200005218913828206922'), percentage=Decimal('-15.33223625737098144828312189')), stock=Change(value=Decimal('-235.679277513376454488014212'), percentage=Decimal('-3.770868440214023271808227392')), total=Change(value=Decimal('-1546.58547751859536831622113'), percentage=Decimal('-10.44990187512564438051500764'))), change_daily=ChangeOverview(crypto=Change(value=Decimal('-658.7800544767629681049103864'), percentage=Decimal('-8.341232926932367539743566056')), stock=Change(value=Decimal('-159.4190439557350361081687367'), percentage=Decimal('-2.582211916709940574113017086')), total=Change(value=Decimal('-818.1990984324980042130791231'), percentage=Decimal('-5.814536416892882272260061902')))), 'user': 'berkay', 'currency': 'EUR'}"	2	daily
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
91	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MjkyNTUxMiwiaWF0IjoxNjUxNjI5NTEyLCJqdGkiOiJjZmU3ZWE1ZTI2MjQ0MWVjYmY3M2Y4MGFhOTRhZDVhNSIsInVzZXJfaWQiOjJ9.-MBgbNNJjnuyHMD8_eGBL1nmCX3sloH8FcmQzEy3a4o	2022-05-04 01:58:32.454168+00	2022-05-19 01:58:32+00	2	cfe7ea5e262441ecbf73f80aa94ad5a5
92	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MjkyNzU5NiwiaWF0IjoxNjUxNjMxNTk2LCJqdGkiOiI1OTI0NThiZGM5Zjk0MDMwYTk1OGJjM2M2MWY3YTY3NSIsInVzZXJfaWQiOjJ9.sg76ms5WVK6sD6SIZwweg6izxArqyrA7vHUens_5kvs	2022-05-04 02:33:16.605148+00	2022-05-19 02:33:16+00	2	592458bdc9f94030a958bc3c61f7a675
93	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MzAzODQ1NiwiaWF0IjoxNjUxNzQyNDU2LCJqdGkiOiJlOTFlZDNjYWY3MjA0MTQ1OTVkYmJhNjQ3M2I1NjQyZSIsInVzZXJfaWQiOjJ9.NX0hSX8kFH44pnNJFntmMY83-WZ2rNi9Jj8uZwmFuw4	2022-05-05 09:20:56.631095+00	2022-05-20 09:20:56+00	2	e91ed3caf720414595dbba6473b5642e
94	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1MzA2MTM2MCwiaWF0IjoxNjUxNzY1MzYwLCJqdGkiOiI2Mjc2NmIwOWQ4MmE0NGZiYWZiYjI5ODhhY2I3NjU3NyIsInVzZXJfaWQiOjJ9.oi3akPZYg_MjbpRZuPfwq9-GyTphMPMs2duzfX9TAsY	2022-05-05 15:42:40.488155+00	2022-05-20 15:42:40+00	2	62766b09d82a44fbafbb2988acb76577
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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 64, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_apscheduler_djangojobexecution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_apscheduler_djangojobexecution_id_seq', 2, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 16, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 119, true);


--
-- Name: holdings_holding_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.holdings_holding_id_seq', 140, true);


--
-- Name: holdings_portfoliosnapshot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.holdings_portfoliosnapshot_id_seq', 10, true);


--
-- Name: token_blacklist_blacklistedtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.token_blacklist_blacklistedtoken_id_seq', 44, true);


--
-- Name: token_blacklist_outstandingtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.token_blacklist_outstandingtoken_id_seq', 94, true);


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
-- Name: django_apscheduler_djangojob django_apscheduler_djangojob_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_apscheduler_djangojob
    ADD CONSTRAINT django_apscheduler_djangojob_pkey PRIMARY KEY (id);


--
-- Name: django_apscheduler_djangojobexecution django_apscheduler_djangojobexecution_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_apscheduler_djangojobexecution
    ADD CONSTRAINT django_apscheduler_djangojobexecution_pkey PRIMARY KEY (id);


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
-- Name: holdings_portfoliosnapshot holdings_portfoliosnapshot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holdings_portfoliosnapshot
    ADD CONSTRAINT holdings_portfoliosnapshot_pkey PRIMARY KEY (id);


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
-- Name: django_apscheduler_djangojobexecution unique_job_executions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_apscheduler_djangojobexecution
    ADD CONSTRAINT unique_job_executions UNIQUE (job_id, run_time);


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
-- Name: django_apscheduler_djangojob_next_run_time_2f022619; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_apscheduler_djangojob_next_run_time_2f022619 ON public.django_apscheduler_djangojob USING btree (next_run_time);


--
-- Name: django_apscheduler_djangojobexecution_job_id_daf5090a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_apscheduler_djangojobexecution_job_id_daf5090a ON public.django_apscheduler_djangojobexecution USING btree (job_id);


--
-- Name: django_apscheduler_djangojobexecution_run_time_16edd96b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_apscheduler_djangojobexecution_run_time_16edd96b ON public.django_apscheduler_djangojobexecution USING btree (run_time);


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
-- Name: holdings_portfoliosnapshot_user_id_5a42ec48; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX holdings_portfoliosnapshot_user_id_5a42ec48 ON public.holdings_portfoliosnapshot USING btree (user_id);


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
-- Name: django_apscheduler_djangojobexecution django_apscheduler_djangojobexecution_job_id_daf5090a_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_apscheduler_djangojobexecution
    ADD CONSTRAINT django_apscheduler_djangojobexecution_job_id_daf5090a_fk FOREIGN KEY (job_id) REFERENCES public.django_apscheduler_djangojob(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: holdings_portfoliosnapshot holdings_portfoliosn_user_id_5a42ec48_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holdings_portfoliosnapshot
    ADD CONSTRAINT holdings_portfoliosn_user_id_5a42ec48_fk_accounts_ FOREIGN KEY (user_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


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

