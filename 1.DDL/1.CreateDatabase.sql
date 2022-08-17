DROP DATABASE IF EXISTS employees;
CREATE DATABASE IF NOT EXISTS employees CHARACTER SET UTF8 COLLATE utf8_unicode_ci;
SHOW DATABASES;

SHOW CREATE DATABASE employees;

USE employees;
/* Show character set for the schema */
SELECT @@character_set_database, @@collation_database;
