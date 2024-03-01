CREATE TABLE cats (
    name varchar(200),
    age int,
    color varchar(200),
    favouriteFood text
);

/*
Імпорт з файлу
\COPY cats FROM '/tmp/cats.csv' DELIMITER ',' CSV HEADER;

Використання папки /tmp дозволяє серверу читати вміст файла для імпорта

Еспорт до файлу
\COPY movies TO '/tmp/movies.csv' DELIMITER ',' CSV HEADER;


*/