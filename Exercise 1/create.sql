-- 1. ARTIST
CREATE INDEX idx_artist_name ON artist (name);

CREATE TABLE artist (
    artist_id   SERIAL PRIMARY KEY,
    name        VARCHAR(255) NOT NULL
);

-- 2. CD
CREATE TABLE cd (
    cd_id       SERIAL PRIMARY KEY,
    title       VARCHAR(255) NOT NULL,
    price       NUMERIC(8,2) NOT NULL CHECK (price >= 0),
    genre       VARCHAR(100),
    artist_id   INTEGER NOT NULL,
    CONSTRAINT fk_cd_artist
        FOREIGN KEY (artist_id)
        REFERENCES artist (artist_id)
        ON DELETE CASCADE
);

-- 3. TRACK
CREATE TABLE track (
    track_id      SERIAL PRIMARY KEY,
    title         VARCHAR(255) NOT NULL,
    running_time  INTEGER NOT NULL CHECK (running_time > 0)  -- seconds
);

-- 4. CD_TRACK 
CREATE TABLE cd_track (
    cd_id       INTEGER NOT NULL,
    track_id    INTEGER NOT NULL,
    PRIMARY KEY (cd_id, track_id),
    CONSTRAINT fk_cdtrack_cd
        FOREIGN KEY (cd_id)
        REFERENCES cd (cd_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_cdtrack_track
        FOREIGN KEY (track_id)
        REFERENCES track (track_id)
        ON DELETE RESTRICT
);
