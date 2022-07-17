
CREATE OR REPLACE FUNCTION movie_db.GET_TOTAL_HORAS_ASSISTIDAS() RETURNS VARCHAR AS $$
DECLARE MINUTES NUMERIC;
BEGIN
    SELECT SUM(DURATION) INTO MINUTES FROM movie_db.watched_title title INNER JOIN movie_db.videos video ON title.video_id = video.video_id;
    RETURN format('Horas assistidas: %s', to_char(MINUTES/60, 'FM999.999'));
END;
$$ LANGUAGE PLPGSQL;

--select movie_db.get_total_horas_assistidas()