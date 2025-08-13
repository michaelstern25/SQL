DROP TABLE employees;

CREATE TABLE IF NOT EXISTS employees(
	employee_id INT PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	department VARCHAR(20),
	salary NUMERIC(10,2),
	joining_date DATE,
	age INT
);

SELECT * FROM employees;

--------------------- 1. Arithmatic Operators ----------------------------

-- Retrive the first_name, salary and calculate a 10% bonus on the salary.
SELECT first_name, salary, 
    (salary * 0.10) AS bonus,
    (salary + salary * 0.10) AS total_salary
FROM employees;


-- Calculate the annual salary and salary increament by 5% - show the monthly new salary as well
SELECT first_name, last_name, salary,
	(salary*12) AS annual_salary,
	(salary*0.05) AS increament_amount,
	(salary*1.05) AS new_salary
FROM employees;


--------------------- 2. Comparison Operators ----------------------------

-- Retrieve employees whose salary is between 40,000 and 60,000. - Use BETWEEN Operators
SELECT first_name, last_name, salary 
FROM employees
WHERE salary BETWEEN 40000 and 60000;


--------------------- 3. Other Operators ----------------------------

-- Find employees whose email addresses end with @gmail.com - Use LIKE Operators
SELECT first_name, last_name, email 
FROM employees
WHERE email LIKE '%@gmail.com';

SELECT first_name
FROM employees
WHERE first_name LIKE 'A%';

-- Retrieve employees who belong to either the 'Finance' or 'Marketing' departments-- Use IN Operators
SELECT first_name, last_name, department 
FROM employees
WHERE department IN ('Finance', 'Marketing');

SELECT first_name, last_name, department 
FROM employees
WHERE department IN ('Finance', 'Marketing', 'IT');

-- Find employees where the age column is NULL 
SELECT first_name, last_name, age 
FROM employees
WHERE age IS NULL;

-- List employees sorted by salary in DESCENDING order.
SELECT first_name, last_name, salary 
FROM employees
ORDER BY salary DESC
LIMIT 5;

-- Retrieve a list of unique department - Using DISTINCT.
SELECT DISTINCT department 
FROM employees;

SELECT COUNT (DISTINCT department) -- Count Unique Value..
FROM employees;


--------------------- 4. Set Operators ----------------------------

CREATE TABLE students_2023 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    course VARCHAR(50)
);

INSERT INTO students_2023 (student_id, student_name, course) VALUES
(1, 'Aarav Sharma', 'Computer Science'),
(2, 'Ishita Verma', 'Mechanical Engineering'),
(3, 'Kabir Patel', 'Electronics'),
(4, 'Ananya Desai', 'Civil Engineering'),
(5, 'Rahul Gupta', 'Computer Science');

SELECT * FROM students_2023;


CREATE TABLE students_2024 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    course VARCHAR(50)
);

INSERT INTO students_2024 (student_id, student_name, course) VALUES
(3, 'Kabir Patel', 'Electronics'),      -- Same as students_2023
(4, 'Ananya Desai', 'Civil Engineering'), -- Same as students_2023
(6, 'Meera Rao', 'Computer Science'),
(7, 'Vikram Singh', 'Mathematics'),
(8, 'Sanya Kapoor', 'Physics');

SELECT * FROM students_2024;

-- 1. UNION (Combines results, remove duplicates)--------------------
SELECT student_name, course
FROM students_2023
UNION
SELECT student_name, course
FROM students_2024;

-- 2. UNION ALL (Combines results, Keeps duplicates)----------------
SELECT student_name, course
FROM students_2023
UNION ALL
SELECT student_name, course
FROM students_2024;

-- 3. INTERSECT (Returns common results)---------------------------
SELECT student_name, course
FROM students_2023
INTERSECT
SELECT student_name, course
FROM students_2024;

-- 4. EXCEPT (Returns results in first, not second)----------------
SELECT student_name, course
FROM students_2023
EXCEPT
SELECT student_name, course
FROM students_2024;


