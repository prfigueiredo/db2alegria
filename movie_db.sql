--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-07-12 00:00:17

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
-- TOC entry 4 (class 2615 OID 16555)
-- Name: movie_db; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA movie_db;


ALTER SCHEMA movie_db OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 234 (class 1259 OID 16631)
-- Name: audio; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db.audio (
    audio_id integer NOT NULL,
    language_id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE movie_db.audio OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16619)
-- Name: character; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db."character" (
    character_id integer NOT NULL,
    name character varying(50) NOT NULL,
    movie_id integer NOT NULL,
    episode_id integer NOT NULL
);


ALTER TABLE movie_db."character" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16571)
-- Name: continue_watching; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db.continue_watching (
    continue_watching_id integer NOT NULL,
    remaining_time integer NOT NULL,
    user_id integer NOT NULL,
    video_id integer NOT NULL
);


ALTER TABLE movie_db.continue_watching OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16580)
-- Name: country; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db.country (
    country_id integer NOT NULL,
    top_level_domain character varying(2)
);


ALTER TABLE movie_db.country OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16586)
-- Name: distribution_rules; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db.distribution_rules (
    distribution_rules_id integer NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE movie_db.distribution_rules OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16622)
-- Name: episodes; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db.episodes (
    episode_id integer NOT NULL,
    name character varying(50) NOT NULL,
    duration integer NOT NULL,
    serie_id integer NOT NULL,
    video_id integer NOT NULL
);


ALTER TABLE movie_db.episodes OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16616)
-- Name: genres; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db.genres (
    genre_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(50)
);


ALTER TABLE movie_db.genres OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16577)
-- Name: language; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db.language (
    language_id integer NOT NULL,
    name character varying(50) NOT NULL,
    country_id integer
);


ALTER TABLE movie_db.language OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16607)
-- Name: movies; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db.movies (
    movie_id integer NOT NULL,
    video_id integer NOT NULL,
    synopsis_id integer,
    genre_id integer,
    customer_name character varying(50)
);


ALTER TABLE movie_db.movies OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16598)
-- Name: next_releases; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db.next_releases (
    next_releases_id integer NOT NULL,
    movie_name character varying(50) NOT NULL,
    movie_category character varying(50) NOT NULL
);


ALTER TABLE movie_db.next_releases OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16601)
-- Name: permission; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db.permission (
    permission_id integer NOT NULL,
    user_id integer NOT NULL,
    birth_date date NOT NULL,
    subtitle_id integer NOT NULL,
    language_id integer NOT NULL
);


ALTER TABLE movie_db.permission OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16565)
-- Name: plans; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db.plans (
    plan_id integer NOT NULL,
    qtt_screens integer NOT NULL,
    price numeric(5,2)
);


ALTER TABLE movie_db.plans OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16559)
-- Name: playback_config; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db.playback_config (
    playback_config_id integer NOT NULL,
    tech_spec_id integer NOT NULL,
    audio_id integer NOT NULL,
    subtitile_id integer NOT NULL,
    video_time integer NOT NULL
);


ALTER TABLE movie_db.playback_config OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16592)
-- Name: premiere_schedulers; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db.premiere_schedulers (
    premiere_id integer NOT NULL,
    date_premiere date NOT NULL,
    time_premiere time with time zone NOT NULL
);


ALTER TABLE movie_db.premiere_schedulers OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16613)
-- Name: seasons; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db.seasons (
    season_id integer NOT NULL,
    synopsis_id integer NOT NULL,
    description character varying(50) NOT NULL,
    qty_episodes integer NOT NULL
);


ALTER TABLE movie_db.seasons OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16610)
-- Name: series; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db.series (
    serie_id integer NOT NULL,
    season_id integer,
    synopsis_id integer NOT NULL,
    description character varying(50) NOT NULL
);


ALTER TABLE movie_db.series OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16595)
-- Name: studios; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db.studios (
    studio_id integer NOT NULL,
    studio_name character varying(50) NOT NULL,
    feat_studio_name character varying(50) NOT NULL
);


ALTER TABLE movie_db.studios OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16589)
-- Name: subtitle; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db.subtitle (
    subtitle_id integer NOT NULL,
    language_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE movie_db.subtitle OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16625)
-- Name: synopsis; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db.synopsis (
    synopsis_id integer NOT NULL,
    text text NOT NULL
);


ALTER TABLE movie_db.synopsis OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16556)
-- Name: tech_spec; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db.tech_spec (
    tech_spec_id integer NOT NULL,
    video_width integer NOT NULL,
    video_height integer NOT NULL,
    video_quality character varying(50) NOT NULL,
    audio_quality character varying(50) NOT NULL,
    dolby_surround boolean NOT NULL
);


ALTER TABLE movie_db.tech_spec OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16628)
-- Name: trailers; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db.trailers (
    trailer_id integer NOT NULL,
    movie_id integer NOT NULL,
    episode_id integer NOT NULL,
    duration integer NOT NULL
);


ALTER TABLE movie_db.trailers OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16568)
-- Name: user; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db."user" (
    user_id integer NOT NULL,
    preferences_id integer NOT NULL,
    plan_id integer NOT NULL,
    name character varying(50) NOT NULL,
    birth_date date NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    plan_active boolean NOT NULL
);


ALTER TABLE movie_db."user" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16562)
-- Name: user_preferences; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db.user_preferences (
    preferences_id integer NOT NULL,
    audio_id integer NOT NULL,
    subtitle_id integer NOT NULL,
    language_id integer NOT NULL
);


ALTER TABLE movie_db.user_preferences OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16604)
-- Name: videos; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db.videos (
    video_id integer NOT NULL,
    customer_name character varying(50) NOT NULL
);


ALTER TABLE movie_db.videos OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16574)
-- Name: watch_later; Type: TABLE; Schema: movie_db; Owner: postgres
--

CREATE TABLE movie_db.watch_later (
    watch_later_id integer NOT NULL,
    user_id integer NOT NULL,
    video_id integer NOT NULL
);


ALTER TABLE movie_db.watch_later OWNER TO postgres;

--
-- TOC entry 3309 (class 2606 OID 16635)
-- Name: audio audio_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.audio
    ADD CONSTRAINT audio_id PRIMARY KEY (audio_id);


--
-- TOC entry 3301 (class 2606 OID 16637)
-- Name: character character_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db."character"
    ADD CONSTRAINT character_id PRIMARY KEY (character_id);


--
-- TOC entry 3271 (class 2606 OID 16639)
-- Name: continue_watching continue_watching_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.continue_watching
    ADD CONSTRAINT continue_watching_id PRIMARY KEY (continue_watching_id);


--
-- TOC entry 3277 (class 2606 OID 16641)
-- Name: country country_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.country
    ADD CONSTRAINT country_id PRIMARY KEY (country_id);


--
-- TOC entry 3279 (class 2606 OID 16643)
-- Name: distribution_rules distribution_rules_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.distribution_rules
    ADD CONSTRAINT distribution_rules_id PRIMARY KEY (distribution_rules_id);


--
-- TOC entry 3303 (class 2606 OID 16650)
-- Name: episodes episodes_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.episodes
    ADD CONSTRAINT episodes_id PRIMARY KEY (episode_id);


--
-- TOC entry 3299 (class 2606 OID 16652)
-- Name: genres genres_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.genres
    ADD CONSTRAINT genres_id PRIMARY KEY (genre_id);


--
-- TOC entry 3275 (class 2606 OID 16663)
-- Name: language language_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.language
    ADD CONSTRAINT language_id PRIMARY KEY (language_id);


--
-- TOC entry 3293 (class 2606 OID 16661)
-- Name: movies movies_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.movies
    ADD CONSTRAINT movies_id PRIMARY KEY (movie_id);


--
-- TOC entry 3287 (class 2606 OID 16665)
-- Name: next_releases next_releases_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.next_releases
    ADD CONSTRAINT next_releases_id PRIMARY KEY (next_releases_id);


--
-- TOC entry 3289 (class 2606 OID 16667)
-- Name: permission permission_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.permission
    ADD CONSTRAINT permission_id PRIMARY KEY (permission_id);


--
-- TOC entry 3267 (class 2606 OID 16669)
-- Name: plans plan_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.plans
    ADD CONSTRAINT plan_id PRIMARY KEY (plan_id);


--
-- TOC entry 3263 (class 2606 OID 16671)
-- Name: playback_config playback_config_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.playback_config
    ADD CONSTRAINT playback_config_id PRIMARY KEY (playback_config_id);


--
-- TOC entry 3265 (class 2606 OID 16713)
-- Name: user_preferences preferences_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.user_preferences
    ADD CONSTRAINT preferences_id PRIMARY KEY (preferences_id);


--
-- TOC entry 3283 (class 2606 OID 16673)
-- Name: premiere_schedulers premiere_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.premiere_schedulers
    ADD CONSTRAINT premiere_id PRIMARY KEY (premiere_id);


--
-- TOC entry 3297 (class 2606 OID 16675)
-- Name: seasons season_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.seasons
    ADD CONSTRAINT season_id PRIMARY KEY (season_id);


--
-- TOC entry 3295 (class 2606 OID 16677)
-- Name: series serie_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.series
    ADD CONSTRAINT serie_id PRIMARY KEY (serie_id);


--
-- TOC entry 3285 (class 2606 OID 16679)
-- Name: studios studio_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.studios
    ADD CONSTRAINT studio_id PRIMARY KEY (studio_id);


--
-- TOC entry 3281 (class 2606 OID 16681)
-- Name: subtitle subtitle_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.subtitle
    ADD CONSTRAINT subtitle_id PRIMARY KEY (subtitle_id);


--
-- TOC entry 3305 (class 2606 OID 16690)
-- Name: synopsis synopsis_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.synopsis
    ADD CONSTRAINT synopsis_id PRIMARY KEY (synopsis_id);


--
-- TOC entry 3261 (class 2606 OID 16692)
-- Name: tech_spec tech_spec_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.tech_spec
    ADD CONSTRAINT tech_spec_id PRIMARY KEY (tech_spec_id);


--
-- TOC entry 3307 (class 2606 OID 16694)
-- Name: trailers trailer_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.trailers
    ADD CONSTRAINT trailer_id PRIMARY KEY (trailer_id);


--
-- TOC entry 3269 (class 2606 OID 16706)
-- Name: user user_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db."user"
    ADD CONSTRAINT user_id PRIMARY KEY (user_id);


--
-- TOC entry 3291 (class 2606 OID 16730)
-- Name: videos videos_pkey; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.videos
    ADD CONSTRAINT videos_pkey PRIMARY KEY (video_id);


--
-- TOC entry 3273 (class 2606 OID 16741)
-- Name: watch_later watch_later_id; Type: CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.watch_later
    ADD CONSTRAINT watch_later_id PRIMARY KEY (watch_later_id);


--
-- TOC entry 3313 (class 2606 OID 16714)
-- Name: user_preferences audio_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.user_preferences
    ADD CONSTRAINT audio_id FOREIGN KEY (audio_id) REFERENCES movie_db.audio(audio_id) NOT VALID;


--
-- TOC entry 3310 (class 2606 OID 16822)
-- Name: playback_config audio_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.playback_config
    ADD CONSTRAINT audio_id FOREIGN KEY (audio_id) REFERENCES movie_db.audio(audio_id) NOT VALID;


--
-- TOC entry 3323 (class 2606 OID 16644)
-- Name: distribution_rules country_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.distribution_rules
    ADD CONSTRAINT country_id FOREIGN KEY (country_id) REFERENCES movie_db.country(country_id) NOT VALID;


--
-- TOC entry 3322 (class 2606 OID 16655)
-- Name: language country_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.language
    ADD CONSTRAINT country_id FOREIGN KEY (country_id) REFERENCES movie_db.country(country_id) NOT VALID;


--
-- TOC entry 3339 (class 2606 OID 16700)
-- Name: trailers episode_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.trailers
    ADD CONSTRAINT episode_id FOREIGN KEY (episode_id) REFERENCES movie_db.episodes(episode_id) NOT VALID;


--
-- TOC entry 3335 (class 2606 OID 16762)
-- Name: character episode_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db."character"
    ADD CONSTRAINT episode_id FOREIGN KEY (episode_id) REFERENCES movie_db.episodes(episode_id) NOT VALID;


--
-- TOC entry 3330 (class 2606 OID 16797)
-- Name: movies genre_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.movies
    ADD CONSTRAINT genre_id FOREIGN KEY (genre_id) REFERENCES movie_db.genres(genre_id) NOT VALID;


--
-- TOC entry 3324 (class 2606 OID 16682)
-- Name: subtitle language_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.subtitle
    ADD CONSTRAINT language_id FOREIGN KEY (language_id) REFERENCES movie_db.language(language_id) NOT VALID;


--
-- TOC entry 3315 (class 2606 OID 16724)
-- Name: user_preferences language_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.user_preferences
    ADD CONSTRAINT language_id FOREIGN KEY (language_id) REFERENCES movie_db.language(language_id) NOT VALID;


--
-- TOC entry 3340 (class 2606 OID 16752)
-- Name: audio language_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.audio
    ADD CONSTRAINT language_id FOREIGN KEY (language_id) REFERENCES movie_db.language(language_id) NOT VALID;


--
-- TOC entry 3325 (class 2606 OID 16812)
-- Name: permission language_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.permission
    ADD CONSTRAINT language_id FOREIGN KEY (language_id) REFERENCES movie_db.language(language_id) NOT VALID;


--
-- TOC entry 3338 (class 2606 OID 16695)
-- Name: trailers movie_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.trailers
    ADD CONSTRAINT movie_id FOREIGN KEY (movie_id) REFERENCES movie_db.movies(movie_id) NOT VALID;


--
-- TOC entry 3334 (class 2606 OID 16757)
-- Name: character movie_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db."character"
    ADD CONSTRAINT movie_id FOREIGN KEY (movie_id) REFERENCES movie_db.movies(movie_id) NOT VALID;


--
-- TOC entry 3316 (class 2606 OID 16707)
-- Name: user plan_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db."user"
    ADD CONSTRAINT plan_id FOREIGN KEY (plan_id) REFERENCES movie_db.plans(plan_id) NOT VALID;


--
-- TOC entry 3317 (class 2606 OID 16847)
-- Name: user preferences_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db."user"
    ADD CONSTRAINT preferences_id FOREIGN KEY (preferences_id) REFERENCES movie_db.user_preferences(preferences_id) NOT VALID;


--
-- TOC entry 3331 (class 2606 OID 16837)
-- Name: series season_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.series
    ADD CONSTRAINT season_id FOREIGN KEY (season_id) REFERENCES movie_db.seasons(season_id) NOT VALID;


--
-- TOC entry 3336 (class 2606 OID 16777)
-- Name: episodes serie_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.episodes
    ADD CONSTRAINT serie_id FOREIGN KEY (serie_id) REFERENCES movie_db.series(serie_id) NOT VALID;


--
-- TOC entry 3314 (class 2606 OID 16719)
-- Name: user_preferences subtitle_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.user_preferences
    ADD CONSTRAINT subtitle_id FOREIGN KEY (subtitle_id) REFERENCES movie_db.subtitle(subtitle_id) NOT VALID;


--
-- TOC entry 3326 (class 2606 OID 16807)
-- Name: permission subtitle_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.permission
    ADD CONSTRAINT subtitle_id FOREIGN KEY (subtitle_id) REFERENCES movie_db.subtitle(subtitle_id) NOT VALID;


--
-- TOC entry 3311 (class 2606 OID 16827)
-- Name: playback_config subtitle_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.playback_config
    ADD CONSTRAINT subtitle_id FOREIGN KEY (subtitile_id) REFERENCES movie_db.subtitle(subtitle_id) NOT VALID;


--
-- TOC entry 3329 (class 2606 OID 16792)
-- Name: movies synopsis_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.movies
    ADD CONSTRAINT synopsis_id FOREIGN KEY (synopsis_id) REFERENCES movie_db.synopsis(synopsis_id) NOT VALID;


--
-- TOC entry 3333 (class 2606 OID 16832)
-- Name: seasons synopsis_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.seasons
    ADD CONSTRAINT synopsis_id FOREIGN KEY (synopsis_id) REFERENCES movie_db.synopsis(synopsis_id) NOT VALID;


--
-- TOC entry 3332 (class 2606 OID 16842)
-- Name: series synopsis_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.series
    ADD CONSTRAINT synopsis_id FOREIGN KEY (synopsis_id) REFERENCES movie_db.synopsis(synopsis_id) NOT VALID;


--
-- TOC entry 3312 (class 2606 OID 16817)
-- Name: playback_config tech_spec_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.playback_config
    ADD CONSTRAINT tech_spec_id FOREIGN KEY (tech_spec_id) REFERENCES movie_db.tech_spec(tech_spec_id) NOT VALID;


--
-- TOC entry 3320 (class 2606 OID 16742)
-- Name: watch_later user_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.watch_later
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES movie_db."user"(user_id) NOT VALID;


--
-- TOC entry 3318 (class 2606 OID 16767)
-- Name: continue_watching user_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.continue_watching
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES movie_db."user"(user_id) NOT VALID;


--
-- TOC entry 3327 (class 2606 OID 16802)
-- Name: permission user_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.permission
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES movie_db."user"(user_id) NOT VALID;


--
-- TOC entry 3321 (class 2606 OID 16747)
-- Name: watch_later video_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.watch_later
    ADD CONSTRAINT video_id FOREIGN KEY (video_id) REFERENCES movie_db.videos(video_id) NOT VALID;


--
-- TOC entry 3319 (class 2606 OID 16772)
-- Name: continue_watching video_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.continue_watching
    ADD CONSTRAINT video_id FOREIGN KEY (video_id) REFERENCES movie_db.videos(video_id) NOT VALID;


--
-- TOC entry 3337 (class 2606 OID 16782)
-- Name: episodes video_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.episodes
    ADD CONSTRAINT video_id FOREIGN KEY (video_id) REFERENCES movie_db.videos(video_id) NOT VALID;


--
-- TOC entry 3328 (class 2606 OID 16787)
-- Name: movies video_id; Type: FK CONSTRAINT; Schema: movie_db; Owner: postgres
--

ALTER TABLE ONLY movie_db.movies
    ADD CONSTRAINT video_id FOREIGN KEY (video_id) REFERENCES movie_db.videos(video_id) NOT VALID;


-- Completed on 2022-07-12 00:00:17

--
-- PostgreSQL database dump complete
--

