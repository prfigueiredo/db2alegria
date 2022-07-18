-- INSERT INTO movie_db.synopsis (description) VALUES ('synopsis');
-- INSERT INTO movie_db.videos (duration, published_status, title) VALUES (200, TRUE, 'HISTÓRIA SEM FIM');
-- INSERT INTO movie_db.genres (name, description) VALUES ('HORROR', 'TRUE HORROR');
-- INSERT INTO movie_db.genres (name, description) VALUES ('COMEDIA', 'TRUE HORROR');
-- INSERT INTO movie_db.movies (video_id,synopsis_id,genre_id, title) VALUES (1, 1, 1, 'HISTÓRIA SEM FIM');
-- INSERT INTO movie_db.movies (video_id,synopsis_id,genre_id, title) VALUES (1, 1, 1, 'HISTÓRIA SEM FIM');
-- INSERT INTO movie_db.movies (video_id,synopsis_id,genre_id, title) VALUES (1, 1, 2, 'HISTÓRIA SEM FIM');
-- INSERT INTO movie_db.movies (video_id,synopsis_id,genre_id, title) VALUES (1, 1, 2, 'HISTÓRIA SEM FIM');


SELECT COUNT(1) AS "Quantidade de Filmes",
       MOVIE_DB.genres.name AS "GENEROS"
FROM MOVIE_DB.movies
INNER JOIN MOVIE_DB.genres
    ON MOVIE_DB.genres.genre_id = MOVIE_DB.movies.genre_id
GROUP BY genres.genre_id;
