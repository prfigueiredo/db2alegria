CREATE MATERIALIZED VIEW published_videos AS
    SELECT movie_db.videos.video_id FROM movie_db.videos WHERE videos.published_status = true
    GROUP BY (video_id)
	ORDER BY sum(video_id) DESC
WITH NO DATA;

-- TESTING
-- INSERT INTO movie_db.videos (duration, published_status, title) VALUES (200, TRUE, 'HISTÓRIA SEM FIM');
-- INSERT INTO movie_db.videos (duration, published_status, title) VALUES (200, TRUE, 'HISTÓRIA SEM FIM');
-- INSERT INTO movie_db.videos (duration, published_status, title) VALUES (200, TRUE, 'HISTÓRIA SEM FIM');
-- INSERT INTO movie_db.videos (duration, published_status, title) VALUES (200, FALSE, 'HISTÓRIA SEM FIM');
-- INSERT INTO movie_db.videos (duration, published_status, title) VALUES (200, FALSE, 'HISTÓRIA SEM FIM');
-- INSERT INTO movie_db.videos (duration, published_status, title) VALUES (200, FALSE, 'HISTÓRIA SEM FIM');
-- REFRESH MATERIALIZED VIEW published_videos;
-- SELECT * FROM published_videos;
