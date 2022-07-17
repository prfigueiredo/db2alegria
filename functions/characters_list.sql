CREATE OR REPLACE FUNCTION movie_db.characterListInMovie(videoID INTEGER) RETURNS TABLE (CHARACTER_NAME VARCHAR) AS
$$
BEGIN
    RETURN QUERY SELECT characters.name
            FROM movie_db.movies INNER JOIN movie_db.characters ON movie_db.characters.movie_id = movie_db.movies.movie_id
            WHERE movie_db.movies.video_id = videoID;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION movie_db.characterListInEpsodie(videoID INTEGER) RETURNS TABLE (CHARACTER_NAME VARCHAR) AS
$$
BEGIN
    RETURN QUERY SELECT characters.name
                 FROM movie_db.episodes
                 INNER JOIN movie_db.characters
                 ON movie_db.characters.episode_id = movie_db.episodes.episode_id
                 WHERE movie_db.episodes.video_id = videoID;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION movie_db.characterListByVideoID(videoID INTEGER) RETURNS TABLE (CHARACTER_NAME VARCHAR) AS
$$
DECLARE
    checkMovie INTEGER;
BEGIN
    SELECT count(movie_id) INTO checkMovie FROM  movie_db.movies WHERE movies.video_id = videoID;

    IF checkMovie <> 0 THEN
        RETURN QUERY SELECT movie_db.characterListInMovie(videoID);
    END IF;


    RETURN QUERY SELECT movie_db.characterListInEpsodie(videoID);
END;
$$ LANGUAGE plpgsql;

-- -- TESTING
-- INSERT INTO movie_db.synopsis (description) VALUES ('synopsis');
-- INSERT INTO movie_db.seasons (synopsis_id, description, qty_episodes) VALUES (1, 'description', 0);
-- INSERT INTO movie_db.series (synopsis_id, description) VALUES (1, 'description');
-- INSERT INTO movie_db.videos (duration, published_status, title) VALUES (200, TRUE, 'HISTÓRIA SEM FIM');
-- INSERT INTO movie_db.genres (name, description) VALUES ('HORROR', 'TRUE HORROR');
-- INSERT INTO movie_db.movies (video_id,synopsis_id,genre_id, title) VALUES (1, 1, 1, 'HISTÓRIA SEM FIM');
-- INSERT INTO movie_db.episodes (name, duration, season_id, serie_id, video_id) VALUES ('nome do episodio', 1440, 1, 1, 1);
-- INSERT INTO movie_db.characters (name, episode_id) VALUES ('J. Doe', 1);
-- INSERT INTO movie_db.characters (name, movie_id) VALUES ('J. Doe MOVIE', 1);

-- SELECT movie_db.characterListByEpsodieID(1);
-- SELECT movie_db.characterListByMovieID(1);
-- SELECT movie_db.characterListByVideoID(1);
