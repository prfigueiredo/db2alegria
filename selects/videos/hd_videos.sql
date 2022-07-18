
-- INSERT INTO movie_db.videos (duration, published_status, title) VALUES (200, TRUE, 'HISTÓRIA SEM FIM');
-- INSERT INTO movie_db.countries (top_level_domain) VALUES ('BR');
-- INSERT INTO movie_db.languages (name, country_id) VALUES ('LINGUA', 1);
-- INSERT INTO movie_db.audios (language_id, name) VALUES (1, 'portuguesa');
-- INSERT INTO movie_db.subtitles (language_id, name) VALUES (1, 'PT [BR]');
-- INSERT INTO movie_db.tech_specs (video_width, video_height, video_quality, audio_quality, dolby_surround) VALUES (1280, 720, 'HD', 'HD', TRUE);
-- INSERT INTO movie_db.tech_specs (video_width, video_height, video_quality, audio_quality, dolby_surround) VALUES (1920, 1080, 'HD', 'HD', TRUE);
-- INSERT INTO movie_db.tech_specs (video_width, video_height, video_quality, audio_quality, dolby_surround) VALUES (640, 360, 'LD', 'LD', TRUE);
-- INSERT INTO movie_db.playback_config (tech_spec_id, audio_id, subtitile_id, video_id) VALUES (1,1,1,1);
-- INSERT INTO movie_db.playback_config (tech_spec_id, audio_id, subtitile_id, video_id) VALUES (2,1,1,1);
-- INSERT INTO movie_db.playback_config (tech_spec_id, audio_id, subtitile_id, video_id) VALUES (2,1,1,1);

SELECT MOVIE_DB.videos.video_id AS "Indentidicador de Vídeo c/ playback HD"
FROM MOVIE_DB.videos
INNER JOIN MOVIE_DB.playback_config
    ON MOVIE_DB.playback_config.video_id = MOVIE_DB.videos.video_id
INNER JOIN MOVIE_DB.tech_specs
    ON MOVIE_DB.playback_config.tech_spec_id = MOVIE_DB.tech_specs.tech_spec_id
WHERE tech_specs.video_quality = 'HD'
GROUP BY videos.video_id;
