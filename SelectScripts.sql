--ЗАДАНИЕ 2
--1. Название и продолжительность самого длительного трека.
SELECT 
	name,
	duration
FROM songs
WHERE duration = (SELECT max(duration) FROM songs);

--2. Название треков, продолжительность которых не менее 3,5 минут.
SELECT 
	name
FROM songs
WHERE duration >= 3.5;

--3. Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT 
	name
FROM collections
WHERE "Year" BETWEEN 2018 AND 2020;

--4. Исполнители, чьё имя состоит из одного слова.
SELECT 
	name
FROM artists
WHERE length(name) - length(replace(name, ' ', '')) = 0;

--5. Название треков, которые содержат слово «мой» или «my».
SELECT 
	name
FROM songs
WHERE lower(name) LIKE '%my%' OR lower(name) LIKE '%мой%';


--ЗАДАНИЕ 3
--1. Количество исполнителей в каждом жанре.
--Вариант 1 с подзапросом
SELECT 
	name,
	(SELECT  
		count(*) 
	FROM artistgenres ag 
	WHERE g.id = ag.genreid) AS count
FROM genres g;

--Вариант 2 с соединением
SELECT 
	name,
	count(ag.*)
FROM genres g
LEFT JOIN artistgenres ag ON g.id = ag.genreid
GROUP BY name;

--2. Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT
	a.name,
	count(s.*)
FROM albums a
LEFT JOIN songs s ON s.albumid = a.id
WHERE a."Year" BETWEEN 2019 AND 2020
GROUP BY a.name;

--3. Средняя продолжительность треков по каждому альбому.
SELECT
	a.name,
	avg(s.duration)
FROM albums a
LEFT JOIN songs s ON s.albumid = a.id
GROUP BY a.name;

--4. Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT
	art.name
FROM artists art
WHERE 2020 NOT IN
(
	SELECT 
		"Year" 
	FROM albums alb 
	INNER JOIN artistalbums artalb ON artalb.albumid = alb.id
	WHERE art.id = artalb.artistid
);

--5. Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT
	c.name
FROM collections c
WHERE 'Rammstein' IN
(
	SELECT 
		art.name 
	FROM songsincollections sic
	INNER JOIN songs s ON sic.songid = s.id
	INNER JOIN albums alb ON s.albumid = alb.id
	INNER JOIN artistalbums artalb ON artalb.albumid = alb.id
	INNER JOIN artists art ON artalb.artistid = art.id
	WHERE c.id = sic.collectionid
);

--ЗАДАНИЕ 4
--1. Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT
	alb.name
FROM albums alb
INNER JOIN artistalbums artalb ON artalb.albumid = alb.id
INNER JOIN artists art ON art.id = artalb.artistid
WHERE 1 < 
(
	SELECT 
		count(*)
	FROM artistgenres ag
	INNER JOIN genres g ON ag.genreid = g.id
	WHERE art.id = ag.artistid
);

--2. Наименования треков, которые не входят в сборники.
SELECT 
	name
FROM songs s 
LEFT JOIN songsincollections sic ON s.id = sic.songid 
WHERE sic.collectionid IS NULL;

--3. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT
	art.name
FROM songs s
INNER JOIN albums alb ON alb.id = s.albumid
INNER JOIN artistalbums artalb ON alb.id = artalb.albumid
INNER JOIN artists art ON art.id = artalb.artistid
WHERE s.duration = (SELECT min(smin.duration) FROM songs smin)

--4. Названия альбомов, содержащих наименьшее количество треков.
WITH res AS
(
	SELECT 
		a.name,
		count(s.*)
	FROM albums a 
	INNER JOIN songs s ON s.albumid = a.id
	GROUP BY a.name
)
SELECT 
	res.name
FROM res
WHERE res.count = (SELECT min(res.count) FROM res);