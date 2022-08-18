SHOW DATABASES;

USE employees;

SHOW TABLES;

/* Show temporary tables */
SELECT * FROM INFORMATION_SCHEMA.INNODB_TEMP_TABLE_INFO;

/* Reconnect to your server to drop temporary tables from the schema */
CREATE TEMPORARY TABLE employees (
	name 	VARCHAR(14)  NOT NULL
)

/* Insert into temp table */
INSERT INTO employees (name) VALUES ('User');

/* Select Data from temp table */
SELECT * FROM employees;

/* Drop+Create pattern */
DROP TABLE IF EXISTS employees;
CREATE TABLE IF NOT EXISTS employees (
	name 	VARCHAR(14)  NOT NULL
) CHARACTER SET UTF8MB4 COLLATE utf8mb4_general_ci, COMMENT='Employees Table';

/* Insert into table and select the data */
INSERT INTO employees (name) VALUES ('User');
SELECT * FROM employees; 

SHOW TABLES;

SHOW TABLE STATUS WHERE Name="employees";

SHOW CREATE TABLE employees;
