USE employees;

/* Default values and ON UPDATE action */
DROP TABLE IF EXISTS default_values;
CREATE TEMPORARY TABLE default_values (
  dummy_id INT,
  int_ INT DEFAULT 0,
  string_ VARCHAR(10) DEFAULT 'STR',
  enum_fld ENUM('Yes', 'No') DEFAULT 'No',
  timestamp_ TIMESTAMP DEFAULT NULL,
  timestamp_current TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  datetime_on_update DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO default_values (dummy_id) VALUES (0);

SELECT * FROM default_values;

UPDATE default_values
    SET timestamp_ = '1970-01-01 01:00:01'
    WHERE dummy_id = 0;

SELECT * FROM default_values;
