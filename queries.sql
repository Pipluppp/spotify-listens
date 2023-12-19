-- Select songs, artists, etc.
SELECT * FROM songs;
SELECT * FROM artists;
SELECT * FROM liked_songs;
SELECT * FROM followed_artists;


-- TOP ARTISTS: By Total playtime, Count of plays, or Number of songs played
-- Top 10 Artists with Highest total play time in hours
SELECT artists.name, (SUM(ms_played) / 1000 / 60 / 60) AS play_time_hours FROM listens
JOIN artists ON listens.artist_id = artists.id
GROUP BY artists.name
ORDER BY play_time_hours DESC
LIMIT 10;

-- Top 10 Artists with Highest plays
SELECT artists.name, COUNT(*) FROM listens
JOIN artists ON listens.artist_id = artists.id
GROUP BY artists.name
ORDER BY COUNT(*) DESC
LIMIT 10;

-- Top 10 Artists with Highest number of distinct songs listened to
SELECT artists.name, COUNT(*) FROM songs
JOIN artists ON songs.artist_id = artists.id
GROUP BY artists.name
ORDER BY COUNT(*) DESC
LIMIT 10;


-- TOP ALBUMS: Top 10 Albums by Hours listened to
SELECT albums.name, artists.name, (SUM(ms_played) / 1000 / 60 / 60) AS playtime_hours FROM listens
JOIN albums ON listens.album_id = albums.id
JOIN artists ON listens.artist_id = artists.id
GROUP BY albums.id, artists.id
ORDER BY playtime_hours DESC
LIMIT 10;


-- SONGS
-- Top 10 songs by Playtime in hours
SELECT songs.name, artists.name, (SUM(ms_played) / 1000 / 60 / 24) AS duration_listened_hours
FROM listens
JOIN songs ON listens.song_id = songs.id
JOIN artists ON songs.artist_id = artists.id
GROUP BY songs.name, artists.name
ORDER BY duration_listened_hours DESC
LIMIT 10;

-- Top 10 songs by number of plays
SELECT songs.name, artists.name, COUNT(*) play_count
FROM listens
JOIN songs ON listens.song_id = songs.id
JOIN artists ON songs.artist_id = artists.id
GROUP BY songs.name, artists.name
ORDER BY play_count DESC
LIMIT 10;

-- Top 10 Skipped songs, and its rate of being skipped
WITH song_skips AS (
  SELECT songs.name, COUNT(*) FILTER (WHERE skipped) AS skips, COUNT(*) AS total_plays
  FROM listens
  JOIN songs ON listens.song_id = songs.id
  GROUP BY songs.name
)
SELECT name, skips, skips / CAST(total_plays AS FLOAT) AS skip_rate
FROM song_skips
ORDER BY skips DESC, total_plays DESC
LIMIT 10;

-- Top 5 Songs of my Top 10 Artists
WITH summary AS
(
    SELECT songs.name AS song_name, artists.name AS artist_name, SUM(ms_played) as playtime
    FROM listens
    JOIN artists ON listens.artist_id = artists.id
    JOIN songs ON listens.song_id = songs.id
    GROUP BY songs.name, artists.name
)

SELECT artist_name, song_name, playtime
FROM
(
    SELECT summary.*, ROW_NUMBER() OVER (PARTITION BY artist_name ORDER BY playtime DESC) AS rank
    FROM summary
) summary
WHERE rank <= 5
    AND artist_name IN 
    (
        SELECT artists.name
        FROM listens
        JOIN artists ON listens.artist_id = artists.id
        GROUP BY artists.name
        ORDER BY (SUM(ms_played) / 1000 / 60 / 60) DESC
        LIMIT 10
    );

-- Top 10 in my Liked Songs, Longest Playtime
SELECT songs.name, (SUM(ms_played) / 1000 / 60 / 60) AS playtime_hours FROM listens
JOIN songs ON listens.song_id = songs.id
WHERE song_id IN (SELECT song_id FROM liked_songs)
GROUP BY songs.id
ORDER BY playtime_hours DESC
LIMIT 10;

-- Top 10 in my Liked Songs, Most Plays
SELECT songs.name, COUNT(*) FROM listens
JOIN songs ON listens.song_id = songs.id
WHERE song_id IN (SELECT song_id FROM liked_songs)
GROUP BY songs.id
ORDER BY COUNT(*) DESC
LIMIT 10;

-- SPOTIFY WRAPPED
-- Duration of listening in days Grouped by year
SELECT date_part('year', ts) AS Year, (SUM(ms_played) / 1000 / 60 / 60 / 24) AS duration_listened_days
FROM listens
GROUP BY Year
ORDER BY YEAR DESC;

SELECT date_part('year', ts) AS year, date_part('month', ts) AS month, (SUM(ms_played) / 1000 / 60 / 24) AS duration_listened_hours
FROM listens
GROUP BY year, month
ORDER BY duration_listened_hours DESC
LIMIT 10;