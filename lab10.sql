CREATE DATABASE lab10;

CREATE TABLE books(
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    price DECIMAL(10,3),
    quantity INT
);

CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    book_id INT,
    customer_id INT,
    order_name INT,
    quantity INT,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

ALTER TABLE orders
ALTER COLUMN order_name TYPE VARCHAR(255);


CREATE TABLE customers(
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
);

INSERT INTO books(book_id, title, author, price, quantity)
VALUES (1,'Database 101','A.Smith', 40.000,10),
        (2, 'Learn SQL', 'B. Johnson', 35.00, 15),
        (3, 'Advanced DB', 'C. Lee', 50.00, 5);

INSERT INTO customers(customer_id, name, email)
VALUES (101,'John Doe','johndoe@gmail.com' ),
       (102, 'Jane Doe', 'janedoe@mail.ru');

--1
BEGIN TRANSACTION;
INSERT INTO orders(order_id, book_id, customer_id, order_name, quantity)
VALUES (1,1,101,'bbqq',2);

UPDATE books SET quantity = quantity - 2 WHERE book_id = 1;
COMMIT;

--2
BEGIN;

DO $$
DECLARE
    available_quantity INT;
BEGIN
    SELECT quantity INTO available_quantity FROM Books WHERE book_id = 3;

    IF available_quantity < 10 THEN
        RAISE NOTICE 'ERROR404';
        ROLLBACK;
    ELSE
        INSERT INTO Orders (order_id, book_id, customer_id, order_name, quantity)
        VALUES (3, 102, CURRENT_DATE, 10);

        UPDATE Books
        SET quantity = quantity - 10
        WHERE book_id = 3;

        COMMIT;
    END IF;
END $$;



--3.1
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

UPDATE Books
SET price = 55.00
WHERE book_id = 3;

--3.2
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT price FROM Books WHERE book_id = 3;

COMMIT;
SELECT price FROM Books WHERE book_id = 3;

--4
BEGIN;
UPDATE customers
SET email = 'aboba52228336@gmail.com'
WHERE customer_id = 101;

COMMIT;

SELECT customer_id, email
FROM customers
WHERE customer_id = 101;