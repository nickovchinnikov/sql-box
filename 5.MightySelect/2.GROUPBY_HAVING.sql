SELECT * FROM salaries;


SELECT emp_no, COUNT(salary)
FROM salaries
WHERE salary >= 100000
GROUP BY emp_no;


SELECT emp_no, COUNT(salary) AS count_salaries
FROM salaries
WHERE salary >= 150000
GROUP BY emp_no
HAVING count_salaries > 3;


SELECT emp_no, AVG(salary) AS avg_salary
FROM salaries
GROUP BY emp_no
HAVING avg_salary > 120000
ORDER BY emp_no;


SELECT emp_no, COUNT(salary) AS salary_changes, AVG(salary) AS avg_salary
FROM salaries
WHERE salary >= 100000
GROUP BY emp_no
HAVING avg_salary > 140000;


/* GROUP_CONCAT */
SELECT emp_no, GROUP_CONCAT(salary)
FROM salaries
GROUP BY emp_no;


SELECT emp_no,
    GROUP_CONCAT(DISTINCT salary
    ORDER BY salary DESC SEPARATOR ';')
FROM salaries
GROUP BY emp_no;


/* JSON_ARRAYAGG */
SELECT emp_no, JSON_ARRAYAGG(salary) AS salary
FROM salaries
GROUP BY emp_no;


/* JSON_OBJECTAGG */
SELECT emp_no, JSON_OBJECTAGG(salary, to_date) AS salary_to_date
FROM salaries
GROUP BY emp_no;

