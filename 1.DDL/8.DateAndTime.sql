USE employees;

/* Date and Time Data Types */
DROP TABLE IF EXISTS date_and_time_table;
CREATE TEMPORARY TABLE date_and_time_table (
    date_ DATE,
    datetime_ DATETIME,
    timestamp_ TIMESTAMP,
    time_ TIME,
    year_ YEAR
);

/* Insert min values */
INSERT INTO date_and_time_table VALUES (
    '1000-01-01',
    '1000-01-01 00:00:00',
    '1970-01-01 01:00:01',
    '12:00:00',
    '1901'
);

/* Insert max values */
INSERT INTO date_and_time_table VALUES (
    '9999-12-31',
    '9999-12-31 23:59:59',
    '2038-01-19 03:14:07',
    '23:59:59',
    '2155'
);


SELECT * FROM date_and_time_table;


/* Overflow handling */
INSERT INTO date_and_time_table VALUES (
    '9999-12-32',
    '1000-01-01 00:00:00',
    '1970-01-01 01:00:01',
    '25:00:00',
    '10000'
);


/* Date and Time with fractional seconds part (fsp) */
DROP TABLE IF EXISTS date_time_fsp;
CREATE TEMPORARY TABLE date_time_fsp (
    time_ TIME(3),
    datatime_ DATETIME(6),
    timestamp_ TIMESTAMP(0)
);

INSERT INTO date_time_fsp VALUES (
    '12:00:00.111',
    '2000-01-01 00:00:00.111234',
    '2000-01-01 00:00:00.111234'
);

SELECT * FROM date_time_fsp;

