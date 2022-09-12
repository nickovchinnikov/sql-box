USE employees;

/* Float and decimal table */
DROP TABLE IF EXISTS exact_precision_table;
CREATE TEMPORARY TABLE exact_precision_table (
    decimal_ DECIMAL(5,4),
    numeric_ NUMERIC(5,4)
);

INSERT INTO exact_precision_table VALUES (
    3.33333,
    3.33333
);

SELECT * FROM exact_precision_table;

/* Out-of-Range and Overflow Handling */
INSERT INTO exact_precision_table VALUES (
    33.33333,
    33.33333
);


/* Float and decimal table */
DROP TABLE IF EXISTS float_table;
CREATE TEMPORARY TABLE float_table (
    float_ FLOAT,
    float_double FLOAT(25),
    double_ DOUBLE
);

/* Out-of-Range and Overflow Handling */
INSERT INTO float_table VALUES (
	0.00000011920928955078125,
	0.00000011920928955078125,
    0.00000011920928955078125
);

INSERT INTO float_table VALUES (
	(10000000000) * 0.00000011920928955078125,
	(10000000000) * 0.00000011920928955078125,
    (10000000000) * 0.00000011920928955078125
);

SELECT * FROM float_table;


/* Bit number */
DROP TABLE IF EXISTS bit_table;
CREATE TEMPORARY TABLE bit_table (
    d1 BIT(2)
);

INSERT INTO bit_table VALUES (
    b'11'
);

SELECT * FROM bit_table;


