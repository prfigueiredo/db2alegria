/*CREATE OR REPLACE FUNCTION movie_db.refresh_movies() RETURNS TRIGGER AS $$
BEGIN
	IF NEW.published_status = TRUE THEN
        REFRESH MATERIALIZED VIEW published_videos;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;
*/

CREATE OR REPLACE TRIGGER refresh_published_videos AFTER
    INSERT ON movie_db.videos
    FOR EACH ROW
    EXECUTE PROCEDURE movie_db.refresh_movies();

-- TESTING
-- INSERT INTO movie_db.videos (duration, published_status, title) VALUES (200, TRUE, 'HISTÓRIA SEM FIM');
-- SELECT * FROM published_videos;
