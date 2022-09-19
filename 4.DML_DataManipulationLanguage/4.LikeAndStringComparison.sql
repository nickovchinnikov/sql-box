USE employees;

/* Like */
SELECT 10 LIKE '1%';
SELECT 10 LIKE '1_';

/** Where Like */
SELECT * FROM employees WHERE first_name LIKE ('Mark%');

SELECT * FROM employees WHERE hire_date LIKE ('%2000%');

SELECT * FROM employees WHERE emp_no LIKE ('1000_');

SELECT * FROM employees WHERE first_name NOT LIKE ('%jack%');

/*
The following two statements illustrate that string comparisons are not
case-sensitive unless one of the operands is case-sensitive
(uses a case-sensitive collation or is a binary string): 
*/
SELECT 'abc' LIKE 'ABC';
SELECT 'abc' LIKE _utf8mb4 'ABC' COLLATE utf8mb4_0900_as_cs;
SELECT 'abc' LIKE _utf8mb4 'ABC' COLLATE utf8mb4_0900_ai_ci;
SELECT 'abc' LIKE _utf8mb4 'ABC' COLLATE utf8mb4_bin;
SELECT 'abc' LIKE BINARY 'ABC';

