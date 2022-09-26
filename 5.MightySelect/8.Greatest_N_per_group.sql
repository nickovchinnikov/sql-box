/* Last salary: greatest-n-per-group */

/* JOIN to subquery example */
SELECT e.emp_no, e.first_name, e.last_name, s2.salary, s2.to_date
FROM employees e
JOIN (
	SELECT emp_no, MAX(to_date) as to_date FROM salaries GROUP BY emp_no
) s1
	ON e.emp_no = s1.emp_no
JOIN salaries s2
	ON s1.emp_no = s2.emp_no AND s1.to_date = s2.to_date;

/* Much more faster! */
SELECT e.emp_no, e.first_name, e.last_name, s1.salary, s1.to_date
FROM employees e
JOIN salaries s1
	ON e.emp_no = s1.emp_no
LEFT JOIN salaries s2
	ON e.emp_no = s2.emp_no AND s1.to_date < s2.to_date
WHERE s2.emp_no IS NULL;
