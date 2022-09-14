USE employees;

SELECT * FROM employees;

ALTER TABLE employees
    ADD COLUMN city VARCHAR(14)
    AFTER last_name;

ALTER TABLE employees
    CHANGE COLUMN city emp_city VARCHAR(24) DEFAULT "Berlin"
    AFTER birth_date;

ALTER TABLE employees
    DROP COLUMN city;

