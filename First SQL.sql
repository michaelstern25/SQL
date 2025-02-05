CREATE DATABASE collage;
USE collage;

CREATE TABLE student(
	rollno INT PRIMARY KEY,
    name VARCHAR(20),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO student
(rollno, name, marks, grade, city)
VALUE 
(101, "anil", 78, "C", "Pune"),
(102, "Arman", 93, "A", "Mumbai"),
(103, "Noman", 85, "B", "Mumbai"),
(104, "Ruman", 96, "A", "Delhi"),
(105, "Rehan", 12, "F", "Delhi"),
(106, "Sufiyan", 82, "B", "Delhi");

SELECT name, marks FROM student;
SELECT * FROM student;
SELECT DISTINCT city FROM student;
SELECT * FROM student WHERE marks > 80;
SELECT * FROM student WHERE city = "Mumbai";
SELECT * FROM student WHERE marks > 80 AND city = "Mumbai";
SELECT * FROM student WHERE marks+10 > 100;
SELECT * FROM student WHERE marks = 93;

SELECT * FROM student WHERE marks > 80 AND city = "Mumbai";
SELECT * FROM student WHERE marks > 90 OR city = "Mumbai";
SELECT * FROM student WHERE marks BETWEEN 80 AND 90;
SELECT * FROM student WHERE city IN ("Delhi", "Mumbai", "Gurgaon");
SELECT * FROM student WHERE city NOT IN ("Delhi", "Mumbai");

SELECT * FROM student LIMIT 3;
SELECT * FROM student WHERE marks > 75 LIMIT 3;

SELECT *FROM student ORDER BY name ASC;
SELECT *FROM student ORDER BY name DESC;
SELECT *FROM student ORDER BY marks DESC LIMIT 3;

SELECT max(marks) FROM student;
SELECT avg(marks) FROM student;
SELECT count(marks) FROM student;
SELECT min(marks) FROM student;
SELECT sum(marks) FROM student;

SELECT city, count(name) FROM student GROUP BY city;

SET SQL_SAFE_UPDATES = 0;

UPDATE student
SET marks = 82
WHERE rollno = 105;

SELECT * FROM student;

UPDATE student
SET grade = "B"
WHERE marks BETWEEN 80 AND 90;

SELECT * FROM student;














