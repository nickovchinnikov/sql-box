USE employees;

SELECT * FROM employees LIMIT 10;

DELETE FROM employees WHERE emp_no = 10001;

DELETE FROM employees ORDER BY emp_no DESC LIMIT 1;

SELECT * FROM salaries ORDER BY salary DESC;

SELECT * FROM salaries ORDER BY salary DESC LIMIT 5;

DELETE FROM employees AS e WHERE e.emp_no IN (
    SELECT emp_no FROM salaries
    WHERE to_date = '9999-01-01'
    ORDER BY salary DESC LIMIT 1
);
