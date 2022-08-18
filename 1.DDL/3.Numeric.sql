SHOW DATABASES;

USE employees;

/* Numeric DataTypes */
DROP TABLE IF EXISTS int_table;
CREATE TEMPORARY TABLE int_table (
    d1 TINYINT,
    d2 SMALLINT,
    d3 MEDIUMINT,
    d4 INT,
    d5 BIGINT
);

/* Query works fine for min values */
INSERT INTO int_table VALUES (
    -128,
    -32768,
    -8388608,
    -2147483648,
    -9223372036854775808 /* -2^63 */
);

/* Query works fine for max values */
INSERT INTO int_table VALUES (
    127,
    32767,
    8388607,
    2147483647,
    9223372036854775807 /* 2^63 - 1 */
);

SELECT * FROM int_table;

/* Out-of-Range and Overflow Handling */
INSERT INTO int_table (d1, d2) VALUES (
    256,
    32769 /* 2^15 + 1 */
);

/* Number attributes */
/* UNSIGNED */
DROP TABLE IF EXISTS unsigned_int_table;
CREATE TEMPORARY TABLE unsigned_int_table (
    d1 TINYINT  UNSIGNED,
    d2 SMALLINT UNSIGNED
);

/* No errors */
INSERT INTO unsigned_int_table VALUES (
    255,
    65535
);

SELECT * FROM unsigned_int_table;

/* Float and decimal table */
DROP TABLE IF EXISTS float_table;
CREATE TEMPORARY TABLE float_table (
    d1 FLOAT(2),
    d2 DOUBLE,
    d3 DECIMAL(5,2)
);

/* Out-of-Range and Overflow Handling */
INSERT INTO float_table (d1, d2, d3) VALUES (
    1444444.13,
    555555.5555555,
    101.11
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

/* AUTO_INCREMENT */
DROP TABLE IF EXISTS auto_increment_table;
CREATE TEMPORARY TABLE auto_increment_table (
    d1 SMALLINT AUTO_INCREMENT,
    d2 SMALLINT,
    PRIMARY KEY (d1)
);

INSERT INTO auto_increment_table VALUES (
    NULL,
    1
);

SELECT * FROM auto_increment_table;



