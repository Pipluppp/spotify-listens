-- Updated structure of listens (only with the needed columns)
CREATE TABLE listens (
    id SERIAL,
    ts TIMESTAMP,
    song_id INT,
    artist_id INT,
    album_id INT,
    ms_played INTEGER,
    reason_start VARCHAR(255),
    reason_end VARCHAR(255),
    shuffle BOOLEAN,
    skipped BOOLEAN,
    PRIMARY KEY(id),
    FOREIGN KEY(song_id) REFERENCES songs(id),
    FOREIGN KEY(artist_id) REFERENCES artists(id),
    FOREIGN KEY(album_id) REFERENCES albums(id)
);

/* CREATE TABLE songs (
    id SERIAL,
    name VARCHAR(255),
    artist_id INT,
    album_id INT,
    PRIMARY KEY(id)
    FOREIGN KEY(album_id) REFERENCES albums(id),
    FOREIGN KEY(artist_id) REFERENCES artists(id) 
); */

CREATE TABLE songs (
    id SERIAL,
    name VARCHAR(255),
    artist_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(artist_id) REFERENCES artists(id)
);

CREATE TABLE artists (
    id SERIAL,
    name VARCHAR(255),
    PRIMARY KEY(id)
);

CREATE TABLE albums (
    id SERIAL,
    name VARCHAR(255),
    artist_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(artist_id) REFERENCES artists(id)
);

CREATE TABLE song_albums (
    id SERIAL,
    song_id INT,
    album_id INT,
    FOREIGN KEY(song_id) REFERENCES songs(id),
    FOREIGN KEY(album_id) REFERENCES albums(id)
);

-- Account Data
CREATE TABLE liked_songs (
    id SERIAL,
    song_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(song_id) REFERENCES songs(id)
);

CREATE TABLE followed_artists (
    id SERIAL,
    artist_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY (artist_id) REFERENCES artists(id)
);