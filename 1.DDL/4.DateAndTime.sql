SHOW DATABASES;

USE employees;

/* Date and Time Data Types */
DROP TABLE IF EXISTS date_and_time_table;
CREATE TEMPORARY TABLE date_and_time_table (
    d1 DATE,
    d2 DATETIME,
    d3 TIMESTAMP,
    d4 TIME,
    d5 YEAR
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
    t TIME(3),
    dt DATETIME(6),
    ts TIMESTAMP(0)
);

INSERT INTO date_time_fsp VALUES (
    '12:00:00.111',
    '2000-01-01 00:00:00.111234',
    '2000-01-01 00:00:00'
);

SELECT * FROM date_time_fsp;


INSERT INTO date_time_fsp VALUES (
    '12:00:00.111',
    '2000-01-01 00:00:00.111234',
    '2000-01-01 00:00:00.111234'
);


/* Default values and ON UPDATE action */
DROP TABLE IF EXISTS timestamp_and_datetime;
CREATE TEMPORARY TABLE timestamp_and_datetime (
  id INT,
  dint INT DEFAULT 0,
  ts TIMESTAMP DEFAULT NULL,
  ts_default TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  dt_update DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

INSERT INTO timestamp_and_datetime (id) VALUES (0);

SELECT * FROM timestamp_and_datetime;

UPDATE timestamp_and_datetime
    SET ts = '1970-01-01 01:00:01'
    WHERE id = 0;

SELECT * FROM timestamp_and_datetime;


/* Default value and action on update */
DROP TABLE IF EXISTS date_and_time_table;
CREATE TEMPORARY TABLE date_and_time_table (
  id INT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  dt DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

SELECT * FROM date_and_time_table;

INSERT INTO date_and_time_table (id) VALUES (1);

SELECT * FROM date_and_time_table;

UPDATE date_and_time_table SET id = 2 WHERE id = 1;

SELECT * FROM date_and_time_table;

