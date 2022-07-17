-- SET statement_timeout = 0;
-- SET lock_timeout = 0;
-- SET idle_in_transaction_session_timeout = 0;
-- SET client_encoding = 'UTF8';
-- SET standard_conforming_strings = on;
-- SELECT pg_catalog.set_config('search_path', '', false);
-- SET check_function_bodies = false;
-- SET xmloption = content;
-- SET client_min_messages = warning;
-- SET row_security = off;

CREATE SCHEMA movie_db;

SET default_tablespace = '';

SET default_table_access_method = heap;

CREATE TABLE movie_db.videos (
    video_id SERIAL PRIMARY KEY,
    customer_name character varying(50) NOT NULL
);

CREATE TABLE movie_db.countries (
    country_id SERIAL PRIMARY KEY,
    top_level_domain character varying(2)
);

CREATE TABLE movie_db.languages (
    language_id SERIAL PRIMARY KEY,
    name character varying(50) NOT NULL,
    country_id integer,
    CONSTRAINT country_id FOREIGN KEY (country_id) REFERENCES movie_db.countries(country_id) NOT VALID
);

CREATE TABLE movie_db.synopsis (
    synopsis_id SERIAL PRIMARY KEY,
    text text NOT NULL
);

CREATE TABLE movie_db.plans (
    plan_id SERIAL PRIMARY KEY,
    qtt_screens integer NOT NULL,
    price numeric(5,2)
);

CREATE TABLE movie_db.subtitles (
    subtitle_id SERIAL PRIMARY KEY,
    language_id integer NOT NULL,
    name character varying(50) NOT NULL,
    CONSTRAINT language_id FOREIGN KEY (language_id) REFERENCES movie_db.languages(language_id) NOT VALID
);

CREATE TABLE movie_db.audios (
    audio_id SERIAL PRIMARY KEY,
    language_id integer NOT NULL,
    name character varying(50),
    CONSTRAINT language_id FOREIGN KEY (language_id) REFERENCES movie_db.languages(language_id) NOT VALID
);

CREATE TABLE movie_db.user_preferences (
    preferences_id SERIAL PRIMARY KEY,
    audio_id integer NOT NULL,
    subtitle_id integer NOT NULL,
    language_id integer NOT NULL,
    CONSTRAINT audio_id FOREIGN KEY (audio_id) REFERENCES movie_db.audios(audio_id) NOT VALID,
    CONSTRAINT language_id FOREIGN KEY (language_id) REFERENCES movie_db.languages(language_id) NOT VALID,
    CONSTRAINT subtitle_id FOREIGN KEY (subtitle_id) REFERENCES movie_db.subtitles(subtitle_id) NOT VALID
);

CREATE TABLE movie_db.users (
    user_id SERIAL PRIMARY KEY,
    preferences_id integer NOT NULL,
    plan_id integer NOT NULL,
    name character varying(50) NOT NULL,
    birth_date date NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    plan_active boolean NOT NULL,
    CONSTRAINT plan_id FOREIGN KEY (plan_id) REFERENCES movie_db.plans(plan_id) NOT VALID,
    CONSTRAINT preferences_id FOREIGN KEY (preferences_id) REFERENCES movie_db.user_preferences(preferences_id) NOT VALID
);

CREATE TABLE movie_db.seasons (
    season_id SERIAL PRIMARY KEY,
    synopsis_id integer NOT NULL,
    description character varying(50) NOT NULL,
    qty_episodes integer NOT NULL,
    CONSTRAINT synopsis_id FOREIGN KEY (synopsis_id) REFERENCES movie_db.synopsis(synopsis_id) NOT VALID
);

CREATE TABLE movie_db.series (
    serie_id SERIAL PRIMARY KEY,
    season_id integer,
    synopsis_id integer NOT NULL,
    description character varying(50) NOT NULL,
    CONSTRAINT season_id FOREIGN KEY (season_id) REFERENCES movie_db.seasons(season_id) NOT VALID,
    CONSTRAINT synopsis_id FOREIGN KEY (synopsis_id) REFERENCES movie_db.synopsis(synopsis_id) NOT VALID
);

CREATE TABLE movie_db.episodes (
    episode_id SERIAL PRIMARY KEY,
    name character varying(50) NOT NULL,
    duration integer NOT NULL,
    serie_id integer NOT NULL,
    video_id integer NOT NULL,
    CONSTRAINT serie_id FOREIGN KEY (serie_id) REFERENCES movie_db.series(serie_id) NOT VALID,
    CONSTRAINT video_id FOREIGN KEY (video_id) REFERENCES movie_db.videos(video_id) NOT VALID
);

CREATE TABLE movie_db.continue_watching (
    continue_watching_id SERIAL PRIMARY KEY,
    remaining_time integer NOT NULL,
    user_id integer NOT NULL,
    video_id integer NOT NULL,
    CONSTRAINT video_id FOREIGN KEY (video_id) REFERENCES movie_db.videos(video_id) NOT VALID,
    CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES movie_db. users(user_id) NOT VALID
);

CREATE TABLE movie_db.distribution_rules (
    distribution_rules_id SERIAL PRIMARY KEY,
    country_id integer NOT NULL,
	video_id integer NOT NULL,
    CONSTRAINT country_id FOREIGN KEY (country_id) REFERENCES movie_db.countries(country_id) NOT VALID,
    CONSTRAINT video_id FOREIGN KEY (video_id) REFERENCES movie_db.videos(video_id) NOT VALID
);

CREATE TABLE movie_db.genres (
    genre_id SERIAL PRIMARY KEY,
    name character varying(50) NOT NULL,
    description character varying(50)
);

CREATE TABLE movie_db.movies (
    movie_id SERIAL PRIMARY KEY,
    video_id integer NOT NULL,
    synopsis_id integer,
    genre_id integer,
    customer_name character varying(50),
    CONSTRAINT genre_id FOREIGN KEY (genre_id) REFERENCES movie_db.genres(genre_id) NOT VALID,
    CONSTRAINT video_id FOREIGN KEY (video_id) REFERENCES movie_db.videos(video_id) NOT VALID,
    CONSTRAINT synopsis_id FOREIGN KEY (synopsis_id) REFERENCES movie_db.synopsis(synopsis_id) NOT VALID
);

CREATE TABLE movie_db.characters (
    character_id SERIAL PRIMARY KEY,
    name character varying(50) NOT NULL,
    movie_id integer NOT NULL,
    episode_id integer NOT NULL,
    CONSTRAINT episode_id FOREIGN KEY (episode_id) REFERENCES movie_db.episodes(episode_id) NOT VALID,
    CONSTRAINT movie_id FOREIGN KEY (movie_id) REFERENCES movie_db.movies(movie_id) NOT VALID
);

CREATE TABLE movie_db.next_releases (
    next_releases_id SERIAL PRIMARY KEY,
    movie_name character varying(50) NOT NULL,
    movie_category character varying(50) NOT NULL
);

CREATE TABLE movie_db.permissions (
    permission_id SERIAL PRIMARY KEY,
    user_id integer NOT NULL,
    birth_date date NOT NULL,
    subtitle_id integer NOT NULL,
    language_id integer NOT NULL,
    CONSTRAINT language_id FOREIGN KEY (language_id) REFERENCES movie_db.languages(language_id) NOT VALID,
    CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES movie_db. users(user_id) NOT VALID,
    CONSTRAINT subtitle_id FOREIGN KEY (subtitle_id) REFERENCES movie_db.subtitles(subtitle_id) NOT VALID
);

CREATE TABLE movie_db.tech_specs (
    tech_spec_id SERIAL PRIMARY KEY,
    video_width integer NOT NULL,
    video_height integer NOT NULL,
    video_quality character varying(50) NOT NULL,
    audio_quality character varying(50) NOT NULL,
    dolby_surround boolean NOT NULL
);

CREATE TABLE movie_db.playback_config (
    playback_config_id SERIAL PRIMARY KEY,
    tech_spec_id integer NOT NULL,
    audio_id integer NOT NULL,
    subtitile_id integer NOT NULL,
    video_time integer NOT NULL,
    CONSTRAINT audio_id FOREIGN KEY (audio_id) REFERENCES movie_db.audios(audio_id) NOT VALID,
    CONSTRAINT tech_spec_id FOREIGN KEY (tech_spec_id) REFERENCES movie_db.tech_specs(tech_spec_id) NOT VALID,
    CONSTRAINT subtitle_id FOREIGN KEY (subtitile_id) REFERENCES movie_db.subtitles(subtitle_id) NOT VALID
);

CREATE TABLE movie_db.premiere_schedulers (
    premiere_id SERIAL PRIMARY KEY,
    date_premiere date NOT NULL,
    time_premiere time with time zone NOT NULL
);

CREATE TABLE movie_db.studios (
    studio_id SERIAL PRIMARY KEY,
    studio_name character varying(50) NOT NULL,
    feat_studio_name character varying(50) NOT NULL
);

CREATE TABLE movie_db.trailers (
    trailer_id SERIAL PRIMARY KEY,
    movie_id integer NOT NULL,
    episode_id integer NOT NULL,
    duration integer NOT NULL,
    CONSTRAINT episode_id FOREIGN KEY (episode_id) REFERENCES movie_db.episodes(episode_id) NOT VALID,
    CONSTRAINT movie_id FOREIGN KEY (movie_id) REFERENCES movie_db.movies(movie_id) NOT VALID
);

CREATE TABLE movie_db.watch_later (
    watch_later_id SERIAL PRIMARY KEY,
    user_id integer NOT NULL,
    video_id integer NOT NULL,
    CONSTRAINT video_id FOREIGN KEY (video_id) REFERENCES movie_db.videos(video_id) NOT VALID,
    CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES movie_db. users(user_id) NOT VALID
);

CREATE TABLE movie_db.watched_title (
	title_watched_id SERIAL PRIMARY KEY,
	user_id integer NOT NULL,
	video_id integer NOT NULL,
	CONSTRAINT video_id FOREIGN KEY (video_id) REFERENCES movie_db.videos(video_id) NOT VALID,
	CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES movie_db.users(user_id) NOT VALID
);