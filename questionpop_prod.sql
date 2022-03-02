--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.8
-- Dumped by pg_dump version 9.5.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: jase
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO jase;

--
-- Name: contacts; Type: TABLE; Schema: public; Owner: jase
--

CREATE TABLE contacts (
    id integer NOT NULL,
    email character varying,
    content character varying,
    shop_domain character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE contacts OWNER TO jase;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: jase
--

CREATE SEQUENCE contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contacts_id_seq OWNER TO jase;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jase
--

ALTER SEQUENCE contacts_id_seq OWNED BY contacts.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: jase
--

CREATE TABLE questions (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    customer_name character varying,
    customer_email character varying,
    customer_phone character varying,
    question_content character varying,
    shop_id integer,
    shop_domain character varying,
    product_id double precision,
    is_answered boolean DEFAULT false
);


ALTER TABLE questions OWNER TO jase;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: jase
--

CREATE SEQUENCE questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE questions_id_seq OWNER TO jase;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jase
--

ALTER SEQUENCE questions_id_seq OWNED BY questions.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: jase
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO jase;

--
-- Name: settings; Type: TABLE; Schema: public; Owner: jase
--

CREATE TABLE settings (
    id integer NOT NULL,
    shop_id integer,
    user_message character varying,
    notification_message character varying,
    shop_domain character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE settings OWNER TO jase;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: jase
--

CREATE SEQUENCE settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE settings_id_seq OWNER TO jase;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jase
--

ALTER SEQUENCE settings_id_seq OWNED BY settings.id;


--
-- Name: shops; Type: TABLE; Schema: public; Owner: jase
--

CREATE TABLE shops (
    id integer NOT NULL,
    shopify_domain character varying NOT NULL,
    shopify_token character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE shops OWNER TO jase;

--
-- Name: shops_id_seq; Type: SEQUENCE; Schema: public; Owner: jase
--

CREATE SEQUENCE shops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shops_id_seq OWNER TO jase;

--
-- Name: shops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jase
--

ALTER SEQUENCE shops_id_seq OWNED BY shops.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jase
--

ALTER TABLE ONLY contacts ALTER COLUMN id SET DEFAULT nextval('contacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jase
--

ALTER TABLE ONLY questions ALTER COLUMN id SET DEFAULT nextval('questions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jase
--

ALTER TABLE ONLY settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jase
--

ALTER TABLE ONLY shops ALTER COLUMN id SET DEFAULT nextval('shops_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: jase
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2017-09-11 03:31:33.171084	2017-09-11 03:31:33.171084
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: jase
--

COPY contacts (id, email, content, shop_domain, created_at, updated_at) FROM stdin;
\.


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jase
--

SELECT pg_catalog.setval('contacts_id_seq', 8, true);


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: jase
--

COPY questions (id, created_at, updated_at, customer_name, customer_email, customer_phone, question_content, shop_id, shop_domain, product_id, is_answered) FROM stdin;
29	2017-10-18 23:13:29.530546	2017-10-18 23:13:29.530546	voldy	Hotcockking123@gmail.com	\N	hi will this fit a 2006 cbr 1000rr	4	moto-helmets-copy-1490606870.myshopify.com	9226824328	f
33	2017-10-26 08:59:54.057968	2017-10-26 08:59:54.057968	Jenny 	jennyhasler89@gmail.com	\N	Hey any other colors for this model?\nThanks,\nJenny	2	wyldhome.myshopify.com	11508999310	f
34	2017-10-26 20:53:00.507252	2017-10-26 20:53:00.507252	peter harrison	peterte4492011@gmail.com	\N	HI YOU HAVE 2 SENA 30K'S ADVERTISED ON YOUR WEB SITE ONE IS SLIGHTLY MORE EXPENSIVE THAN THE OTHER,CAN YOU TELL ME WHAT THE DIFFERENCE IS BETWEEN THE TWO,THANKS.	4	moto-helmets-copy-1490606870.myshopify.com	10769856200	f
35	2017-10-27 05:37:25.797818	2017-10-27 05:37:25.797818	Zachary Delawarr	Zachhyper@hotmail.com	\N	I bought the shark raw helmet 2 weeks ago and I have noticed it isn’t an approved helmet it doesn’t have the stickers it has a code in the buckle but I’ve never seen one that long help	4	moto-helmets-copy-1490606870.myshopify.com	9029689288	f
36	2017-10-27 15:59:11.75039	2017-10-27 15:59:11.75039	Addie Ismail	addie.viral@gmail.com	\N	size guide?\nwaterproof?	4	moto-helmets-copy-1490606870.myshopify.com	10180496456	f
37	2017-10-28 10:42:20.227732	2017-10-28 10:42:20.227732	Aaron	azza_1992@msn.com	\N	I was wondering if there was an exchange policy if the jacket doesn’t fit?	4	moto-helmets-copy-1490606870.myshopify.com	10180666248	f
38	2017-10-29 18:44:06.083064	2017-10-29 18:44:06.083064	James	jam_hardman@yahoo.com	\N	Hi love these, could you get them in brown with green flock? 	2	wyldhome.myshopify.com	7634321667	f
39	2017-10-30 07:16:38.948248	2017-10-30 07:16:38.948248	Samantha Hojdus	samanthahojdus@live.com.au	\N	do you have a size chart please as they are for my 13yr old daughter	4	moto-helmets-copy-1490606870.myshopify.com	10736632008	f
16	2017-10-02 17:15:27.377599	2017-10-02 17:15:27.377599	Bethany Wrede Peterson	bethany@rocketfactory.co	\N	Hi there, \nDo you have samples of your Mind the Gap wallpapers, and if so, will you ship to the US? \n\nThanks,\nBethany	2	wyldhome.myshopify.com	11346426894	f
17	2017-10-02 22:30:25.400966	2017-10-02 22:30:25.400966	Real Life Shooter	sales@printingboss.com.au	\N	Hi are these instock 	4	moto-helmets-copy-1490606870.myshopify.com	10280422216	f
18	2017-10-03 02:16:20.587099	2017-10-03 02:16:20.587099	Chris	chris.pols@gmail.com	\N	Hi,\nFor your boots, I see you're using Euro sizing. Can you confirm a size 10 in Aus is a 4 on your site?\nLooking at - https://motorcyclestuff.com.au/collections/boots/products/street-1-0-boot-black-new-stock-eta-mid-april?variant=34313944584# \nThanks\nChris	4	moto-helmets-copy-1490606870.myshopify.com	9283486728	f
20	2017-10-03 19:26:11.184994	2017-10-03 19:26:11.184994	Georgie	Georgyplatt@btinternet.com	\N	Hi we have two chandeliers hanging at 2 metres each one. We’d like some black covers. Ideally in velvet but silk worst way. How may covers would we need and how soon could we get them and what’s the costs please. Thank you 	2	wyldhome.myshopify.com	5380698627	f
21	2017-10-07 22:23:58.735636	2017-10-07 22:23:58.735636	Shaun Sutton	shaunsutton434@yahoo.com.au	\N	Can you please tell me the date of manufacture please	4	moto-helmets-copy-1490606870.myshopify.com	9029571080	f
22	2017-10-12 02:37:11.00868	2017-10-12 02:37:11.00868	Aimy Margetts	aimz3001@gmail.com	\N	Could I please get the measurements in cm's for across the chest in 7XL, 8XL and 9XL for the suede mens vests please? 	4	moto-helmets-copy-1490606870.myshopify.com	10715530504	f
23	2017-10-14 00:48:42.894783	2017-10-14 00:48:42.894783	Christine 	christinekostic@hotmail.com	\N	Hi can you please  tell me what size 13 in mens please thankyou 	4	moto-helmets-copy-1490606870.myshopify.com	9281741128	f
24	2017-10-14 01:32:28.270283	2017-10-14 01:32:28.270283	Jason	Jason77wilson@icloud.com	\N	Do these also come in matte carbon?	4	moto-helmets-copy-1490606870.myshopify.com	9926307336	f
25	2017-10-18 01:55:57.211949	2017-10-18 01:55:57.211949	Matt	meznz@hotmail.com	\N	Hi, just wanting to clarify that this product comes with the fork brackets/clamps?\nThanks.	4	moto-helmets-copy-1490606870.myshopify.com	10503456072	f
40	2017-11-05 10:21:39.733456	2017-11-05 10:21:39.733456	John Abbott	sebjohnastian@gmail.com	\N	Is this product supplied with a unit for the rider and the pillion passenger, or is it a just one unit for the rider. So another one needs to be purchased for the passenger?	4	moto-helmets-copy-1490606870.myshopify.com	9029611336	f
41	2017-11-07 12:08:50.788153	2017-11-07 12:08:50.788153	Rick	Ricky.kearns@laminex.com.au	\N	What are the physical dimensions of the bag	4	moto-helmets-copy-1490606870.myshopify.com	9215772616	f
42	2017-11-10 06:32:42.353061	2017-11-10 06:32:42.353061	Jason	Jason77wilson@icloud.com	\N	Do you have the front pads for a 2010 as these do not match mine?	4	moto-helmets-copy-1490606870.myshopify.com	26376765448	f
\.


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jase
--

SELECT pg_catalog.setval('questions_id_seq', 42, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: jase
--

COPY schema_migrations (version) FROM stdin;
20170325070251
20170507075647
20170507133306
20170507142518
20170702112249
20170713034539
20170801153452
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: jase
--

COPY settings (id, shop_id, user_message, notification_message, shop_domain, created_at, updated_at) FROM stdin;
1	1	Submit your question for this product	Thanks for contacting us. We will get back to you later	the-vintage-lighting-company-ltd.myshopify.com	2017-09-22 22:01:52.805071	2017-09-22 22:01:52.805071
2	2	Ask away :)	Thanks for ing. We'll get back to you as soon as we can.	wyldhome.myshopify.com	2017-09-27 09:18:17.147583	2017-09-30 13:04:05.728671
3	3	Submit your question for this product	Thanks for contacting us. We will get back to you later	as-colour-online.myshopify.com	2017-10-02 12:41:12.900252	2017-10-02 12:41:12.900252
4	4	Submit your question for this product	Thanks for contacting us. We will get back to you real soon 	moto-helmets-copy-1490606870.myshopify.com	2017-10-02 12:46:39.619641	2017-10-02 12:48:11.156414
\.


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jase
--

SELECT pg_catalog.setval('settings_id_seq', 31, true);


--
-- Data for Name: shops; Type: TABLE DATA; Schema: public; Owner: jase
--

COPY shops (id, shopify_domain, shopify_token, created_at, updated_at) FROM stdin;
1	the-vintage-lighting-company-ltd.myshopify.com	17971a4454e1e37eb84cfbcd0391b3c3	2017-09-22 22:01:52.796239	2017-09-23 15:10:09.631257
2	wyldhome.myshopify.com	fda9aeee2b3a41ce31185cf2de4bccd9	2017-09-27 09:18:17.132624	2017-09-27 09:18:17.132624
3	as-colour-online.myshopify.com	10ca3fd4e6577d73c7603aef03bf6bd6	2017-10-02 12:41:12.890557	2017-10-02 12:41:12.890557
4	moto-helmets-copy-1490606870.myshopify.com	ad7b29e2eb721660d5225ff2444389b7	2017-10-02 12:46:39.616876	2017-10-02 12:46:39.616876
\.


--
-- Name: shops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jase
--

SELECT pg_catalog.setval('shops_id_seq', 31, true);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: jase
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: jase
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: questions_pkey; Type: CONSTRAINT; Schema: public; Owner: jase
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: jase
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: settings_pkey; Type: CONSTRAINT; Schema: public; Owner: jase
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: shops_pkey; Type: CONSTRAINT; Schema: public; Owner: jase
--

ALTER TABLE ONLY shops
    ADD CONSTRAINT shops_pkey PRIMARY KEY (id);


--
-- Name: index_settings_on_shop_id; Type: INDEX; Schema: public; Owner: jase
--

CREATE UNIQUE INDEX index_settings_on_shop_id ON settings USING btree (shop_id);


--
-- Name: index_shops_on_shopify_domain; Type: INDEX; Schema: public; Owner: jase
--

CREATE UNIQUE INDEX index_shops_on_shopify_domain ON shops USING btree (shopify_domain);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
