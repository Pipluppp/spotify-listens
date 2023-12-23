-- Listens table containing each play/list of a song
CREATE TABLE listens (
    id SERIAL,
    ts TIMESTAMP,
    song_id INT,
    artist_id INT,
    album_id INT,
    ms_played INT,
    reason_start VARCHAR(255),
    reason_end VARCHAR(255),
    shuffle BOOLEAN,
    skipped BOOLEAN,
    PRIMARY KEY(id),
    FOREIGN KEY(song_id) REFERENCES songs(id),
    FOREIGN KEY(artist_id) REFERENCES artists(id),
    FOREIGN KEY(album_id) REFERENCES albums(id)
);

-- Songs table containing all the songs listened to
CREATE TABLE songs (
    id SERIAL,
    name VARCHAR(255),
    artist_id INT,
    liked BOOLEAN,
    PRIMARY KEY(id),
    FOREIGN KEY(artist_id) REFERENCES artists(id)
);

-- Artists table containing all the artists
CREATE TABLE artists (
    id SERIAL,
    name VARCHAR(255),
    followed BOOLEAN,
    PRIMARY KEY(id)
);

-- Albums table containing all the albums
CREATE TABLE albums (
    id SERIAL,
    name VARCHAR(255),
    artist_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(artist_id) REFERENCES artists(id)
);

-- Junction table for the songs-albums relationship (songs in an album, and albums a song is part of)
CREATE TABLE song_albums (
    id SERIAL,
    song_id INT,
    album_id INT,
    FOREIGN KEY(song_id) REFERENCES songs(id),
    FOREIGN KEY(album_id) REFERENCES albums(id)
);

-- Songs that are liked by the user
CREATE TABLE liked_songs (
    id SERIAL,
    song_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(song_id) REFERENCES songs(id)
);

-- Artists followed by the user
CREATE TABLE followed_artists (
    id SERIAL,
    artist_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY (artist_id) REFERENCES artists(id)
);


-- INDEX
CREATE INDEX songs_name ON songs (name);
CREATE INDEX artists_name ON artists (name);
CREATE INDEX albums_name ON albums (name);
CREATE INDEX listens_songid ON listens (song_id);
CREATE INDEX listens_artistid ON listens (artist_id);
CREATE INDEX listens_albumid ON listens (album_id);


-- VIEWS
CREATE VIEW top_artists_playtime AS
    SELECT artists.name, (SUM(ms_played) / 1000 / 60 / 60) AS play_time_hours FROM listens
    JOIN artists ON listens.artist_id = artists.id
    GROUP BY artists.name
    ORDER BY play_time_hours DESC
    LIMIT 10;

CREATE VIEW top_albums_playtime AS
    SELECT albums.name AS album_name, artists.name AS artist_name, (SUM(ms_played) / 1000 / 60 / 60) AS playtime_hours FROM listens
    JOIN albums ON listens.album_id = albums.id
    JOIN artists ON listens.artist_id = artists.id
    GROUP BY albums.id, artists.id
    ORDER BY playtime_hours DESC
    LIMIT 10;

CREATE VIEW top_songs_playtime AS
    SELECT songs.name AS song_name, artists.name AS artist_name, (SUM(ms_played) / 1000 / 60 / 24) AS duration_listened_hours
    FROM listens
    JOIN songs ON listens.song_id = songs.id
    JOIN artists ON songs.artist_id = artists.id
    GROUP BY songs.name, artists.name
    ORDER BY duration_listened_hours DESC
    LIMIT 10;