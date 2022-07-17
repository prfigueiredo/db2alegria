CREATE OR REPLACE FUNCTION movie_db.setNewDefaultDistribution() RETURNS TRIGGER AS $$
BEGIN
    /* movie_db.setDefaultDistributionRule é definida em /functions */
	PERFORM movie_db.setDefaultDistributionRule(NEW.video_id);
    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE TRIGGER DEFAULT_DISTRIBUTION AFTER
    INSERT ON movie_db.videos
    FOR EACH ROW
    EXECUTE PROCEDURE movie_db.setNewDefaultDistribution();

-- TESTING
-- INSERT INTO movie_db.countries (top_level_domain) VALUES ('BR');
-- INSERT INTO movie_db.videos (duration, published_status, views, title) VALUES (200, TRUE, 0, 'HISTÓRIA SEM FIM');
-- INSERT INTO movie_db.videos (duration, published_status, title) VALUES (200, TRUE, 'HISTÓRIA SEM FIM');
-- SELECT * FROM movie_db.distribution_rules;
