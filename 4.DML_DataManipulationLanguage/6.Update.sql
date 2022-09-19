DROP DATABASE IF EXISTS employees;
CREATE DATABASE IF NOT EXISTS employees;


USE employees;


DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    emp_no      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,    
    hire_date   DATE            NOT NULL,
    salary      INT,
    PRIMARY KEY (emp_no)
);

INSERT INTO `employees` (emp_no, birth_date, first_name, last_name, gender, hire_date) VALUES
    (10001,'1953-09-02','Georgi','Facello','M','1986-06-26'),
    (10002,'1964-06-02','Bezalel','Simmel','F','1985-11-21'),
    (10003,'1959-12-03','Parto','Bamford','M','1986-08-28'),
    (10004,'1954-05-01','Chirstian','Koblick','M','1986-12-01'),
    (10005,'1955-01-21','Kyoichi','Maliniak','M','1989-09-12'),
    (10006,'1953-04-20','Anneke','Preusig','F','1989-06-02');


SELECT * FROM `employees`;

UPDATE employees SET birth_date = '1959-12-01' WHERE emp_no = 10003;


UPDATE employees SET emp_no = emp_no + 1;

UPDATE employees SET emp_no = emp_no + 1 ORDER BY emp_no DESC;

UPDATE employees SET emp_no = emp_no + 1 ORDER BY emp_no DESC LIMIT 1;


SELECT * FROM `employees`;

/* Revert changes */

UPDATE employees SET birth_date = '1959-12-03' WHERE emp_no = 10003;

UPDATE employees SET emp_no = emp_no - 1 ORDER BY emp_no DESC LIMIT 1;

UPDATE employees SET emp_no = emp_no - 1 ORDER BY emp_no;


SELECT * FROM `employees`;


DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries (
    emp_no      INT             NOT NULL,
    salary      INT             NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no, from_date)
);


INSERT INTO `salaries` VALUES (10001,60117,'1986-06-26','1987-06-26'),
(10001,62102,'1987-06-26','1988-06-25'),
(10001,88958,'2002-06-22','9999-01-01'),
(10002,65828,'1996-08-03','1997-08-03'),
(10002,72527,'2001-08-02','9999-01-01'),
(10003,40006,'1995-12-03','1996-12-02'),
(10003,43311,'2001-12-01','9999-01-01'),
(10004,40054,'1986-12-01','1987-12-01'),
(10004,74057,'2001-11-27','9999-01-01'),
(10005,78228,'1989-09-12','1990-09-12'),
(10005,82621,'1990-09-12','1991-09-12'),
(10005,83735,'1991-09-12','1992-09-11'),
(10005,94692,'2001-09-09','9999-01-01'),
(10006,40000,'1990-08-05','1991-08-05'),
(10006,42085,'1991-08-05','1992-08-04'),
(10006,59755,'2001-08-02','9999-01-01');


SELECT * FROM `salaries`;


UPDATE employees, salaries
SET employees.salary = salaries.salary
WHERE employees.emp_no = salaries.emp_no;


SELECT * FROM employees;

