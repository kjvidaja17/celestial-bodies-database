--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(60) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    estimated_diameter_ly integer NOT NULL,
    distance_from_earth_ly numeric(14,2) NOT NULL,
    is_visible_to_naked_eye boolean NOT NULL,
    description text NOT NULL
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
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    mean_radius_km integer NOT NULL,
    orbital_period_days numeric(12,4) NOT NULL,
    is_geologically_active boolean NOT NULL,
    description text NOT NULL
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
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(30) NOT NULL,
    orbital_order integer NOT NULL,
    orbital_period_days numeric(12,3) NOT NULL,
    has_rings boolean NOT NULL,
    is_potentially_habitable boolean NOT NULL
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
-- Name: spacecraft; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spacecraft (
    spacecraft_id integer NOT NULL,
    name character varying(60) NOT NULL,
    agency character varying(60) NOT NULL,
    mission_type character varying(40) NOT NULL,
    launch_year integer NOT NULL,
    is_active boolean NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.spacecraft OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spacecraft_spacecraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spacecraft_spacecraft_id_seq OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spacecraft_spacecraft_id_seq OWNED BY public.spacecraft.spacecraft_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(20) NOT NULL,
    mass_solar_masses numeric(10,3) NOT NULL,
    age_myr integer NOT NULL,
    is_variable boolean NOT NULL
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: spacecraft spacecraft_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft ALTER COLUMN spacecraft_id SET DEFAULT nextval('public.spacecraft_spacecraft_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 100000, 0.00, true, 'The galaxy containing our Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Spiral', 152000, 2500000.00, true, 'The nearest major spiral galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'Spiral', 60000, 2730000.00, false, 'A spiral galaxy in the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 14000, 163000.00, true, 'A satellite galaxy of the Milky Way.');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Irregular', 7000, 200000.00, true, 'A dwarf galaxy near the Milky Way.');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'Spiral', 76000, 23000000.00, false, 'A well-known interacting spiral galaxy.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737, 27.3217, false, 'Earth natural satellite.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11, 0.3189, false, 'One of the two moons of Mars.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6, 1.2630, false, 'The smaller natural satellite of Mars.');
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821, 1.7690, true, 'A volcanically active moon of Jupiter.');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1561, 3.5510, false, 'An icy moon believed to have a subsurface ocean.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634, 7.1550, false, 'The largest moon in the Solar System.');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, 16.6890, false, 'A heavily cratered moon of Jupiter.');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 2575, 15.9450, true, 'A moon with a dense atmosphere.');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 252, 1.3700, true, 'An icy moon with water-rich plumes.');
INSERT INTO public.moon VALUES (10, 'Rhea', 6, 764, 4.5180, false, 'The second-largest moon of Saturn.');
INSERT INTO public.moon VALUES (11, 'Iapetus', 6, 735, 79.3210, false, 'A moon with contrasting bright and dark hemispheres.');
INSERT INTO public.moon VALUES (12, 'Dione', 6, 561, 2.7370, false, 'An icy moon of Saturn.');
INSERT INTO public.moon VALUES (13, 'Titania', 7, 788, 8.7060, false, 'The largest moon of Uranus.');
INSERT INTO public.moon VALUES (14, 'Oberon', 7, 761, 13.4630, false, 'An outer major moon of Uranus.');
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 585, 4.1440, false, 'A dark moon of Uranus.');
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 579, 2.5200, true, 'One of the major moons of Uranus.');
INSERT INTO public.moon VALUES (17, 'Miranda', 7, 236, 1.4130, false, 'A moon with unusual surface features.');
INSERT INTO public.moon VALUES (18, 'Triton', 8, 1353, 5.8770, true, 'The largest moon of Neptune.');
INSERT INTO public.moon VALUES (19, 'Nereid', 8, 170, 360.1360, false, 'A distant irregular moon of Neptune.');
INSERT INTO public.moon VALUES (20, 'Proteus', 8, 210, 1.1220, false, 'A large irregular moon of Neptune.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 1, 87.969, false, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 2, 224.701, false, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 3, 365.256, false, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 4, 686.980, false, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 5, 4332.590, true, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 6, 10759.220, true, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 7, 30688.500, true, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 8, 60182.000, true, false);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 3, 'Terrestrial', 1, 11.186, false, true);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1b', 4, 'Terrestrial', 1, 1.511, false, false);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1c', 4, 'Terrestrial', 2, 2.422, false, false);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', 4, 'Terrestrial', 3, 4.050, false, true);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1e', 4, 'Terrestrial', 4, 6.099, false, true);
INSERT INTO public.planet VALUES (14, 'TRAPPIST-1f', 4, 'Terrestrial', 5, 9.207, false, true);
INSERT INTO public.planet VALUES (15, 'TRAPPIST-1g', 4, 'Terrestrial', 6, 12.353, false, true);


--
-- Data for Name: spacecraft; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spacecraft VALUES (1, 'Voyager 1', 'NASA', 'Interstellar Exploration', 1977, true, 'Space probe exploring interstellar space.');
INSERT INTO public.spacecraft VALUES (2, 'Voyager 2', 'NASA', 'Interstellar Exploration', 1977, true, 'Space probe that visited the outer planets.');
INSERT INTO public.spacecraft VALUES (3, 'Cassini', 'NASA', 'Orbiter', 1997, false, 'Mission that studied Saturn and its moons.');
INSERT INTO public.spacecraft VALUES (4, 'New Horizons', 'NASA', 'Flyby', 2006, true, 'Mission that explored Pluto and the Kuiper Belt.');
INSERT INTO public.spacecraft VALUES (5, 'Juno', 'NASA', 'Orbiter', 2011, false, 'Mission designed to study Jupiter.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 1.000, 4600, false);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A1V', 2.063, 242, false);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 'M5.5V', 0.122, 4850, true);
INSERT INTO public.star VALUES (4, 'TRAPPIST-1', 1, 'M8V', 0.089, 7600, false);
INSERT INTO public.star VALUES (5, 'Kepler-90', 1, 'G0V', 1.200, 2000, false);
INSERT INTO public.star VALUES (6, 'R136a1', 4, 'WN5h', 196.000, 2, true);
INSERT INTO public.star VALUES (7, 'M31-V1', 2, 'Cepheid', 5.000, 50, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spacecraft_spacecraft_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: spacecraft spacecraft_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_name_key UNIQUE (name);


--
-- Name: spacecraft spacecraft_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_pkey PRIMARY KEY (spacecraft_id);


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

