USE employees;

SELECT * FROM employees;

SELECT * FROM employees ORDER BY hire_date;

SELECT * FROM employees ORDER BY hire_date DESC;

SELECT * FROM employees ORDER BY hire_date DESC LIMIT 1;

SELECT * FROM salaries ORDER BY salary DESC;

SELECT * FROM salaries ORDER BY salary DESC LIMIT 5;

SELECT e.*, s.salary FROM employees AS e, (
	SELECT * FROM salaries
		WHERE to_date = '9999-01-01'
		ORDER BY salary DESC LIMIT 5
	) AS s
WHERE e.emp_no = s.emp_no;

