-- DROP FUNCTION IF EXISTS setDefaultDistributionRule;

CREATE OR REPLACE FUNCTION movie_db.setDefaultDistributionRule(videoID INTEGER) RETURNS VOID AS
$$
DECLARE
   brasilID INTEGER;
   validateRules INTEGER;
BEGIN
   SELECT country_id INTO brasilID FROM movie_db.countries WHERE top_level_domain = 'BR';
   SELECT count(*) INTO validateRules FROM movie_db.distribution_rules WHERE country_id = brasilID AND video_id = videoID;

   IF validateRules = 0 THEN
      INSERT INTO movie_db.distribution_rules (country_id, video_id) VALUES (brasilID, videoID);
   END IF;
END;
$$ LANGUAGE plpgsql;


-- TESTING
-- INSERT INTO movie_db.countries (top_level_domain) VALUES ('BR');
-- INSERT INTO movie_db.videos (duration, published_status, title) VALUES (200, TRUE, 'HISTÓRIA SEM FIM');
-- SELECT setDefaultDistributionRule(<video_id>);
-- SELECT * FROM movie_db.distribution_rules;
