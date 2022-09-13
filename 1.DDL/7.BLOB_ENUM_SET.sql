USE employees;

/*
    A BLOB is a binary large object that can hold a variable amount of data.
    The four BLOB types are TINYBLOB, BLOB, MEDIUMBLOB, and LONGBLOB.
    These differ only in the maximum length of the values they can hold.
    The four TEXT types are TINYTEXT, TEXT, MEDIUMTEXT, and LONGTEXT
*/

/* Blob */
DROP TABLE IF EXISTS blob_tbl;
CREATE TEMPORARY TABLE blob_tbl
(
    blb BLOB
);

INSERT INTO blob_tbl VALUES
('abcef');

SELECT CONCAT('(', blb, ')') FROM blob_tbl;

SELECT CONCAT('(', CAST(blb as CHAR), ')') FROM blob_tbl;

/* Check the length */
SELECT CHAR_LENGTH(blb) FROM blob_tbl;

SELECT BIT_LENGTH(blb) FROM blob_tbl;

SELECT * FROM blob_tbl;

/* Enum type */
DROP TABLE IF EXISTS employees;
CREATE TEMPORARY TABLE employees
(
    name VARCHAR(40),
    department ENUM('sales', 'dev', 'marketing', 'hr')
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

INSERT INTO employees VALUES
('John', 'sales'),
('Mary', 'dev'),
('Robert', 'dev'),
('Jane', 'hr'),
('Robert', 'marketing'),
('Jane', 'hr');

SELECT * FROM employees WHERE department = 'dev';

/* Insert non-existed department */
INSERT INTO employees VALUES
('John', 'presales');

/* By enum idx */
SELECT * FROM employees WHERE department=0;

/* Convert to numeric values */
SELECT name, department, department+0 FROM employees;

/* Set */
DROP TABLE IF EXISTS employees;
CREATE TEMPORARY TABLE employees
(
    name VARCHAR(40),
    department SET('sales', 'dev', 'marketing', 'hr')
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

INSERT INTO employees VALUES
('John', 'sales,dev'),
('Mary', 'dev,sales'),
('Robert', 'dev,marketing,dev'),
('Jane', 'hr,sales,marketing,sales'),
('Robert', 'marketing,dev'),
('Jane', 'hr,sales,marketing'),
('Ann', '');

SELECT * FROM employees;

