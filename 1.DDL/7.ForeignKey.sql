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




DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
    dept_no     CHAR(4)         NOT NULL,
    dept_name   VARCHAR(40)     NOT NULL,
    PRIMARY KEY (dept_no),
    UNIQUE  KEY (dept_name)
);


INSERT INTO `departments` VALUES 
('d001','Marketing'),
('d002','Finance'),
('d003','Human Resources'),
('d004','Production'),
('d005','Development'),
('d006','Quality Management'),
('d007','Sales'),
('d008','Research'),
('d009','Customer Service');



CREATE TABLE dept_manager (
   emp_no       INT             NOT NULL,
   dept_no      CHAR(4)         NOT NULL,
   from_date    DATE            NOT NULL,
   to_date      DATE            NOT NULL,
   FOREIGN KEY (emp_no)  REFERENCES employees (emp_no)    ON DELETE CASCADE,
   FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
   PRIMARY KEY (emp_no,dept_no)
);


INSERT INTO `dept_manager` VALUES 
(110022,'d001','1985-01-01','1991-10-01'),
(110039,'d001','1991-10-01','9999-01-01'),
(110085,'d002','1985-01-01','1989-12-17'),
(110114,'d002','1989-12-17','9999-01-01'),
(110183,'d003','1985-01-01','1992-03-21'),
(110228,'d003','1992-03-21','9999-01-01'),
(110303,'d004','1985-01-01','1988-09-09'),
(110344,'d004','1988-09-09','1992-08-02'),
(110386,'d004','1992-08-02','1996-08-30'),
(110420,'d004','1996-08-30','9999-01-01'),
(110511,'d005','1985-01-01','1992-04-25'),
(110567,'d005','1992-04-25','9999-01-01'),
(110725,'d006','1985-01-01','1989-05-06'),
(110765,'d006','1989-05-06','1991-09-12'),
(110800,'d006','1991-09-12','1994-06-28'),
(110854,'d006','1994-06-28','9999-01-01'),
(111035,'d007','1985-01-01','1991-03-07'),
(111133,'d007','1991-03-07','9999-01-01'),
(111400,'d008','1985-01-01','1991-04-08'),
(111534,'d008','1991-04-08','9999-01-01'),
(111692,'d009','1985-01-01','1988-10-17'),
(111784,'d009','1988-10-17','1992-09-08'),
(111877,'d009','1992-09-08','1996-01-03'),
(111939,'d009','1996-01-03','9999-01-01');


INSERT INTO `dept_manager` VALUES 
(999,'d124','1985-01-01','1991-10-01');


SELECT * FROM dept_manager WHERE emp_no >= 111692;

DELETE FROM employees WHERE emp_no = 111877;

SELECT * FROM dept_manager WHERE emp_no >= 111692;
