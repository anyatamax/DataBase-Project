--Вывести количество песен в медиатеке для каждого музыканта, у которого больше 1 песни
SELECT musician_name, COUNT(song_id)
FROM Songs.song
         INNER JOIN Songs.id_keys_musician using (song_id)
         INNER JOIN Songs.musician using (musician_id)
GROUP BY musician_name
HAVING COUNT(song_id) > 1;

--Вывести топ песен по порядку
SELECT place_song, song_name
FROM Songs.TOP_charts
         INNER JOIN Songs.Song USING (song_id)
ORDER BY place_song;

--Вывести самый популярный жанр и количество песен, соответствующее ему
with genre_count as (
    SELECT genre_name as name, COUNT(genre_id) as c
    FROM Songs.Song
             INNER JOIN Songs.genre using (genre_id)
    GROUP BY genre_name
)
SELECT genre_count.name, genre_count.c
FROM genre_count
where genre_count.c = (SELECT MAX(c) from genre_count);

--Вывести среднее время песни для каждого жанра
SELECT song_name, song_time, year, genre_name, AVG(song_time) OVER (PARTITION BY genre_id) as avg_time
FROM Songs.Song
         INNER JOIN Songs.genre using (genre_id);

--Пронумеровать песни по возрастанию года, в пределах каждой страны
SELECT song_name, country, ROW_NUMBER() OVER (PARTITION BY country ORDER BY year)
FROM Songs.song;

--Вывести для каждого музыканта его песни, соответствующие альбомы и количество песен, которые есть в данной таблице из этого альбома
SELECT DISTINCT musician_name,
                album_name,
                COUNT(album_name) OVER (PARTITION BY album_name, musician_name) as cnt_current_songs_in_album
FROM Songs.musician
         INNER JOIN Songs.ID_keys_musician USING (musician_id)
         INNER JOIN Songs.Song USING (song_id)
         INNER JOIN Songs.album USING (album_id);
