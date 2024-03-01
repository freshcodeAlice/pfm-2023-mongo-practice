--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0 (Ubuntu 15.0-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.0 (Ubuntu 15.0-1.pgdg22.04+1)

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
-- Name: enum_rents_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_rents_status AS ENUM (
    'taken',
    'returned',
    'failed'
);


ALTER TYPE public.enum_rents_status OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO postgres;

--
-- Name: cats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cats (
    name character varying(200),
    age integer,
    color character varying(200),
    favouritefood text
);


ALTER TABLE public.cats OWNER TO postgres;

--
-- Name: movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movies (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    director character varying(255),
    studio character varying(255),
    genre text,
    production_date date,
    duration integer,
    actors text,
    rating integer,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.movies OWNER TO postgres;

--
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_id_seq OWNER TO postgres;

--
-- Name: movies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movies_id_seq OWNED BY public.movies.id;


--
-- Name: rents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rents (
    id integer NOT NULL,
    movie_id integer,
    user_id integer,
    deadline timestamp with time zone,
    status public.enum_rents_status DEFAULT 'taken'::public.enum_rents_status,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.rents OWNER TO postgres;

--
-- Name: rents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rents_id_seq OWNER TO postgres;

--
-- Name: rents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rents_id_seq OWNED BY public.rents.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255) NOT NULL,
    gender character varying(255),
    favourite_films text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: movies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);


--
-- Name: rents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rents ALTER COLUMN id SET DEFAULT nextval('public.rents_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SequelizeMeta" (name) FROM stdin;
20240301071517-create-user.js
20240301072033-create-movie.js
20240301072630-create-rent.js
\.


--
-- Data for Name: cats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cats (name, age, color, favouritefood) FROM stdin;
Murzik	3	red	[]
Barsik	2	white	[]
Barsik	2	white	[]
Tuzik	2	white	[]
Murka	3	white	[]
\.


--
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movies (id, name, director, studio, genre, production_date, duration, actors, rating, created_at, updated_at) FROM stdin;
1	Superfilm	Tarantino	Fox	thriller	\N	\N	\N	\N	2024-03-01 10:04:45.301+02	2024-03-01 10:04:45.301+02
2	Another film	Scorcese	Marvel	epic	\N	\N	\N	\N	2024-03-01 10:23:52.943+02	2024-03-01 10:23:52.943+02
3	Thrid film	Npone	Marvel	epic	\N	\N	\N	\N	2024-03-01 10:28:45.156+02	2024-03-01 10:28:45.156+02
\.


--
-- Data for Name: rents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rents (id, movie_id, user_id, deadline, status, created_at, updated_at) FROM stdin;
1	1	1	2024-03-11 10:26:54.897+02	taken	2024-03-01 10:27:00.179+02	2024-03-01 10:27:00.179+02
2	2	1	2024-03-02 02:00:00+02	returned	2024-03-01 10:27:50.609+02	2024-03-01 10:27:50.609+02
3	3	1	2024-03-02 02:00:00+02	returned	2024-03-01 10:28:54.957+02	2024-03-01 10:28:54.957+02
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, first_name, last_name, email, gender, favourite_films, created_at, updated_at) FROM stdin;
1	Bruce	Benner	halk@ave.nger	male	\N	2024-03-01 10:04:17.54+02	2024-03-01 10:04:17.54+02
\.


--
-- Name: movies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movies_id_seq', 3, true);


--
-- Name: rents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rents_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- Name: rents rents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rents
    ADD CONSTRAINT rents_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: rents rents_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rents
    ADD CONSTRAINT rents_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(id);


--
-- Name: rents rents_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rents
    ADD CONSTRAINT rents_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

