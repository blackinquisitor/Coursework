--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: yiabd2; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE yiabd2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE yiabd2 OWNER TO postgres;

\connect yiabd2

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
-- Name: Category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Category" (
    "IDCategory" integer NOT NULL,
    "Name" character varying(50) NOT NULL
);


ALTER TABLE public."Category" OWNER TO postgres;

--
-- Name: CategorySubcategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CategorySubcategory" (
    "IDCategorySubcategory" integer NOT NULL,
    "IDCategory" integer NOT NULL,
    "IDSubcategory" integer NOT NULL
);


ALTER TABLE public."CategorySubcategory" OWNER TO postgres;

--
-- Name: CategorySubcategory_IDCategorySubcategory_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."CategorySubcategory" ALTER COLUMN "IDCategorySubcategory" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."CategorySubcategory_IDCategorySubcategory_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Category_IDCategory_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Category" ALTER COLUMN "IDCategory" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Category_IDCategory_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: HomeAddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HomeAddress" (
    "IDHomeAddress" integer NOT NULL,
    "Town" character varying(50) NOT NULL,
    "Street" character varying(50) NOT NULL,
    "NumberHome" character varying(50)
);


ALTER TABLE public."HomeAddress" OWNER TO postgres;

--
-- Name: HomeAddress_IDHomeAddress_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."HomeAddress" ALTER COLUMN "IDHomeAddress" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."HomeAddress_IDHomeAddress_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Manufacturer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Manufacturer" (
    "IDManufacturer" integer NOT NULL,
    "Name" character varying(100) NOT NULL,
    "Country" character varying(30) NOT NULL
);


ALTER TABLE public."Manufacturer" OWNER TO postgres;

--
-- Name: Payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Payment" (
    "IDPayment" integer NOT NULL,
    "FinalPrice" numeric,
    "PurchaseDate" date DEFAULT now(),
    "FinalQuantity" integer,
    "Delivery" boolean
);


ALTER TABLE public."Payment" OWNER TO postgres;

--
-- Name: Payment_IDPayment_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Payment" ALTER COLUMN "IDPayment" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Payment_IDPayment_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product" (
    "IDProduct" integer NOT NULL,
    "Name" character varying(50),
    "Weight" character varying(20),
    "Height" character varying(20),
    "Lenght" character varying(20),
    "Description" character varying(300),
    "Price" numeric,
    "ProductType" character varying(50),
    "TypeOfInstallation" character varying(50),
    "Colour" character varying(50),
    "DesignStyle" character varying(50),
    "HousingMaterial" character varying(50),
    "VendorCode" character varying(50),
    "InStock" integer,
    "IDManufacturer" integer,
    "Image" character varying
);


ALTER TABLE public."Product" OWNER TO postgres;

--
-- Name: ProductPayment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductPayment" (
    "IDProductPayment" integer NOT NULL,
    "IDProduct" integer,
    "IDPayment" integer,
    "IDUser" integer,
    "Quantity" integer
);


ALTER TABLE public."ProductPayment" OWNER TO postgres;

--
-- Name: ProductPayment_IDProductPayment_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."ProductPayment" ALTER COLUMN "IDProductPayment" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."ProductPayment_IDProductPayment_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ProductSubcategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductSubcategory" (
    "IDProductSubcategory" integer NOT NULL,
    "IDProduct" integer NOT NULL,
    "IDSubcategory" integer NOT NULL
);


ALTER TABLE public."ProductSubcategory" OWNER TO postgres;

--
-- Name: ProductSubcategory_IDProductSubcategory_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."ProductSubcategory" ALTER COLUMN "IDProductSubcategory" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."ProductSubcategory_IDProductSubcategory_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Product_IDProduct_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Product" ALTER COLUMN "IDProduct" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Product_IDProduct_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Role" (
    "IDRole" integer NOT NULL,
    "RoleName" character varying NOT NULL
);


ALTER TABLE public."Role" OWNER TO postgres;

--
-- Name: Subcategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Subcategory" (
    "IDSubcategory" integer NOT NULL,
    "Name" character varying(50) NOT NULL
);


ALTER TABLE public."Subcategory" OWNER TO postgres;

--
-- Name: Subcategory_IDSubcategory_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Subcategory" ALTER COLUMN "IDSubcategory" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Subcategory_IDSubcategory_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    "IDUser" integer NOT NULL,
    "LastName" character varying(50),
    "SecondName" character varying(50),
    "FirstName" character varying(50),
    "PhoneNumber" character varying(11),
    "Password" character varying(100),
    "BirthDate" date,
    "Email" character varying(30),
    "IDHomeAddress" integer,
    "IDRole" integer
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: User_IDUser_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."User" ALTER COLUMN "IDUser" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."User_IDUser_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Category" ("IDCategory", "Name") FROM stdin;
11	Смесители
12	Аксессуары для ванной комнаты
13	Всё для душа
14	Раковины для ванной
15	Унитазы
16	Биде
17	Гигиенический душ
18	Писсуары
19	Ванны
20	Мебель для ванной комнаты
\.


--
-- Data for Name: CategorySubcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CategorySubcategory" ("IDCategorySubcategory", "IDCategory", "IDSubcategory") FROM stdin;
3	11	11
4	12	12
14	13	13
15	14	14
16	15	15
17	16	16
18	17	17
19	18	18
20	19	19
21	20	20
22	12	21
\.


--
-- Data for Name: HomeAddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."HomeAddress" ("IDHomeAddress", "Town", "Street", "NumberHome") FROM stdin;
\.


--
-- Data for Name: Manufacturer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Manufacturer" ("IDManufacturer", "Name", "Country") FROM stdin;
3	Devon&Devon	Италия
1	ANTONIO LUPI	Италия
5	IFO	Швеция
6	KERAMAG	Германия
4	GEBERIT	Германия
2	ARTCERAM	Италия
10	RAVAK	Чехия
9	TOTO	Япония
11	ANTONIO LUPI1	Италия
8	ROCA	Испания
7	LAUFEN	Австрия
\.


--
-- Data for Name: Payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Payment" ("IDPayment", "FinalPrice", "PurchaseDate", "FinalQuantity", "Delivery") FROM stdin;
12	136008	2023-07-02	6	\N
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product" ("IDProduct", "Name", "Weight", "Height", "Lenght", "Description", "Price", "ProductType", "TypeOfInstallation", "Colour", "DesignStyle", "HousingMaterial", "VendorCode", "InStock", "IDManufacturer", "Image") FROM stdin;
37	IFO Sign	26кг	900мм	355мм	IFO Sign 687206011 + 98126 Унитаз для инвалидов с высокой чашей	45250	Унитаз напольный	Напольный	Белый	Современный	Керамика	687206011	84	6	240190.1500.jpg
35	Полка - корзинка для душевых принадлежностей	-	120мм	320мм	Металлическая полка - корзинка для душевых принадлежностей	9142	Полка	Настенный	Чёрный матовый	Современный	Металл	24952370000	50	4	289455.1500.jpg
36	Teka Formentera	-	1140мм	1500мм	Душевая система: однорычажный смеситель для душа с полочкой	31666	Душевая система	Настенный	Хром	Современный	Латунь	622980200	30	7	224063.1500.jpg
38	ArtCeram File	21кг	420мм	350мм	ArtCeram File 2.0 FLB002 01 00 Биде напольное, приставное. Размер 36х52х42 см. С переливом, одно отверстие под смеситель готово. Укомплектовано крепежными элементами. Цвет белый глянцевый.	24150	Биде (напольное)	Напольный	Белый	Современный	Санфаянс (санитарная керамика)	FLB002 01 00	2	5	159413.1500.jpg
39	Ванна Oberon	-	180мм	1.5м	Ванна UBQ180OBE2V-01 VILLEROY&BOCH Oberon 180х80 см. Прямоугольная модель. Входит в объем поставки: Комплект ножек для ванны (самоклеящихся) входит в поставку, регулируются от 145 - 180 мм.	112050	Ванна	Напольный	Белый	Современный	Кварил	UBQ180OBE2V-01	123	10	203879.1500.jpg
40	GEROMIN Specials	40кг	89см	60см	Раковина для стирки и хозяйственных нужд	39850	Раковина (хозяйственная)	-	Белый	Современный	Санфаянс (санитарная керамика)	YXM901MB	4	3	401311.1500.jpg
42	Globo Forty3	18кг	570мм	340мм	Globo Forty3 FO030.BI Писсуар подвесной под скрытый налив, 37*32 см, с отверстиями для крышки, с крепежом, цвет: белый.	34788	Писсуар	Настенный	Белый	Современный	Санфаянс (санитарная керамика)	FO030.BI	34	6	153180.1500.jpg
43	Bossini Paloma Flat	-	-	-	Bossini Paloma Flat E37015B.073 Гигиенический душ - комплект с прогрессивным смесителем (чёрный матовый).	35160	Писсуары	Настенный	Чёрный матовый	Современный	Латунь	E37015B.073	123	5	197249.1500.jpg
41	Villeroy&Boch Evana	18кг	570мм	340мм	Globo Forty3 FO030.BI Писсуар подвесной под скрытый налив, 37*32 см, с отверстиями для крышки, с крепежом, цвет: белый. Дополнительно приобрететь крышку FO024BI, в комплект поставки не входит.	43760	Врезная раковина	Настенный	Белый	Современный	Санфарфор (сантехнический фарфор)	61440001	54	4	310084.1500.jpg
44	HATRIA MAIORA	-	205мм	570мм	Раковина врезная, встраиваемая на 57 см HATRIA MAIORA YE8801. Умывальник врезной, встраиваемый на 57 см, под смеситель на одно отверстие. Устанавливается в столешницы, подстолья и мебель. Производитель Италия "HATRIA".	25491	Врезная раковина	Сверху столешницы	Белый	Современный	Санфарфор (сантехнический фарфор)	YE8801	1	1	3050.1500.jpg
\.


--
-- Data for Name: ProductPayment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ProductPayment" ("IDProductPayment", "IDProduct", "IDPayment", "IDUser", "Quantity") FROM stdin;
94	37	12	3	1
96	36	12	3	2
95	35	12	3	3
98	37	\N	3	1
99	35	\N	3	3
100	36	\N	3	2
\.


--
-- Data for Name: ProductSubcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ProductSubcategory" ("IDProductSubcategory", "IDProduct", "IDSubcategory") FROM stdin;
59	37	15
60	35	21
61	36	13
62	38	16
63	39	19
64	40	14
65	41	14
66	42	18
67	43	18
68	44	14
\.


--
-- Data for Name: Role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Role" ("IDRole", "RoleName") FROM stdin;
1	Администратор
2	Пользователь
\.


--
-- Data for Name: Subcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Subcategory" ("IDSubcategory", "Name") FROM stdin;
11	Смесители для раковины
12	Держатели для полотенец
13	Верхний душ
14	Врезные раковины
15	Подвесные унитазы
16	Подвесные биде
17	Встраиваемый гигиенический душ
18	Подвесные писсуары
19	Акриловые ванны
20	Тумбы для раковины по размерам
21	корзинка для душевых принадлежностей
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" ("IDUser", "LastName", "SecondName", "FirstName", "PhoneNumber", "Password", "BirthDate", "Email", "IDHomeAddress", "IDRole") FROM stdin;
2	1	1	1	1	$2b$05$kXIPHEbRmQ8WxGOZYjARkufMcvKiyGZ3/kpV2ZqMT1D0CW..fbeaG	1111-11-11	1	\N	2
4	1	1	1	12	$2b$05$xPXBXVQx.6anW7SD6Wk1.uBEto/jS2xwxVk5vMvuAYDR6urc6s9kO	2112-12-12	3212	\N	2
5	1	1	1	12341212	$2b$05$9YxX352cY6UoZbaw1e3NJeAuXWSEzubRht2brLwGtNwC1EDYDKxwO	1111-11-11	123ацкца	\N	2
3	Невинский	Дмитриевич	Иван	89138994324	$2b$05$KdXeihkpfhb.v3h7lUY8EurUDuQ/cBlRP3Rz38lCUro2z64sw2Jwy	2004-01-23	gr602neidm@gmail.com	\N	1
\.


--
-- Name: CategorySubcategory_IDCategorySubcategory_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CategorySubcategory_IDCategorySubcategory_seq"', 22, true);


--
-- Name: Category_IDCategory_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Category_IDCategory_seq"', 20, true);


--
-- Name: HomeAddress_IDHomeAddress_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."HomeAddress_IDHomeAddress_seq"', 1, false);


--
-- Name: Payment_IDPayment_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Payment_IDPayment_seq"', 12, true);


--
-- Name: ProductPayment_IDProductPayment_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ProductPayment_IDProductPayment_seq"', 100, true);


--
-- Name: ProductSubcategory_IDProductSubcategory_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ProductSubcategory_IDProductSubcategory_seq"', 68, true);


--
-- Name: Product_IDProduct_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Product_IDProduct_seq"', 44, true);


--
-- Name: Subcategory_IDSubcategory_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Subcategory_IDSubcategory_seq"', 21, true);


--
-- Name: User_IDUser_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_IDUser_seq"', 5, true);


--
-- Name: CategorySubcategory CategorySubcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CategorySubcategory"
    ADD CONSTRAINT "CategorySubcategory_pkey" PRIMARY KEY ("IDCategorySubcategory");


--
-- Name: Category Category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_pk" PRIMARY KEY ("IDCategory");


--
-- Name: HomeAddress HomeAddress_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HomeAddress"
    ADD CONSTRAINT "HomeAddress_pk" PRIMARY KEY ("IDHomeAddress");


--
-- Name: Manufacturer Manufacturer_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manufacturer"
    ADD CONSTRAINT "Manufacturer_pk" PRIMARY KEY ("IDManufacturer");


--
-- Name: Payment Payment_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Payment"
    ADD CONSTRAINT "Payment_pk" PRIMARY KEY ("IDPayment");


--
-- Name: ProductPayment ProductPayment_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductPayment"
    ADD CONSTRAINT "ProductPayment_pk" PRIMARY KEY ("IDProductPayment");


--
-- Name: ProductSubcategory ProductSubcategory_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductSubcategory"
    ADD CONSTRAINT "ProductSubcategory_pk" PRIMARY KEY ("IDProductSubcategory");


--
-- Name: Product Product_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pk" PRIMARY KEY ("IDProduct");


--
-- Name: Role Role_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pk" PRIMARY KEY ("IDRole");


--
-- Name: Subcategory Subcategory_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Subcategory"
    ADD CONSTRAINT "Subcategory_pk" PRIMARY KEY ("IDSubcategory");


--
-- Name: User User_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pk" PRIMARY KEY ("IDUser");


--
-- Name: CategorySubcategory_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "CategorySubcategory_pk" ON public."CategorySubcategory" USING btree ("IDCategorySubcategory");


--
-- Name: User_Email_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_Email_uindex" ON public."User" USING btree ("Email");


--
-- Name: User_PhoneNumber_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_PhoneNumber_uindex" ON public."User" USING btree ("PhoneNumber");


--
-- Name: CategorySubcategory CategorySubcategory_IDCategory_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CategorySubcategory"
    ADD CONSTRAINT "CategorySubcategory_IDCategory_fkey" FOREIGN KEY ("IDCategory") REFERENCES public."Category"("IDCategory") ON UPDATE CASCADE;


--
-- Name: CategorySubcategory CategorySubcategory_IDSubcategory_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CategorySubcategory"
    ADD CONSTRAINT "CategorySubcategory_IDSubcategory_fkey" FOREIGN KEY ("IDSubcategory") REFERENCES public."Subcategory"("IDSubcategory") ON UPDATE CASCADE;


--
-- Name: ProductPayment ProductPayment_Payment_IDPayment_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductPayment"
    ADD CONSTRAINT "ProductPayment_Payment_IDPayment_fk" FOREIGN KEY ("IDPayment") REFERENCES public."Payment"("IDPayment");


--
-- Name: ProductPayment ProductPayment_Product_IDProduct_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductPayment"
    ADD CONSTRAINT "ProductPayment_Product_IDProduct_fk" FOREIGN KEY ("IDProduct") REFERENCES public."Product"("IDProduct");


--
-- Name: ProductPayment ProductPayment_User_IDUser_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductPayment"
    ADD CONSTRAINT "ProductPayment_User_IDUser_fk" FOREIGN KEY ("IDUser") REFERENCES public."User"("IDUser");


--
-- Name: ProductSubcategory ProductSubcategory_Product_IDProduct_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductSubcategory"
    ADD CONSTRAINT "ProductSubcategory_Product_IDProduct_fk" FOREIGN KEY ("IDProduct") REFERENCES public."Product"("IDProduct");


--
-- Name: ProductSubcategory ProductSubcategory_Subcategory_IDSubcategory_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductSubcategory"
    ADD CONSTRAINT "ProductSubcategory_Subcategory_IDSubcategory_fk" FOREIGN KEY ("IDSubcategory") REFERENCES public."Subcategory"("IDSubcategory");


--
-- Name: Product Product_Manufacturer_IDManufacturer_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_Manufacturer_IDManufacturer_fk" FOREIGN KEY ("IDManufacturer") REFERENCES public."Manufacturer"("IDManufacturer");


--
-- Name: User User_HomeAddress_IDHomeAddress_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_HomeAddress_IDHomeAddress_fk" FOREIGN KEY ("IDHomeAddress") REFERENCES public."HomeAddress"("IDHomeAddress");


--
-- Name: User User_Role_IDRole_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_Role_IDRole_fk" FOREIGN KEY ("IDRole") REFERENCES public."Role"("IDRole");


--
-- PostgreSQL database dump complete
--

