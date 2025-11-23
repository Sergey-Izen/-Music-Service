-- 1. Таблица жанров
CREATE TABLE Жанры (
    id_Жанра SERIAL PRIMARY KEY,
    Название VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Таблица исполнителей 
CREATE TABLE Исполнитель (
    id_Исполнителя SERIAL PRIMARY KEY,
    Имя VARCHAR(100) NOT NULL
);

-- 3. Таблица альбомов
CREATE TABLE Альбомы (
    id_Альбома SERIAL PRIMARY KEY,
    Название VARCHAR(100) NOT NULL,
    Год_выпуска INT
);

-- 4. Связь многие-ко-многим: жанры и исполнители
CREATE TABLE ЖанрыИсполнитель (
    id_Жанра INT NOT NULL,
    id_Исполнителя INT NOT NULL,
    PRIMARY KEY (id_Жанра, id_Исполнителя),
    FOREIGN KEY (id_Жанра) REFERENCES Жанры(id_Жанра) ON DELETE CASCADE,
    FOREIGN KEY (id_Исполнителя) REFERENCES Исполнитель(id_Исполнителя) ON DELETE CASCADE
);

-- 5. Связь многие-ко-многим: исполнители и альбомы
CREATE TABLE Исполнительальбом (
    id_Исполнителя INT NOT NULL,
    id_Альбома INT NOT NULL,
    PRIMARY KEY (id_Исполнителя, id_Альбома),
    FOREIGN KEY (id_Исполнителя) REFERENCES Исполнитель(id_Исполнителя) ON DELETE CASCADE,
    FOREIGN KEY (id_Альбома) REFERENCES Альбомы(id_Альбома) ON DELETE CASCADE
);

-- 6. Таблица треков (связь один-ко-многим с альбомами)
CREATE TABLE Треки (
    id_Трека SERIAL PRIMARY KEY,
    Название VARCHAR(100) NOT NULL,
    Длительность INT NOT NULL,
    id_Альбома INT NOT NULL,
    FOREIGN KEY (id_Альбома) REFERENCES Альбомы(id_Альбома) ON DELETE CASCADE
);

-- 7. Таблица сборников
CREATE TABLE Сборник (
    id_Сборника SERIAL PRIMARY KEY,
    Название VARCHAR(100) NOT NULL,
    Год_выпуска INT
);

-- 8. Связь многие-ко-многим: треки и сборники
CREATE TABLE Трексборник (
    id_Трека INT NOT NULL,
    id_Сборника INT NOT NULL,
    PRIMARY KEY (id_Трека, id_Сборника),
    FOREIGN KEY (id_Трека) REFERENCES Треки(id_Трека) ON DELETE CASCADE,
    FOREIGN KEY (id_Сборника) REFERENCES Сборник(id_Сборника) ON DELETE CASCADE
);