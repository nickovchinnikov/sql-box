USE employees;

/* Employee + Titles */
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.to_date
FROM employees e
JOIN titles t USING(emp_no)
WHERE t.to_date = '9999-01-01';

/* Active department managers */
SELECT d.*, m.emp_no AS mng_no, e.first_name, e.last_name, m.to_date
FROM departments d
JOIN dept_manager m USING(dept_no)
JOIN employees e USING(emp_no)
WHERE m.to_date = '9999-01-01';

/* Active salary */
SELECT e.emp_no, e.first_name, e.last_name, s.salary
FROM employees e
JOIN salaries s USING(emp_no)
WHERE s.to_date = '9999-01-01';

/* AVG salary by title */
SELECT t.title, MIN(s.salary), MAX(s.salary), AVG(s.salary)
FROM titles t
JOIN salaries s USING(emp_no)
WHERE t.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
GROUP BY title;
