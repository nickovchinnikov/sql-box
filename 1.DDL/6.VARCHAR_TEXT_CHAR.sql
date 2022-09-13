USE employees;

/*
A TEXT column with a maximum length of 65,535 (2^16 − 1) characters

Values in VARCHAR columns are variable-length strings.
The length can be specified as a value from 0 to 65,535.

The effective maximum length of a VARCHAR is subject to the maximum
row size (65,535 bytes, which is shared among all columns)
*/

/* The CHAR and VARCHAR Types */
DROP TABLE IF EXISTS varchar_char;
CREATE TEMPORARY TABLE varchar_char
(
    vch VARCHAR(10) CHARACTER SET utf8mb4,
    txt TEXT CHARSET utf8mb4 COLLATE utf8mb4_general_ci,
    chr CHAR(10) CHARACTER SET latin1
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

INSERT INTO varchar_char VALUES
('abcef     ', 'abcef     ', 'abcef     ');

/* trailing spaces are removed from CHAR columns upon retrieval */
SELECT
    CONCAT('(', vch, ')'),
    CONCAT('(', chr, ')'),
    CONCAT('(', txt, ')')
FROM varchar_char;

/* Check the length */
SELECT
    CHAR_LENGTH(vch),
    CHAR_LENGTH(chr),
    CHAR_LENGTH(txt)
FROM varchar_char;


SELECT
    CONCAT('(', vch, ' | ', chr, ')')
FROM varchar_char;

/* Text overflow error */
INSERT INTO varchar_char VALUES
('abcefabcefabcef', 'abcefabcefabcef', 'abcefabcefabcef');

/* https://dev.mysql.com/doc/refman/8.0/en/char.html */


/* The BINARY and VARBINARY Types */
DROP TABLE IF EXISTS binary_varbinary;
CREATE TEMPORARY TABLE binary_varbinary
(
    bin BINARY(10),
    varbin VARBINARY(10)
);

INSERT INTO binary_varbinary VALUES
('abcef     ', 'abcef     ');

/* trailing spaces are removed from BINARY columns upon retrieval */
SELECT CONCAT('(', bin, ')'), CONCAT('(', varbin, ')') FROM binary_varbinary;

/* Check the length */
SELECT BIT_LENGTH(bin), BIT_LENGTH(varbin) FROM binary_varbinary;

/* Cast bin to CHAR */
SELECT CAST(bin AS CHAR), CAST(varbin AS CHAR) FROM binary_varbinary;

/*
    If the value retrieved must be the same as the value
    specified for storage with no padding, it might be
    preferable to use VARBINARY or one of the BLOB data
    types instead. 
*/

/* Text overflow error */
INSERT INTO binary_varbinary VALUES
('abcefabcefabcef', 'abcefabcefabcef');
