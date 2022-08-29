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

INSERT INTO `employees` VALUES
    (10001,'1953-09-02','Georgi','Facello','M','1986-06-26'),
    (10002,'1964-06-02','Bezalel','Simmel','F','1985-11-21'),
    (10003,'1959-12-03','Parto','Bamford','M','1986-08-28'),
    (10004,'1954-05-01','Chirstian','Koblick','M','1986-12-01'),
    (10005,'1955-01-21','Kyoichi','Maliniak','M','1989-09-12'),
    (10006,'1953-04-20','Anneke','Preusig','F','1989-06-02');

SELECT * FROM `employees`;

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    emp_no      INT             AUTO_INCREMENT,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,    
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no)
);


INSERT INTO `employees` (birth_date, first_name, last_name, gender, hire_date) VALUES
    ('1953-09-02','Georgi','Facello','M','1986-06-26'),
    ('1964-06-02','Bezalel','Simmel','F','1985-11-21'),
    ('1959-12-03','Parto','Bamford','M','1986-08-28'),
    ('1954-05-01','Chirstian','Koblick','M','1986-12-01'),
    ('1955-01-21','Kyoichi','Maliniak','M','1989-09-12'),
    ('1953-04-20','Anneke','Preusig','F','1989-06-02');

SELECT * FROM `employees`;
