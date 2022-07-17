CREATE OR REPLACE FUNCTION movie_db.countSeasonBySerie(serieID INTEGER) RETURNS INTEGER AS
$$
DECLARE
    totalSeason INTEGER;
BEGIN
   SELECT count(*) INTO totalSeason FROM movie_db.seasons WHERE serie_id = serieID;
   RETURN totalEpsodies;
END;
$$ LANGUAGE plpgsql;

-- TESTING countEpsodiesBySeason
-- INSERT INTO movie_db.synopsis (description) VALUES ('synopsis');
-- INSERT INTO movie_db.seasons (synopsis_id, description, qty_episodes) VALUES (1, 'description', 0);
-- INSERT INTO movie_db.videos (duration, published_status, title) VALUES (200, TRUE, 'HISTÓRIA SEM FIM');
-- INSERT INTO movie_db.series (synopsis_id, description) VALUES (1, 'description');
-- INSERT INTO movie_db.episodes (name, duration, season_id, serie_id, video_id) VALUES ('nome do episodio', 1440, 1, 1, 1);
-- SELECT movie_db.countSeasonBySerie(1);
