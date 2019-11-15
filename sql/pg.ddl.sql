--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: ppmbest; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA ppmbest;

SELECT pg_catalog.set_config('search_path', 'ppmbest', false);

ALTER SCHEMA ppmbest OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alipay_config; Type: TABLE; Schema: ppmbest; Owner: postgres
--

CREATE TABLE alipay_config (
    id bigint NOT NULL,
    app_id character varying(255),
    charset character varying(255),
    format character varying(255),
    gateway_url character varying(255),
    notify_url character varying(255),
    private_key text,
    public_key text,
    return_url character varying(255),
    sign_type character varying(255),
    sys_service_provider_id character varying(255)
);


ALTER TABLE alipay_config OWNER TO postgres;

--
-- Name: dept; Type: TABLE; Schema: ppmbest; Owner: postgres
--

CREATE TABLE dept (
    id bigint NOT NULL,
    create_time timestamp without time zone,
    enabled character(1) NOT NULL,
    name character varying(255) NOT NULL,
    pid bigint NOT NULL
);


ALTER TABLE dept OWNER TO postgres;

--
-- Name: dept_id_seq; Type: SEQUENCE; Schema: ppmbest; Owner: postgres
--

CREATE SEQUENCE dept_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dept_id_seq OWNER TO postgres;

--
-- Name: dept_id_seq; Type: SEQUENCE OWNED BY; Schema: ppmbest; Owner: postgres
--

ALTER SEQUENCE dept_id_seq OWNED BY dept.id;


--
-- Name: dict; Type: TABLE; Schema: ppmbest; Owner: postgres
--

CREATE TABLE dict (
    id bigint NOT NULL,
    create_time timestamp without time zone,
    name character varying(255) NOT NULL,
    remark character varying(255)
);


ALTER TABLE dict OWNER TO postgres;

--
-- Name: dict_detail; Type: TABLE; Schema: ppmbest; Owner: postgres
--

CREATE TABLE dict_detail (
    id bigint NOT NULL,
    create_time timestamp without time zone,
    label character varying(255) NOT NULL,
    sort character varying(255),
    value character varying(255) NOT NULL,
    dict_id bigint
);


ALTER TABLE dict_detail OWNER TO postgres;

--
-- Name: dict_detail_id_seq; Type: SEQUENCE; Schema: ppmbest; Owner: postgres
--

CREATE SEQUENCE dict_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dict_detail_id_seq OWNER TO postgres;

--
-- Name: dict_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: ppmbest; Owner: postgres
--

ALTER SEQUENCE dict_detail_id_seq OWNED BY dict_detail.id;


--
-- Name: dict_id_seq; Type: SEQUENCE; Schema: ppmbest; Owner: postgres
--

CREATE SEQUENCE dict_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dict_id_seq OWNER TO postgres;

--
-- Name: dict_id_seq; Type: SEQUENCE OWNED BY; Schema: ppmbest; Owner: postgres
--

ALTER SEQUENCE dict_id_seq OWNED BY dict.id;


--
-- Name: email_config; Type: TABLE; Schema: ppmbest; Owner: postgres
--

CREATE TABLE email_config (
    id bigint NOT NULL,
    from_user character varying(255),
    host character varying(255),
    pass character varying(255),
    port character varying(255),
    username character varying(255)
);


ALTER TABLE email_config OWNER TO postgres;

--
-- Name: gen_config; Type: TABLE; Schema: ppmbest; Owner: postgres
--

CREATE TABLE gen_config (
    id bigint NOT NULL,
    api_path character varying(255),
    author character varying(255),
    cover boolean,
    module_name character varying(255),
    pack character varying(255),
    path character varying(255),
    prefix character varying(255)
);


ALTER TABLE gen_config OWNER TO postgres;

--
-- Name: job; Type: TABLE; Schema: ppmbest; Owner: postgres
--

CREATE TABLE job (
    id bigint NOT NULL,
    create_time timestamp without time zone,
    enabled boolean NOT NULL,
    name character varying(255) NOT NULL,
    sort bigint NOT NULL,
    dept_id bigint
);


ALTER TABLE job OWNER TO postgres;

--
-- Name: job_id_seq; Type: SEQUENCE; Schema: ppmbest; Owner: postgres
--

CREATE SEQUENCE job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE job_id_seq OWNER TO postgres;

--
-- Name: job_id_seq; Type: SEQUENCE OWNED BY; Schema: ppmbest; Owner: postgres
--

ALTER SEQUENCE job_id_seq OWNED BY job.id;


--
-- Name: local_storage; Type: TABLE; Schema: ppmbest; Owner: postgres
--

CREATE TABLE local_storage (
    id bigint NOT NULL,
    create_time timestamp without time zone,
    name character varying(255),
    operate character varying(255),
    path character varying(255),
    real_name character varying(255),
    size character varying(255),
    suffix character varying(255),
    type character varying(255)
);


ALTER TABLE local_storage OWNER TO postgres;

--
-- Name: local_storage_id_seq; Type: SEQUENCE; Schema: ppmbest; Owner: postgres
--

CREATE SEQUENCE local_storage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE local_storage_id_seq OWNER TO postgres;

--
-- Name: local_storage_id_seq; Type: SEQUENCE OWNED BY; Schema: ppmbest; Owner: postgres
--

ALTER SEQUENCE local_storage_id_seq OWNED BY local_storage.id;


--
-- Name: log; Type: TABLE; Schema: ppmbest; Owner: postgres
--

CREATE TABLE log (
    id bigint NOT NULL,
    address character varying(255),
    browser character varying(255),
    create_time timestamp without time zone,
    description character varying(255),
    exception_detail text,
    log_type character varying(255),
    method character varying(255),
    params text,
    request_ip character varying(255),
    "time" bigint,
    username character varying(255)
);


ALTER TABLE log OWNER TO postgres;

--
-- Name: log_id_seq; Type: SEQUENCE; Schema: ppmbest; Owner: postgres
--

CREATE SEQUENCE log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE log_id_seq OWNER TO postgres;

--
-- Name: log_id_seq; Type: SEQUENCE OWNED BY; Schema: ppmbest; Owner: postgres
--

ALTER SEQUENCE log_id_seq OWNED BY log.id;


--
-- Name: menu; Type: TABLE; Schema: ppmbest; Owner: postgres
--

CREATE TABLE menu (
    id bigint NOT NULL,
    cache boolean,
    component character varying(255),
    component_name character varying(255),
    create_time timestamp without time zone,
    hidden boolean,
    i_frame boolean,
    icon character varying(255),
    name character varying(255),
    path character varying(255),
    permission character varying(255),
    pid bigint NOT NULL,
    sort bigint,
    type integer
);


ALTER TABLE menu OWNER TO postgres;

--
-- Name: menu_id_seq; Type: SEQUENCE; Schema: ppmbest; Owner: postgres
--

CREATE SEQUENCE menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE menu_id_seq OWNER TO postgres;

--
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: ppmbest; Owner: postgres
--

ALTER SEQUENCE menu_id_seq OWNED BY menu.id;


--
-- Name: picture; Type: TABLE; Schema: ppmbest; Owner: postgres
--

CREATE TABLE picture (
    id bigint NOT NULL,
    create_time timestamp without time zone,
    delete_url character varying(255),
    filename character varying(255),
    height character varying(255),
    md5code character varying(255),
    size character varying(255),
    url character varying(255),
    username character varying(255),
    width character varying(255)
);


ALTER TABLE picture OWNER TO postgres;

--
-- Name: picture_id_seq; Type: SEQUENCE; Schema: ppmbest; Owner: postgres
--

CREATE SEQUENCE picture_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE picture_id_seq OWNER TO postgres;

--
-- Name: picture_id_seq; Type: SEQUENCE OWNED BY; Schema: ppmbest; Owner: postgres
--

ALTER SEQUENCE picture_id_seq OWNED BY picture.id;


--
-- Name: qiniu_config; Type: TABLE; Schema: ppmbest; Owner: postgres
--

CREATE TABLE qiniu_config (
    id bigint NOT NULL,
    access_key text,
    bucket character varying(255),
    host character varying(255),
    secret_key text,
    type character varying(255),
    zone character varying(255)
);


ALTER TABLE qiniu_config OWNER TO postgres;

--
-- Name: qiniu_content; Type: TABLE; Schema: ppmbest; Owner: postgres
--

CREATE TABLE qiniu_content (
    id bigint NOT NULL,
    bucket character varying(255),
    name character varying(255),
    size character varying(255),
    suffix character varying(255),
    type character varying(255),
    update_time timestamp without time zone,
    url character varying(255)
);


ALTER TABLE qiniu_content OWNER TO postgres;

--
-- Name: qiniu_content_id_seq; Type: SEQUENCE; Schema: ppmbest; Owner: postgres
--

CREATE SEQUENCE qiniu_content_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE qiniu_content_id_seq OWNER TO postgres;

--
-- Name: qiniu_content_id_seq; Type: SEQUENCE OWNED BY; Schema: ppmbest; Owner: postgres
--

ALTER SEQUENCE qiniu_content_id_seq OWNED BY qiniu_content.id;


--
-- Name: quartz_job; Type: TABLE; Schema: ppmbest; Owner: postgres
--

CREATE TABLE quartz_job (
    id bigint NOT NULL,
    bean_name character varying(255),
    create_time timestamp without time zone,
    cron_expression character varying(255),
    is_pause boolean,
    job_name character varying(255),
    method_name character varying(255),
    params character varying(255),
    remark character varying(255)
);


ALTER TABLE quartz_job OWNER TO postgres;

--
-- Name: quartz_job_id_seq; Type: SEQUENCE; Schema: ppmbest; Owner: postgres
--

CREATE SEQUENCE quartz_job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quartz_job_id_seq OWNER TO postgres;

--
-- Name: quartz_job_id_seq; Type: SEQUENCE OWNED BY; Schema: ppmbest; Owner: postgres
--

ALTER SEQUENCE quartz_job_id_seq OWNED BY quartz_job.id;


--
-- Name: quartz_log; Type: TABLE; Schema: ppmbest; Owner: postgres
--

CREATE TABLE quartz_log (
    id bigint NOT NULL,
    baen_name character varying(255),
    create_time timestamp without time zone,
    cron_expression character varying(255),
    exception_detail text,
    is_success boolean,
    job_name character varying(255),
    method_name character varying(255),
    params character varying(255),
    "time" bigint
);


ALTER TABLE quartz_log OWNER TO postgres;

--
-- Name: quartz_log_id_seq; Type: SEQUENCE; Schema: ppmbest; Owner: postgres
--

CREATE SEQUENCE quartz_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quartz_log_id_seq OWNER TO postgres;

--
-- Name: quartz_log_id_seq; Type: SEQUENCE OWNED BY; Schema: ppmbest; Owner: postgres
--

ALTER SEQUENCE quartz_log_id_seq OWNED BY quartz_log.id;


--
-- Name: role; Type: TABLE; Schema: ppmbest; Owner: postgres
--

CREATE TABLE role (
    id bigint NOT NULL,
    create_time timestamp without time zone,
    data_scope character varying(255),
    level integer,
    name character varying(255) NOT NULL,
    permission character varying(255),
    remark character varying(255)
);


ALTER TABLE role OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: ppmbest; Owner: postgres
--

CREATE SEQUENCE role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_id_seq OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: ppmbest; Owner: postgres
--

ALTER SEQUENCE role_id_seq OWNED BY role.id;


--
-- Name: roles_depts; Type: TABLE; Schema: ppmbest; Owner: postgres
--

CREATE TABLE roles_depts (
    role_id bigint NOT NULL,
    dept_id bigint NOT NULL
);


ALTER TABLE roles_depts OWNER TO postgres;

--
-- Name: roles_menus; Type: TABLE; Schema: ppmbest; Owner: postgres
--

CREATE TABLE roles_menus (
    role_id bigint NOT NULL,
    menu_id bigint NOT NULL
);


ALTER TABLE roles_menus OWNER TO postgres;

--
-- Name: user_avatar; Type: TABLE; Schema: ppmbest; Owner: postgres
--

CREATE TABLE user_avatar (
    id bigint NOT NULL,
    create_time timestamp without time zone,
    path character varying(255),
    real_name character varying(255),
    size character varying(255)
);


ALTER TABLE user_avatar OWNER TO postgres;

--
-- Name: user_avatar_id_seq; Type: SEQUENCE; Schema: ppmbest; Owner: postgres
--

CREATE SEQUENCE user_avatar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_avatar_id_seq OWNER TO postgres;

--
-- Name: user_avatar_id_seq; Type: SEQUENCE OWNED BY; Schema: ppmbest; Owner: postgres
--

ALTER SEQUENCE user_avatar_id_seq OWNED BY user_avatar.id;


--
-- Name: users; Type: TABLE; Schema: ppmbest; Owner: postgres
--

CREATE TABLE users (
    id bigint NOT NULL,
    create_time timestamp without time zone,
    email character varying(255),
    enabled boolean NOT NULL,
    last_password_reset_time timestamp without time zone,
    password character varying(255),
    phone character varying(255),
    username character varying(255),
    dept_id bigint,
    job_id bigint,
    avatar_id bigint
);


ALTER TABLE users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: ppmbest; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: ppmbest; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_roles; Type: TABLE; Schema: ppmbest; Owner: postgres
--

CREATE TABLE users_roles (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE users_roles OWNER TO postgres;

--
-- Name: verification_code; Type: TABLE; Schema: ppmbest; Owner: postgres
--

CREATE TABLE verification_code (
    id bigint NOT NULL,
    code character varying(255),
    create_time timestamp without time zone,
    scenes character varying(255),
    status boolean,
    type character varying(255),
    value character varying(255)
);


ALTER TABLE verification_code OWNER TO postgres;

--
-- Name: verification_code_id_seq; Type: SEQUENCE; Schema: ppmbest; Owner: postgres
--

CREATE SEQUENCE verification_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE verification_code_id_seq OWNER TO postgres;

--
-- Name: verification_code_id_seq; Type: SEQUENCE OWNED BY; Schema: ppmbest; Owner: postgres
--

ALTER SEQUENCE verification_code_id_seq OWNED BY verification_code.id;


--
-- Name: visits; Type: TABLE; Schema: ppmbest; Owner: postgres
--

CREATE TABLE visits (
    id bigint NOT NULL,
    create_time timestamp without time zone,
    date character varying(255),
    ip_counts bigint,
    pv_counts bigint,
    week_day character varying(255)
);


ALTER TABLE visits OWNER TO postgres;

--
-- Name: visits_id_seq; Type: SEQUENCE; Schema: ppmbest; Owner: postgres
--

CREATE SEQUENCE visits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE visits_id_seq OWNER TO postgres;

--
-- Name: visits_id_seq; Type: SEQUENCE OWNED BY; Schema: ppmbest; Owner: postgres
--

ALTER SEQUENCE visits_id_seq OWNED BY visits.id;


--
-- Name: dept id; Type: DEFAULT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY dept ALTER COLUMN id SET DEFAULT nextval('dept_id_seq'::regclass);


--
-- Name: dict id; Type: DEFAULT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY dict ALTER COLUMN id SET DEFAULT nextval('dict_id_seq'::regclass);


--
-- Name: dict_detail id; Type: DEFAULT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY dict_detail ALTER COLUMN id SET DEFAULT nextval('dict_detail_id_seq'::regclass);


--
-- Name: job id; Type: DEFAULT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY job ALTER COLUMN id SET DEFAULT nextval('job_id_seq'::regclass);


--
-- Name: local_storage id; Type: DEFAULT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY local_storage ALTER COLUMN id SET DEFAULT nextval('local_storage_id_seq'::regclass);


--
-- Name: log id; Type: DEFAULT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY log ALTER COLUMN id SET DEFAULT nextval('log_id_seq'::regclass);


--
-- Name: menu id; Type: DEFAULT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY menu ALTER COLUMN id SET DEFAULT nextval('menu_id_seq'::regclass);


--
-- Name: picture id; Type: DEFAULT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY picture ALTER COLUMN id SET DEFAULT nextval('picture_id_seq'::regclass);


--
-- Name: qiniu_content id; Type: DEFAULT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY qiniu_content ALTER COLUMN id SET DEFAULT nextval('qiniu_content_id_seq'::regclass);


--
-- Name: quartz_job id; Type: DEFAULT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY quartz_job ALTER COLUMN id SET DEFAULT nextval('quartz_job_id_seq'::regclass);


--
-- Name: quartz_log id; Type: DEFAULT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY quartz_log ALTER COLUMN id SET DEFAULT nextval('quartz_log_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY role ALTER COLUMN id SET DEFAULT nextval('role_id_seq'::regclass);


--
-- Name: user_avatar id; Type: DEFAULT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY user_avatar ALTER COLUMN id SET DEFAULT nextval('user_avatar_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: verification_code id; Type: DEFAULT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY verification_code ALTER COLUMN id SET DEFAULT nextval('verification_code_id_seq'::regclass);


--
-- Name: visits id; Type: DEFAULT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY visits ALTER COLUMN id SET DEFAULT nextval('visits_id_seq'::regclass);


--
-- Name: alipay_config alipay_config_pkey; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY alipay_config
    ADD CONSTRAINT alipay_config_pkey PRIMARY KEY (id);


--
-- Name: dept dept_pkey; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY dept
    ADD CONSTRAINT dept_pkey PRIMARY KEY (id);


--
-- Name: dict_detail dict_detail_pkey; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY dict_detail
    ADD CONSTRAINT dict_detail_pkey PRIMARY KEY (id);


--
-- Name: dict dict_pkey; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY dict
    ADD CONSTRAINT dict_pkey PRIMARY KEY (id);


--
-- Name: email_config email_config_pkey; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY email_config
    ADD CONSTRAINT email_config_pkey PRIMARY KEY (id);


--
-- Name: gen_config gen_config_pkey; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY gen_config
    ADD CONSTRAINT gen_config_pkey PRIMARY KEY (id);


--
-- Name: job job_pkey; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- Name: local_storage local_storage_pkey; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY local_storage
    ADD CONSTRAINT local_storage_pkey PRIMARY KEY (id);


--
-- Name: log log_pkey; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY log
    ADD CONSTRAINT log_pkey PRIMARY KEY (id);


--
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);


--
-- Name: picture picture_pkey; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY picture
    ADD CONSTRAINT picture_pkey PRIMARY KEY (id);


--
-- Name: qiniu_config qiniu_config_pkey; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY qiniu_config
    ADD CONSTRAINT qiniu_config_pkey PRIMARY KEY (id);


--
-- Name: qiniu_content qiniu_content_pkey; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY qiniu_content
    ADD CONSTRAINT qiniu_content_pkey PRIMARY KEY (id);


--
-- Name: quartz_job quartz_job_pkey; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY quartz_job
    ADD CONSTRAINT quartz_job_pkey PRIMARY KEY (id);


--
-- Name: quartz_log quartz_log_pkey; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY quartz_log
    ADD CONSTRAINT quartz_log_pkey PRIMARY KEY (id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: roles_depts roles_depts_pkey; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY roles_depts
    ADD CONSTRAINT roles_depts_pkey PRIMARY KEY (role_id, dept_id);


--
-- Name: roles_menus roles_menus_pkey; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY roles_menus
    ADD CONSTRAINT roles_menus_pkey PRIMARY KEY (role_id, menu_id);


--
-- Name: visits uk_11aksgq87euk9bcyeesfs4vtp; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY visits
    ADD CONSTRAINT uk_11aksgq87euk9bcyeesfs4vtp UNIQUE (date);


--
-- Name: dict uk_801vlclah89ymu7dppibe5flo; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY dict
    ADD CONSTRAINT uk_801vlclah89ymu7dppibe5flo UNIQUE (name);


--
-- Name: job uk_db9dlna8wi9ljov2h4knqwro1; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY job
    ADD CONSTRAINT uk_db9dlna8wi9ljov2h4knqwro1 UNIQUE (sort);


--
-- Name: users uk_r43af9ap4edm43mmtq01oddj6; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT uk_r43af9ap4edm43mmtq01oddj6 UNIQUE (username);


--
-- Name: user_avatar user_avatar_pkey; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY user_avatar
    ADD CONSTRAINT user_avatar_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_roles users_roles_pkey; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: verification_code verification_code_pkey; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY verification_code
    ADD CONSTRAINT verification_code_pkey PRIMARY KEY (id);


--
-- Name: visits visits_pkey; Type: CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY visits
    ADD CONSTRAINT visits_pkey PRIMARY KEY (id);


--
-- Name: users_roles fk2o0jvgh89lemvvo17cbqvdxaa; Type: FK CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY users_roles
    ADD CONSTRAINT fk2o0jvgh89lemvvo17cbqvdxaa FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: dict_detail fk5tpkputc6d9nboxojdbgnpmyb; Type: FK CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY dict_detail
    ADD CONSTRAINT fk5tpkputc6d9nboxojdbgnpmyb FOREIGN KEY (dict_id) REFERENCES dict(id);


--
-- Name: users fk7erlbfqh4er9f21ngd9nvylwe; Type: FK CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk7erlbfqh4er9f21ngd9nvylwe FOREIGN KEY (job_id) REFERENCES job(id);


--
-- Name: users fk7puvf45ag65uok4ue7fhks1y3; Type: FK CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk7puvf45ag65uok4ue7fhks1y3 FOREIGN KEY (avatar_id) REFERENCES user_avatar(id);


--
-- Name: roles_depts fk7qg6itn5ajdoa9h9o78v9ksur; Type: FK CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY roles_depts
    ADD CONSTRAINT fk7qg6itn5ajdoa9h9o78v9ksur FOREIGN KEY (dept_id) REFERENCES dept(id);


--
-- Name: users fkb5g26hfoj5g0fim8tth33aiax; Type: FK CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fkb5g26hfoj5g0fim8tth33aiax FOREIGN KEY (dept_id) REFERENCES dept(id);


--
-- Name: job fkmvhj0rogastlctflsxf1d6k3i; Type: FK CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fkmvhj0rogastlctflsxf1d6k3i FOREIGN KEY (dept_id) REFERENCES dept(id);


--
-- Name: roles_menus fko7wsmlrrxb2osfaoavp46rv2r; Type: FK CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY roles_menus
    ADD CONSTRAINT fko7wsmlrrxb2osfaoavp46rv2r FOREIGN KEY (menu_id) REFERENCES menu(id);


--
-- Name: roles_depts fkrg1ci4cxxfbja0sb0pddju7k; Type: FK CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY roles_depts
    ADD CONSTRAINT fkrg1ci4cxxfbja0sb0pddju7k FOREIGN KEY (role_id) REFERENCES role(id);


--
-- Name: users_roles fkt4v0rrweyk393bdgt107vdx0x; Type: FK CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY users_roles
    ADD CONSTRAINT fkt4v0rrweyk393bdgt107vdx0x FOREIGN KEY (role_id) REFERENCES role(id);


--
-- Name: roles_menus fktag324maketmxffly3pdyh193; Type: FK CONSTRAINT; Schema: ppmbest; Owner: postgres
--

ALTER TABLE ONLY roles_menus
    ADD CONSTRAINT fktag324maketmxffly3pdyh193 FOREIGN KEY (role_id) REFERENCES role(id);


--
-- PostgreSQL database dump complete
--

