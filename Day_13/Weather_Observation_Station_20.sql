SET @rowindex := -1;

SELECT ROUND(AVG(lat_n), 4)
FROM (
    SELECT @rowindex := @rowindex + 1 AS rowindex, lat_n
    FROM STATION
    ORDER BY lat_n
) AS sorted_list
WHERE sorted_list.rowindex IN (
    FLOOR(@rowindex / 2), 
    CEIL(@rowindex / 2)
);
