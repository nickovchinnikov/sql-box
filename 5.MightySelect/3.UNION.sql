SELECT 1,2,3 UNION SELECT 'a','b','c';

VALUES ROW(1,2,3), ROW(4,5,6) UNION SELECT 'a','b','d';

/* Error */
VALUES ROW(1,2,3), ROW(4,5,6) UNION SELECT 'a','b';

/* TABLE keyword */
DROP TABLE IF EXISTS table_1;
CREATE TABLE table_1 (x INT, y INT, z INT);
INSERT INTO table_1 VALUES ROW(1,2,3),ROW(4,5,6);

DROP TABLE IF EXISTS table_2;
CREATE TABLE table_2 (a INT, b INT, c INT);
INSERT INTO table_2 VALUES ROW(7,8,9), ROW(10,11,12);

TABLE table_1 UNION TABLE table_2;

/* UNION combination */
VALUES ROW(1,2,3), ROW(1,2,3)
	UNION
SELECT * FROM table_2
	UNION
TABLE table_1;

/* UNION ALL - show duplicates */
VALUES ROW(1,2,3), ROW(1,2,3)
	UNION ALL
SELECT * FROM table_2
	UNION ALL
TABLE table_1;


SELECT MIN(salary), MAX(salary), AVG(salary)
FROM salaries WHERE salary BETWEEN 0 AND 50000
	UNION
SELECT MIN(salary), MAX(salary), AVG(salary)
FROM salaries WHERE salary BETWEEN 50000 AND 100000
	UNION
SELECT MIN(salary), MAX(salary), AVG(salary)
FROM salaries WHERE salary BETWEEN 100000 AND 160000;
