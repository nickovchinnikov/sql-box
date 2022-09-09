SHOW DATABASES;

USE employees;

/* Numeric DataTypes */
DROP TABLE IF EXISTS int_table;
CREATE TEMPORARY TABLE int_table (
    tiny_int TINYINT,
    small_int SMALLINT,
    medium_int MEDIUMINT,
    _int INT,
    big_int BIGINT
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
INSERT INTO int_table (tiny_int) VALUES (
    256,
    32769 /* 2^15 + 1 */
);

/* Number attributes */
/* UNSIGNED */
DROP TABLE IF EXISTS unsigned_int_table;
CREATE TEMPORARY TABLE unsigned_int_table (
    tiny_int_u TINYINT  UNSIGNED,
    small_int_u SMALLINT UNSIGNED
);

/* No errors */
INSERT INTO unsigned_int_table VALUES (
    255,
    65535
);

/* Overflow error for the negative values */
INSERT INTO unsigned_int_table VALUES (
    -255,
    -65535
);

SELECT * FROM unsigned_int_table;

/* AUTO_INCREMENT */
DROP TABLE IF EXISTS auto_increment_table;
CREATE TEMPORARY TABLE auto_increment_table (
    d1 SMALLINT AUTO_INCREMENT,
    d2 SMALLINT,
    PRIMARY KEY (d1)
);

INSERT INTO auto_increment_table (d2) VALUES (
    1
);

SELECT * FROM auto_increment_table;
