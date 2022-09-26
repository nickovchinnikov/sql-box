/* JOIN Examples */
/* TABLES */
DROP TABLE IF EXISTS table_1;
CREATE TABLE table_1 (
    id INT,
    a INT
);

INSERT INTO table_1
VALUES ROW(1000,1),
    ROW(2000,2),
    ROW(3000,3);

SELECT * FROM table_1;


DROP TABLE IF EXISTS table_2;
CREATE TABLE table_2 (
    id INT,
    b VARCHAR(2)
);

INSERT INTO table_2
VALUES ROW(2000,'A'),
    ROW(3000,'B'),
    ROW(4000,'C');

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
(SELECT * FROM table_1 t1 LEFT JOIN table_2 t2 ON t1.id = t2.id)
UNION
(SELECT * FROM table_1 t1 RIGHT JOIN table_2 t2 ON t1.id = t2.id);


DROP TABLE IF EXISTS table_3;
CREATE TABLE table_3 (
    id INT,
    c VARCHAR(2)
);


INSERT INTO table_3 
VALUES ROW(4000,'D'),
    ROW(5000,'E'),
    ROW(6000,'F');


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
