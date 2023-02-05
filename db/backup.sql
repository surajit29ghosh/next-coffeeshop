--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'WIN1252';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: barista; Type: SCHEMA; Schema: -; Owner: coffeeshop
--

CREATE SCHEMA barista;


ALTER SCHEMA barista OWNER TO coffeeshop;

--
-- Name: kitchen; Type: SCHEMA; Schema: -; Owner: coffeeshop
--

CREATE SCHEMA kitchen;


ALTER SCHEMA kitchen OWNER TO coffeeshop;

--
-- Name: order; Type: SCHEMA; Schema: -; Owner: coffeeshop
--

CREATE SCHEMA "order";


ALTER SCHEMA "order" OWNER TO coffeeshop;

--
-- Name: product; Type: SCHEMA; Schema: -; Owner: coffeeshop
--

CREATE SCHEMA product;


ALTER SCHEMA product OWNER TO coffeeshop;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: barista_orders; Type: TABLE; Schema: barista; Owner: coffeeshop
--

CREATE TABLE barista.barista_orders (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    item_type integer NOT NULL,
    item_name text NOT NULL,
    time_up timestamp with time zone NOT NULL,
    created timestamp with time zone DEFAULT now() NOT NULL,
    updated timestamp with time zone
);


ALTER TABLE barista.barista_orders OWNER TO coffeeshop;

--
-- Name: kitchen_orders; Type: TABLE; Schema: kitchen; Owner: coffeeshop
--

CREATE TABLE kitchen.kitchen_orders (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    order_id uuid NOT NULL,
    item_type integer NOT NULL,
    item_name text NOT NULL,
    time_up timestamp with time zone NOT NULL,
    created timestamp with time zone DEFAULT now() NOT NULL,
    updated timestamp with time zone
);


ALTER TABLE kitchen.kitchen_orders OWNER TO coffeeshop;

--
-- Name: line_items; Type: TABLE; Schema: order; Owner: coffeeshop
--

CREATE TABLE "order".line_items (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    item_type integer NOT NULL,
    name text NOT NULL,
    price numeric NOT NULL,
    item_status integer NOT NULL,
    is_barista_order boolean NOT NULL,
    order_id uuid,
    created timestamp with time zone DEFAULT now() NOT NULL,
    updated timestamp with time zone
);


ALTER TABLE "order".line_items OWNER TO coffeeshop;

--
-- Name: orders; Type: TABLE; Schema: order; Owner: coffeeshop
--

CREATE TABLE "order".orders (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    order_source integer NOT NULL,
    loyalty_member_id uuid NOT NULL,
    order_status integer NOT NULL,
    updated timestamp with time zone
);


ALTER TABLE "order".orders OWNER TO coffeeshop;

--
-- Name: products; Type: TABLE; Schema: product; Owner: coffeeshop
--

CREATE TABLE product.products (
    id bigint NOT NULL,
    name text NOT NULL,
    price double precision NOT NULL,
    image text,
    created timestamp with time zone DEFAULT now() NOT NULL,
    updated timestamp with time zone
);


ALTER TABLE product.products OWNER TO coffeeshop;

--
-- Name: product_import; Type: TABLE; Schema: public; Owner: coffeeshop
--

CREATE UNLOGGED TABLE public.product_import (
    doc json
);


ALTER TABLE public.product_import OWNER TO coffeeshop;

--
-- Name: products_seq; Type: SEQUENCE; Schema: public; Owner: coffeeshop
--

CREATE SEQUENCE public.products_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_seq OWNER TO coffeeshop;

--
-- Data for Name: barista_orders; Type: TABLE DATA; Schema: barista; Owner: coffeeshop
--

COPY barista.barista_orders (id, item_type, item_name, time_up, created, updated) FROM stdin;
\.


--
-- Data for Name: kitchen_orders; Type: TABLE DATA; Schema: kitchen; Owner: coffeeshop
--

COPY kitchen.kitchen_orders (id, order_id, item_type, item_name, time_up, created, updated) FROM stdin;
\.


--
-- Data for Name: line_items; Type: TABLE DATA; Schema: order; Owner: coffeeshop
--

COPY "order".line_items (id, item_type, name, price, item_status, is_barista_order, order_id, created, updated) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: order; Owner: coffeeshop
--

COPY "order".orders (id, order_source, loyalty_member_id, order_status, updated) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: product; Owner: coffeeshop
--

COPY product.products (id, name, price, image, created, updated) FROM stdin;
1	CAPPUCCINO	450	static/img/CAPPUCCINO.png	2023-01-20 12:44:21.527125+05:30	\N
2	COFFEE BLACK	300	static/img/COFFEE_BLACK.png	2023-01-20 12:44:21.527125+05:30	\N
3	COFFEE WITH ROOM	300	static/img/COFFEE_WITH_ROOM.png	2023-01-20 12:44:21.527125+05:30	\N
4	ESPRESSO	350	static/img/ESPRESSO.png	2023-01-20 12:44:21.527125+05:30	\N
5	ESPRESSO DOUBLE	450	static/img/ESPRESSO_DOUBLE.png	2023-01-20 12:44:21.527125+05:30	\N
6	LATTE	450	static/img/LATTE.png	2023-01-20 12:44:21.527125+05:30	\N
7	CAKEPOP	250	static/img/CAKEPOP.png	2023-01-20 12:44:21.527125+05:30	\N
8	CROISSANT	325	static/img/CROISSANT.png	2023-01-20 12:44:21.527125+05:30	\N
9	MUFFIN	300	static/img/MUFFIN.png	2023-01-20 12:44:21.527125+05:30	\N
10	CROISSANT CHOCOLATE	350	static/img/CROISSANT_CHOCOLATE.png	2023-01-20 12:44:21.527125+05:30	\N
\.


--
-- Data for Name: product_import; Type: TABLE DATA; Schema: public; Owner: coffeeshop
--

COPY public.product_import (doc) FROM stdin;
{"type": 1,"name": "CAPPUCCINO","price": 4.5,"image": "static/img/CAPPUCCINO.png"}
{"type": 2,"name": "COFFEE BLACK","price": 3,"image": "static/img/COFFEE_BLACK.png"}
{"type": 3,"name": "COFFEE WITH ROOM","price": 3,"image": "static/img/COFFEE_WITH_ROOM.png"}
{"type": 4,"name": "ESPRESSO","price": 3.5,"image": "static/img/ESPRESSO.png"}
{"type": 5,"name": "ESPRESSO DOUBLE","price": 4.5,"image": "static/img/ESPRESSO_DOUBLE.png"}
{"type": 6,"name": "LATTE","price": 4.5,"image": "static/img/LATTE.png"}
{"type": 7,"name": "CAKEPOP","price": 2.5,"image": "static/img/CAKEPOP.png"}
{"type": 8,"name": "CROISSANT","price": 3.25,"image": "static/img/CROISSANT.png"}
{"type": 9,"name": "MUFFIN","price": 3,"image": "static/img/MUFFIN.png"}
{"type": 10,"name": "CROISSANT CHOCOLATE","price": 3.5,"image": "static/img/CROISSANT_CHOCOLATE.png"}
\.


--
-- Name: products_seq; Type: SEQUENCE SET; Schema: public; Owner: coffeeshop
--

SELECT pg_catalog.setval('public.products_seq', 1, false);


--
-- Name: barista_orders pk_barista_orders; Type: CONSTRAINT; Schema: barista; Owner: coffeeshop
--

ALTER TABLE ONLY barista.barista_orders
    ADD CONSTRAINT pk_barista_orders PRIMARY KEY (id);


--
-- Name: kitchen_orders pk_kitchen_orders; Type: CONSTRAINT; Schema: kitchen; Owner: coffeeshop
--

ALTER TABLE ONLY kitchen.kitchen_orders
    ADD CONSTRAINT pk_kitchen_orders PRIMARY KEY (id);


--
-- Name: line_items pk_line_items; Type: CONSTRAINT; Schema: order; Owner: coffeeshop
--

ALTER TABLE ONLY "order".line_items
    ADD CONSTRAINT pk_line_items PRIMARY KEY (id);


--
-- Name: orders pk_orders; Type: CONSTRAINT; Schema: order; Owner: coffeeshop
--

ALTER TABLE ONLY "order".orders
    ADD CONSTRAINT pk_orders PRIMARY KEY (id);


--
-- Name: products pk_products; Type: CONSTRAINT; Schema: product; Owner: coffeeshop
--

ALTER TABLE ONLY product.products
    ADD CONSTRAINT pk_products PRIMARY KEY (id);


--
-- Name: ix_barista_orders_id; Type: INDEX; Schema: barista; Owner: coffeeshop
--

CREATE UNIQUE INDEX ix_barista_orders_id ON barista.barista_orders USING btree (id);


--
-- Name: ix_kitchen_orders_id; Type: INDEX; Schema: kitchen; Owner: coffeeshop
--

CREATE UNIQUE INDEX ix_kitchen_orders_id ON kitchen.kitchen_orders USING btree (id);


--
-- Name: ix_line_items_id; Type: INDEX; Schema: order; Owner: coffeeshop
--

CREATE UNIQUE INDEX ix_line_items_id ON "order".line_items USING btree (id);


--
-- Name: ix_line_items_order_id; Type: INDEX; Schema: order; Owner: coffeeshop
--

CREATE INDEX ix_line_items_order_id ON "order".line_items USING btree (order_id);


--
-- Name: ix_orders_id; Type: INDEX; Schema: order; Owner: coffeeshop
--

CREATE UNIQUE INDEX ix_orders_id ON "order".orders USING btree (id);


--
-- Name: line_items fk_line_items_orders_order_temp_id; Type: FK CONSTRAINT; Schema: order; Owner: coffeeshop
--

ALTER TABLE ONLY "order".line_items
    ADD CONSTRAINT fk_line_items_orders_order_temp_id FOREIGN KEY (order_id) REFERENCES "order".orders(id);


--
-- PostgreSQL database dump complete
--

