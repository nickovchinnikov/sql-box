/*
The convention used here is:

    Character-set name (utf8mb4)
    Language identifier (de,is etc)
    Unicode version (0900)
    Accent and case sensitivity (ai_ci means case and accent insensitive)

de_pb means German phone book. es_trad means ‘traditional Spain’.
*/
SHOW COLLATION LIKE 'utf8mb4%0900%';

SET NAMES utf8mb4;

/*
 However, with the newer utf8mb4_hr_0900_ai_ci collation, it sorts greater
*/
SELECT 'α' < 'а' COLLATE utf8mb4_hr_0900_ai_ci;

/*
 The Greek character ‘α’ (U+03B1) sorts less than
 Cyrillic character ‘а’ (U+0430) with the utf8mb4_hungarian_ci 
*/
SELECT 'α' < 'а' COLLATE utf8mb4_hungarian_ci;
