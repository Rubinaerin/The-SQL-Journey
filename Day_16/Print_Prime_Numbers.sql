WITH RECURSIVE Numbers AS (
    SELECT 2 AS n
    UNION ALL
    SELECT n + 1 FROM Numbers WHERE n < 1000
)
SELECT GROUP_CONCAT(n SEPARATOR '&')
FROM Numbers n1
WHERE NOT EXISTS (
    SELECT 1 
    FROM Numbers n2 
    WHERE n2.n <= SQRT(n1.n) AND n1.n % n2.n = 0 AND n1.n <> n2.n
);
