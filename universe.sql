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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    brightest_star character varying(100) NOT NULL,
    visible_season text,
    galaxy_id integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    size_millions integer,
    has_supermassive_black_hole boolean NOT NULL,
    description text
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
    name character varying(100) NOT NULL,
    planet_id integer,
    diameter_km integer,
    is_tidal_locked boolean NOT NULL,
    is_inhabited boolean NOT NULL,
    description text
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
    name character varying(100) NOT NULL,
    star_id integer,
    has_atmosphere boolean NOT NULL,
    description text
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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    spectral_class character varying(10),
    age_years numeric,
    is_main_sequence boolean NOT NULL,
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'Greek mythological hunter', 'Rigel', 'Winter', 1);
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 'Big Bear', 'Dubhe', 'Spring', 1);
INSERT INTO public.constellation VALUES (3, 'Crux', 'Cross', 'Acrux', 'Summer', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, true, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 200000, true, 'Nearest spiral galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 50000, false, 'Third-largest galaxy in the Local Group');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 30000, false, 'Spiral galaxy interacting with a smaller companion');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 60000, false, 'Spiral galaxy with a prominent bulge');
INSERT INTO public.galaxy VALUES (7, 'Pinwheel', 40000, false, 'Face-on spiral galaxy in the constellation Ursa Major');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 3474, true, false, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, true, false, NULL);
INSERT INTO public.moon VALUES (3, 'Ganymede', 3, 5262, true, false, NULL);
INSERT INTO public.moon VALUES (90, 'Europa', 3, 3122, true, false, 'Europa is one of Jupiter''s Galilean moons and is known for its smooth and cracked icy surface, suggesting the presence of a subsurface ocean.');
INSERT INTO public.moon VALUES (91, 'Io', 3, 3637, true, false, 'Io is the innermost of Jupiter''s four Galilean moons and is the most volcanically active body in the Solar System.');
INSERT INTO public.moon VALUES (92, 'Callisto', 3, 4821, true, false, 'Callisto is one of Jupiter''s Galilean moons and is the most heavily cratered object in the Solar System.');
INSERT INTO public.moon VALUES (93, 'Titan', 4, 5150, true, false, 'Titan is the largest moon of Saturn and is the only moon in the Solar System with a dense atmosphere.');
INSERT INTO public.moon VALUES (94, 'Enceladus', 4, 504, true, false, 'Enceladus is one of Saturn''s innermost moons and is known for its geysers erupting from its south pole, indicating the presence of a subsurface ocean.');
INSERT INTO public.moon VALUES (95, 'Mimas', 4, 396, true, false, 'Mimas is a moon of Saturn and is known for its large Herschel Crater, giving it a resemblance to the Death Star from Star Wars.');
INSERT INTO public.moon VALUES (98, 'Charon', 9, 1212, true, false, 'Charon is the largest moon of Pluto and is tidally locked with Pluto, meaning the same side always faces the planet.');
INSERT INTO public.moon VALUES (99, 'Nix', 9, 49, true, false, 'Nix is one of the moons of Pluto and was discovered in 2005 by the Hubble Space Telescope.');
INSERT INTO public.moon VALUES (100, 'Hydra', 9, 32, true, false, 'Hydra is one of the moons of Pluto and was discovered in 2005 by the Hubble Space Telescope.');
INSERT INTO public.moon VALUES (101, 'Ariel', 10, 1157, true, false, 'Ariel is one of Uranus'' five major moons and is the fourth-largest moon of Uranus.');
INSERT INTO public.moon VALUES (102, 'Umbriel', 10, 1169, true, false, 'Umbriel is one of Uranus'' five major moons and is the third-largest moon of Uranus.');
INSERT INTO public.moon VALUES (103, 'Miranda', 10, 472, true, false, 'Miranda is one of Uranus'' five major moons and is the smallest and innermost of them.');
INSERT INTO public.moon VALUES (104, 'Triton', 10, 2707, true, false, 'Triton is one of Neptune''s moons and is the largest and most massive of Neptune''s moons.');
INSERT INTO public.moon VALUES (106, 'Nereid', 11, 170, true, false, 'Nereid is the third-largest moon of Neptune and is irregularly shaped.');
INSERT INTO public.moon VALUES (107, 'Larissa', 11, 194, true, false, 'Larissa is one of the inner moons of Neptune and was discovered in 1981 by the Voyager 2 spacecraft.');
INSERT INTO public.moon VALUES (108, 'Naiad', 11, 58, true, false, 'Naiad is one of the inner moons of Neptune and was discovered in 1989 by the Voyager 2 spacecraft.');
INSERT INTO public.moon VALUES (109, 'Thalassa', 11, 82, true, false, 'Thalassa is one of the inner moons of Neptune and was discovered in 1989 by the Voyager 2 spacecraft.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (4, 'Saturn', 1, true, 'Saturn is the sixth planet from the Sun and is known for its prominent rings.');
INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 'Earth is the third planet from the Sun and is the only known astronomical object to harbor life.');
INSERT INTO public.planet VALUES (2, 'Mars', 1, true, 'Mars is the fourth planet from the Sun and is often called the "Red Planet" due to its reddish appearance.');
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, true, 'Jupiter is the fifth planet from the Sun and is the largest planet in the Solar System, known for its Great Red Spot.');
INSERT INTO public.planet VALUES (7, 'Mercury', 1, false, 'Mercury is the smallest and innermost planet in the Solar System, named after the Roman deity Mercury.');
INSERT INTO public.planet VALUES (8, 'Venus', 1, true, 'Venus is the second planet from the Sun and is often called Earth’s twin, named after the Roman goddess of love and beauty.');
INSERT INTO public.planet VALUES (9, 'Uranus', 1, true, 'Uranus is the seventh planet from the Sun and is known for its unique sideways rotation, named after the Greek god of the sky.');
INSERT INTO public.planet VALUES (11, 'Pluto', 1, false, 'Pluto was formerly considered the ninth planet in the Solar System but is now classified as a dwarf planet, named after the Roman god of the underworld.');
INSERT INTO public.planet VALUES (12, 'Kepler-186f', 2, true, 'Kepler-186f is an exoplanet discovered orbiting within the habitable zone of its star.');
INSERT INTO public.planet VALUES (13, 'Kepler-452b', 2, true, 'Kepler-452b is a potentially habitable exoplanet orbiting within the habitable zone of its star.');
INSERT INTO public.planet VALUES (14, 'HD 189733b', 3, true, 'HD 189733b is a hot Jupiter exoplanet with a deep blue color due to the presence of silicate particles.');
INSERT INTO public.planet VALUES (15, 'HD 209458b', 3, true, 'HD 209458b is a hot Jupiter exoplanet with an atmosphere containing water vapor.');
INSERT INTO public.planet VALUES (16, 'TRAPPIST-1d', 3, true, 'TRAPPIST-1d is an exoplanet within the habitable zone of its star and is one of seven Earth-sized planets in its system.');
INSERT INTO public.planet VALUES (17, 'TOI-700d', 3, true, 'TOI-700d is an Earth-sized exoplanet within the habitable zone of its star.');
INSERT INTO public.planet VALUES (10, 'Neptune', 1, true, 'Neptune is the eighth and farthest-known planet from the Sun in the Solar System.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 4.6, true, NULL);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'M5V', 4.85, true, NULL);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'A1V', 0.3, true, NULL);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 2, 'M1-2Ia-Iab', 8.5, true, NULL);
INSERT INTO public.star VALUES (5, 'Aldebaran', 2, 'K5 III', 6.7, true, NULL);
INSERT INTO public.star VALUES (6, 'Arcturus', 2, 'K0 III', 7.1, true, NULL);
INSERT INTO public.star VALUES (7, 'Antares', 2, 'M1.5Iab-b', 12, true, NULL);
INSERT INTO public.star VALUES (8, 'Rigel', 2, 'B8 Ia', 8.5, true, NULL);
INSERT INTO public.star VALUES (9, 'Vega', 2, 'A0 V', 0.45, true, NULL);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 109, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

