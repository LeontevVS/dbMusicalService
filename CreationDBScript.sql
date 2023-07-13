--отделы
CREATE TABLE IF NOT EXISTS Departments (
	Id SERIAL PRIMARY KEY,
	Name VARCHAR(70) NOT NULL
);

--сотрудники
--стоило бы начальника вынести в таблицу отделов, но так как по заданию таблица должна ссылаться на себя, сделал как требуется в задании
CREATE TABLE IF NOT EXISTS Staff (
	Id SERIAL PRIMARY KEY,
	Name VARCHAR(70) NOT NULL,
	DepartmentId INTEGER NOT NULL,
	ChiefId INTEGER NOT NULL,
	CONSTRAINT fk_Department FOREIGN KEY (DepartmentId) REFERENCES Departments(Id) ON DELETE CASCADE,
	CONSTRAINT fk_Chief FOREIGN KEY (ChiefId) REFERENCES Staff(Id) ON DELETE CASCADE
);

--жанры
CREATE TABLE IF NOT EXISTS Genres (
	Id SERIAL PRIMARY KEY,
	Name VARCHAR(70) NOT NULL
);

--музыканты
CREATE TABLE IF NOT EXISTS Artists (
	Id SERIAL PRIMARY KEY,
	Name VARCHAR(70) NOT NULL
);

--связи артистов и жанров
CREATE TABLE IF NOT EXISTS ArtistGenres (
	ArtistId INTEGER,
	GenreId INTEGER,
	CONSTRAINT pk_ArtistGenre PRIMARY KEY (ArtistId, GenreId),
	CONSTRAINT fk_Artist FOREIGN KEY (ArtistId) REFERENCES Artists(Id) ON DELETE CASCADE,
	CONSTRAINT fk_Genre FOREIGN KEY (GenreId) REFERENCES Genres(Id) ON DELETE CASCADE
);

--альбомы
CREATE TABLE IF NOT EXISTS Albums (
	Id SERIAL PRIMARY KEY,
	Name VARCHAR(70) NOT NULL,
	"Year" INT NOT NULL
);

--связи артистов и альбомов
CREATE TABLE IF NOT EXISTS ArtistAlbums (
	ArtistId INTEGER,
	AlbumId INTEGER,
	CONSTRAINT pk_ArtistsAlbums PRIMARY KEY (ArtistId, AlbumId),
	CONSTRAINT fk_Artist FOREIGN KEY (ArtistId) REFERENCES Artists(Id) ON DELETE CASCADE,
	CONSTRAINT fk_Album FOREIGN KEY (AlbumId) REFERENCES Albums(Id) ON DELETE CASCADE
);

--музыкальные произведения
CREATE TABLE IF NOT EXISTS Songs (
	Id SERIAL PRIMARY KEY,
	Name VARCHAR(70) NOT NULL,
	Duration TIME  NOT NULL,
	AlbumId INTEGER NOT NULL,
	CONSTRAINT fk_Album FOREIGN KEY (AlbumId) REFERENCES Albums(Id) ON DELETE CASCADE
);

--сборники песен
CREATE TABLE IF NOT EXISTS Collections (
	Id SERIAL PRIMARY KEY,
	Name VARCHAR(70) NOT NULL,
	"Year" INTEGER NOT NULL
);

--связь сборников с песнями
CREATE TABLE IF NOT EXISTS SongsInCollections (
	Id SERIAL PRIMARY KEY,
	SongId INTEGER NOT NULL,
	CollectionId INTEGER NOT NULL,
	CONSTRAINT fk_Song FOREIGN KEY (SongId) REFERENCES Songs(Id) ON DELETE CASCADE,
	CONSTRAINT fk_Collection FOREIGN KEY (CollectionId) REFERENCES Collections(Id) ON DELETE CASCADE
);