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
7	info@motorcyclestuff.com.au	this app does not even work please advise how it works	motorcyclestuff.com.au	2017-10-02 12:49:24.75964	2017-10-02 12:49:24.75964
8	ontrendsavenue@gmail.com	how can I answer the customer back	www.ontrendsavenue.com	2017-10-18 15:46:41.756598	2017-10-18 15:46:41.756598
\.


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jase
--

SELECT pg_catalog.setval('contacts_id_seq', 8, true);


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: jase
--

COPY questions (id, created_at, updated_at, customer_name, customer_email, customer_phone, question_content, shop_id, shop_domain, product_id, is_answered) FROM stdin;
29	2017-10-18 23:13:29.530546	2017-10-18 23:13:29.530546	voldy	Hotcockking123@gmail.com	\N	hi will this fit a 2006 cbr 1000rr	15	moto-helmets-copy-1490606870.myshopify.com	9226824328	f
30	2017-10-23 16:37:29.553367	2017-10-23 16:37:29.553367	Fizzah Nurmohamed 	fizzahkazmi@gmail.com	\N	 Can I ask the size of the pizza in the pocket book? I want to see if it fits in a party bag. Many thanks 	22	islamic-goods-direct-igd.myshopify.com	10628116935	f
33	2017-10-26 08:59:54.057968	2017-10-26 08:59:54.057968	Jenny 	jennyhasler89@gmail.com	\N	Hey any other colors for this model?\nThanks,\nJenny	10	wyldhome.myshopify.com	11508999310	f
31	2017-10-26 08:54:39.349974	2017-10-26 16:13:51.615653	Jenny 	jennyhasler89@gmail.com	\N	Hey, Any other color for this model?\nThanks,\nJenny	27	your-fashions-for-less.myshopify.com	9567146065	t
32	2017-10-26 08:55:21.080397	2017-10-26 16:29:37.577264	Jenny 	jennyhasler89@gmail.com	\N	Hey any other colors for this model?\nThanks,\nJenny	27	your-fashions-for-less.myshopify.com	9567146065	t
34	2017-10-26 20:53:00.507252	2017-10-26 20:53:00.507252	peter harrison	peterte4492011@gmail.com	\N	HI YOU HAVE 2 SENA 30K'S ADVERTISED ON YOUR WEB SITE ONE IS SLIGHTLY MORE EXPENSIVE THAN THE OTHER,CAN YOU TELL ME WHAT THE DIFFERENCE IS BETWEEN THE TWO,THANKS.	15	moto-helmets-copy-1490606870.myshopify.com	10769856200	f
35	2017-10-27 05:37:25.797818	2017-10-27 05:37:25.797818	Zachary Delawarr	Zachhyper@hotmail.com	\N	I bought the shark raw helmet 2 weeks ago and I have noticed it isn’t an approved helmet it doesn’t have the stickers it has a code in the buckle but I’ve never seen one that long help	15	moto-helmets-copy-1490606870.myshopify.com	9029689288	f
36	2017-10-27 15:59:11.75039	2017-10-27 15:59:11.75039	Addie Ismail	addie.viral@gmail.com	\N	size guide?\nwaterproof?	15	moto-helmets-copy-1490606870.myshopify.com	10180496456	f
37	2017-10-28 10:42:20.227732	2017-10-28 10:42:20.227732	Aaron	azza_1992@msn.com	\N	I was wondering if there was an exchange policy if the jacket doesn’t fit?	15	moto-helmets-copy-1490606870.myshopify.com	10180666248	f
38	2017-10-29 18:44:06.083064	2017-10-29 18:44:06.083064	James	jam_hardman@yahoo.com	\N	Hi love these, could you get them in brown with green flock? 	10	wyldhome.myshopify.com	7634321667	f
39	2017-10-30 07:16:38.948248	2017-10-30 07:16:38.948248	Samantha Hojdus	samanthahojdus@live.com.au	\N	do you have a size chart please as they are for my 13yr old daughter	15	moto-helmets-copy-1490606870.myshopify.com	10736632008	f
15	2017-09-30 15:03:42.432254	2017-09-30 15:03:42.432254	Are there any other colors for this product?	sql_nerd@yahoo.com	\N	fffdfgdg	1	lskdfj.myshopify.com	8553214032	f
16	2017-10-02 17:15:27.377599	2017-10-02 17:15:27.377599	Bethany Wrede Peterson	bethany@rocketfactory.co	\N	Hi there, \nDo you have samples of your Mind the Gap wallpapers, and if so, will you ship to the US? \n\nThanks,\nBethany	10	wyldhome.myshopify.com	11346426894	f
17	2017-10-02 22:30:25.400966	2017-10-02 22:30:25.400966	Real Life Shooter	sales@printingboss.com.au	\N	Hi are these instock 	15	moto-helmets-copy-1490606870.myshopify.com	10280422216	f
18	2017-10-03 02:16:20.587099	2017-10-03 02:16:20.587099	Chris	chris.pols@gmail.com	\N	Hi,\nFor your boots, I see you're using Euro sizing. Can you confirm a size 10 in Aus is a 44 on your site?\nLooking at - https://motorcyclestuff.com.au/collections/boots/products/street-1-0-boot-black-new-stock-eta-mid-april?variant=34313944584# \nThanks\nChris	15	moto-helmets-copy-1490606870.myshopify.com	9283486728	f
19	2017-10-03 03:14:46.654474	2017-10-03 03:14:46.654474	Du an mau	tinnguyen911@gmail.com	\N	fffff	1	lskdfj.myshopify.com	8553147664	f
20	2017-10-03 19:26:11.184994	2017-10-03 19:26:11.184994	Georgie	Georgyplatt@btinternet.com	\N	Hi we have two chandeliers hanging at 2 metres each one. We’d like some black covers. Ideally in velvet but silk worst way. How may covers would we need and how soon could we get them and what’s the costs please. Thank you 	10	wyldhome.myshopify.com	5380698627	f
21	2017-10-07 22:23:58.735636	2017-10-07 22:23:58.735636	Shaun Sutton	shaunsutton434@yahoo.com.au	\N	Can you please tell me the date of manufacture please	15	moto-helmets-copy-1490606870.myshopify.com	9029571080	f
22	2017-10-12 02:37:11.00868	2017-10-12 02:37:11.00868	Aimy Margetts	aimz3001@gmail.com	\N	Could I please get the measurements in cm's for across the chest in 7XL, 8XL and 9XL for the suede mens vests please? 	15	moto-helmets-copy-1490606870.myshopify.com	10715530504	f
23	2017-10-14 00:48:42.894783	2017-10-14 00:48:42.894783	Christine 	christinekostic@hotmail.com	\N	Hi can you please  tell me what size 13 in mens please thankyou 	15	moto-helmets-copy-1490606870.myshopify.com	9281741128	f
24	2017-10-14 01:32:28.270283	2017-10-14 01:32:28.270283	Jason	Jason77wilson@icloud.com	\N	Do these also come in matte carbon?	15	moto-helmets-copy-1490606870.myshopify.com	9926307336	f
25	2017-10-18 01:55:57.211949	2017-10-18 01:55:57.211949	Matt	meznz@hotmail.com	\N	Hi, just wanting to clarify that this product comes with the fork brackets/clamps?\nThanks.	15	moto-helmets-copy-1490606870.myshopify.com	10503456072	f
26	2017-10-18 14:25:32.474738	2017-10-18 14:25:32.474738	Dynette Clark	ontrendsavenue@gmail.com	\N	what size does this come in	23	on-trends-avenue.myshopify.com	8904465160	f
27	2017-10-18 14:33:20.815393	2017-10-18 14:33:20.815393	Dynette Clark	dynclark@gmail.com	\N	test	23	on-trends-avenue.myshopify.com	8904465160	f
28	2017-10-18 15:14:09.187552	2017-10-18 15:39:51.146492	Susan	susanaalexandra88@gmail.com	\N	I want buy backpack purple color...is it available?	23	on-trends-avenue.myshopify.com	8198582408	t
40	2017-11-05 10:21:39.733456	2017-11-05 10:21:39.733456	John Abbott	sebjohnastian@gmail.com	\N	Is this product supplied with a unit for the rider and the pillion passenger, or is it a just one unit for the rider. So another one needs to be purchased for the passenger?	15	moto-helmets-copy-1490606870.myshopify.com	9029611336	f
41	2017-11-07 12:08:50.788153	2017-11-07 12:08:50.788153	Rick	Ricky.kearns@laminex.com.au	\N	What are the physical dimensions of the bag	15	moto-helmets-copy-1490606870.myshopify.com	9215772616	f
42	2017-11-10 06:32:42.353061	2017-11-10 06:32:42.353061	Jason	Jason77wilson@icloud.com	\N	Do you have the front pads for a 2010 as these do not match mine?	15	moto-helmets-copy-1490606870.myshopify.com	26376765448	f
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
2	2	Submit your question for this product	Thanks for contacting us. We will get back to you later	jasestore.myshopify.com	2017-09-11 03:38:26.67325	2017-09-11 03:38:26.67325
3	3	Submit your question for this product	Thanks for contacting us. We will get back to you later	suitekix1.myshopify.com	2017-09-11 19:52:04.348668	2017-09-11 19:52:04.348668
4	4	Submit your question for this product	Thanks for contacting us. We will get back to you later	suitekix3.myshopify.com	2017-09-11 19:56:52.218888	2017-09-11 19:56:52.218888
5	5	Submit your question for this product	Thanks for contacting us. We will get back to you later	suitekix2.myshopify.com	2017-09-13 15:55:58.845333	2017-09-13 15:55:58.845333
6	6	Submit your question for this product	Thanks for contacting us. We will get back to you later	suitekix6.myshopify.com	2017-09-16 18:53:47.64138	2017-09-16 18:53:47.64138
7	7	Submit your question for this product	Thanks for contacting us. We will get back to you later	the-vintage-lighting-company-ltd.myshopify.com	2017-09-22 22:01:52.805071	2017-09-22 22:01:52.805071
8	8	Submit your question for this product	Thanks for contacting us. We will get back to you later	tinstore1.myshopify.com	2017-09-23 02:59:10.598241	2017-09-23 02:59:10.598241
9	9	Submit your question for this product	Thanks for contacting us. We will get back to you later	starving-jewelers.myshopify.com	2017-09-26 03:17:44.421544	2017-09-26 03:17:44.421544
11	11	Submit your question for this product	Thanks for contacting us. We will get back to you later	the-million-roses-praha.myshopify.com	2017-09-27 10:01:24.294344	2017-09-27 10:01:24.294344
12	12	Submit your question for this product	Thanks for contacting us. We will get back to you later	theshavingshopclub.myshopify.com	2017-09-27 11:59:51.732045	2017-09-27 11:59:51.732045
13	13	Submit your question for this product	Thanks for contacting us. We will get back to you later	nakhuda-store.myshopify.com	2017-09-27 12:13:22.570543	2017-09-27 12:13:22.570543
1	1	Submit your question for this product?	Thanks for contacting us. We will get back to you later!	lskdfj.myshopify.com	2017-09-11 03:32:00.206468	2017-09-28 08:23:31.710259
10	10	Ask away :)	Thanks for ing. We'll get back to you as soon as we can.	wyldhome.myshopify.com	2017-09-27 09:18:17.147583	2017-09-30 13:04:05.728671
14	14	Submit your question for this product	Thanks for contacting us. We will get back to you later	as-colour-online.myshopify.com	2017-10-02 12:41:12.900252	2017-10-02 12:41:12.900252
15	15	Submit your question for this product	Thanks for contacting us. We will get back to you real soon 	moto-helmets-copy-1490606870.myshopify.com	2017-10-02 12:46:39.619641	2017-10-02 12:48:11.156414
16	16	Submit your question for this product	Thanks for contacting us. We will get back to you later	4myskin.myshopify.com	2017-10-02 14:33:26.179721	2017-10-02 14:33:26.179721
17	17	Submit your question for this product	Thanks for contacting us. We will get back to you later	test-store-apps.myshopify.com	2017-10-05 20:16:07.480831	2017-10-05 20:16:07.480831
18	18	Submit your question for this product	Thanks for contacting us. We will get back to you later	earth-elixir.myshopify.com	2017-10-08 22:21:08.302866	2017-10-08 22:21:08.302866
19	19	Submit your question for this product	Thanks for contacting us. We will get back to you later	appstoretest7.myshopify.com	2017-10-12 12:59:31.782947	2017-10-12 12:59:31.782947
20	20	Request a sample. Tell us about your project.	Thanks for contacting us. We will get back to you as soon as possible.	filmstep.myshopify.com	2017-10-12 16:34:02.867521	2017-10-12 16:36:06.480343
21	21	Submit your question for this product	Thanks for contacting us. We will get back to you later	cullensbabyland.myshopify.com	2017-10-12 20:29:24.843894	2017-10-12 20:29:24.843894
23	23	Submit your question for this product	Thanks for contacting us. We will get back to you later	on-trends-avenue.myshopify.com	2017-10-18 14:24:05.623527	2017-10-18 14:24:05.623527
24	24	Submit your question for this product	Thanks for contacting us. We will get back to you later	sauvageswm.myshopify.com	2017-10-18 16:25:13.197717	2017-10-18 16:25:13.197717
25	25	Submit your question for this product	Thanks for contacting us. We will get back to you later	tkskin.myshopify.com	2017-10-19 08:07:40.340569	2017-10-19 08:07:40.340569
26	26	Submit your question for this product	Thanks for contacting us. We will get back to you later	applerok.myshopify.com	2017-10-20 21:46:53.833496	2017-10-20 21:46:53.833496
22	22	Just hit "Submit" when you're done typing your question	Thanks for asking about this product. One of the lovely team will review this and get back to you as soon as possible :)	islamic-goods-direct-igd.myshopify.com	2017-10-17 14:42:37.992416	2017-10-23 10:58:32.482162
27	27	Submit your question for this product	Thanks for contacting us. We will get back to you later	your-fashions-for-less.myshopify.com	2017-10-25 15:45:03.201733	2017-10-25 15:45:03.201733
28	28	Submit your question for this product	Thanks for contacting us. We will get back to you later	sui-generis-consignment.myshopify.com	2017-10-27 20:58:03.71451	2017-10-27 20:58:03.71451
29	29	Submit your question for this product	Thanks for contacting us. We will get back to you later	dragonsrose.myshopify.com	2017-10-29 03:30:40.118535	2017-10-29 03:30:40.118535
30	30	Submit your question for this product	Thanks for contacting us. We will get back to you later	appstest22.myshopify.com	2017-10-30 23:59:08.878714	2017-10-30 23:59:08.878714
31	31	Submit your question for this product	Thanks for contacting us. We will get back to you later	appstest1.myshopify.com	2017-11-10 22:07:00.958786	2017-11-10 22:07:00.958786
\.


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jase
--

SELECT pg_catalog.setval('settings_id_seq', 31, true);


--
-- Data for Name: shops; Type: TABLE DATA; Schema: public; Owner: jase
--

COPY shops (id, shopify_domain, shopify_token, created_at, updated_at) FROM stdin;
30	appstest22.myshopify.com	f3e085ae9f09fb59597f49e7e02d445a	2017-10-30 23:59:08.873405	2017-10-30 23:59:08.873405
19	appstoretest7.myshopify.com	efe6500ff16e266ce233f819bae746cd	2017-10-12 12:59:31.77273	2017-11-07 04:26:00.885986
31	appstest1.myshopify.com	d3c40a56921d59a41170fbe9b32ef0a5	2017-11-10 22:07:00.953295	2017-11-10 22:07:00.953295
8	tinstore1.myshopify.com	36a457ca48156176f50fdcfc80fc859e	2017-09-23 02:59:10.580558	2017-11-11 02:49:49.639768
3	suitekix1.myshopify.com	b99394774df331ab7616618f18eb0055	2017-09-11 19:52:04.342078	2017-09-13 15:54:52.676211
5	suitekix2.myshopify.com	a3cdbe4465434873e2962244a234b525	2017-09-13 15:55:58.836569	2017-09-13 15:55:58.836569
6	suitekix6.myshopify.com	2bd279bef99150fa82a60e5fc978df4a	2017-09-16 18:53:47.633016	2017-09-16 18:59:55.908258
4	suitekix3.myshopify.com	23e96af86b1be724f7a35d10f7f9ece2	2017-09-11 19:56:52.215742	2017-09-19 16:14:05.403036
2	jasestore.myshopify.com	3829677fe4d4baadebf64a88da5e8bb0	2017-09-11 03:38:26.669792	2017-09-23 03:10:24.168428
7	the-vintage-lighting-company-ltd.myshopify.com	17971a4454e1e37eb84cfbcd0391b3c3	2017-09-22 22:01:52.796239	2017-09-23 15:10:09.631257
9	starving-jewelers.myshopify.com	eba9e48b92a1437128fa2eb8590e0327	2017-09-26 03:17:44.416615	2017-09-26 03:17:44.416615
10	wyldhome.myshopify.com	fda9aeee2b3a41ce31185cf2de4bccd9	2017-09-27 09:18:17.132624	2017-09-27 09:18:17.132624
11	the-million-roses-praha.myshopify.com	68849398f51d5244d312b248504e51b2	2017-09-27 10:01:24.290493	2017-09-27 10:01:24.290493
12	theshavingshopclub.myshopify.com	68a43b6b9f220f67fc0fc1c82b92c47b	2017-09-27 11:59:51.728776	2017-09-27 11:59:51.728776
13	nakhuda-store.myshopify.com	3fb75c95801bcc9a21a6983ca88a7d52	2017-09-27 12:13:22.567615	2017-09-27 12:13:22.567615
14	as-colour-online.myshopify.com	10ca3fd4e6577d73c7603aef03bf6bd6	2017-10-02 12:41:12.890557	2017-10-02 12:41:12.890557
15	moto-helmets-copy-1490606870.myshopify.com	ad7b29e2eb721660d5225ff2444389b7	2017-10-02 12:46:39.616876	2017-10-02 12:46:39.616876
16	4myskin.myshopify.com	50cd293e689f5c537e350063c52c4ae1	2017-10-02 14:33:26.176838	2017-10-02 14:33:26.176838
1	lskdfj.myshopify.com	570821365a3398d81eaff09401ec137e	2017-09-11 03:32:00.188688	2017-10-03 03:13:43.552966
17	test-store-apps.myshopify.com	22bd11b8fa60fcd65537cfccb05ffc4f	2017-10-05 20:16:07.47125	2017-10-05 20:16:07.47125
18	earth-elixir.myshopify.com	db1970e8e89320e5b41af95c04f93ca9	2017-10-08 22:21:08.293034	2017-10-08 22:21:08.293034
20	filmstep.myshopify.com	ae59e260b01c130a896015083b7d7b88	2017-10-12 16:34:02.864084	2017-10-12 16:34:02.864084
21	cullensbabyland.myshopify.com	b9ded49700292f5896bdbaf5fb7b8fee	2017-10-12 20:29:24.84078	2017-10-12 20:29:24.84078
22	islamic-goods-direct-igd.myshopify.com	5ee8df55c2822c940377dfa35594dfd7	2017-10-17 14:42:37.982486	2017-10-17 14:42:37.982486
23	on-trends-avenue.myshopify.com	320fb21c3813a8a48224c1bceef9be38	2017-10-18 14:24:05.62052	2017-10-18 14:24:05.62052
24	sauvageswm.myshopify.com	b6ce04d84c945e9622d1523b4dc05463	2017-10-18 16:25:13.193892	2017-10-18 16:25:13.193892
25	tkskin.myshopify.com	79c2513a5718b54b5c830e8326ae2dfd	2017-10-19 08:07:40.33048	2017-10-19 08:07:40.33048
26	applerok.myshopify.com	7854874aa7e87bf2f6026dd8b40da80c	2017-10-20 21:46:53.824606	2017-10-20 21:46:53.824606
27	your-fashions-for-less.myshopify.com	02f1f489022db3a336ee8eebcccf6ae1	2017-10-25 15:45:03.192244	2017-10-25 15:45:03.192244
28	sui-generis-consignment.myshopify.com	f95a419f50f1329817aba569c5bad565	2017-10-27 20:58:03.709362	2017-10-27 20:58:03.709362
29	dragonsrose.myshopify.com	402ccd27d8d0f24065aafa4e9232a8c7	2017-10-29 03:30:40.113443	2017-10-29 11:52:00.931377
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

