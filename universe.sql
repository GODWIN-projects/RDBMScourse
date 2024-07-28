--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    radius_in_lightyear numeric(4,1),
    has_blackhole boolean NOT NULL,
    age_in_billion integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_id integer,
    gravity numeric(1,1),
    explored boolean DEFAULT false NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: path; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.path (
    path_id integer NOT NULL,
    planet_from integer NOT NULL,
    planet_to integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.path OWNER TO freecodecamp;

--
-- Name: path_path_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.path_path_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.path_path_id_seq OWNER TO freecodecamp;

--
-- Name: path_path_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.path_path_id_seq OWNED BY public.path.path_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_id integer,
    no_of_moons integer DEFAULT 0 NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_id integer,
    no_of_planets integer DEFAULT 0 NOT NULL,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: path path_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.path ALTER COLUMN path_id SET DEFAULT nextval('public.path_path_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milkyway', 532.4, true, 700);
INSERT INTO public.galaxy VALUES (2, 'andromeda', 503.1, true, 981);
INSERT INTO public.galaxy VALUES (3, 'aux', 982.9, false, 421);
INSERT INTO public.galaxy VALUES (4, 'skeek', 999.0, true, 1009);
INSERT INTO public.galaxy VALUES (5, 'dark', 494.0, false, 298);
INSERT INTO public.galaxy VALUES (6, 'irontight', 734.0, false, 734);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'the_moon', 1, 0.3, true);
INSERT INTO public.moon VALUES (2, 'msjk2', 2, 0.4, true);
INSERT INTO public.moon VALUES (3, 'wk235', 2, 0.1, true);
INSERT INTO public.moon VALUES (4, 'ase10', 3, 0.8, false);
INSERT INTO public.moon VALUES (5, 'sel90', 4, 0.9, true);
INSERT INTO public.moon VALUES (6, 'nen33', 4, 0.4, false);
INSERT INTO public.moon VALUES (7, 'pg60', 5, 0.6, true);
INSERT INTO public.moon VALUES (8, 'ig002', 6, 0.5, false);
INSERT INTO public.moon VALUES (9, 'qewst', 6, 0.9, true);
INSERT INTO public.moon VALUES (10, 'imp', 7, 0.9, true);
INSERT INTO public.moon VALUES (11, 'tyuol', 8, 0.7, false);
INSERT INTO public.moon VALUES (12, 'oop', 7, 0.6, false);
INSERT INTO public.moon VALUES (13, 'rt', 9, 0.8, false);
INSERT INTO public.moon VALUES (14, 'nxtop', 9, 0.1, true);
INSERT INTO public.moon VALUES (15, 'klop', 9, 0.9, false);
INSERT INTO public.moon VALUES (16, 'hitk', 10, 0.3, false);
INSERT INTO public.moon VALUES (17, 'bud', 11, 0.6, true);
INSERT INTO public.moon VALUES (18, 'eef', 12, 0.8, false);
INSERT INTO public.moon VALUES (19, 'uops', 12, 0.6, false);
INSERT INTO public.moon VALUES (20, 'vas', 11, 0.3, false);


--
-- Data for Name: path; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.path VALUES (1, 2, 1, 'freeway');
INSERT INTO public.path VALUES (2, 1, 3, 'norman');
INSERT INTO public.path VALUES (3, 2, 3, 'grus');
INSERT INTO public.path VALUES (4, 5, 6, 'fitrack');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', 1, 1, true);
INSERT INTO public.planet VALUES (2, 'mars', 1, 3, true);
INSERT INTO public.planet VALUES (3, 'saturn', 1, 63, true);
INSERT INTO public.planet VALUES (4, 'avalo', 2, 8, false);
INSERT INTO public.planet VALUES (5, 'greyman', 2, 10, false);
INSERT INTO public.planet VALUES (6, 'taj', 2, 2, false);
INSERT INTO public.planet VALUES (7, 'necro', 3, 9, true);
INSERT INTO public.planet VALUES (8, 'shockt', 4, 7, true);
INSERT INTO public.planet VALUES (9, 'masc', 4, 1, false);
INSERT INTO public.planet VALUES (10, 'abys', 5, 82, false);
INSERT INTO public.planet VALUES (11, 'igon', 5, 11, true);
INSERT INTO public.planet VALUES (12, 'marices', 3, 4, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 1, 9, 'orange ball');
INSERT INTO public.star VALUES (2, 'dwarf', 1, 0, 'small white ball');
INSERT INTO public.star VALUES (3, 'stylus', 2, 6, 'oval red sun');
INSERT INTO public.star VALUES (4, 'stringer', 3, 14, 'blue star');
INSERT INTO public.star VALUES (5, 'glug', 3, 8, 'low temp irregular');
INSERT INTO public.star VALUES (6, 'curly', 6, 0, 'spiral shaped blue ball');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 32, true);


--
-- Name: path_path_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.path_path_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: path path_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.path
    ADD CONSTRAINT path_name_key UNIQUE (name);


--
-- Name: path path_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.path
    ADD CONSTRAINT path_pkey PRIMARY KEY (path_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: planet unique_const; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_const UNIQUE (name);


--
-- Name: star unique_const_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_const_name UNIQUE (name);


--
-- Name: moon unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

