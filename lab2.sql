CREATE DATABASE lab2; 

CREATE TABLE countries(
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100),
    region_id INT,
    population INT
);

INSERT INTO countries( country_name, region_id, population)
VALUES('China',1,1411778724);

INSERT INTO countries( country_id, country_name)
VALUES(6,'Russia');

UPDATE countries SET region_id = NULL WHERE country_name = 'Russia';

INSERT INTO countries(country_name, region_id, population)
VALUES('Japan',11,124500000),
      ('Germany',52,84270625),
      ('Mongolia',27, 2952000);

ALTER TABLE countries
ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries(region_id, population)
VALUES(13, 20159707);

INSERT INTO countries DEFAULT VALUES;

CREATE TABLE countries_new AS SELECT * FROM countries WHERE false;

INSERT INTO countries_new SELECT * FROM countries;

UPDATE countries_new SET region_id = 1 WHERE region_id IS NULL;

SELECT country_name, population * 1.10 AS "New Population" FROM countries;

DELETE FROM countries WHERE population < 100000;

DELETE FROM countries_new USING countries WHERE countries_new.country_id = countries.country_id
RETURNING *;

DELETE FROM countries
RETURNING *;





