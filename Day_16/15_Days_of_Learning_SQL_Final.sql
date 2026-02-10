SELECT 
    submission_date,
    (SELECT COUNT(DISTINCT hacker_id)  
     FROM Submissions s2  
     WHERE s2.submission_date = s1.submission_date 
       AND (SELECT COUNT(DISTINCT s3.submission_date) 
            FROM Submissions s3 
            WHERE s3.hacker_id = s2.hacker_id 
              AND s3.submission_date < s1.submission_date) = DATEDIFF(s1.submission_date, '2016-03-01')),
    (SELECT hacker_id 
     FROM Submissions s2 
     WHERE s2.submission_date = s1.submission_date 
     GROUP BY hacker_id 
     ORDER BY COUNT(submission_id) DESC, hacker_id ASC 
     LIMIT 1) AS leader_id,
    (SELECT name FROM Hackers WHERE hacker_id = leader_id)
FROM (SELECT DISTINCT submission_date FROM Submissions) s1
ORDER BY submission_date;
