CREATE DATABASE lab7;

CREATE TABLE countries(
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(25),
    capital VARCHAR(30)
);

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE ,
    budget INTEGER,
    country_id INTEGER REFERENCES countries
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR (50),
    Last_name VARCHAR(50),
    email VARCHAR (50),
    phone_number VARCHAR (20),
    salary INTEGER,
    department_id INTEGER REFERENCES departments
);

INSERT INTO countries (country_name, capital) VALUES
    ('USA', 'Washington D.C.'),
    ('Canada', 'Ottawa'),
    ('Mexico', 'Mexico City'),
    ('Germany', 'Berlin'),
    ('France', 'Paris');

INSERT INTO departments (department_name, budget, country_id) VALUES
    ('Sales', 500000, 1),
    ('Engineering', 1200000, 2),
    ('HR', 300000, 3),
    ('Marketing', 400000, 4),
    ('Finance', 700000, 5);

    INSERT INTO employees (first_name, last_name, email, phone_number, salary, department_id) VALUES
        ('John', 'Doe', 'johndoe@example.com', '123-456-7890', 60000, 1),
        ('Jane', 'Smith', 'janesmith@example.com', '234-567-8901', 80000, 2),
        ('Carlos', 'Garcia', 'cgarcia@example.com', '345-678-9012', 50000, 3),
        ('Marie', 'Curie', 'mcurie@example.com', '456-789-0123', 75000, 4),
        ('Albert', 'Einstein', 'aeinstein@example.com', '567-890-1234', 90000, 5),
        ('Emily', 'Clark', 'eclark@example.com', '678-901-2345', 65000, 1),
        ('Michael', 'Johnson', 'mjohnson@example.com', '789-012-3456', 72000, 2),
        ('Anna', 'Schmidt', 'aschmidt@example.com', '890-123-4567', 54000, 3),
        ('Robert', 'Brown', 'rbrown@example.com', '901-234-5678', 80000, 4),
        ('Julia', 'Taylor', 'jtaylor@example.com', '012-345-6789', 62000, 5);

UPDATE employees SET salary = 160000 WHERE first_name = 'Jane'AND last_name = 'Smith';

--1
CREATE INDEX idx_countries_name ON countries(country_name);

SELECT * FROM countries WHERE country_name = 'USA';
--2
CREATE INDEX idx_employees_firstname_lastname ON employees(first_name, last_name);

SELECT * FROM employees WHERE first_name = 'Jane' AND last_name = 'Smith';
--3
CREATE UNIQUE INDEX idx_employees_salary ON employees(salary);

SELECT * FROM employees WHERE salary < 100000 AND salary > 80000;
--4
CREATE INDEX idx_employees_substring ON employees (substring(first_name FROM 1 FOR 4));

SELECT * FROM employees WHERE substring(first_name FROM 1 FOR 4) = 'Jane';
--5
CREATE INDEX idx_employees_departments_salary_budget ON employees(department_id,salary);
CREATE INDEX idx_departments_budget ON departments(budget);

SELECT * FROM employees AS e JOIN departments AS d ON e.department_id = d.department_id WHERE d.budget > 120000 AND e.salary < 54000;

