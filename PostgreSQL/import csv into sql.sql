CREATE TABLE IF NOT EXISTS employee1(
	employee_id INT PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	department VARCHAR(20),
	salary NUMERIC(10,2),
	joining_date DATE,
	age INT
);

SELECT * FROM employee1;

COPY
employee1 (employee_id, first_name, last_name, department, salary, joining_date, age)
FROM 'C:\Users\arman\Downloads\employee_data.csv'
DELIMITER','
CSV HEADER;

