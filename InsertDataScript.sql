--жанры
INSERT INTO genres (name) VALUES ('Grunge');
INSERT INTO genres (name) VALUES ('индастриал-метал');
INSERT INTO genres (name) VALUES ('русский рок');
INSERT INTO genres (name) VALUES ('панк');
INSERT INTO genres (name) VALUES ('Rock-n-Roll');
INSERT INTO genres (name) VALUES ('Art-Rock');
INSERT INTO genres (name) VALUES ('Neue Deutsche Härte');

--исполнители
INSERT INTO artists (name) VALUES ('Rammstein');
INSERT INTO artists (name) VALUES ('Nirvana');
INSERT INTO artists (name) VALUES ('Кино');
INSERT INTO artists (name) VALUES ('Король и Шут');
INSERT INTO artists (name) VALUES ('The Beatles');
INSERT INTO artists (name) VALUES ('Radiohead');
INSERT INTO artists (name) VALUES ('Oomph!');

--связь исполнителей и жанров
INSERT INTO artistgenres (artistid, genreid) VALUES (1, 2);
INSERT INTO artistgenres (artistid, genreid) VALUES (1, 7);
INSERT INTO artistgenres (artistid, genreid) VALUES (2, 1);
INSERT INTO artistgenres (artistid, genreid) VALUES (3, 3);
INSERT INTO artistgenres (artistid, genreid) VALUES (4, 4);
INSERT INTO artistgenres (artistid, genreid) VALUES (5, 5);
INSERT INTO artistgenres (artistid, genreid) VALUES (6, 6);
INSERT INTO artistgenres (artistid, genreid) VALUES (7, 7);

--альбомы
INSERT INTO albums (name, "Year") VALUES ('Zeit', 2022);
INSERT INTO albums (name, "Year") VALUES ('Rammstein', 2019);
INSERT INTO albums (name, "Year") VALUES ('Nevermind', 1991);
INSERT INTO albums (name, "Year") VALUES ('Черный альбом', 1990);
INSERT INTO albums (name, "Year") VALUES ('The Beatles (10th White album)', 1968);
INSERT INTO albums (name, "Year") VALUES ('My iron lung', 1994);

--связь альбомов и исполнителей
INSERT INTO artistalbums (artistid, albumid) VALUES (1, 1);
INSERT INTO artistalbums (artistid, albumid) VALUES (1, 2);
INSERT INTO artistalbums (artistid, albumid) VALUES (2, 3);
INSERT INTO artistalbums (artistid, albumid) VALUES (3, 4);
INSERT INTO artistalbums (artistid, albumid) VALUES (5, 5);
INSERT INTO artistalbums (artistid, albumid) VALUES (6, 6);

--музыкальные композиции
INSERT INTO songs (name, duration, albumid) VALUES ('Angst', '00:03:45', 1);
INSERT INTO songs (name, duration, albumid) VALUES ('Zeit', '00:05:22', 1);
INSERT INTO songs (name, duration, albumid) VALUES ('Armee Der Tristen', '00:03:26', 1);
INSERT INTO songs (name, duration, albumid) VALUES ('Deutschland', '00:05:22', 2);
INSERT INTO songs (name, duration, albumid) VALUES ('Puppe', '00:04:33', 2);
INSERT INTO songs (name, duration, albumid) VALUES ('Was ich liebe', '00:04:29', 2);
INSERT INTO songs (name, duration, albumid) VALUES ('Smells like teen spirit', '00:05:01', 3);
INSERT INTO songs (name, duration, albumid) VALUES ('Polly', '00:02:54', 3);
INSERT INTO songs (name, duration, albumid) VALUES ('Come as you are', '00:03:39', 3);
INSERT INTO songs (name, duration, albumid) VALUES ('While my guitar gently weeps', '00:04:44', 5);
INSERT INTO songs (name, duration, albumid) VALUES ('My iron lung', '00:04:36', 6);
INSERT INTO songs (name, duration, albumid) VALUES ('Creep (acoustic version)', '00:04:19', 6);

--сборники
INSERT INTO collections (name, "Year") VALUES ('Rammstein best songs', 2023);
INSERT INTO collections (name, "Year") VALUES ('На все времена', 2018);
INSERT INTO collections (name, "Year") VALUES ('Британский рок', 2019);
INSERT INTO collections (name, "Year") VALUES ('Collection 1', 2017);

--связь сборников и песен
INSERT INTO songsincollections (songid, collectionid) VALUES (1, 1);
INSERT INTO songsincollections (songid, collectionid) VALUES (2, 1);
INSERT INTO songsincollections (songid, collectionid) VALUES (4, 1);
INSERT INTO songsincollections (songid, collectionid) VALUES (6, 1);
INSERT INTO songsincollections (songid, collectionid) VALUES (4, 2);
INSERT INTO songsincollections (songid, collectionid) VALUES (2, 2);
INSERT INTO songsincollections (songid, collectionid) VALUES (7, 2);
INSERT INTO songsincollections (songid, collectionid) VALUES (10, 2);
INSERT INTO songsincollections (songid, collectionid) VALUES (12, 2);
INSERT INTO songsincollections (songid, collectionid) VALUES (12, 3);
INSERT INTO songsincollections (songid, collectionid) VALUES (11, 3);
INSERT INTO songsincollections (songid, collectionid) VALUES (10, 3);
INSERT INTO songsincollections (songid, collectionid) VALUES (8, 4);
INSERT INTO songsincollections (songid, collectionid) VALUES (9, 4);