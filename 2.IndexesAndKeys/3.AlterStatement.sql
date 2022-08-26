DROP DATABASE IF EXISTS employees;
CREATE DATABASE IF NOT EXISTS employees CHARACTER SET UTF8 COLLATE utf8_unicode_ci;
SHOW DATABASES;

SHOW CREATE DATABASE employees;

USE employees;

/* Show character set for the schema */
SELECT @@character_set_database, @@collation_database;

ALTER DATABASE employees CHARACTER SET UTF8MB4 COLLATE utf8mb4_general_ci;

SELECT @@character_set_database, @@collation_database;


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
(110022,'1956-09-12','Margareta','Markovitch','M','1985-01-01'),
(110039,'1963-06-21','Vishwani','Minakawa','M','1986-04-12'),
(110085,'1959-10-28','Ebru','Alpin','M','1985-01-01'),
(110114,'1957-03-28','Isamu','Legleitner','F','1985-01-14'),
(110183,'1953-06-24','Shirish','Ossenbruggen','F','1985-01-01'),
(110228,'1958-12-02','Karsten','Sigstam','F','1985-08-04'),
(110303,'1956-06-08','Krassimir','Wegerle','F','1985-01-01'),
(110344,'1961-09-07','Rosine','Cools','F','1985-11-22'),
(110386,'1953-10-04','Shem','Kieras','M','1988-10-14'),
(110420,'1963-07-27','Oscar','Ghazalie','M','1992-02-05'),
(110511,'1957-07-08','DeForest','Hagimont','M','1985-01-01'),
(110567,'1964-04-25','Leon','DasSarma','F','1986-10-21'),
(110725,'1961-03-14','Peternela','Onuegbe','F','1985-01-01'),
(110765,'1954-05-22','Rutger','Hofmeyr','F','1989-01-07'),
(110800,'1963-02-07','Sanjoy','Quadeer','F','1986-08-12'),
(110854,'1960-08-19','Dung','Pesch','M','1989-06-09'),
(111035,'1962-02-24','Przemyslawa','Kaelbling','M','1985-01-01'),
(111133,'1955-03-16','Hauke','Zhang','M','1986-12-30'),
(111400,'1959-11-09','Arie','Staelin','M','1985-01-01'),
(111534,'1952-06-27','Hilary','Kambil','F','1988-01-31'),
(111692,'1954-10-05','Tonny','Butterworth','F','1985-01-01'),
(111784,'1956-06-14','Marjo','Giarratana','F','1988-02-12'),
(111877,'1962-10-18','Xiaobin','Spinelli','F','1991-08-17'),
(111939,'1960-03-25','Yuchang','Weedman','M','1989-07-10');


SELECT * FROM employees;

ALTER TABLE employees RENAME COLUMN emp_no TO id;

SELECT * FROM employees;

