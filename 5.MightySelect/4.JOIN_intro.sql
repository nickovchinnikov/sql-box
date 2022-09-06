USE employees;


SELECT * FROM employees e, salaries s
WHERE e.emp_no = s.emp_no;


SELECT e.emp_no, e.first_name, e.last_name, s.salary, s.to_date
FROM employees e, salaries s
WHERE e.emp_no = s.emp_no;

/*
INNER JOIN and , (comma) are semantically equivalent in the absence of a join condition:
both produce a Cartesian product between the specified tables (that is, each and every row
in the first table is joined to each and every row in the second table). 
*/

SELECT * FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;


SELECT e.emp_no, e.first_name, e.last_name, s.salary, s.to_date
FROM employees e
JOIN salaries s USING(emp_no);

