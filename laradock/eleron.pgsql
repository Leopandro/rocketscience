--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: company; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.company (
    id bigint NOT NULL,
    inn bigint,
    name character varying(255),
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.company OWNER TO rocketscience;

--
-- Name: company_id_seq; Type: SEQUENCE; Schema: public; Owner: rocketscience
--

CREATE SEQUENCE public.company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.company_id_seq OWNER TO rocketscience;

--
-- Name: company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rocketscience
--

ALTER SEQUENCE public.company_id_seq OWNED BY public.company.id;


--
-- Name: event; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.event (
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    description text NOT NULL,
    date date NOT NULL,
    time_from time(0) without time zone NOT NULL,
    time_to time(0) without time zone NOT NULL,
    register_until_date date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.event OWNER TO rocketscience;

--
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: rocketscience
--

CREATE SEQUENCE public.event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_id_seq OWNER TO rocketscience;

--
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rocketscience
--

ALTER SEQUENCE public.event_id_seq OWNED BY public.event.id;


--
-- Name: event_user; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.event_user (
    id bigint NOT NULL,
    event_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.event_user OWNER TO rocketscience;

--
-- Name: event_user_id_seq; Type: SEQUENCE; Schema: public; Owner: rocketscience
--

CREATE SEQUENCE public.event_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_user_id_seq OWNER TO rocketscience;

--
-- Name: event_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rocketscience
--

ALTER SEQUENCE public.event_user_id_seq OWNED BY public.event_user.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO rocketscience;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: rocketscience
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO rocketscience;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rocketscience
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO rocketscience;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: rocketscience
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO rocketscience;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rocketscience
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.media (
    id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL,
    uuid uuid,
    collection_name character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    file_name character varying(255) NOT NULL,
    mime_type character varying(255),
    disk character varying(255) NOT NULL,
    conversions_disk character varying(255),
    size bigint NOT NULL,
    manipulations json NOT NULL,
    custom_properties json NOT NULL,
    generated_conversions json NOT NULL,
    responsive_images json NOT NULL,
    order_column integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.media OWNER TO rocketscience;

--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: rocketscience
--

CREATE SEQUENCE public.media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.media_id_seq OWNER TO rocketscience;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rocketscience
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO rocketscience;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: rocketscience
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO rocketscience;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rocketscience
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: mile; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.mile (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    income integer DEFAULT 0 NOT NULL,
    paid integer DEFAULT 0 NOT NULL,
    income_percent smallint DEFAULT '0'::smallint NOT NULL,
    total bigint DEFAULT '0'::bigint NOT NULL,
    active_from timestamp(0) without time zone NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.mile OWNER TO rocketscience;

--
-- Name: mile_card; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.mile_card (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    card_number character varying(255),
    active boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.mile_card OWNER TO rocketscience;

--
-- Name: mile_card_id_seq; Type: SEQUENCE; Schema: public; Owner: rocketscience
--

CREATE SEQUENCE public.mile_card_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mile_card_id_seq OWNER TO rocketscience;

--
-- Name: mile_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rocketscience
--

ALTER SEQUENCE public.mile_card_id_seq OWNED BY public.mile_card.id;


--
-- Name: mile_id_seq; Type: SEQUENCE; Schema: public; Owner: rocketscience
--

CREATE SEQUENCE public.mile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mile_id_seq OWNER TO rocketscience;

--
-- Name: mile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rocketscience
--

ALTER SEQUENCE public.mile_id_seq OWNED BY public.mile.id;


--
-- Name: mile_income; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.mile_income (
    id bigint NOT NULL,
    mile_id bigint NOT NULL,
    value bigint DEFAULT '0'::bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    order_id bigint NOT NULL,
    result_value integer
);


ALTER TABLE public.mile_income OWNER TO rocketscience;

--
-- Name: mile_income_id_seq; Type: SEQUENCE; Schema: public; Owner: rocketscience
--

CREATE SEQUENCE public.mile_income_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mile_income_id_seq OWNER TO rocketscience;

--
-- Name: mile_income_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rocketscience
--

ALTER SEQUENCE public.mile_income_id_seq OWNED BY public.mile_income.id;


--
-- Name: mile_payment; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.mile_payment (
    id bigint NOT NULL,
    mile_id bigint NOT NULL,
    mile_card_id bigint NOT NULL,
    value bigint DEFAULT '0'::bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    result_value integer
);


ALTER TABLE public.mile_payment OWNER TO rocketscience;

--
-- Name: mile_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: rocketscience
--

CREATE SEQUENCE public.mile_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mile_payment_id_seq OWNER TO rocketscience;

--
-- Name: mile_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rocketscience
--

ALTER SEQUENCE public.mile_payment_id_seq OWNED BY public.mile_payment.id;


--
-- Name: model_has_permission; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.model_has_permission (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_permission OWNER TO rocketscience;

--
-- Name: model_has_role; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.model_has_role (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_role OWNER TO rocketscience;

--
-- Name: notifications; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.notifications (
    id uuid NOT NULL,
    type character varying(255) NOT NULL,
    notifiable_type character varying(255) NOT NULL,
    notifiable_id character varying(255) NOT NULL,
    data text NOT NULL,
    read_at timestamp(0) without time zone,
    date_sent timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.notifications OWNER TO rocketscience;

--
-- Name: order; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public."order" (
    id bigint NOT NULL,
    number bigint,
    date timestamp(0) without time zone,
    total bigint,
    payment_status character varying(255),
    production_stage character varying(255),
    user_id bigint,
    company_id bigint NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    order_id bigint,
    mile_id bigint NOT NULL,
    retro_id bigint
);


ALTER TABLE public."order" OWNER TO rocketscience;

--
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: rocketscience
--

CREATE SEQUENCE public.order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_id_seq OWNER TO rocketscience;

--
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rocketscience
--

ALTER SEQUENCE public.order_id_seq OWNED BY public."order".id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO rocketscience;

--
-- Name: permission; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.permission (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permission OWNER TO rocketscience;

--
-- Name: permission_id_seq; Type: SEQUENCE; Schema: public; Owner: rocketscience
--

CREATE SEQUENCE public.permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permission_id_seq OWNER TO rocketscience;

--
-- Name: permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rocketscience
--

ALTER SEQUENCE public.permission_id_seq OWNED BY public.permission.id;


--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO rocketscience;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: rocketscience
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO rocketscience;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rocketscience
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: profile; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.profile (
    id bigint NOT NULL,
    phone bigint,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    account_type character varying(255) DEFAULT 'basic'::character varying NOT NULL,
    telegram_notify boolean DEFAULT false NOT NULL,
    email_notify boolean DEFAULT false NOT NULL,
    chat_id bigint
);


ALTER TABLE public.profile OWNER TO rocketscience;

--
-- Name: profile_id_seq; Type: SEQUENCE; Schema: public; Owner: rocketscience
--

CREATE SEQUENCE public.profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.profile_id_seq OWNER TO rocketscience;

--
-- Name: profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rocketscience
--

ALTER SEQUENCE public.profile_id_seq OWNED BY public.profile.id;


--
-- Name: retro; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.retro (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    income integer DEFAULT 0 NOT NULL,
    paid integer DEFAULT 0 NOT NULL,
    income_percent smallint DEFAULT '0'::smallint NOT NULL,
    total bigint DEFAULT '0'::bigint NOT NULL,
    active_from timestamp(0) without time zone NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.retro OWNER TO rocketscience;

--
-- Name: retro_card; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.retro_card (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    card_number character varying(255),
    active boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.retro_card OWNER TO rocketscience;

--
-- Name: retro_card_id_seq; Type: SEQUENCE; Schema: public; Owner: rocketscience
--

CREATE SEQUENCE public.retro_card_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.retro_card_id_seq OWNER TO rocketscience;

--
-- Name: retro_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rocketscience
--

ALTER SEQUENCE public.retro_card_id_seq OWNED BY public.retro_card.id;


--
-- Name: retro_id_seq; Type: SEQUENCE; Schema: public; Owner: rocketscience
--

CREATE SEQUENCE public.retro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.retro_id_seq OWNER TO rocketscience;

--
-- Name: retro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rocketscience
--

ALTER SEQUENCE public.retro_id_seq OWNED BY public.retro.id;


--
-- Name: retro_income; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.retro_income (
    id bigint NOT NULL,
    retro_id bigint NOT NULL,
    order_id bigint NOT NULL,
    value bigint DEFAULT '0'::bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    result_value integer
);


ALTER TABLE public.retro_income OWNER TO rocketscience;

--
-- Name: retro_income_id_seq; Type: SEQUENCE; Schema: public; Owner: rocketscience
--

CREATE SEQUENCE public.retro_income_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.retro_income_id_seq OWNER TO rocketscience;

--
-- Name: retro_income_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rocketscience
--

ALTER SEQUENCE public.retro_income_id_seq OWNED BY public.retro_income.id;


--
-- Name: retro_payment; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.retro_payment (
    id bigint NOT NULL,
    retro_id bigint NOT NULL,
    retro_card_id bigint NOT NULL,
    value bigint DEFAULT '0'::bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    result_value integer
);


ALTER TABLE public.retro_payment OWNER TO rocketscience;

--
-- Name: retro_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: rocketscience
--

CREATE SEQUENCE public.retro_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.retro_payment_id_seq OWNER TO rocketscience;

--
-- Name: retro_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rocketscience
--

ALTER SEQUENCE public.retro_payment_id_seq OWNED BY public.retro_payment.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.role (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.role OWNER TO rocketscience;

--
-- Name: role_has_permission; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.role_has_permission (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.role_has_permission OWNER TO rocketscience;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: rocketscience
--

CREATE SEQUENCE public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_id_seq OWNER TO rocketscience;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rocketscience
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: telegram_setting; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.telegram_setting (
    id bigint NOT NULL,
    notification_offset bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.telegram_setting OWNER TO rocketscience;

--
-- Name: telegram_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: rocketscience
--

CREATE SEQUENCE public.telegram_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.telegram_setting_id_seq OWNER TO rocketscience;

--
-- Name: telegram_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rocketscience
--

ALTER SEQUENCE public.telegram_setting_id_seq OWNED BY public.telegram_setting.id;


--
-- Name: temp_file; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.temp_file (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.temp_file OWNER TO rocketscience;

--
-- Name: temp_file_id_seq; Type: SEQUENCE; Schema: public; Owner: rocketscience
--

CREATE SEQUENCE public.temp_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.temp_file_id_seq OWNER TO rocketscience;

--
-- Name: temp_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rocketscience
--

ALTER SEQUENCE public.temp_file_id_seq OWNED BY public.temp_file.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: rocketscience
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255),
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    company_id bigint,
    first_name character varying(255),
    "position" character varying(255),
    phone character varying(255),
    last_name character varying(255),
    patronymic character varying(255)
);


ALTER TABLE public.users OWNER TO rocketscience;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: rocketscience
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO rocketscience;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rocketscience
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: company id; Type: DEFAULT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.company ALTER COLUMN id SET DEFAULT nextval('public.company_id_seq'::regclass);


--
-- Name: event id; Type: DEFAULT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.event ALTER COLUMN id SET DEFAULT nextval('public.event_id_seq'::regclass);


--
-- Name: event_user id; Type: DEFAULT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.event_user ALTER COLUMN id SET DEFAULT nextval('public.event_user_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: mile id; Type: DEFAULT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.mile ALTER COLUMN id SET DEFAULT nextval('public.mile_id_seq'::regclass);


--
-- Name: mile_card id; Type: DEFAULT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.mile_card ALTER COLUMN id SET DEFAULT nextval('public.mile_card_id_seq'::regclass);


--
-- Name: mile_income id; Type: DEFAULT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.mile_income ALTER COLUMN id SET DEFAULT nextval('public.mile_income_id_seq'::regclass);


--
-- Name: mile_payment id; Type: DEFAULT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.mile_payment ALTER COLUMN id SET DEFAULT nextval('public.mile_payment_id_seq'::regclass);


--
-- Name: order id; Type: DEFAULT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public."order" ALTER COLUMN id SET DEFAULT nextval('public.order_id_seq'::regclass);


--
-- Name: permission id; Type: DEFAULT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.permission ALTER COLUMN id SET DEFAULT nextval('public.permission_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: profile id; Type: DEFAULT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.profile ALTER COLUMN id SET DEFAULT nextval('public.profile_id_seq'::regclass);


--
-- Name: retro id; Type: DEFAULT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.retro ALTER COLUMN id SET DEFAULT nextval('public.retro_id_seq'::regclass);


--
-- Name: retro_card id; Type: DEFAULT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.retro_card ALTER COLUMN id SET DEFAULT nextval('public.retro_card_id_seq'::regclass);


--
-- Name: retro_income id; Type: DEFAULT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.retro_income ALTER COLUMN id SET DEFAULT nextval('public.retro_income_id_seq'::regclass);


--
-- Name: retro_payment id; Type: DEFAULT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.retro_payment ALTER COLUMN id SET DEFAULT nextval('public.retro_payment_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: telegram_setting id; Type: DEFAULT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.telegram_setting ALTER COLUMN id SET DEFAULT nextval('public.telegram_setting_id_seq'::regclass);


--
-- Name: temp_file id; Type: DEFAULT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.temp_file ALTER COLUMN id SET DEFAULT nextval('public.temp_file_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.company (id, inn, name, deleted_at, created_at, updated_at) FROM stdin;
1	3664069397	OZON	\N	2023-11-27 10:19:26	2023-11-27 10:19:26
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.event (id, name, description, date, time_from, time_to, register_until_date, created_at, updated_at) FROM stdin;
24	Name	Это будет мероприятие, посвященное опредлеленной тематике с определенными людьми в определенном месте	2023-12-28	00:30:00	08:00:00	2023-12-25	2023-11-29 10:21:06	2023-11-29 10:21:06
\.


--
-- Data for Name: event_user; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.event_user (id, event_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.media (id, model_type, model_id, uuid, collection_name, name, file_name, mime_type, disk, conversions_disk, size, manipulations, custom_properties, generated_conversions, responsive_images, order_column, created_at, updated_at) FROM stdin;
31	App\\Domain\\Event\\Event	20	\N	event-main-image	Снимок экрана 2023-11-23 в 14.28.13	Снимок-экрана-2023-11-23-в-14.28.13.png	image/png	secret	secret	461480	[]	[]	[]	[]	\N	2023-11-27 11:23:50	2023-11-27 11:23:50
33	App\\Domain\\Event\\Event	24	\N	event-main-image	Снимок экрана 2023-10-06 в 18.03.55	Снимок-экрана-2023-10-06-в-18.03.55.png	image/png	secret	secret	780537	[]	[]	[]	[]	\N	2023-11-29 10:21:06	2023-11-29 10:21:06
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
3	2019_08_19_000000_create_failed_jobs_table	1
4	2019_12_14_000001_create_personal_access_tokens_table	1
5	2023_10_10_105930_create_organization_table	1
6	2023_10_10_142725_add_user_fields	1
7	2023_10_11_122737_create_permission_tables	1
8	2023_10_11_122857_create_user_profile_table	1
9	2023_10_11_130244_create_media_table	1
10	2023_10_11_140318_create_bill_table	1
11	2023_10_13_135915_create_temp_file_table	1
12	2023_10_19_114910_create_jobs_table	1
13	2023_10_20_120546_create_notification_table	1
14	2023_10_25_102958_create_order_order_id	1
15	2023_10_25_143804_create_mile	1
16	2023_10_25_144415_create_mile_income	1
17	2023_10_25_144543_create_milie_card	1
18	2023_10_30_000000_create_mile_payment	1
19	2023_10_31_074939_create_order_mile_id	1
20	2023_10_31_175956_add_mile_income_order_id	1
21	2023_11_01_072600_add_profile_account_type	1
22	2023_11_03_141623_create_retro_table	1
23	2023_11_03_142323_create_retro_card_table	1
24	2023_11_03_144437_create_retro_income_table	1
25	2023_11_03_145256_create_retro_payment_table	1
26	2023_11_03_145637_create_order_retro_id	1
27	2023_11_06_174702_add_mile_result_into_mile_income_table	1
28	2023_11_07_201548_make_retro_mile_unique	1
29	2023_11_07_213906_add_profile_telegram_email_notifications	1
30	2023_11_08_155817_create_telegram_table	1
31	2023_11_08_163946_create_profile_chat_id	1
32	2023_11_08_193333_create_events_table	1
33	2023_11_08_195315_create_event_users_table	1
\.


--
-- Data for Name: mile; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.mile (id, user_id, income, paid, income_percent, total, active_from, created_at, updated_at) FROM stdin;
3	3	1800012	0	10	1800012	2023-11-27 10:49:01	2023-11-27 10:49:01	2023-11-28 14:06:37
1	1	5551000	0	10	5551000	2023-01-01 00:00:00	2023-11-27 10:18:26	2023-11-28 14:13:06
4	4	0	0	10	0	2023-11-27 00:00:00	2023-11-27 13:49:10	2023-11-27 13:49:10
\.


--
-- Data for Name: mile_card; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.mile_card (id, user_id, card_number, active, created_at, updated_at) FROM stdin;
1	3	12312312312	t	\N	\N
\.


--
-- Data for Name: mile_income; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.mile_income (id, mile_id, value, created_at, updated_at, order_id, result_value) FROM stdin;
2	3	150000	2023-11-27 10:48:35	2023-11-28 09:55:51	3	550000
3	3	50000	2023-11-27 10:49:01	2023-11-28 09:55:51	2	600000
1	3	50000	2023-11-27 10:48:25	2023-11-28 09:55:51	1	650000
7	3	150000	2023-11-27 13:49:27	2023-11-28 09:55:51	7	800000
10	3	100000	2023-11-28 09:56:07	2023-11-28 09:56:21	10	1400000
11	3	100000	2023-11-28 09:56:21	2023-11-28 13:07:21	11	1600000
5	1	150000	2023-11-27 13:48:01	2023-11-28 13:07:21	5	5250000
6	1	150000	2023-11-27 13:48:02	2023-11-28 13:07:21	6	5400000
8	3	100000	2023-11-28 09:55:51	2023-11-28 13:07:22	8	1700000
4	1	150000	2023-11-27 13:48:00	2023-11-28 14:06:37	4	5550000
9	3	100012	2023-11-28 09:56:03	2023-11-28 14:06:37	9	1800012
12	1	1000	2023-11-28 14:13:06	2023-11-28 14:13:06	13	5551000
\.


--
-- Data for Name: mile_payment; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.mile_payment (id, mile_id, mile_card_id, value, created_at, updated_at, result_value) FROM stdin;
1	3	1	1500	\N	\N	25000
\.


--
-- Data for Name: model_has_permission; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.model_has_permission (permission_id, model_type, model_id) FROM stdin;
\.


--
-- Data for Name: model_has_role; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.model_has_role (role_id, model_type, model_id) FROM stdin;
1	App\\Domain\\User\\Model\\User	1
2	App\\Domain\\User\\Model\\User	3
2	App\\Domain\\User\\Model\\User	4
3	App\\Domain\\User\\Model\\User	6
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.notifications (id, type, notifiable_type, notifiable_id, data, read_at, date_sent, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public."order" (id, number, date, total, payment_status, production_stage, user_id, company_id, deleted_at, created_at, updated_at, order_id, mile_id, retro_id) FROM stdin;
5	12341234	2023-03-30 00:00:00	1500000	paid	issued	1	1	\N	2023-11-27 13:48:01	2023-11-28 13:07:21	\N	1	1
6	12341234	2023-03-30 00:00:00	1500000	paid	issued	1	1	\N	2023-11-27 13:48:02	2023-11-28 13:07:21	\N	1	1
3	12341234	2023-03-30 00:00:00	1500000	paid	issued	3	1	\N	2023-11-27 10:48:35	2023-11-28 09:55:51	\N	1	1
2	12341234	2023-03-30 00:00:00	500000	paid	issued	3	1	\N	2023-11-27 10:48:25	2023-11-28 09:55:51	\N	1	1
1	12341234	2023-03-30 00:00:00	500000	paid	shipping	3	1	\N	2023-11-27 10:48:00	2023-11-28 09:55:51	\N	1	1
7	12341234	2023-03-30 00:00:00	1500000	paid	issued	3	1	\N	2023-11-27 13:49:27	2023-11-28 09:55:51	\N	3	3
4	12341234	2023-03-30 00:00:00	1500000	paid	issued	1	1	\N	2023-11-27 13:48:00	2023-11-28 14:06:37	\N	1	1
9	12341234	2222-01-03 00:00:00	1000120	wait_for_payment	accepted	3	1	\N	2023-11-28 09:56:03	2023-11-28 14:06:49	8	3	3
13	13241234	2023-11-10 00:00:00	10000	paid	accepted	1	1	\N	2023-11-28 14:13:06	2023-11-28 14:13:06	\N	1	1
14	123123	2023-11-10 00:00:00	500000	cancelled	accepted	1	1	\N	2023-11-28 14:13:52	2023-11-28 14:13:52	\N	1	1
15	123123	2023-11-30 00:00:00	2342314	wait_for_payment	accepted	1	1	\N	2023-11-28 17:03:16	2023-11-28 17:03:16	\N	1	1
16	5555	2023-11-11 00:00:00	555	wait_for_payment	received	3	1	\N	2023-11-28 17:04:02	2023-11-28 17:04:02	\N	3	3
10	12341234	2222-01-16 00:00:00	1000000	wait_for_payment	shipping	3	1	\N	2023-11-28 09:56:07	2023-11-28 17:17:19	8	3	3
11	12341234	2222-01-11 00:00:00	1002345	wait_for_payment	issued	3	1	\N	2023-11-28 09:56:21	2023-11-28 17:17:29	8	3	3
17	7777666	2023-11-24 00:00:00	9000000	paid	by_parts	3	1	\N	2023-11-28 17:45:55	2023-11-28 17:45:55	\N	3	3
8	12341234	2023-11-28 00:00:00	1000000	paid	by_parts	3	1	\N	2023-11-28 09:55:51	2023-11-28 13:07:21	\N	3	3
12	13241234	2023-11-10 00:00:00	1234	paid	accepted	1	1	\N	2023-11-28 14:12:31	2023-11-28 17:45:55	\N	1	1
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.permission (id, name, guard_name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
2	App\\Domain\\User\\Model\\User	1	auth-token	d24bbb5a0de97d4164f602dbf277b045d3134406c5d5e6c9136cd4ff46e73d3e	["*"]	\N	\N	2023-11-27 10:19:18	2023-11-27 10:19:18
14	App\\Domain\\User\\Model\\User	1	auth-token	9dee3522603428bf83cee24bb093a8f65999d2d176154839cec663b247eb4def	["*"]	2023-11-28 12:15:17	\N	2023-11-28 12:14:58	2023-11-28 12:15:17
10	App\\Domain\\User\\Model\\User	1	auth-token	b65ee671aa73f56d66066791d6421ec00cde861316209cf5c1d05ce1cef74890	["*"]	2023-11-28 12:09:25	\N	2023-11-28 12:08:00	2023-11-28 12:09:25
15	App\\Domain\\User\\Model\\User	1	auth-token	1b28bf45b63b08d92f523efc445ce121ab9f9409817d7aa740f515659e5ae289	["*"]	2023-11-28 12:15:23	\N	2023-11-28 12:15:23	2023-11-28 12:15:23
11	App\\Domain\\User\\Model\\User	1	auth-token	4d0a8463ca6158c1b24aaba04811fb7c713c1bae1063edcc7667aa381523a9a3	["*"]	2023-11-28 12:09:49	\N	2023-11-28 12:09:36	2023-11-28 12:09:49
20	App\\Domain\\User\\Model\\User	1	auth-token	3005a2d1496797b2bf9305d8d523b8f6e1da898fd3e861bfd47f1d67f514c579	["*"]	2023-11-30 15:24:57	\N	2023-11-29 12:33:20	2023-11-30 15:24:57
16	App\\Domain\\User\\Model\\User	1	auth-token	e4a40ea04852476d43a061d5d67338dfbc4e5a323415bc01c03b7aa8255b8eda	["*"]	2023-11-28 12:15:51	\N	2023-11-28 12:15:38	2023-11-28 12:15:51
3	App\\Domain\\User\\Model\\User	1	auth-token	870c2a13fe574b89955b95ff23a2090d24e97335e4344b0175464d335da20def	["*"]	2023-11-28 12:03:41	\N	2023-11-28 09:51:17	2023-11-28 12:03:41
5	App\\Domain\\User\\Model\\User	1	auth-token	962dd948d41d84bc30645c7d40f76112fe77924063a9d541e386ffb7cb687b99	["*"]	\N	\N	2023-11-28 12:04:38	2023-11-28 12:04:38
1	App\\Domain\\User\\Model\\User	1	auth-token	7022c6429a56afd708959f515b6de1e9f9ed4f628059b6ae75e866445ce6b243	["*"]	2023-11-28 10:21:49	\N	2023-11-27 10:19:07	2023-11-28 10:21:49
6	App\\Domain\\User\\Model\\User	1	auth-token	cb062b2f23af7f26744512e6cb9d0c77f4ce19d32fefe480c313c3b13d77b6dc	["*"]	2023-11-28 12:07:31	\N	2023-11-28 12:05:11	2023-11-28 12:07:31
17	App\\Domain\\User\\Model\\User	1	auth-token	06472163699c411158185c8f3f647c9635c953946015332854308cbf1e590961	["*"]	2023-11-28 18:18:00	\N	2023-11-28 12:15:58	2023-11-28 18:18:00
12	App\\Domain\\User\\Model\\User	1	auth-token	1a4428341133be53d9ef98df06f204562d8dd9dcb4bf96f6e3bc802e70ac3488	["*"]	2023-11-28 12:13:27	\N	2023-11-28 12:09:52	2023-11-28 12:13:27
7	App\\Domain\\User\\Model\\User	1	auth-token	68d83c3d97063180017b0cc39064afa265a68bccab2d43dfca104d8f3c754b0c	["*"]	2023-11-28 12:07:43	\N	2023-11-28 12:07:34	2023-11-28 12:07:43
8	App\\Domain\\User\\Model\\User	1	auth-token	d9a5ea34bb6316d4146f3c171ebefe60c3efa112fe804031929cd66f3b084e39	["*"]	2023-11-28 12:07:52	\N	2023-11-28 12:07:46	2023-11-28 12:07:52
9	App\\Domain\\User\\Model\\User	1	auth-token	7be7ae2a70d689aed858d88d1ccd1f13154b020b98367ff8988c1e7cb60d94f8	["*"]	2023-11-28 12:07:55	\N	2023-11-28 12:07:55	2023-11-28 12:07:55
19	App\\Domain\\User\\Model\\User	1	auth-token	9742f83c273f787b1ae9e71b79c27262b0b69d254156e1fd1ac5a020a1969052	["*"]	2023-11-30 15:25:17	\N	2023-11-28 18:22:56	2023-11-30 15:25:17
13	App\\Domain\\User\\Model\\User	1	auth-token	87bf4fd94dfd97a9602e5b510f35c17c969477630e8e39a7bc99cd099bca5eb1	["*"]	2023-11-28 12:14:52	\N	2023-11-28 12:13:35	2023-11-28 12:14:52
18	App\\Domain\\User\\Model\\User	1	auth-token	b6dd957a5b18535b826a07fc5568b429d3d6e9c2bd8d55893e46e65c53749d3e	["*"]	2023-11-28 18:22:50	\N	2023-11-28 18:22:33	2023-11-28 18:22:50
4	App\\Domain\\User\\Model\\User	3	auth-token	afdbc5f765e53d3e9c12c1af7aa4b9df88524a39b4812e9e261f04a7d79b9369	["*"]	2023-11-30 14:58:34	\N	2023-11-28 10:22:26	2023-11-30 14:58:34
\.


--
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.profile (id, phone, user_id, created_at, updated_at, account_type, telegram_notify, email_notify, chat_id) FROM stdin;
4	\N	4	2023-11-27 13:49:10	2023-11-27 13:49:10	pro	f	f	\N
1	\N	1	2023-11-27 10:18:26	2023-11-28 13:07:21	vip	f	f	\N
3	\N	3	2023-11-27 10:49:01	2023-11-28 17:45:55	vip	f	f	\N
6	\N	6	2023-11-28 18:16:23	2023-11-28 18:16:23	basic	f	f	\N
\.


--
-- Data for Name: retro; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.retro (id, user_id, income, paid, income_percent, total, active_from, created_at, updated_at) FROM stdin;
2	4	0	0	8	0	2023-01-01 00:00:00	2023-11-27 13:49:10	2023-11-27 13:49:10
3	3	640000	0	8	640000	2023-01-01 00:00:00	2023-11-27 13:49:10	2023-11-28 13:07:21
1	1	360800	0	8	360800	2023-01-01 00:00:00	2023-11-27 10:18:26	2023-11-28 14:13:06
\.


--
-- Data for Name: retro_card; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.retro_card (id, user_id, card_number, active, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: retro_income; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.retro_income (id, retro_id, order_id, value, created_at, updated_at, result_value) FROM stdin;
1	3	3	120000	2023-11-28 09:55:51	2023-11-28 09:55:51	120000
2	3	2	40000	2023-11-28 09:55:51	2023-11-28 09:55:51	160000
3	3	1	40000	2023-11-28 09:55:51	2023-11-28 09:55:51	200000
4	3	7	120000	2023-11-28 09:55:51	2023-11-28 09:55:51	320000
5	3	9	80000	2023-11-28 09:56:03	2023-11-28 09:56:03	400000
6	3	8	80000	2023-11-28 09:56:07	2023-11-28 09:56:07	480000
7	3	10	80000	2023-11-28 09:56:21	2023-11-28 09:56:21	560000
8	3	11	80000	2023-11-28 13:07:21	2023-11-28 13:07:21	640000
9	1	5	120000	2023-11-28 13:07:21	2023-11-28 13:07:21	120000
10	1	6	120000	2023-11-28 13:07:22	2023-11-28 13:07:22	240000
11	1	4	120000	2023-11-28 14:06:37	2023-11-28 14:06:37	360000
12	1	13	800	2023-11-28 14:13:06	2023-11-28 14:13:06	360800
\.


--
-- Data for Name: retro_payment; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.retro_payment (id, retro_id, retro_card_id, value, created_at, updated_at, result_value) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.role (id, name, guard_name, created_at, updated_at) FROM stdin;
1	admin	web	2023-11-27 10:18:25	2023-11-27 10:18:25
2	manager	web	2023-11-27 10:18:25	2023-11-27 10:18:25
3	auditor	web	2023-11-27 10:18:25	2023-11-27 10:18:25
4	projector	web	2023-11-27 10:18:25	2023-11-27 10:18:25
\.


--
-- Data for Name: role_has_permission; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.role_has_permission (permission_id, role_id) FROM stdin;
\.


--
-- Data for Name: telegram_setting; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.telegram_setting (id, notification_offset, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: temp_file; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.temp_file (id, created_at, updated_at) FROM stdin;
1	\N	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: rocketscience
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, company_id, first_name, "position", phone, last_name, patronymic) FROM stdin;
1	\N	admin_0@example.net	2023-11-27 10:18:26	$2y$10$fZkq95kPwOjg2HUBKJU87eiZaJ.nLtxc3HfYqeJ2a/OJXUz0ShJHe	\N	2023-11-27 10:18:26	2023-11-27 10:18:26	\N	Сергеевич	\N	\N	Анатолий	Дмитриев
4	\N	alexeiyag@mail.ru	\N	$2y$10$cwS4AyG74khoqiPbRs346OpmPgTgBondeSjWunLNbEJjTeysSDDee	\N	2023-11-27 13:49:10	2023-11-27 13:49:10	1	Alexey	\N	\N	Alexey	Vitalievich
3	\N	manager_0@example.net	\N	$2y$10$fZkq95kPwOjg2HUBKJU87eiZaJ.nLtxc3HfYqeJ2a/OJXUz0ShJHe	\N	2023-11-27 10:49:01	2023-11-27 10:49:01	1	Alexey	\N	\N	Alexey	Vitalievich
6	\N	asdfdsaf@asdasd.asd	\N	$2y$10$HuDG19.Z7RtDH1ueMAJt2OC/4E0eyl.fJmPyo80QXXdswf/3AcpHq	\N	2023-11-28 18:16:23	2023-11-28 18:16:23	1	12341324	\N	\N	1451345	asdfasdf
\.


--
-- Name: company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rocketscience
--

SELECT pg_catalog.setval('public.company_id_seq', 2, true);


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rocketscience
--

SELECT pg_catalog.setval('public.event_id_seq', 24, true);


--
-- Name: event_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rocketscience
--

SELECT pg_catalog.setval('public.event_user_id_seq', 1, false);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rocketscience
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rocketscience
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rocketscience
--

SELECT pg_catalog.setval('public.media_id_seq', 33, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rocketscience
--

SELECT pg_catalog.setval('public.migrations_id_seq', 33, true);


--
-- Name: mile_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rocketscience
--

SELECT pg_catalog.setval('public.mile_card_id_seq', 1, false);


--
-- Name: mile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rocketscience
--

SELECT pg_catalog.setval('public.mile_id_seq', 4, true);


--
-- Name: mile_income_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rocketscience
--

SELECT pg_catalog.setval('public.mile_income_id_seq', 13, true);


--
-- Name: mile_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rocketscience
--

SELECT pg_catalog.setval('public.mile_payment_id_seq', 1, false);


--
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rocketscience
--

SELECT pg_catalog.setval('public.order_id_seq', 17, true);


--
-- Name: permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rocketscience
--

SELECT pg_catalog.setval('public.permission_id_seq', 1, false);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rocketscience
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 20, true);


--
-- Name: profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rocketscience
--

SELECT pg_catalog.setval('public.profile_id_seq', 6, true);


--
-- Name: retro_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rocketscience
--

SELECT pg_catalog.setval('public.retro_card_id_seq', 1, false);


--
-- Name: retro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rocketscience
--

SELECT pg_catalog.setval('public.retro_id_seq', 2, true);


--
-- Name: retro_income_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rocketscience
--

SELECT pg_catalog.setval('public.retro_income_id_seq', 12, true);


--
-- Name: retro_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rocketscience
--

SELECT pg_catalog.setval('public.retro_payment_id_seq', 1, false);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rocketscience
--

SELECT pg_catalog.setval('public.role_id_seq', 4, true);


--
-- Name: telegram_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rocketscience
--

SELECT pg_catalog.setval('public.telegram_setting_id_seq', 1, false);


--
-- Name: temp_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rocketscience
--

SELECT pg_catalog.setval('public.temp_file_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rocketscience
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- Name: event_user event_user_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.event_user
    ADD CONSTRAINT event_user_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: media media_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_uuid_unique UNIQUE (uuid);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: mile_card mile_card_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.mile_card
    ADD CONSTRAINT mile_card_pkey PRIMARY KEY (id);


--
-- Name: mile_income mile_income_order_id_unique; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.mile_income
    ADD CONSTRAINT mile_income_order_id_unique UNIQUE (order_id);


--
-- Name: mile_income mile_income_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.mile_income
    ADD CONSTRAINT mile_income_pkey PRIMARY KEY (id);


--
-- Name: mile_payment mile_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.mile_payment
    ADD CONSTRAINT mile_payment_pkey PRIMARY KEY (id);


--
-- Name: mile mile_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.mile
    ADD CONSTRAINT mile_pkey PRIMARY KEY (id);


--
-- Name: model_has_permission model_has_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.model_has_permission
    ADD CONSTRAINT model_has_permission_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- Name: model_has_role model_has_role_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.model_has_role
    ADD CONSTRAINT model_has_role_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- Name: permission permission_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT permission_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: permission permission_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: profile profile_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id);


--
-- Name: retro_card retro_card_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.retro_card
    ADD CONSTRAINT retro_card_pkey PRIMARY KEY (id);


--
-- Name: retro_income retro_income_order_id_unique; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.retro_income
    ADD CONSTRAINT retro_income_order_id_unique UNIQUE (order_id);


--
-- Name: retro_income retro_income_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.retro_income
    ADD CONSTRAINT retro_income_pkey PRIMARY KEY (id);


--
-- Name: retro_payment retro_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.retro_payment
    ADD CONSTRAINT retro_payment_pkey PRIMARY KEY (id);


--
-- Name: retro retro_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.retro
    ADD CONSTRAINT retro_pkey PRIMARY KEY (id);


--
-- Name: role_has_permission role_has_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.role_has_permission
    ADD CONSTRAINT role_has_permission_pkey PRIMARY KEY (permission_id, role_id);


--
-- Name: role role_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: telegram_setting telegram_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.telegram_setting
    ADD CONSTRAINT telegram_setting_pkey PRIMARY KEY (id);


--
-- Name: temp_file temp_file_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.temp_file
    ADD CONSTRAINT temp_file_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: rocketscience
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: media_model_type_model_id_index; Type: INDEX; Schema: public; Owner: rocketscience
--

CREATE INDEX media_model_type_model_id_index ON public.media USING btree (model_type, model_id);


--
-- Name: media_order_column_index; Type: INDEX; Schema: public; Owner: rocketscience
--

CREATE INDEX media_order_column_index ON public.media USING btree (order_column);


--
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: public; Owner: rocketscience
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permission USING btree (model_id, model_type);


--
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: public; Owner: rocketscience
--

CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_role USING btree (model_id, model_type);


--
-- Name: notifications_notifiable_type_notifiable_id_index; Type: INDEX; Schema: public; Owner: rocketscience
--

CREATE INDEX notifications_notifiable_type_notifiable_id_index ON public.notifications USING btree (notifiable_type, notifiable_id);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: rocketscience
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: rocketscience
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: event_user event_user_event_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.event_user
    ADD CONSTRAINT event_user_event_id_foreign FOREIGN KEY (event_id) REFERENCES public.event(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: event_user event_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.event_user
    ADD CONSTRAINT event_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: mile_card mile_card_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.mile_card
    ADD CONSTRAINT mile_card_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: mile_income mile_income_mile_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.mile_income
    ADD CONSTRAINT mile_income_mile_id_foreign FOREIGN KEY (mile_id) REFERENCES public.mile(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: mile_income mile_income_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.mile_income
    ADD CONSTRAINT mile_income_order_id_foreign FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: mile_payment mile_payment_mile_card_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.mile_payment
    ADD CONSTRAINT mile_payment_mile_card_id_foreign FOREIGN KEY (mile_card_id) REFERENCES public.mile_card(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: mile_payment mile_payment_mile_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.mile_payment
    ADD CONSTRAINT mile_payment_mile_id_foreign FOREIGN KEY (mile_id) REFERENCES public.mile(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: mile mile_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.mile
    ADD CONSTRAINT mile_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: model_has_permission model_has_permission_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.model_has_permission
    ADD CONSTRAINT model_has_permission_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permission(id) ON DELETE CASCADE;


--
-- Name: model_has_role model_has_role_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.model_has_role
    ADD CONSTRAINT model_has_role_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.role(id) ON DELETE CASCADE;


--
-- Name: order order_company_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_company_id_foreign FOREIGN KEY (company_id) REFERENCES public.company(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: order order_mile_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_mile_id_foreign FOREIGN KEY (mile_id) REFERENCES public.mile(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order order_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_order_id_foreign FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order order_retro_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_retro_id_foreign FOREIGN KEY (retro_id) REFERENCES public.retro(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order order_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: profile profile_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: retro_card retro_card_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.retro_card
    ADD CONSTRAINT retro_card_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: retro_income retro_income_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.retro_income
    ADD CONSTRAINT retro_income_order_id_foreign FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: retro_income retro_income_retro_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.retro_income
    ADD CONSTRAINT retro_income_retro_id_foreign FOREIGN KEY (retro_id) REFERENCES public.retro(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: retro_payment retro_payment_retro_card_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.retro_payment
    ADD CONSTRAINT retro_payment_retro_card_id_foreign FOREIGN KEY (retro_card_id) REFERENCES public.retro_card(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: retro_payment retro_payment_retro_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.retro_payment
    ADD CONSTRAINT retro_payment_retro_id_foreign FOREIGN KEY (retro_id) REFERENCES public.retro(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: retro retro_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.retro
    ADD CONSTRAINT retro_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: role_has_permission role_has_permission_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.role_has_permission
    ADD CONSTRAINT role_has_permission_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permission(id) ON DELETE CASCADE;


--
-- Name: role_has_permission role_has_permission_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.role_has_permission
    ADD CONSTRAINT role_has_permission_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.role(id) ON DELETE CASCADE;


--
-- Name: users users_company_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rocketscience
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_company_id_foreign FOREIGN KEY (company_id) REFERENCES public.company(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

