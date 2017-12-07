DROP DATABASE IF EXISTS m_danilova;
CREATE DATABASE m_danilova;
\c m_danilova;
CREATE TABLE countries (
    id integer NOT NULL,
    country character varying(69) NOT NULL
);


ALTER TABLE countries OWNER TO postgres;


CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE countries_id_seq OWNER TO postgres;


ALTER SEQUENCE countries_id_seq OWNED BY countries.id;



CREATE TABLE genres (
    id integer NOT NULL,
    genre character varying(69) NOT NULL
);


ALTER TABLE genres OWNER TO postgres;


CREATE SEQUENCE genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genres_id_seq OWNER TO postgres;



ALTER SEQUENCE genres_id_seq OWNED BY genres.id;



CREATE TABLE music_groups (
    id integer NOT NULL,
    genre integer NOT NULL,
    name_group character varying(69) NOT NULL,
    data_begin integer NOT NULL,
    data_end integer,
    country_id integer NOT NULL,
    CONSTRAINT music_groups_data_begin_check CHECK (((data_begin <= data_end) AND (data_begin >= 1400)))
);


ALTER TABLE music_groups OWNER TO postgres;


CREATE SEQUENCE music_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE music_groups_id_seq OWNER TO postgres;


ALTER SEQUENCE music_groups_id_seq OWNED BY music_groups.id;



CREATE TABLE music_rewards (
    id integer NOT NULL,
    name character varying(69) NOT NULL,
    begin integer NOT NULL,
    country_m integer NOT NULL,
    CONSTRAINT music_rewards_begin_check CHECK ((begin >= 1000))
);


ALTER TABLE music_rewards OWNER TO postgres;


CREATE SEQUENCE music_rewards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE music_rewards_id_seq OWNER TO postgres;


ALTER SEQUENCE music_rewards_id_seq OWNED BY music_rewards.id;


CREATE TABLE musical_instruments (
    id integer NOT NULL,
    instrument character varying(69) NOT NULL
);


ALTER TABLE musical_instruments OWNER TO postgres;


CREATE SEQUENCE musical_instruments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE musical_instruments_id_seq OWNER TO postgres;



ALTER SEQUENCE musical_instruments_id_seq OWNED BY musical_instruments.id;



CREATE TABLE musicians (
    id integer NOT NULL,
    name_surname character varying(69) NOT NULL,
    birthday date NOT NULL,
    music_education boolean NOT NULL,
    id_country integer NOT NULL,
    data_death date NOT NULL,
    cause_death character varying(169) NOT NULL,
    CONSTRAINT musician_birthday_check CHECK (((birthday <= data_death) AND (birthday >= '1400-01-01'::date)))
);


ALTER TABLE musicians OWNER TO postgres;



CREATE SEQUENCE musicians_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE musicians_id_seq OWNER TO postgres;


ALTER SEQUENCE musicians_id_seq OWNED BY musicians.id;



CREATE TABLE musicians_music_groups_relation (
    id integer NOT NULL,
    id_music_group integer NOT NULL,
    id_musician integer NOT NULL
);


ALTER TABLE musicians_music_groups_relation OWNER TO postgres;



CREATE SEQUENCE musicians_music_groups_relation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE musicians_music_groups_relation_id_seq OWNER TO postgres;



ALTER SEQUENCE musicians_music_groups_relation_id_seq OWNED BY musicians_music_groups_relation.id;



CREATE TABLE musicians_music_rewards_relation (
    id integer NOT NULL,
    id_music_reward integer NOT NULL,
    id_musician integer NOT NULL
);


ALTER TABLE musicians_music_rewards_relation OWNER TO postgres;



CREATE SEQUENCE musicians_music_rewards_relation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE musicians_music_rewards_relation_id_seq OWNER TO postgres;


ALTER SEQUENCE musicians_music_rewards_relation_id_seq OWNED BY musicians_music_rewards_relation.id;


CREATE TABLE musicians_musical_instruments_relation (
    id integer NOT NULL,
    id_instrument integer NOT NULL,
    id_musician integer NOT NULL
);


ALTER TABLE musicians_musical_instruments_relation OWNER TO postgres;


CREATE SEQUENCE musicians_musical_instruments_relation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE musicians_musical_instruments_relation_id_seq OWNER TO postgres;



ALTER SEQUENCE musicians_musical_instruments_relation_id_seq OWNED BY musicians_musical_instruments_relation.id;



ALTER TABLE ONLY countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);



ALTER TABLE ONLY genres ALTER COLUMN id SET DEFAULT nextval('genres_id_seq'::regclass);



ALTER TABLE ONLY music_groups ALTER COLUMN id SET DEFAULT nextval('music_groups_id_seq'::regclass);



ALTER TABLE ONLY music_rewards ALTER COLUMN id SET DEFAULT nextval('music_rewards_id_seq'::regclass);



ALTER TABLE ONLY musical_instruments ALTER COLUMN id SET DEFAULT nextval('musical_instruments_id_seq'::regclass);



ALTER TABLE ONLY musicians ALTER COLUMN id SET DEFAULT nextval('musicians_id_seq'::regclass);



ALTER TABLE ONLY musicians_music_groups_relation ALTER COLUMN id SET DEFAULT nextval('musicians_music_groups_relation_id_seq'::regclass);



ALTER TABLE ONLY musicians_music_rewards_relation ALTER COLUMN id SET DEFAULT nextval('musicians_music_rewards_relation_id_seq'::regclass);



ALTER TABLE ONLY musicians_musical_instruments_relation ALTER COLUMN id SET DEFAULT nextval('musicians_musical_instruments_relation_id_seq'::regclass);



INSERT INTO countries VALUES (1, 'Jamaica');
INSERT INTO countries VALUES (2, 'USA');
INSERT INTO countries VALUES (3, 'USSR');
INSERT INTO countries VALUES (4, 'Great Britain');
INSERT INTO countries VALUES (5, 'Italy');
INSERT INTO countries VALUES (6, 'France');
INSERT INTO countries VALUES (7, 'Russia');
INSERT INTO countries VALUES (8, 'Holy Roman Empire');
INSERT INTO countries VALUES (9, 'Germany');
INSERT INTO countries VALUES (10, 'Sweden');



SELECT pg_catalog.setval('countries_id_seq', 10, true);



INSERT INTO genres VALUES (1, 'Grunge');
INSERT INTO genres VALUES (2, 'Punk-Rock');
INSERT INTO genres VALUES (3, 'Jazz');
INSERT INTO genres VALUES (4, 'Reggae');
INSERT INTO genres VALUES (5, 'Rock');
INSERT INTO genres VALUES (6, 'Hard-Rock');
INSERT INTO genres VALUES (7, 'Glam-Rock');
INSERT INTO genres VALUES (8, 'Post-Punk');
INSERT INTO genres VALUES (9, 'Rock-n-Roll');
INSERT INTO genres VALUES (10, 'Art-Rock');
INSERT INTO genres VALUES (11, 'Pop-Rock');
INSERT INTO genres VALUES (12, 'Pop');
INSERT INTO genres VALUES (13, 'Folk-Rock');



SELECT pg_catalog.setval('genres_id_seq', 13, true);


INSERT INTO music_groups VALUES (1, 1, 'Nirvana', 1987, 1994, 2);
INSERT INTO music_groups VALUES (2, 2, 'Fecal Matter', 1985, 1986, 2);
INSERT INTO music_groups VALUES (3, 3, 'King Olivers Creole Jazz Band', 1922, 1928, 2);
INSERT INTO music_groups VALUES (4, 3, 'Hot Five', 1925, 1928, 2);
INSERT INTO music_groups VALUES (5, 4, 'The Wailers', 1963, 1974, 1);
INSERT INTO music_groups VALUES (6, 4, 'Bob Marley and The Wailers', 1974, 1986, 1);
INSERT INTO music_groups VALUES (8, 6, 'Thin Machine', 1988, 1992, 4);
INSERT INTO music_groups VALUES (9, 7, 'The Spiders from Mars', 1970, 1973, 4);
INSERT INTO music_groups VALUES (10, 8, 'Grazhdanskaya oborona', 1984, 2008, 3);
INSERT INTO music_groups VALUES (11, 2, 'Posev', 1982, 1985, 3);
INSERT INTO music_groups VALUES (12, 9, 'The Beatles', 1960, 1970, 4);
INSERT INTO music_groups VALUES (13, 9, 'The Quarrymen', 1956, 1960, 4);
INSERT INTO music_groups VALUES (14, 10, 'Plastic Ono Band', 1969, 1975, 4);
INSERT INTO music_groups VALUES (15, 3, 'The Dave Brubeck Quartet', 1958, 1967, 2);
INSERT INTO music_groups VALUES (16, 2, 'Rock-gruppa', 2003, 2003, 7);
INSERT INTO music_groups VALUES (17, 2, 'Korol I shut', 1988, 2014, 7);
INSERT INTO music_groups VALUES (18, 12, 'The Jackson 5', 1962, 1989, 2);
INSERT INTO music_groups VALUES (20, 13, 'The Traveling Wilburys', 1988, 1990, 4);



SELECT pg_catalog.setval('music_groups_id_seq', 20, true);



INSERT INTO music_rewards VALUES (1, 'Grammy', 1958, 2);
INSERT INTO music_rewards VALUES (2, 'American Music Awards', 1974, 2);
INSERT INTO music_rewards VALUES (3, 'MTV Video Music Awards', 1984, 2);
INSERT INTO music_rewards VALUES (4, 'BRIT Awards', 1977, 4);
INSERT INTO music_rewards VALUES (5, 'NME Awards', 1994, 4);
INSERT INTO music_rewards VALUES (6, 'Grammy Lifetime Achievment Award', 1962, 2);
INSERT INTO music_rewards VALUES (7, 'Echo Music Prize', 1992, 9);
INSERT INTO music_rewards VALUES (8, 'Ivor Novello Awards', 1955, 4);
INSERT INTO music_rewards VALUES (9, 'Q Awards', 1990, 4);
INSERT INTO music_rewards VALUES (10, 'Chartova Dujina', 2008, 7);
INSERT INTO music_rewards VALUES (11, 'MTV Europe Music Awards', 1994, 4);
INSERT INTO music_rewards VALUES (12, 'Polar Music Prize', 1989, 10);
INSERT INTO music_rewards VALUES (13, 'Zolotoj Grammofon', 1995, 7);
INSERT INTO music_rewards VALUES (14, 'Classical BRIT Awards', 2000, 4);
INSERT INTO music_rewards VALUES (15, 'MTV Russia Music Awards', 2004, 7);



SELECT pg_catalog.setval('music_rewards_id_seq', 1, false);


INSERT INTO musical_instruments VALUES (1, 'vocal');
INSERT INTO musical_instruments VALUES (2, 'drums');
INSERT INTO musical_instruments VALUES (3, 'guitar');
INSERT INTO musical_instruments VALUES (4, 'trumpet');
INSERT INTO musical_instruments VALUES (5, 'cornet');
INSERT INTO musical_instruments VALUES (6, 'bas-guitar');
INSERT INTO musical_instruments VALUES (7, 'french horn');
INSERT INTO musical_instruments VALUES (8, 'trombone');
INSERT INTO musical_instruments VALUES (9, 'piano');
INSERT INTO musical_instruments VALUES (10, 'harmonica');
INSERT INTO musical_instruments VALUES (11, 'saxophone');
INSERT INTO musical_instruments VALUES (12, 'percussion');
INSERT INTO musical_instruments VALUES (13, 'organ');
INSERT INTO musical_instruments VALUES (14, 'harpsichord');
INSERT INTO musical_instruments VALUES (15, 'violin');
INSERT INTO musical_instruments VALUES (16, 'sitar');
INSERT INTO musical_instruments VALUES (17, 'ukulele');



SELECT pg_catalog.setval('musical_instruments_id_seq', 17, true);


INSERT INTO musicians VALUES (1, 'Kurt Cobain', '1967-02-20', false, 2, '1994-04-05', 'Suicide');
INSERT INTO musicians VALUES (2, 'Louis Armstrong', '1901-08-04', false, 2, '1971-07-06', 'Heart failure');
INSERT INTO musicians VALUES (3, 'Amy Winehouse', '1983-08-14', false, 4, '2011-07-23', 'Alcohol poisoning');
INSERT INTO musicians VALUES (4, 'Robert Marley', '1945-02-06', false, 1, '1981-05-11', 'Melanoma');
INSERT INTO musicians VALUES (5, 'John Entwistle', '1944-10-09', false, 4, '2002-06-27', 'Myocardial infarction');
INSERT INTO musicians VALUES (6, 'David Bowie', '1947-01-08', false, 4, '2016-01-10', 'Liver cancer');
INSERT INTO musicians VALUES (7, 'Egor Letov', '1964-09-10', false, 3, '2008-02-19', 'Heart failure');
INSERT INTO musicians VALUES (8, 'Johann Bach', '1685-03-21', true, 8, '1750-07-28', 'Insult');
INSERT INTO musicians VALUES (9, 'Luciano Pavarotti', '1935-10-12', false, 5, '2007-09-06', 'Pancreas cancer');
INSERT INTO musicians VALUES (10, 'Edith Piaf', '1915-12-19', false, 6, '1963-10-10', 'Liver cancer');
INSERT INTO musicians VALUES (11, 'John Lennon', '1940-10-09', false, 4, '1980-12-08', 'Killing');
INSERT INTO musicians VALUES (12, 'Dave Brubeck', '1920-12-06', true, 2, '2012-12-05', 'Heart failure');
INSERT INTO musicians VALUES (13, 'Michael Gorshenev', '1973-08-07', false, 7, '2013-07-19', 'Myocardial infarction');
INSERT INTO musicians VALUES (14, 'Michael Jackson', '1958-08-29', false, 2, '2009-06-25', 'Narcotic poisoning');
INSERT INTO musicians VALUES (15, 'Freddie Mercury', '1946-09-05', false, 4, '1991-11-24', 'Pneumonia');
INSERT INTO musicians VALUES (16, 'George Harrison', '1943-02-25', false, 4, '2001-11-29', 'Lung cancer');



SELECT pg_catalog.setval('musicians_id_seq', 16, true);



INSERT INTO musicians_music_groups_relation VALUES (1, 1, 1);
INSERT INTO musicians_music_groups_relation VALUES (2, 2, 1);
INSERT INTO musicians_music_groups_relation VALUES (3, 3, 2);
INSERT INTO musicians_music_groups_relation VALUES (4, 4, 2);
INSERT INTO musicians_music_groups_relation VALUES (5, 5, 4);
INSERT INTO musicians_music_groups_relation VALUES (6, 6, 4);
INSERT INTO musicians_music_groups_relation VALUES (7, 7, 5);
INSERT INTO musicians_music_groups_relation VALUES (8, 8, 6);
INSERT INTO musicians_music_groups_relation VALUES (9, 9, 6);
INSERT INTO musicians_music_groups_relation VALUES (10, 10, 7);
INSERT INTO musicians_music_groups_relation VALUES (11, 11, 7);
INSERT INTO musicians_music_groups_relation VALUES (12, 12, 11);
INSERT INTO musicians_music_groups_relation VALUES (13, 12, 16);
INSERT INTO musicians_music_groups_relation VALUES (14, 13, 11);
INSERT INTO musicians_music_groups_relation VALUES (15, 13, 16);
INSERT INTO musicians_music_groups_relation VALUES (16, 14, 11);
INSERT INTO musicians_music_groups_relation VALUES (17, 14, 16);
INSERT INTO musicians_music_groups_relation VALUES (18, 15, 12);
INSERT INTO musicians_music_groups_relation VALUES (19, 16, 13);
INSERT INTO musicians_music_groups_relation VALUES (20, 17, 13);
INSERT INTO musicians_music_groups_relation VALUES (21, 18, 14);
INSERT INTO musicians_music_groups_relation VALUES (22, 19, 15);
INSERT INTO musicians_music_groups_relation VALUES (23, 20, 16);



SELECT pg_catalog.setval('musicians_music_groups_relation_id_seq', 23, true);



INSERT INTO musicians_music_rewards_relation VALUES (1, 1, 1);
INSERT INTO musicians_music_rewards_relation VALUES (2, 3, 1);
INSERT INTO musicians_music_rewards_relation VALUES (3, 4, 1);
INSERT INTO musicians_music_rewards_relation VALUES (4, 6, 2);
INSERT INTO musicians_music_rewards_relation VALUES (5, 1, 3);
INSERT INTO musicians_music_rewards_relation VALUES (6, 4, 3);
INSERT INTO musicians_music_rewards_relation VALUES (7, 7, 3);
INSERT INTO musicians_music_rewards_relation VALUES (8, 8, 3);
INSERT INTO musicians_music_rewards_relation VALUES (9, 6, 4);
INSERT INTO musicians_music_rewards_relation VALUES (10, 1, 6);
INSERT INTO musicians_music_rewards_relation VALUES (11, 3, 6);
INSERT INTO musicians_music_rewards_relation VALUES (12, 4, 6);
INSERT INTO musicians_music_rewards_relation VALUES (13, 8, 6);
INSERT INTO musicians_music_rewards_relation VALUES (14, 9, 6);
INSERT INTO musicians_music_rewards_relation VALUES (15, 1, 9);
INSERT INTO musicians_music_rewards_relation VALUES (16, 1, 10);
INSERT INTO musicians_music_rewards_relation VALUES (17, 9, 11);
INSERT INTO musicians_music_rewards_relation VALUES (18, 6, 12);
INSERT INTO musicians_music_rewards_relation VALUES (19, 10, 13);
INSERT INTO musicians_music_rewards_relation VALUES (20, 2, 14);
INSERT INTO musicians_music_rewards_relation VALUES (21, 1, 14);
INSERT INTO musicians_music_rewards_relation VALUES (22, 4, 14);
INSERT INTO musicians_music_rewards_relation VALUES (23, 3, 14);
INSERT INTO musicians_music_rewards_relation VALUES (24, 1, 16);



SELECT pg_catalog.setval('musicians_music_rewards_relation_id_seq', 24, true);



INSERT INTO musicians_musical_instruments_relation VALUES (1, 1, 1);
INSERT INTO musicians_musical_instruments_relation VALUES (2, 2, 1);
INSERT INTO musicians_musical_instruments_relation VALUES (3, 3, 1);
INSERT INTO musicians_musical_instruments_relation VALUES (4, 1, 2);
INSERT INTO musicians_musical_instruments_relation VALUES (5, 4, 2);
INSERT INTO musicians_musical_instruments_relation VALUES (6, 5, 2);
INSERT INTO musicians_musical_instruments_relation VALUES (7, 3, 3);
INSERT INTO musicians_musical_instruments_relation VALUES (8, 2, 3);
INSERT INTO musicians_musical_instruments_relation VALUES (9, 1, 3);
INSERT INTO musicians_musical_instruments_relation VALUES (10, 1, 4);
INSERT INTO musicians_musical_instruments_relation VALUES (11, 3, 4);
INSERT INTO musicians_musical_instruments_relation VALUES (12, 1, 5);
INSERT INTO musicians_musical_instruments_relation VALUES (13, 3, 5);
INSERT INTO musicians_musical_instruments_relation VALUES (14, 6, 5);
INSERT INTO musicians_musical_instruments_relation VALUES (15, 4, 5);
INSERT INTO musicians_musical_instruments_relation VALUES (16, 7, 5);
INSERT INTO musicians_musical_instruments_relation VALUES (17, 8, 5);
INSERT INTO musicians_musical_instruments_relation VALUES (18, 9, 5);
INSERT INTO musicians_musical_instruments_relation VALUES (19, 10, 5);
INSERT INTO musicians_musical_instruments_relation VALUES (20, 1, 6);
INSERT INTO musicians_musical_instruments_relation VALUES (21, 3, 6);
INSERT INTO musicians_musical_instruments_relation VALUES (22, 11, 6);
INSERT INTO musicians_musical_instruments_relation VALUES (23, 9, 6);
INSERT INTO musicians_musical_instruments_relation VALUES (24, 1, 7);
INSERT INTO musicians_musical_instruments_relation VALUES (25, 3, 7);
INSERT INTO musicians_musical_instruments_relation VALUES (26, 6, 7);
INSERT INTO musicians_musical_instruments_relation VALUES (27, 2, 7);
INSERT INTO musicians_musical_instruments_relation VALUES (28, 12, 7);
INSERT INTO musicians_musical_instruments_relation VALUES (29, 13, 8);
INSERT INTO musicians_musical_instruments_relation VALUES (30, 14, 8);
INSERT INTO musicians_musical_instruments_relation VALUES (31, 15, 8);
INSERT INTO musicians_musical_instruments_relation VALUES (32, 1, 9);
INSERT INTO musicians_musical_instruments_relation VALUES (33, 1, 10);
INSERT INTO musicians_musical_instruments_relation VALUES (34, 1, 11);
INSERT INTO musicians_musical_instruments_relation VALUES (35, 3, 11);
INSERT INTO musicians_musical_instruments_relation VALUES (36, 6, 11);
INSERT INTO musicians_musical_instruments_relation VALUES (37, 9, 11);
INSERT INTO musicians_musical_instruments_relation VALUES (38, 10, 11);
INSERT INTO musicians_musical_instruments_relation VALUES (39, 9, 12);
INSERT INTO musicians_musical_instruments_relation VALUES (40, 1, 13);
INSERT INTO musicians_musical_instruments_relation VALUES (41, 3, 13);
INSERT INTO musicians_musical_instruments_relation VALUES (42, 6, 13);
INSERT INTO musicians_musical_instruments_relation VALUES (43, 1, 14);
INSERT INTO musicians_musical_instruments_relation VALUES (44, 12, 14);
INSERT INTO musicians_musical_instruments_relation VALUES (45, 1, 15);
INSERT INTO musicians_musical_instruments_relation VALUES (46, 9, 15);
INSERT INTO musicians_musical_instruments_relation VALUES (47, 3, 15);
INSERT INTO musicians_musical_instruments_relation VALUES (48, 1, 16);
INSERT INTO musicians_musical_instruments_relation VALUES (49, 3, 16);
INSERT INTO musicians_musical_instruments_relation VALUES (50, 6, 16);
INSERT INTO musicians_musical_instruments_relation VALUES (51, 9, 16);
INSERT INTO musicians_musical_instruments_relation VALUES (52, 16, 16);
INSERT INTO musicians_musical_instruments_relation VALUES (53, 17, 16);



SELECT pg_catalog.setval('musicians_musical_instruments_relation_id_seq', 53, true);



ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_country_key UNIQUE (country);



ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pk PRIMARY KEY (id);



ALTER TABLE ONLY genres
    ADD CONSTRAINT genres_genre_key UNIQUE (genre);



ALTER TABLE ONLY genres
    ADD CONSTRAINT genres_pk PRIMARY KEY (id);



ALTER TABLE ONLY music_groups
    ADD CONSTRAINT music_groups_pk PRIMARY KEY (id);



ALTER TABLE ONLY music_rewards
    ADD CONSTRAINT music_rewards_name_key UNIQUE (name);



ALTER TABLE ONLY music_rewards
    ADD CONSTRAINT music_rewards_pk PRIMARY KEY (id);


ALTER TABLE ONLY musical_instruments
    ADD CONSTRAINT musical_instruments_pk PRIMARY KEY (id);


ALTER TABLE ONLY musicians_music_groups_relation
    ADD CONSTRAINT musicians_music_groups_relation_pk PRIMARY KEY (id);


ALTER TABLE ONLY musicians_music_rewards_relation
    ADD CONSTRAINT musicians_music_rewards_relation_pk PRIMARY KEY (id);



ALTER TABLE ONLY musicians_musical_instruments_relation
    ADD CONSTRAINT musicians_musical_instruments_relation_pk PRIMARY KEY (id);



ALTER TABLE ONLY musicians
    ADD CONSTRAINT musicians_pk PRIMARY KEY (id);



ALTER TABLE ONLY music_groups
    ADD CONSTRAINT music_groups_fk0 FOREIGN KEY (genre) REFERENCES genres(id);



ALTER TABLE ONLY music_groups
    ADD CONSTRAINT music_groups_fk1 FOREIGN KEY (country_id) REFERENCES countries(id);



ALTER TABLE ONLY music_rewards
    ADD CONSTRAINT music_rewards_fk0 FOREIGN KEY (country_m) REFERENCES countries(id) ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE ONLY musicians
    ADD CONSTRAINT musicians_fk0 FOREIGN KEY (id_country) REFERENCES countries(id) ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE ONLY musicians_music_groups_relation
    ADD CONSTRAINT musicians_music_groups_relation_fk0 FOREIGN KEY (id_musician) REFERENCES musicians(id);



ALTER TABLE ONLY musicians_music_rewards_relation
    ADD CONSTRAINT musicians_music_rewards_relation_fk0 FOREIGN KEY (id_music_reward) REFERENCES music_rewards(id) ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY musicians_music_rewards_relation
    ADD CONSTRAINT musicians_music_rewards_relation_fk1 FOREIGN KEY (id_musician) REFERENCES musicians(id) ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE ONLY musicians_musical_instruments_relation
    ADD CONSTRAINT musicians_musical_instruments_relation_fk0 FOREIGN KEY (id_instrument) REFERENCES musical_instruments(id) ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY musicians_musical_instruments_relation
    ADD CONSTRAINT musicians_musical_instruments_relation_fk1 FOREIGN KEY (id_musician) REFERENCES musicians(id) ON UPDATE CASCADE ON DELETE CASCADE;


