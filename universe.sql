--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: artificial_satellites; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.artificial_satellites (
    artificial_satellites_id integer NOT NULL,
    name character varying(30) NOT NULL,
    purpose text NOT NULL,
    planet_id integer NOT NULL,
    us_dollar_cost integer
);


ALTER TABLE public.artificial_satellites OWNER TO freecodecamp;

--
-- Name: artificial_satellites_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.artificial_satellites_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artificial_satellites_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: artificial_satellites_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.artificial_satellites_satellite_id_seq OWNED BY public.artificial_satellites.artificial_satellites_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type text NOT NULL,
    image_name character varying(30),
    constellation text
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
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_km numeric NOT NULL,
    mass_kg numeric NOT NULL
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_km numeric NOT NULL,
    mass_kg numeric NOT NULL,
    known_life boolean NOT NULL,
    est_pop_millions integer NOT NULL
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
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_type character varying(30) NOT NULL,
    radius_km numeric NOT NULL,
    mass_rg numeric NOT NULL,
    within_ten_ly_sol boolean NOT NULL
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
-- Name: artificial_satellites artificial_satellites_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.artificial_satellites ALTER COLUMN artificial_satellites_id SET DEFAULT nextval('public.artificial_satellites_satellite_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: artificial_satellites; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.artificial_satellites VALUES (3, 'US Sat-323', 'Defense', 1, NULL);
INSERT INTO public.artificial_satellites VALUES (4, 'US Sat-324', 'Defense', 1, NULL);
INSERT INTO public.artificial_satellites VALUES (5, 'US Sat-325', 'Defense', 1, NULL);
INSERT INTO public.artificial_satellites VALUES (6, 'US Sat-326', 'Defense', 1, NULL);
INSERT INTO public.artificial_satellites VALUES (7, 'US Sat-327', 'Defense', 1, NULL);
INSERT INTO public.artificial_satellites VALUES (8, 'US Sat-328', 'GPS', 1, NULL);
INSERT INTO public.artificial_satellites VALUES (9, 'US Sat-329', 'Scientific Research', 1, NULL);
INSERT INTO public.artificial_satellites VALUES (10, 'International Rock Killer', 'Killer Astroid Interception', 1, NULL);
INSERT INTO public.artificial_satellites VALUES (11, 'International Rock Killer Two', 'Killer Astroid Interception', 1, NULL);
INSERT INTO public.artificial_satellites VALUES (12, 'K-Pop Sat', 'Entertainment', 1, NULL);
INSERT INTO public.artificial_satellites VALUES (13, 'Mint Mobile Sat', 'Telecommunications', 1, NULL);
INSERT INTO public.artificial_satellites VALUES (14, 'Lunar One', 'Recieves Imports from Lunar Mining', 1, NULL);
INSERT INTO public.artificial_satellites VALUES (15, 'Lunar Two', 'Trains Lunar Technicians', 1, NULL);
INSERT INTO public.artificial_satellites VALUES (16, 'Lunar Three', 'Prepares Supplies for Export to Lunar Mines', 1, NULL);
INSERT INTO public.artificial_satellites VALUES (17, 'Sino 1', 'Defense', 1, NULL);
INSERT INTO public.artificial_satellites VALUES (18, 'Sino 2', 'Entertainment', 1, NULL);
INSERT INTO public.artificial_satellites VALUES (19, 'Sino 3', 'Unknown', 1, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral, barred', 'milkyWay.png', 'Sagittarius');
INSERT INTO public.galaxy VALUES (2, 'NGC 7537', 'Spiral, barred', 'NGC7537.png', 'Pisces');
INSERT INTO public.galaxy VALUES (3, 'NGC 3021', 'Spiral', 'NGC3021.png', 'Leo Minor');
INSERT INTO public.galaxy VALUES (4, 'NGC 5643', 'Spiral', 'NGC5643.png', 'Lupus');
INSERT INTO public.galaxy VALUES (5, 'NGC 3254', 'Spiral', 'NGC3254.png', 'Leo Minor');
INSERT INTO public.galaxy VALUES (6, 'NGC 3147', 'Spiral', 'NGC3147.png', 'Draco');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Earth 1 Moon 1', 10, 20);
INSERT INTO public.moon VALUES (2, 1, 'Earth 1 Moon 2', 10, 20);
INSERT INTO public.moon VALUES (3, 1, 'Earth 1 Moon 3', 10, 20);
INSERT INTO public.moon VALUES (4, 1, 'Earth 1 Moon 4', 10, 20);
INSERT INTO public.moon VALUES (5, 1, 'Earth 1 Moon 5', 10, 20);
INSERT INTO public.moon VALUES (6, 1, 'Earth 1 Moon 6', 10, 20);
INSERT INTO public.moon VALUES (7, 1, 'Earth 1 Moon 7', 10, 20);
INSERT INTO public.moon VALUES (8, 1, 'Can you tell Im moon', 10, 20);
INSERT INTO public.moon VALUES (9, 1, 'Earth 1 Moon 8', 10, 20);
INSERT INTO public.moon VALUES (10, 2, 'Earth 2 Moon 1', 10, 20);
INSERT INTO public.moon VALUES (11, 11, 'Centauri Primes Moon', 10, 20);
INSERT INTO public.moon VALUES (12, 12, 'Ross 248 Prime Moon', 10, 20);
INSERT INTO public.moon VALUES (13, 13, 'Madeup Star 1 Prime Moon', 10, 20);
INSERT INTO public.moon VALUES (14, 4, 'Earth 4 Moon', 10, 20);
INSERT INTO public.moon VALUES (15, 5, 'Earth 5 moon', 10, 20);
INSERT INTO public.moon VALUES (16, 6, 'Earth 6 Moon', 10, 20);
INSERT INTO public.moon VALUES (17, 8, 'Bored planets moon', 10, 20);
INSERT INTO public.moon VALUES (18, 7, 'Earth 7 Moon', 10, 20);
INSERT INTO public.moon VALUES (19, 9, 'Earth 8 Moon', 10, 20);
INSERT INTO public.moon VALUES (20, 10, 'Earth 9 Moon', 10, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', 10, 20, false, 7000);
INSERT INTO public.planet VALUES (2, 2, 'Earth2', 10, 20, false, 0);
INSERT INTO public.planet VALUES (3, 1, 'Earth3', 10, 20, false, 0);
INSERT INTO public.planet VALUES (4, 1, 'Earth4', 10, 20, false, 0);
INSERT INTO public.planet VALUES (5, 1, 'Eart5', 10, 20, false, 0);
INSERT INTO public.planet VALUES (6, 1, 'Earth6', 10, 20, false, 0);
INSERT INTO public.planet VALUES (7, 1, 'Earth7', 10, 20, false, 0);
INSERT INTO public.planet VALUES (8, 1, 'Can you tell Im bored', 10, 20, false, 0);
INSERT INTO public.planet VALUES (9, 1, 'Earth8', 10, 20, false, 0);
INSERT INTO public.planet VALUES (10, 1, 'Earth9', 10, 20, false, 0);
INSERT INTO public.planet VALUES (11, 2, 'Centauri Prime', 10, 20, false, 0);
INSERT INTO public.planet VALUES (12, 5, 'Ross 248 Prime', 10, 20, false, 0);
INSERT INTO public.planet VALUES (13, 6, 'Madeup Star 1 Prime', 10, 20, false, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sol', 'G2 V', 700000, 1988500, true);
INSERT INTO public.star VALUES (2, 1, 'Alpha Centauri', 'Pending', 1, 1, true);
INSERT INTO public.star VALUES (3, 1, 'Beta Centauri ', 'Pending', 1, 1, true);
INSERT INTO public.star VALUES (5, 1, 'Ross 248', 'Pending', 1, 1, false);
INSERT INTO public.star VALUES (6, 2, 'MadeUp from Galaxy NGC 7537', 'Doesnt Exist', 1, 1, false);
INSERT INTO public.star VALUES (7, 3, 'MadeUp from Galaxy NGC 3021', 'Doesnt Exist', 1, 1, false);
INSERT INTO public.star VALUES (8, 4, 'MadeUp from Galaxy NGC 5643', 'Doesnt Exist', 1, 1, false);
INSERT INTO public.star VALUES (9, 5, 'MadeUp from Galaxy NGC 3254', 'Doesnt Exist', 1, 1, false);
INSERT INTO public.star VALUES (10, 6, 'MadeUp from Galaxy NGC 3147', 'Doesnt Exist', 1, 1, false);
INSERT INTO public.star VALUES (4, 1, 'Proxima Centauri', 'Pending', 1, 1, true);


--
-- Name: artificial_satellites_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.artificial_satellites_satellite_id_seq', 19, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: artificial_satellites artificial_satellites_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.artificial_satellites
    ADD CONSTRAINT artificial_satellites_name_key UNIQUE (name);


--
-- Name: artificial_satellites artificial_satellites_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.artificial_satellites
    ADD CONSTRAINT artificial_satellites_pkey PRIMARY KEY (artificial_satellites_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: artificial_satellites artificial_satellites_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.artificial_satellites
    ADD CONSTRAINT artificial_satellites_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

