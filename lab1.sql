CREATE DATABASE lab1;

CREATE TABLE users(
    id SERIAL,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);

ALTER TABLE users ADD isadmin INT;

ALTER TABLE users ALTER COLUMN isadmin SET DATA TYPE BOOLEAN USING isadmin = 1;

ALTER TABLE users ALTER COLUMN isadmin SET DEFAULT false;

ALTER TABLE users ADD PRIMARY KEY(id);

CREATE TABLE tasks(
    id SERIAL,
    name VARCHAR(50),
    user_id INT
);

INSERT INTO users ( firstname, lastname) VALUES ('Timur', 'Kharitonov');

DROP TABLE tasks;
DROP DATABASE lab1;


