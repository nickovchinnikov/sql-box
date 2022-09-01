/* COUNT(_) AND COUNT(DISTINCT _) */
SELECT COUNT(salary) FROM salaries
WHERE to_date = '9999-01-01' AND salary >= 100000;

SELECT COUNT(first_name) FROM employees;
SELECT COUNT(DISTINCT first_name) FROM employees;

/* MAX, MIN, AVG, SUM */
SELECT MAX(salary) FROM salaries;
SELECT MIN(salary) FROM salaries;
SELECT AVG(salary) FROM salaries;
SELECT SUM(salary) FROM salaries;

/* Standart deviation and Variance */
-- Standart anotation for SQL
SELECT VAR_POP(salary) FROM salaries;
-- Aliases
SELECT VAR_SAMP(salary) FROM salaries;
SELECT VARIANCE(salary) FROM salaries;

-- Standart anotation for SQL
SELECT STDDEV_POP(salary) FROM salaries;
-- Aliases
SELECT STD(salary) FROM salaries;
SELECT STDDEV_SAMP(salary) FROM salaries;

-- Standart deviation math
SELECT SQRT(VARIANCE(salary)) = STD(salary) FROM salaries;
