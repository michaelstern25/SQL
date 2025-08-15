CREATE TABLE Employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT
);
INSERT INTO Employees (employee_id, first_name, last_name, department_id) VALUES
(1, 'Rahul', 'Sharma', 101),
(2, 'Priya', 'Mehta', 102),
(3, 'Ankit', 'Verma', 103),
(4, 'Simran', 'Kaur', NULL),
(5, 'Aman', 'Singh', 101);

SELECT * FROM Employees;


CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
INSERT INTO Departments (department_id, department_name) VALUES
(101, 'Sales'),
(102, 'Marketing'),
(103, 'IT'),
(104, 'HR');

SELECT * FROM Departments;


-- 1. INNER JOIN - Retrieve Employees and their department names where a match exists.
SELECT e.employee_id, e.first_name, e.last_name,
	   d.department_id, d.department_name
FROM Employees e
INNER JOIN
Departments d
ON e.department_id = d.department_id;


-- 2. LEFT JOIN - REtrieve all employee and their department names, including those without a department.
SELECT e.employee_id, e.first_name, e.last_name,
	   d.department_id, d.department_name
FROM Employees e
LEFT JOIN
Departments d
ON e.department_id = d.department_id;


-- 3. RIGHT JOIN - Retrieve all departments and the employee working in them, including departments without
SELECT e.employee_id, e.first_name, e.last_name,
	   d.department_id, d.department_name
FROM Employees e
RIGHT JOIN
Departments d
ON e.department_id = d.department_id;


-- 4. FULL OUTER JOIN - Retrieve all employee and departments, including non-matching records from both tables
SELECT e.employee_id, e.first_name, e.last_name,
	   d.department_id, d.department_name
FROM Employees e
FULL OUTER JOIN
Departments d
ON e.department_id = d.department_id;


-- 5. CROSS JOIN - Retrieve all possible combinations of employee and departments
SELECT e.first_name, e.last_name, d.department_name
FROM Employees e
CROSS JOIN
Departments d;


-- 6. SELF JOIN - Find employee who share the same department
SELECT e1.first_name AS emp_name1,
		e2.first_name AS emp_name2,
		d.department_name
FROM employees e1 JOIN employees e2
ON e1.department_id=e2.department_id AND e1.employee_id!=e2.employee_id
JOIN
departments d
ON
e1.department_id=d.department_id;