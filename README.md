# spotify-listens

Project for [CS50’s Introduction to Databases with SQL](https://cs50.harvard.edu/sql/2023/). PostgreSQL database to store my Spotify Extended streaming history exported data, and some queries a la Spotify Wrapped:
- `schema.sql` contains the tables
- `queries.sql` contains some common queries on Spotify data

## Queries

Spotify streaming history mostly from the years 2020-2023 (and a bit from the years 2014-2019)

### Top 10 Songs by Playtime (in hours)

| name                                                                   | name           | duration_listened_hours | 
|------------------------------------------------------------------------|----------------|-------------------------| 
| Miroirs: III. Une barque sur l'océan                                   | Maurice Ravel  | 133                     | 
| Doria - Island Songs VII                                               | Ólafur Arnalds | 127                     | 
| Ballade slave, L. 70                                                   | Claude Debussy | 119                     | 
| Années de pèlerinage III, S. 163: IV. Les jeux d'eau à la Villa d'Este | Franz Liszt    | 105                     | 
| Estampes, L. 100: I. Pagodes. Modérément animé                         | Claude Debussy | 78                      | 
| Gymnopédie No. 1                                                       | Erik Satie     | 70                      | 
| Rêverie, L. 68                                                         | Claude Debussy | 56                      | 
| Préludes / Book 1, L.117: 8. La fille aux cheveux de lin               | Claude Debussy | 43                      | 
| 1/1 - Remastered 2004                                                  | Brian Eno      | 38                      | 
| No. 3, Clair de lune                                                   | Claude Debussy | 36                      | 


### Top 10 Artists by Playtime (in hours)

| name             | play_time_hours | 
|------------------|-----------------| 
| Claude Debussy   | 519             | 
| HYUKOH           | 167             | 
| Maurice Ravel    | 146             | 
| Ólafur Arnalds   | 134             | 
| Ichiko Aoba      | 129             | 
| h hunt           | 124             | 
| Erik Satie       | 120             | 
| Ryuichi Sakamoto | 113             | 
| Franz Liszt      | 110             | 
| Arcade Fire      | 105             | 


### Top 10 Albums by Playtime (in hours)

| album_name                                                  | artist_name      | playtime_hours | 
|-------------------------------------------------------------|------------------|----------------| 
| Debussy: Estampes; Pour le piano; 6 épigraphes antiques     | Claude Debussy   | 202            | 
| Ravel: Miroirs, Jeux D'Eau, Pavane Pour Une Infante Défunte | Maurice Ravel    | 142            | 
| Island Songs                                                | Ólafur Arnalds   | 128            | 
| Playing Piano for Dad                                       | h hunt           | 124            | 
| The Essential Piano Collection: Top 50                      | Franz Liszt      | 105            | 
| Her (Original Score)                                        | Arcade Fire      | 98             | 
| Wolf Children (Original Motion Picture Soundtrack)          | Masakatsu Takagi | 89             | 
| 琹の葉                                                         | Ironomi          | 88             | 
| Music for Museum Gift Shops                                 | Lullatone        | 86             | 
| Debussy: Préludes Book 1; Estampes                          | Claude Debussy   | 79             | 

### Top 5 Songs of my Top 10 Artists (in minutes)

| artist_name      | song_name                                                                           | playtime | 
|------------------|-------------------------------------------------------------------------------------|----------| 
| Arcade Fire      | Song on the Beach                                                                   | 1002     | 
| Arcade Fire      | Dimensions                                                                          | 736      | 
| Arcade Fire      | Morning Talk / Supersymmetry                                                        | 588      | 
| Arcade Fire      | Sleepwalker                                                                         | 555      | 
| Arcade Fire      | Loneliness #3 (Night Talking)                                                       | 525      | 
| Claude Debussy   | Ballade slave, L. 70                                                                | 7171     | 
| Claude Debussy   | Estampes, L. 100: I. Pagodes. Modérément animé                                      | 4692     | 
| Claude Debussy   | Rêverie, L. 68                                                                      | 3393     | 
| Claude Debussy   | Préludes / Book 1, L.117: 8. La fille aux cheveux de lin                            | 2633     | 
| Claude Debussy   | No. 3, Clair de lune                                                                | 2201     | 
| Erik Satie       | Gymnopédie No. 1                                                                    | 4254     | 
| Erik Satie       | Je te veux                                                                          | 440      | 
| Erik Satie       | 3 Gymnopédies: No. 1, Lent et douloureux                                            | 412      | 
| Erik Satie       | Petite ouverture à danser (Ed. Caby)                                                | 410      | 
| Erik Satie       | Gnossienne No. 1                                                                    | 300      | 
| Franz Liszt      | Années de pèlerinage III, S. 163: IV. Les jeux d'eau à la Villa d'Este              | 6322     | 
| Franz Liszt      | 3 Études de Concert, S. 144: No. 3 in D-Flat Major Un sospiro                       | 237      | 
| Franz Liszt      | Un sospiro                                                                          | 17       | 
| Franz Liszt      | 6 Chants polonais, S. 480: No. 2, Frühling (Wiosna, Spring) [After Chopin's Op. 74] | 15       | 
| Franz Liszt      | Liebestraum No. 3 in A-Flat Major, S. 541 / 3                                       | 9        | 
| h hunt           | C U Soon                                                                            | 1155     | 
| h hunt           | Pêche II                                                                            | 1003     | 
| h hunt           | Having a Bath                                                                       | 853      | 
| h hunt           | Journeys                                                                            | 836      | 
| h hunt           | Go Home                                                                             | 802      | 
| HYUKOH           | New born                                                                            | 1525     | 
| HYUKOH           | Mer                                                                                 | 884      | 
| HYUKOH           | Gondry                                                                              | 560      | 
| HYUKOH           | Jesus lived in a motel room                                                         | 518      | 
| HYUKOH           | TOMBOY                                                                              | 421      | 
| Ichiko Aoba      | Akatombo - live at Milton Court, London, 2022                                       | 665      | 
| Ichiko Aoba      | Parfum d'étoiles                                                                    | 368      | 
| Ichiko Aoba      | Seabed Eden - live at Bunkamura Orchard Hall, Tokyo, 2021                           | 358      | 
| Ichiko Aoba      | Prologue                                                                            | 344      | 
| Ichiko Aoba      | Dawn in the Adan                                                                    | 299      | 
| Maurice Ravel    | Miroirs: III. Une barque sur l'océan                                                | 8037     | 
| Maurice Ravel    | Daphnis et Chloe: Part III: Lever du jour                                           | 129      | 
| Maurice Ravel    | Pavane Pour Une Infante Défunte                                                     | 82       | 
| Maurice Ravel    | Jeux D'Eau                                                                          | 65       | 
| Maurice Ravel    | Miroirs: V. La vallée des cloches                                                   | 59       | 
| Ólafur Arnalds   | Doria - Island Songs VII                                                            | 7644     | 
| Ólafur Arnalds   | 20:17                                                                               | 146      | 
| Ólafur Arnalds   | re:member                                                                           | 30       | 
| Ólafur Arnalds   | saman                                                                               | 19       | 
| Ólafur Arnalds   | Zero                                                                                | 17       | 
| Ryuichi Sakamoto | Amore                                                                               | 1463     | 
| Ryuichi Sakamoto | Merry Christmas Mr. Lawrence                                                        | 897      | 
| Ryuichi Sakamoto | 20220214                                                                            | 582      | 
| Ryuichi Sakamoto | Rain                                                                                | 492      | 
| Ryuichi Sakamoto | After Yang Main Theme - Solo                                                        | 392      | 

### Playtime of Spotify by Year (in days)

| year | duration_listened_days | 
|------|------------------------| 
| 2023 | 60                     | 
| 2022 | 60                     | 
| 2021 | 104                    | 
| 2020 | 12                     | 
| 2019 | 0                      | 
| 2018 | 6                      | 
| 2017 | 1                      | 
| 2015 | 0                      | 
| 2014 | 0                      | 
