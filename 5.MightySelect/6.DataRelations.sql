USE test_employees;

/* One2One */
DROP TABLE IF EXISTS tokens;
CREATE TABLE tokens (
    emp_no      INT NOT NULL,
    token       VARCHAR(256)
        GENERATED ALWAYS AS (SHA2(CONCAT("emp_token", emp_no), 256)) VIRTUAL,
	PRIMARY KEY (emp_no),
    CONSTRAINT `tokens_2_employee_no`
        FOREIGN KEY (`emp_no`)
        REFERENCES `employees`.`employees` (`emp_no`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

INSERT INTO tokens (emp_no) VALUES
    (10001),
    (10002),
    (10003),
    (10004),
    (10005);

SELECT * FROM tokens;

SELECT * FROM employees e
LEFT JOIN tokens t ON e.emp_no = t.emp_no;

/* One2Many */
SELECT * FROM employees
LEFT JOIN titles USING(emp_no);


/*Many2Many*/
USE employees;

SELECT * FROM employees e
LEFT JOIN dep_emp de ON e.emp_no = de.emp_no
LEFT JOIN department d ON e.emp_no = d.emp_no;
