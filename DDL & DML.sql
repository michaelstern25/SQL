--------------------- 1. Data Definition Language (DDL) -------------------------

--1. DDL -------------------------------- CREATE --------------------------------
CREATE DATABASE Company;

CREATE TABLE employee (
    id SERIAL PRIMARY KEY,         -- auto-increment id
    name VARCHAR(50) NOT NULL,     -- text column, max length 50
    age INT,                       -- integer
    department VARCHAR(50),        -- text column
    join_date DATE,                 -- date column
    salary NUMERIC(10,2),           -- number with 2 decimal places
    is_active BOOLEAN DEFAULT true -- boolean with default value
);

CREATE VIEW high_salary_employees AS
SELECT name, department, salary
FROM employee
WHERE salary > 50000;


-- 2. DML ------------------------------ Insert data into a table --------------------------------
INSERT INTO employee (emp_name, age, department, join_date, salary, is_active)
VALUES
('Arman Khan', 25, 'IT', '2024-06-15', 50000.00, true),
('John Doe', 30, 'HR', '2023-04-10', 45000.00, true),
('Sara Ali', 28, 'Finance', '2022-01-05', 60000.00, false),
('Priya Sharma', 35, 'Marketing', '2021-08-20', 55000.00, true),
('Ravi Kumar', 40, 'Sales', '2020-12-01', 70000.00, false),
('Neha Singh', 27, 'IT', '2023-09-12', 48000.00, true),
('David Lee', 32, 'Finance', '2022-11-07', 62000.00, true),
('Ananya Verma', 29, 'HR', '2021-05-18', 52000.00, false),
('Vikram Patel', 31, 'Operations', '2024-02-25', 58000.00, true),
('Emily Johnson', 26, 'Marketing', '2023-01-15', 50000.00, true);


-- 1. DDL -------------------------------- ALTER ------------------------------
ALTER TABLE employee -- CHANGE COLUMN NAME 
RENAME COLUMN name TO emp_name;

ALTER TABLE employee -- DELETE SPACIFIC COLUMN PERMANENTLY
DROP COLUMN is_active;

ALTER TABLE employee
ADD COLUMN email VARCHAR(100) UNIQUE; -- ADD NEW COLUMN

ALTER TABLE employee
ALTER COLUMN email TYPE VARCHAR(50); -- DATA TYPE CHANGE

ALTER TABLE employee
ADD CONSTRAINT unique_email UNIQUE (email); -- ADD CONSTRAINT

ALTER TABLE employee
DROP CONSTRAINT unique_email; -- DROP CONSTRAINT

ALTER TABLE employee
RENAME TO staff;  -- RENAME TABLE


-- 1. DDL -------------------------------- DROP --------------------------------
DROP TABLE IF EXISTS employee2;

DROP DATABASE IF EXISTS company2;

DROP VIEW high_salary_employees;


-- 1. DDL -------------------------------- TRUNCATE ------------------------
TRUNCATE employee RESTART IDENTITY; -- REMOVE ALL RECORDS (ROWS)


------------------------------- 2. Data Manipulation Language (DML) --------


-- 2. DML -------------------------------- UPDATE ------------------------------
UPDATE practice_data SET email = 'arman.khan@example.com' WHERE id = 1;
UPDATE practice_data SET email = 'john.doe@example.com' WHERE id = 2;
UPDATE practice_data SET email = 'sara.ali@example.com' WHERE id = 3;
UPDATE practice_data SET email = 'priya.sharma@example.com' WHERE id = 4;
UPDATE practice_data SET email = 'ravi.kumar@example.com' WHERE id = 5;
UPDATE practice_data SET email = 'neha.singh@example.com' WHERE id = 6;
UPDATE practice_data SET email = 'david.lee@example.com' WHERE id = 7;
UPDATE practice_data SET email = 'ananya.verma@example.com' WHERE id = 8;
UPDATE practice_data SET email = 'vikram.patel@example.com' WHERE id = 9;
UPDATE practice_data SET email = 'emily.johnson@example.com' WHERE id = 10;

UPDATE employee
SET email = CASE id
    WHEN 1 THEN 'arman.khan@gmail.com'
    WHEN 2 THEN 'john.doe@yahoo.com'
    WHEN 3 THEN 'sara.ali@hotmail.com'
    WHEN 4 THEN 'priya.sharma@gmail.com'
    WHEN 5 THEN 'ravi.kumar@yahoo.com'
    WHEN 6 THEN 'neha.singh@hotmail.com'
    WHEN 7 THEN 'david.lee@gmail.com'
    WHEN 8 THEN 'ananya.verma@yahoo.com'
    WHEN 9 THEN 'vikram.patel@hotmail.com'
    WHEN 10 THEN 'emily.johnson@gmail.com'
END
WHERE id BETWEEN 1 AND 10;

UPDATE employee SET salary = 75000 WHERE age>= 40;

UPDATE employee SET department="HR", salary=60000 WHERE emp_name = "Arman Khan";

UPDATE employee SET age = age+1 WHERE email LIKE '%@gmail.com';

SELECT * FROM employee ORDER BY salary ASC;


-- 2. DML -------------------------------- DELETE ------------------------------
DELETE FROM employe 
WHERE emp_name="Arman Khan"  -- DELETE SPACIFIC ROW




---------------------------------- CURRENT TIMESTAMP --------------------------
ALTER TABLE employee
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;



SELECT * FROM employee ORDER BY id ASC;








