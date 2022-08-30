/* Type Conversion in Expression Evaluation */
SELECT 1+'1';
SELECT CONCAT(2,' test');

/** Equals and Data Casting */
SELECT 20 = 10;
SELECT '20' = 20;
SELECT '10.0' = 10;
SELECT '0.01' = 0;
SELECT '.01' = 0.01;

/* Problems when compare with NULL */
SELECT 1 = 1, NULL = NULL, 1 = NULL;

/* NULL-safe equal */
SELECT 1 <=> 1, NULL <=> NULL, 1 <=> NULL;

/* Not equals */
SELECT '.01' <> '0.01';
SELECT '.01' != '0.01';

SELECT 'ascv' <> 'ascvv';


/* Less/Greater , LE/GE */
SELECT 0.1 <= 2;
SELECT 2 < 2;

SELECT 2 >= 2;
SELECT 2 > 2;

/* Between */
SELECT 2 BETWEEN 1 AND 3, 2 BETWEEN 3 and 1;
SELECT 2 NOT BETWEEN 1 AND 5, 2 BETWEEN 3 and 1;

/* Returns the first non-NULL value in the list or NULL if there are no non-NULL values */
SELECT COALESCE(NULL,1,NULL);
SELECT COALESCE(NULL,NULL,NULL);

/* GREATEST / LEAST */
SELECT GREATEST(10, 20);
SELECT GREATEST(40.0, 30.0, 5.0, 900.0);
SELECT GREATEST('B','A','C');

SELECT LEAST(10, 20);
SELECT LEAST(40.0, 30.0, 5.0, 900.0);
SELECT LEAST('B','A','C');

/* IN */
SELECT 2 IN (0,5,50,70);
SELECT 'test' IN ('tees','ttee','set','test');

SELECT (3,4) IN ((1,2), (3,4));
SELECT (3,4) IN ((1,2), (3,5));

/* Tests a value against a boolean value */
SELECT 1 IS TRUE, 0 IS FALSE, NULL IS UNKNOWN;

SELECT 1 IS NOT UNKNOWN, 0 IS NOT UNKNOWN, NULL IS NOT UNKNOWN;

SELECT 1 IS NULL, 0 IS NULL, NULL IS NULL;
SELECT 1 IS NOT NULL, 0 IS NOT NULL, NULL IS NOT NULL;

/* If expr is NULL, ISNULL() returns 1, otherwise it returns 0. */
SELECT ISNULL(1+1);
SELECT ISNULL(1/0);

/* Like */
SELECT 'ä' LIKE 'ae' COLLATE latin1_german2_ci;

SELECT 'ä' = 'ae' COLLATE latin1_german2_ci;

/*
    % matches any number of characters, even zero characters.
    _ matches exactly one character. 
*/
SELECT 'David!' LIKE 'David_';
SELECT 'David!' LIKE '%D%v%';

/*
The following two statements illustrate that string comparisons are not case-sensitive unless one of the operands is case-sensitive (uses a case-sensitive collation or is a binary string): 
*/
SELECT 'abc' LIKE 'ABC';
SELECT 'abc' LIKE _utf8mb4 'ABC' COLLATE utf8mb4_0900_as_cs;
SELECT 'abc' LIKE _utf8mb4 'ABC' COLLATE utf8mb4_bin;
SELECT 'abc' LIKE BINARY 'ABC';


SELECT 10 LIKE '1%';
