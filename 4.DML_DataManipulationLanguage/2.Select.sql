/** Load employees DB from https://github.com/datacharmer/test_db */

USE employees;
        
/** AND, OR */
SELECT * FROM employees WHERE first_name = 'Elvis';

SELECT * FROM employees WHERE first_name = 'Elvis' AND last_name = 'Demeyer';

SELECT * FROM employees WHERE first_name = 'Kellie' OR first_name = 'Aruna';

SELECT * FROM employees
    WHERE gender = 'F' AND
        (first_name = 'Kellie' OR first_name = 'Aruna');


SELECT * FROM employees WHERE gender = 'F' AND hire_date >= '2000-01-01';

/** IN */
SELECT * FROM employees WHERE first_name IN ('Denis', 'Elvis');

SELECT * FROM employees WHERE first_name NOT IN ('John', 'Mark', 'Jacob');

/** IN Sub query */
SELECT emp_no FROM dept_manager WHERE to_date = '9999-01-01';

SELECT * FROM employees WHERE emp_no IN (
    SELECT emp_no FROM dept_manager WHERE to_date = '9999-01-01'
);

/** Where Like */
SELECT * FROM employees WHERE first_name LIKE ('Mark%');

SELECT * FROM employees WHERE hire_date LIKE ('%2000%');

SELECT * FROM employees WHERE emp_no LIKE ('1000_');

SELECT * FROM employees WHERE first_name NOT LIKE ('%jack%');

/** BETWEEN */
SELECT * FROM salaries WHERE salary BETWEEN 155000 AND 160000;

/** DISTINCT */
SELECT DISTINCT first_name FROM employees;
