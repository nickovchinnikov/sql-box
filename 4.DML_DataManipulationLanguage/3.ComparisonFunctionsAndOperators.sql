/* Type Conversion in Expression Evaluation */
SELECT 10 + '10';
SELECT '10' + '10';

SELECT '10' + 'D10';
SELECT '10' * 'D10';

SELECT CONCAT('10', '10');

SELECT CONCAT(first_name, ", ", last_name) FROM employees;

/* Compare as numbers */
SELECT '10.0' = 10, '.01' = 0.01;

/* Compare as strings */
SELECT '10.0' = '10', '.01' = '0.01';

/* Not equals */
SELECT '.01' <> '0.01', '.01' != '0.01', 'ascv' <> 'ascvv';

SELECT * FROM salaries WHERE salary > "80000";
SELECT * FROM salaries WHERE salary BETWEEN "80000" AND "80020";

SELECT * FROM salaries WHERE salary NOT BETWEEN "0" AND "130000";

SELECT *
FROM salaries
WHERE salary NOT BETWEEN "0" AND "130000"
    AND emp_no <> 10897;

/* Example with NULL */
DROP TABLE IF EXISTS revenues;
CREATE TABLE IF NOT EXISTS revenues (
    company_id INT PRIMARY KEY,
    q1 INT,
    q2 INT,
    q3 INT,
    q4 INT
);

INSERT INTO revenues(company_id,q1,q2,q3,q4)
VALUES (1,100,120,110,130),
       (2,250,260,300,310),
       (3,NULL,NULL,300,NULL);

/* Error */
SELECT * FROM revenues WHERE q1 = NULL;

/* Problems when compare with NULL */
SELECT 1 = 1, NULL = NULL, 1 = NULL;

/* NULL-safe equal */
SELECT 1 <=> 1, NULL <=> NULL, 1 <=> NULL;

/* Fix */
SELECT * FROM revenues WHERE q1 <=> NULL;

SELECT * FROM revenues WHERE q1 IS NULL;

/* Tests a value against a boolean value */
SELECT 1 IS TRUE, 0 IS FALSE, NULL IS UNKNOWN;

SELECT 1 IS NOT UNKNOWN, 0 IS NOT UNKNOWN, NULL IS NOT UNKNOWN;

SELECT 1 IS NULL, 0 IS NULL, NULL IS NULL;
SELECT 1 IS NOT NULL, 0 IS NOT NULL, NULL IS NOT NULL;

/* If expr is NULL, ISNULL() returns 1, otherwise it returns 0. */
SELECT ISNULL(1+1);
SELECT ISNULL(1/0);

/* Returns the first non-NULL value in the list or NULL if there are no non-NULL values */
SELECT COALESCE(NULL,1,NULL);
SELECT COALESCE(NULL,NULL,NULL);

/* Example */
SELECT
    company_id,
    COALESCE(q1, q2, q3, q4) AS FIRST_NOTNULL_Q
FROM revenues;

/* GREATEST / LEAST */
SELECT GREATEST(10, 20);
SELECT GREATEST(40.0, 30.0, 5.0, 900.0);
SELECT GREATEST('B','A','C');

SELECT LEAST(10, 20);
SELECT LEAST(40.0, 30.0, 5.0, 900.0);
SELECT LEAST('B','A','C');

SELECT
    company_id,
    LEAST(q1, q2, q3, q4) low_q,
    GREATEST(q1, q2, q3, q4) high_q
FROM
    revenues;
