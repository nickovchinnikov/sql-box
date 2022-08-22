USE employees;

/* The CHAR and VARCHAR Types */
DROP TABLE IF EXISTS varchar_char;
CREATE TEMPORARY TABLE varchar_char
(
    vch VARCHAR(10) CHARACTER SET utf8mb4,
    chr CHAR(10) CHARACTER SET latin1
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

INSERT INTO varchar_char VALUES
('abcef     ', 'abcef     ');

/* trailing spaces are removed from CHAR columns upon retrieval */
SELECT CONCAT('(', vch, ')'), CONCAT('(', chr, ')') FROM varchar_char;

/* Check the length */
SELECT CHAR_LENGTH(vch), CHAR_LENGTH(chr) FROM varchar_char;

/* Text overflow error */
INSERT INTO varchar_char VALUES
('abcefabcefabcef', 'abcefabcefabcef');

/* https://dev.mysql.com/doc/refman/8.0/en/char.html */


/* The BINARY and VARBINARY Types */
DROP TABLE IF EXISTS binary_varbinary;
CREATE TEMPORARY TABLE binary_varbinary
(
    bin BINARY(10),
    varbin VARBINARY(10)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

INSERT INTO binary_varbinary VALUES
('abcef     ', 'abcef     ');

/* trailing spaces are removed from BINARY columns upon retrieval */
SELECT CONCAT('(', bin, ')'), CONCAT('(', varbin, ')') FROM binary_varbinary;

/* Check the length */
SELECT BINARY_LENGTH(bin), BINARY_LENGTH(varbin) FROM binary_varbinary;

/* Cast bin to hex and char */
SELECT HEX(bin), CAST(bin AS CHAR), CAST(varbin AS CHAR) FROM binary_varbinary;

/*
    If the value retrieved must be the same as the value
    specified for storage with no padding, it might be
    preferable to use VARBINARY or one of the BLOB data
    types instead. 
*/

/* Text overflow error */
INSERT INTO binary_varbinary VALUES
('abcefabcefabcef', 'abcefabcefabcef');

/* Text and blob */
DROP TABLE IF EXISTS text_blob;
CREATE TEMPORARY TABLE text_blob
(
    txt TEXT CHARSET utf8mb4 COLLATE utf8mb4_general_ci,
    blb BLOB
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

INSERT INTO text_blob VALUES
('abcef     ', 'abcef     '),
('abcef', 'abcef');

SELECT CONCAT('(', txt, ')'), CONCAT('(', CAST(blb as CHAR), ')') FROM text_blob;

/* Check the length */
SELECT CHAR_LENGTH(txt), CHAR_LENGTH(blb) FROM text_blob;

SELECT * FROM text_blob;

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

