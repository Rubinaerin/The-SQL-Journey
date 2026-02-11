SET @number := 0;

SELECT REPEAT('* ', @number := @number + 1)
FROM INFORMATION_SCHEMA.TABLES
WHERE @number < 20;
