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
    PRIMARY KEY (emp_no)
);

/*
    CRUD operations
*/

/* INSERT statement */
INSERT INTO `employees` VALUES
    (10001,'1953-09-02','Georgi','Facello','M','1986-06-26'),
    (10002,'1964-06-02','Bezalel','Simmel','F','1985-11-21');

/* SELECT statement */
SELECT * FROM `employees`;

SELECT * FROM employees WHERE first_name = 'Georgi';

SELECT * FROM employees WHERE first_name = 'Georgi' AND last_name = 'Facello';

/* UPDATE statement */
UPDATE employees SET birth_date = '1959-12-01' WHERE emp_no = 10002;

/* DELETE statement */
DELETE FROM employees WHERE emp_no = 10001;
