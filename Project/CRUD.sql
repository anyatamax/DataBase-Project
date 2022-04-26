--ого, новая песня вышла, пока я писала БД
UPDATE Songs.musician SET songs_number = 181 WHERE musician_name = 'ЛСП';

--не понравился клип
DELETE FROM Songs.songs_music_video WHERE song_id = 1;

--вставим другой
INSERT INTO Songs.songs_music_video (song_id, reference, descriptions)
VALUES (14, 'https://www.youtube.com/watch?v=GRvRIS--JRo', '***
http://facebook.com/miron.official
http://twitter.com/norimyxxxo');

--поменялся топ на 5 месте
UPDATE Songs.TOP_charts SET song_id = 19, comments_about_song = 'Эта песня не сравниться ни с чем другим. Вокал и музыкальный стиль новозеландки Эллы Марии Лани Йелич-О’Коннор просто восхитителен! Сам факт, что этот дебютный сингл принес певице Грэмми в возрасте 16-ти лет просто будоражит. Песня была выпущена в далеком 2013 году, но ее слушают и по сей день. И ведь даже не скажешь, что это было так давно, исполнение очень свежо и красиво. Дать послушать эту песню человеку, кто не знаком с творчеством Lorde, он и в жизни не скажет, что эта песня была исполнена 9 лет назад (о боже целых 9, это так давно)!! Смысл песни тоже очень глубокий, просто вслушайтесь и проникнитесь той идей, что доносит нам певица Lorde за эти 3,5 минуты. Я в восторге! (от Полины) ' WHERE place_song = 5;

--удалим бывший топ-1
DELETE FROM Songs.TOP_charts WHERE place_song = 1;

--добавим топ-1
INSERT INTO Songs.TOP_charts (song_id, place_song, comments_about_song)
VALUES (13, 1, 'во всех песнях ЛСП есть смысл,как не в каких группах,ему много лет,а он до сих пор идеален');

--посмотрим на топ песен
SELECT place_song, song_name FROM Songs.TOP_charts inner join Songs.song s on s.song_id = top_charts.song_id ORDER BY place_song;

--новая информация об исполнителе
UPDATE Songs.musician SET descriptions = 'Певица Монеточка (настоящее имя – Лиза Гырдымова) стала популярной всего за несколько дней, и все благодаря социальным сетям, где она публиковала свои песни. На тот момент она оканчивала школу, сейчас же из сетевой звезды из сотни подобных она превратилась в серьезную исполнительницу. Ее жанр можно охарактеризовать как антифолк или поп-рок.' WHERE musician_name = 'Монеточка';

--не актуальный клип
DELETE FROM Songs.songs_music_video WHERE song_id = 13;

--посмотрим на все песни
SELECT DISTINCT song_name, g.genre_name, m.musician_name  FROM Songs.song INNER JOIN Songs.genre g on g.genre_id = song.genre_id INNER JOIN Songs.ID_keys_musician Ikm on song.song_id = Ikm.song_id INNER JOIN Songs.Musician M on Ikm.musician_id = M.musician_id;
