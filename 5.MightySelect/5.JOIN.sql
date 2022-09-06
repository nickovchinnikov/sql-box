USE employees;

/* JOIN Examples */
/* TABLES */
DROP TABLE IF EXISTS table_1;
CREATE TABLE table_1 (id INT, a INT);

INSERT INTO table_1
VALUES ROW(1,2),
    ROW(3,4),
    ROW(5,6);

SELECT * FROM table_1;


DROP TABLE IF EXISTS table_2;
CREATE TABLE table_2 (id INT, b INT);

INSERT INTO table_2
VALUES ROW(3,4),
    ROW(5,6),
    ROW(7,8);

SELECT * FROM table_2;


/* JOIN Examples */
SELECT * FROM table_1 t1 JOIN table_2 t2 ON t1.id = t2.id;

/* Alias */
SELECT * FROM table_1 t1 INNER JOIN table_2 t2 ON t1.id = t2.id;

/* USING instead of ON */
SELECT * FROM table_1 t1 INNER JOIN table_2 t2 USING(id);


/* OUTER JOINS */
SELECT * FROM table_1 t1 LEFT JOIN table_2 t2 ON t1.id = t2.id;

SELECT * FROM table_1 t1 RIGHT JOIN table_2 t2 ON t1.id = t2.id;


/* FULL OUTER JOIN */
(SELECT * FROM table_1 LEFT JOIN table_2 USING(id))
UNION
(SELECT * FROM table_1 RIGHT JOIN table_2 USING(id));


DROP TABLE IF EXISTS table_3;
CREATE TABLE table_3 (id INT, c INT);
INSERT INTO table_3 
VALUES ROW(5,6),
    ROW(7,8),
    ROW(9,10);


/* 3 and more tables can be joined */
SELECT * FROM table_1 t1
    LEFT JOIN table_2 t2 ON t1.id = t2.id
    LEFT JOIN table_3 t3 ON t1.id = t3.id;


/* With USING */
SELECT * FROM table_1 t1
    LEFT JOIN table_2 t2 USING(id)
    LEFT JOIN table_3 t3 USING(id);


/* CROSS JOIN */
SELECT * FROM table_1
    CROSS JOIN table_2;
