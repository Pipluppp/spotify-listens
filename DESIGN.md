# Design Document

By Duncan Bandojo

Video overview: TODO

## Scope

The Spotify streaming history database includes the Listening History of the user which allows: the processing of what songs, albums, and artists the user had listened. the duration and frequency of playing songs; stcross the existence of their Spotify account. relating the number of plays, hours listened to, and  process of tracking student progress and leaving feedback on student work.
As such, included in the database's scope is:

* Listens, which includes each play of a song together with its timestamp, duration, song name, artist, album, etc.
* Songs, the names of the songs listened to
* Artists, the names of the artists listened to
* Albums, the names of the albums listened to
* Songs Albums, including the songs part of an album
* Liked Songs, includes all the songs that are liked by the user
* Followed Artists, includes all the artists followed by the user

The database structure of the Spotify Listening history assumes:
* Artists can have multiple songs; but songs can only have a single artist
* Artists can have multiple albums; but albums can only have a single artist
* Songs can be part of multiple albums


## Functional Requirements

This database:

* Performs CRUD operations for songs, artists, albums, listens, followed artists, and liked songs
* Tracks all the plays or listens of the user


## Representation

Entities are captured in PostgreSQL tables with the following schema.

### Entities

The database includes the following entities:

#### Songs

The `songs` table includes:

* `id`, which specifies the unique ID for the student as `SERIAL`. This column thus has the `PRIMARY KEY` constraint applied.
* `name`, which specifies the song's name as `VARCHAR(255)` to store text
* `artist_id`, which is the ID of the artist, which is a foreign key to `id` of the `artists` table defined as `INT`

#### Artists

The `artists` table includes:

* `id`, which specifies the unique ID for the artis as a `SERIAL`. This column thus has the `PRIMARY KEY` constraint applied.
* `name`, which specifies the name of the artis as `VARCHAR(255)` to store text


#### Albums

The `albums` table includes:

* `id`, which specifies the unique ID for the album as a `SERIAL`. This column thus has the `PRIMARY KEY` constraint applied.
* `name`, which is the name of the album set as `VARCHAR(255)`
* `artist_id`, which is the ID of the artist, which is a foreign key to `id` of the `artists` table defined as `INT`


#### Listens

The `listens` table lists out all the *plays* by the user, it includes

* `id`, which specifies the unique ID as a `SERIAL`. This column thus has the `PRIMARY KEY` constraint applied.
* `ts`, which is the timestamp of when the song play had ended. This has type `TIMESTAMP` to record the exact year, month, day, hour, minute, second mark
* `song_id`, which is the ID of the song, a foreign key to the `id` of the `songs` table defined as `INT`
* `artist_id`, which is the ID of the artist, which is a foreign key to `id` of the `artists` table defined as `INT`
* `album_id`, which is the ID of the album, a foreign key to the `id` of the `albums` table defined as `INT`
* `ms_played`, which is the duration on milliseconds of the song played, defined with the type `INT`
* `reason_start`, which is the reason as the why the song had played, defined with the type `VARCHAR(255)`
* `reason_end`, which is the reason as the why the song had ended, defined with the type `VARCHAR(255)`
* `shuffle`, which is defined as a `BOOELAN` type denoting if the song played from shuffle
* `skipped`, which is defined as a `BOOELAN` type denoting if the song had been skipped


#### Songs Albums

The `songs_albums` table includes:

* `id`, which specifies the unique ID for the relation as a `SERIAL`. This column thus has the `PRIMARY KEY` constraint applied.
* `song_id`, which is the ID of the song, a foreign key to the `id` of the `songs` table defined as `INT`
* `album_id`, which is the ID of the album, a foreign key to the `id` of the `albums` table defined as `INT`


#### Liked Songs

The `liked_songs` table includes:

* `id`, which specifies the unique ID for the submission as `SERIAL`. This column thus has the `PRIMARY KEY` constraint applied.
* `song_id`, which is the ID of the song, a foreign key to the `id` of the `songs` table defined as `INT`


#### Followed Artists

The `followed_artists` table includes:

* `id`, which specifies the unique ID for the submission as `SERIAL`. This column thus has the `PRIMARY KEY` constraint applied.

* `song_id`, which is the ID of the song, a foreign key to the `id` of the `songs` table defined as `INT`


### Relationships: TODO

The below entity relationship diagram describes the relationships among the entities in the database.

![ER Diagram](TODO.png)

As detailed by the diagram:

* A song is associated with one and only one artist. But, an artist can have many songs related to them
* A song can be part of many albums, and albums can also be associated with many songs
* An album is associated with one and only one artist But, an artist can have many artists related to them

## Optimizations: TODO

Per the typical queries in `queries.sql`, it is common for users of the database to access the song names, album names, and artist names. Hence, indexes are created on the `songs.name`, `artists.name`, and `albums.name` columns to speed up the identification of the names by those columns.

Similarly, it is also common practice for a user of the database to concerned with viewing all students who submitted work to a particular problem. As such, an index is created on the `name` column in the `problems` table to speed the identification of problems by name.

## Limitations

It's commonplace for songs and albums to have many artists associated to them, but we assume here that a song and album can onl have a single artist to it