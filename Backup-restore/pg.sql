--
-- PostgreSQL database dump
--

-- Dumped from database version 10.19 (Debian 10.19-1.pgdg90+1)
-- Dumped by pg_dump version 10.19 (Debian 10.19-1.pgdg90+1)

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = true;

--
-- Name: criminal_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.criminal_records (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    felony character varying(30) NOT NULL,
    ssn character varying(11) NOT NULL,
    home_address character varying(100) NOT NULL,
    entry timestamp without time zone NOT NULL,
    city character varying(100) NOT NULL,
    status character varying(16) NOT NULL
);


ALTER TABLE public.criminal_records OWNER TO postgres;

--
-- Name: criminal_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.criminal_records_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.criminal_records_id_seq OWNER TO postgres;

--
-- Name: criminal_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.criminal_records_id_seq OWNED BY public.criminal_records.id;


--
-- Name: criminal_records id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.criminal_records ALTER COLUMN id SET DEFAULT nextval('public.criminal_records_id_seq'::regclass);


--
-- Data for Name: criminal_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.criminal_records (id, name, felony, ssn, home_address, entry, city, status) FROM stdin;
1	Susan Grant	Tax evasion	094-06-7769	22880 Smith Manor	2021-08-21 00:00:00	Hallberg, MD 17486	missing
2	Terri Riddle	Arson	476-69-5983	5139 Castro Views Apt. 972	2006-01-25 00:00:00	Haysborough, VA 57605	missing
3	Scott Luna	Animal cruelty	453-93-0985	652 Manuel Islands Suite 033	2012-08-16 00:00:00	West Kevin, NC 43942-2168	alive
4	Bradley Cooper	Animal cruelty	181-47-7675	321 Compton Throughway Apt. 364	1990-03-01 00:00:00	New Ashley, ID 43792-6724	terminated
5	Steven Miller MD	Vehicular homicide	792-90-8439	35990 Courtney Fall Suite 357	1981-04-17 00:00:00	East Markberg, GA 25025	missing
6	Marissa Williams	Vehicular homicide	437-66-0443	1453 Megan Center Apt. 892	2001-02-24 00:00:00	Brandonstad, MN 48475-4013	alive
7	Matthew Ward	Larceny	330-33-8508	4343 Toni Vista	1975-04-24 00:00:00	Brownport, MA 52366	alive
8	Monica Fowler	Check fraud	179-14-2082	6483 Dudley Locks	2015-03-01 00:00:00	Hannahberg, MS 11412-8535	missing
9	Sara Oliver	Check fraud	564-41-7039	8392 Devin Cape	2002-03-20 00:00:00	West Davidmouth, WY 11107-8754	alive
10	Jessica Contreras	Obstruction of justice	065-83-6753	29013 Thomas Plaza	2007-02-03 00:00:00	New Susan, ID 23639-5665	terminated
11	Ronald Johnson	Burglary	445-41-6063	363 Newman Mall Suite 691	1986-08-17 00:00:00	South Cristianfort, DC 10773	terminated
12	Steven Anderson	Check fraud	620-98-8383	22351 Jonathan Manor	1985-11-24 00:00:00	Nicolemouth, PR 21740-9762	alive
13	Lisa Riley MD	Check fraud	136-74-5509	Unit 1931 Box 7421	2008-04-11 00:00:00	DPO AE 07073-5582	missing
14	Donna Daniel	Larceny	683-95-2238	934 Watts Springs	2021-03-05 00:00:00	Lake Stephaniefurt, IN 08906-6752	alive
15	Jesse Osborne	Arson	073-68-5031	78959 Tucker Islands	1984-12-31 00:00:00	Knighthaven, LA 94442-7257	terminated
16	James Martinez	Burglary	154-86-3844	2314 David Pass Apt. 111	1994-05-06 00:00:00	Barbarashire, LA 39835	missing
17	Nicholas Bishop	Larceny	125-19-8970	USNV Howe	1981-08-28 00:00:00	FPO AP 23951	terminated
18	Brandi Shah	Burglary	624-73-2256	79986 Finley Points	1983-04-28 00:00:00	Allenview, NJ 68566-2393	alive
19	Paul Rodriguez	Check fraud	218-09-5361	40419 Foster Causeway Apt. 311	1973-05-16 00:00:00	Katelynville, TN 51541	alive
20	Laura Carpenter	Larceny	165-55-0596	9290 Figueroa Flats Apt. 943	2001-05-08 00:00:00	Lake Madison, NH 37597-1414	terminated
21	Mitchell Miller	Obstruction of justice	485-31-7910	49626 Sharp Glen Apt. 885	1994-07-24 00:00:00	Wayneshire, WV 23476	alive
22	Henry Webster	Tax evasion	880-89-8377	3550 Mcdowell Mill	2006-09-24 00:00:00	Harrisport, VI 20282-8726	missing
23	Linda Walker	Check fraud	336-49-4158	026 Brooks Terrace	1983-01-01 00:00:00	Edwardhaven, MO 00067	terminated
24	James Moore	Perjury	172-77-7448	1903 Huff Island	1997-01-06 00:00:00	Valenzuelafurt, IL 49522-2314	terminated
25	Robert Davis	Arson	641-40-9571	PSC 3777, Box 3645	2018-12-14 00:00:00	APO AE 32338	alive
26	Ashlee House	Vehicular homicide	402-21-2377	8384 Katie Motorway	2011-02-05 00:00:00	North Matthew, GU 14833	terminated
27	Justin Johnson	Animal cruelty	825-06-7522	0898 Smith Fort	1992-05-25 00:00:00	Conleymouth, NC 63597	alive
28	Sarah Diaz	Arson	225-34-0591	1509 Robert Creek	1976-02-04 00:00:00	Lake Jamesburgh, OK 30564-6679	alive
29	Dawn Parker	Tax evasion	696-48-2387	Unit 0065 Box 6995	2020-04-10 00:00:00	DPO AA 42216-7704	alive
30	Samantha Smith	Perjury	187-27-0068	25565 Andrew Alley	2021-04-26 00:00:00	Lake Brendashire, SC 64895-3942	terminated
31	Antonio Hull	Arson	841-60-5623	1725 Brandy Expressway Suite 414	1998-10-30 00:00:00	Lake Mariabury, AL 49075-2415	missing
32	Teresa Smith	Burglary	849-60-4082	0128 Michele Trail	2021-05-05 00:00:00	Ericksonhaven, MS 85647-8985	missing
33	Daniel Lawson	Tax evasion	161-01-8859	073 Young Gardens Suite 012	2015-11-02 00:00:00	East Carrie, NM 16193-1613	missing
34	Sean Gonzalez	Obstruction of justice	118-26-4538	31374 Allen Road	1983-05-01 00:00:00	Kristinside, AK 11941	alive
35	Erika Mercado	Perjury	864-42-5176	9240 Estrada Drives	2014-07-05 00:00:00	Jennifermouth, MN 43709	alive
36	Joshua Roman	Vehicular homicide	615-51-7909	43957 Lynn Shoals	1984-04-22 00:00:00	Lake Brandy, DE 94402-5182	alive
37	Austin Ford	Tax evasion	687-73-7830	66743 Costa Parks	2021-06-16 00:00:00	New Trevorberg, CT 72645	alive
38	Mrs. Sarah Adams	Tax evasion	008-46-9501	76197 James Cove	1994-05-25 00:00:00	New Stephanieshire, WI 65282	alive
39	Dr. Jon Figueroa	Tax evasion	363-46-0719	200 Michael Road	2010-01-25 00:00:00	Tracyhaven, NH 82877-9285	alive
40	Bailey Craig	Larceny	712-39-1810	899 Kevin Forest	2010-06-28 00:00:00	Candicebury, PW 66916	missing
41	Jason Hatfield Jr.	Arson	845-30-0146	47847 Christopher Groves	2021-09-19 00:00:00	Marissaland, AK 77387	missing
42	David Lopez	Obstruction of justice	795-93-9828	64776 Mora Views	1976-05-22 00:00:00	New Tyronehaven, OK 82951	terminated
43	Ronald Carter	Perjury	490-31-8547	8727 Megan Plains Apt. 542	2015-03-13 00:00:00	Allenshire, DE 28406	terminated
44	Edwin Riggs	Vehicular homicide	586-73-2666	0051 Gay Knoll	1988-05-01 00:00:00	Dodsonview, ME 56713	missing
45	Tony Glover	Manslaughter	475-65-3320	74184 Greer Track Suite 607	2008-12-19 00:00:00	Barkerfurt, MA 46281	alive
46	Michael Mayer	Burglary	032-55-3087	406 William Prairie	1989-02-27 00:00:00	East Reginaldborough, ID 61268	alive
47	Evan Garcia	Tax evasion	111-07-6801	268 Shelby Cliff Apt. 538	1976-03-04 00:00:00	Robinland, MI 64620	alive
48	Patricia Phillips	Tax evasion	523-37-2390	434 Tiffany Court Apt. 363	1997-02-27 00:00:00	Cookshire, VI 20069-3710	alive
49	Nathan Castro	Manslaughter	806-11-3688	91801 Kelly Knoll Suite 270	2007-01-03 00:00:00	Wendyhaven, PR 35535-4604	alive
50	Collin Espinoza	Burglary	857-37-6661	5592 Simon Ports	1970-11-02 00:00:00	New Gregoryside, AS 58201	terminated
51	Michael Watts	Check fraud	554-84-8189	8430 Melissa Manor	1976-08-07 00:00:00	Paulshire, HI 49026-1110	missing
52	Nicholas Guerrero	Obstruction of justice	854-06-0614	632 Rhonda Pass	1984-10-28 00:00:00	Hallville, VA 83580-8270	alive
53	Dr. Mary Alexander	Check fraud	847-33-3516	578 Ellison Garden	2020-11-14 00:00:00	Port Adam, HI 53491-6802	missing
54	David Wright	Obstruction of justice	880-42-4176	549 Macias Courts	1993-07-26 00:00:00	Wendyshire, ND 89397-1575	alive
55	Kathy Smith	Manslaughter	229-99-9137	0764 Phelps Unions Apt. 413	2008-05-15 00:00:00	East Jared, ND 18027	terminated
56	Garrett Garza	Animal cruelty	450-29-5690	7157 Matthew River	2014-04-23 00:00:00	North Christopherburgh, PA 34542-3369	terminated
57	Michelle Mccoy	Vehicular homicide	343-60-4345	297 Christopher Port Apt. 637	2005-03-31 00:00:00	Kelleyhaven, NE 49581	missing
58	Monica Thompson	Obstruction of justice	248-80-0383	526 Aaron River	1998-06-13 00:00:00	Lake Kennethmouth, MD 44006	alive
59	Beth Greene	Tax evasion	406-79-3161	Unit 7532 Box 5521	2018-08-23 00:00:00	DPO AE 58765	alive
60	Erica Martinez	Tax evasion	422-12-1952	505 Martinez Club	1999-05-04 00:00:00	Jessicamouth, IA 25520-2423	terminated
61	Krystal Taylor	Obstruction of justice	289-19-5643	430 Nicole Coves	2005-10-12 00:00:00	North Natalieberg, MI 48609-0517	alive
62	Randall Mitchell	Tax evasion	191-07-3760	2120 Goodwin Lakes	1976-04-29 00:00:00	North Jamieport, NJ 34805	missing
63	Mr. Eric Davis	Vehicular homicide	270-98-5161	525 Adams Causeway	2015-05-28 00:00:00	Raymondville, MI 15301	alive
64	Maria Williamson	Arson	210-45-8894	358 Joshua Trafficway Apt. 411	1979-06-15 00:00:00	Beckershire, MS 49724-5382	missing
65	Matthew Chambers	Tax evasion	254-17-5480	9722 Jones Lock	2018-12-26 00:00:00	Lake Rebecca, SD 17966-8990	alive
66	Cameron Wallace	Vehicular homicide	637-42-2339	8333 Gonzalez Forges	1998-05-11 00:00:00	New Ryan, MI 35240	alive
67	Tamara Burke	Vehicular homicide	241-87-6387	26357 Mary Brook Suite 342	2014-08-10 00:00:00	West Tanyamouth, MS 24813-7463	terminated
68	Adam Hogan	Vehicular homicide	245-69-5463	95041 Jacob Spring	1984-09-06 00:00:00	Jensenhaven, KY 25152	terminated
69	Peter Delacruz	Tax evasion	031-34-8736	536 Brian Valley	1999-01-17 00:00:00	Davisside, RI 42840	terminated
70	Jonathan Rose	Tax evasion	551-17-6445	62017 Miller Expressway	1995-03-24 00:00:00	West William, MA 63998-5378	missing
71	Sandra Gross	Animal cruelty	028-41-1401	2572 Holly Street Suite 745	1972-12-28 00:00:00	Danielleborough, NY 75855	missing
72	Amanda Myers	Obstruction of justice	858-74-2460	80463 Pham Ford Apt. 981	1974-02-07 00:00:00	Smithside, MN 94810	alive
73	Michael Johnson	Arson	047-60-3320	5494 Short Avenue Apt. 244	2000-01-07 00:00:00	East Christina, MI 14937-5958	missing
74	James Gray	Perjury	709-13-0475	317 Hernandez Village Apt. 414	2010-07-04 00:00:00	Lake Michael, TX 73402	missing
75	Robert Patel	Arson	894-34-7573	USCGC Wood	1991-11-25 00:00:00	FPO AA 10399-1620	missing
76	Hannah Jones	Obstruction of justice	592-80-2804	0899 Reyes Club	1983-03-22 00:00:00	New Jill, ID 52624	terminated
77	Robin Cain DVM	Tax evasion	367-78-0201	0954 Wu Path	2010-04-18 00:00:00	Port Tristanbury, NV 04395	alive
78	Barbara Marshall	Arson	403-28-7578	606 Webster Knoll	2002-09-20 00:00:00	Port Collin, MA 65448	alive
79	Amanda Howard	Vehicular homicide	031-90-1150	093 Martin Knolls	1976-06-29 00:00:00	Ryanshire, MA 26235	terminated
\.


--
-- Name: criminal_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.criminal_records_id_seq', 79, true);


--
-- Name: criminal_records criminal_records_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.criminal_records
    ADD CONSTRAINT criminal_records_pk PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

