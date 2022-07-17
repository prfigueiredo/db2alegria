CREATE OR REPLACE FUNCTION movie_db.CONTROLE_VIDEOS_ASSISTIDOS() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.remaining_time = 0 THEN
        INSERT INTO movie_db.watched_title (user_id, video_id) values (NEW.user_id, NEW.video_id);
        RETURN NEW;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

