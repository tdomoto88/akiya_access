--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6 (Homebrew)
-- Dumped by pg_dump version 16.2

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
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: tdomoto88
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO tdomoto88;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: tdomoto88
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_attachments_id_seq OWNER TO tdomoto88;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tdomoto88
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: tdomoto88
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO tdomoto88;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: tdomoto88
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_blobs_id_seq OWNER TO tdomoto88;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tdomoto88
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: tdomoto88
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO tdomoto88;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: tdomoto88
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNER TO tdomoto88;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tdomoto88
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: tdomoto88
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO tdomoto88;

--
-- Name: bookings; Type: TABLE; Schema: public; Owner: tdomoto88
--

CREATE TABLE public.bookings (
    id bigint NOT NULL,
    check_in date,
    check_out date,
    guests integer,
    user_id bigint NOT NULL,
    property_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.bookings OWNER TO tdomoto88;

--
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: tdomoto88
--

CREATE SEQUENCE public.bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookings_id_seq OWNER TO tdomoto88;

--
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tdomoto88
--

ALTER SEQUENCE public.bookings_id_seq OWNED BY public.bookings.id;


--
-- Name: properties; Type: TABLE; Schema: public; Owner: tdomoto88
--

CREATE TABLE public.properties (
    id bigint NOT NULL,
    price double precision,
    age integer,
    address character varying,
    bedrooms integer,
    description character varying,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    latitude double precision,
    longitude double precision,
    city character varying,
    prefecture character varying
);


ALTER TABLE public.properties OWNER TO tdomoto88;

--
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: tdomoto88
--

CREATE SEQUENCE public.properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.properties_id_seq OWNER TO tdomoto88;

--
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tdomoto88
--

ALTER SEQUENCE public.properties_id_seq OWNED BY public.properties.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: tdomoto88
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO tdomoto88;

--
-- Name: users; Type: TABLE; Schema: public; Owner: tdomoto88
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    dob date,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone
);


ALTER TABLE public.users OWNER TO tdomoto88;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: tdomoto88
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO tdomoto88;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tdomoto88
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: tdomoto88
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: tdomoto88
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: tdomoto88
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: tdomoto88
--

ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public.bookings_id_seq'::regclass);


--
-- Name: properties id; Type: DEFAULT; Schema: public; Owner: tdomoto88
--

ALTER TABLE ONLY public.properties ALTER COLUMN id SET DEFAULT nextval('public.properties_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: tdomoto88
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: tdomoto88
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
14	photo	Property	17	14	2024-05-30 04:34:07.497696
15	photo	Property	18	15	2024-05-30 04:34:15.579102
16	photo	Property	19	16	2024-05-30 04:34:22.28221
17	photo	Property	20	17	2024-05-30 04:34:27.085886
18	photo	Property	21	18	2024-05-30 04:34:31.45287
19	photo	Property	22	19	2024-05-30 04:34:36.43585
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: tdomoto88
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
14	gr8by61i34rqs8165hse2woy0lhv	akiya.png	image/webp	{"identified":true,"analyzed":true}	cloudinary	109854	B0Q0HMWDW6+iOIf+ehJ08Q==	2024-05-30 04:34:07.495396
15	zpx631104cuz51l64ngd99wip3eb	akiya2.png	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	2344021	namKVl+u0R39ukM82aNKrQ==	2024-05-30 04:34:15.576842
16	2izdnz36ddp44wy3imdfm9ojn8y4	akiya3.png	text/html	{"identified":true,"analyzed":true}	cloudinary	1485	+dzvlBCTlNuSy/JKAig+Eg==	2024-05-30 04:34:22.280013
17	klq9cun0hu5uit5vklfouq3bif46	akiya4.png	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	62166	SnrQ5eXaZD0Wt9C8JgY4uA==	2024-05-30 04:34:27.08366
18	ml3haawnyrkv526sd172syvxkbt0	akiya5.png	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	170080	9QO5fzUbgX538Gx/czTIvA==	2024-05-30 04:34:31.451162
19	4x9amrtszj0upsthbynjc49bc3wj	akiya6.png	image/jpeg	{"identified":true}	cloudinary	164823	vX0xTVcf9lGDtvXdFzLPMg==	2024-05-30 04:34:36.433576
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: tdomoto88
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: tdomoto88
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-05-27 06:46:44.706008	2024-05-27 06:46:44.70601
\.


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: tdomoto88
--

COPY public.bookings (id, check_in, check_out, guests, user_id, property_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: tdomoto88
--

COPY public.properties (id, price, age, address, bedrooms, description, user_id, created_at, updated_at, latitude, longitude, city, prefecture) FROM stdin;
20	15858	1971	Tanaka Asukaicho, Kyoto, 606-8304 Japan	1	This 1-bedroom condo is located in Tanaka Asukaimachi, Sakyo Ward, Kyoto City, Kyoto Prefecture. The 51-year-old steel-frame building features 1 bedroom, 1 dining room, and 1 kitchen. It is a 6-minute walk from Tanaka Station on the Eizan Electric Railway Eizan Main Line.	9	2024-05-30 04:34:27.07067	2024-05-30 04:34:29.194193	35.031903	135.7795504	Kyoto	Kyoto
21	10783	1933	4 Hayashiji, Ikuno-ku, Osaka-shi, Osaka Prefecture	3	This 3-bedroom, 1-living room, 1-dining room, and 1-kitchen wooden house is 89 years old and is located in Ikuno-ku, Osaka. The house is a leasehold property with a new 20-year lease period. The house is conveniently located near shopping and has public transportation nearby including the JR Osaka Loop Line Teradamachi Station which is a 16-minute walk away.	9	2024-05-30 04:34:31.440924	2024-05-30 04:34:33.991784	34.6426035	135.5338376	Osaka	Osaka
17	19111	1983	Miyamacho Mitsuno, Nantan, Kyoto 601-0773, Japan	5	This 5-bedroom, 1-dining room, and 1-kitchen house is nestled amidst lush greenery, offering a tranquil escape for nature enthusiasts. The 39-year-old wooden home features public water and a convenient parking space. It is a short 6-minute walk from the Kawatani stop on the Nantan City Bus and a 15.8 km drive from the Wachi Station on the JR Sanin Main Line.	9	2024-05-30 04:34:07.472803	2024-05-30 04:34:10.028997	\N	\N	Nagano	Kyoto
22	19029	1983	Mitano Otana, Miyama-cho, Nantan City, Kyoto Prefecture	5	This 5-bedroom, 1-dining room, and 1-kitchen house is nestled amidst lush greenery, offering a tranquil escape for nature enthusiasts. The 39-year-old wooden home features public water and a convenient parking space. It is a short 6-minute walk from the Kawatani stop on the Nantan City Bus and a 15.8 km drive from the Wachi Station on the JR Sanin Main Line.	9	2024-05-30 04:34:36.418419	2024-05-30 04:34:36.437702	\N	\N	Nantan	Kyoto
18	11466	1926	281 Shimonojō, Fukuchiyama, Kyoto 620-0211, Japan	3	This 130-year-old house is nestled in a tranquil residential neighborhood and boasts a detached building and a warehouse. The detached building spans 1,257 square feet, and the property offers ample parking for five kei cars.	10	2024-05-30 04:34:15.562477	2024-05-30 04:34:19.443539	\N	\N	Tokyo	Kyoto
19	22296	1965	Kyotango, Kyoto 629-3101, Japan	8	This 8-bedroom, 1-kitchen house is located in a quiet area near the sea. The wooden, 2-story building is 58 years old and is a short 20-minute walk from Amino Station on the Amino-cho Line.	9	2024-05-30 04:34:22.266546	2024-05-30 04:34:23.669676	35.6455135	135.0434555	Kyoto	Kyoto
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: tdomoto88
--

COPY public.schema_migrations (version) FROM stdin;
20240527070443
20240527071201
20240527071202
20240527082640
20240529025627
20240529030820
20240529042914
20240530032652
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: tdomoto88
--

COPY public.users (id, first_name, last_name, dob, created_at, updated_at, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at) FROM stdin;
9	Sebastian	Burke	2002-03-01	2024-05-30 04:34:03.194219	2024-05-30 04:34:03.194219	sebastian.b@gmail.com	$2a$12$TB4VtTLp.kYM0AT2OsQgwOhJDshvOVYRkzUx//HBd/l/glnipDfIq	\N	\N	\N
10	Mamun	Jan	2003-08-15	2024-05-30 04:34:03.439152	2024-05-30 04:34:03.439152	mamun.j@gmail.com	$2a$12$nAxJPuD25PLWbIs90WpoEOTGSzuw/hjVwvBOC5VrP1K94nguIEzp6	\N	\N	\N
11	Tsuyoshi	Domoto	2024-05-30	2024-05-30 06:29:48.062137	2024-05-30 06:29:48.062137	tdomoto88@gmail.com	$2a$12$Z3FfXkTIta9suhjYVoMhaOquXKsoSrNbGNWsdfttw2/92BzvrbNUG	\N	\N	\N
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tdomoto88
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 19, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tdomoto88
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 19, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tdomoto88
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tdomoto88
--

SELECT pg_catalog.setval('public.bookings_id_seq', 1, false);


--
-- Name: properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tdomoto88
--

SELECT pg_catalog.setval('public.properties_id_seq', 22, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tdomoto88
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: tdomoto88
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: tdomoto88
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: tdomoto88
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: tdomoto88
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: tdomoto88
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- Name: properties properties_pkey; Type: CONSTRAINT; Schema: public; Owner: tdomoto88
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: tdomoto88
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: tdomoto88
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: tdomoto88
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: tdomoto88
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: tdomoto88
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: tdomoto88
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_bookings_on_property_id; Type: INDEX; Schema: public; Owner: tdomoto88
--

CREATE INDEX index_bookings_on_property_id ON public.bookings USING btree (property_id);


--
-- Name: index_bookings_on_user_id; Type: INDEX; Schema: public; Owner: tdomoto88
--

CREATE INDEX index_bookings_on_user_id ON public.bookings USING btree (user_id);


--
-- Name: index_properties_on_user_id; Type: INDEX; Schema: public; Owner: tdomoto88
--

CREATE INDEX index_properties_on_user_id ON public.properties USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: tdomoto88
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: tdomoto88
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: bookings fk_rails_95b2761688; Type: FK CONSTRAINT; Schema: public; Owner: tdomoto88
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT fk_rails_95b2761688 FOREIGN KEY (property_id) REFERENCES public.properties(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: tdomoto88
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: tdomoto88
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: properties fk_rails_e41321a67c; Type: FK CONSTRAINT; Schema: public; Owner: tdomoto88
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT fk_rails_e41321a67c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: bookings fk_rails_ef0571f117; Type: FK CONSTRAINT; Schema: public; Owner: tdomoto88
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT fk_rails_ef0571f117 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

