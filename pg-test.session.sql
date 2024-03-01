CREATE TABLE cats (
    name varchar(200),
    age int,
    color varchar(200),
    favouriteFood text
);

INSERT INTO cats (name, age, color, favouriteFood) VALUES ('Murzik', 5, 'black', '[]')
/*
Імпорт з файлу
\COPY cats FROM '/tmp/cats.csv' DELIMITER ',' CSV HEADER;

Використання папки /tmp дозволяє серверу читати вміст файла для імпорта

Еспорт до файлу
\COPY movies TO '/tmp/movies.csv' DELIMITER ',' CSV HEADER;


*/


--- ДАМП БД - повний бекап, необхідний для відтворення аналогічної структури та даних в іншому місці або у випадку пошкодження початкової БД

--pfm_2023_practice

/*
Створення дампа - утіліта pg_dump

Правцювати вона може тільки від імені користувача postgres в системі
А цей користувач має доступ до запису\копіюванню даних тільки в папці /tmp

pg_dump -d pfm_2023_practice -f '/tmp/pgDUMP.sql'