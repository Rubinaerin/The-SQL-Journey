SELECT h.hacker_id, h.name, COUNT(c.challenge_id) AS c_count
FROM Hackers h
JOIN Challenges c ON h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
HAVING c_count = (
    -- 1. KOSUL: Maksimum sayıyı bulan alt sorgu
    SELECT MAX(temp.cnt)
    FROM (
        SELECT COUNT(challenge_id) AS cnt
        FROM Challenges
        GROUP BY hacker_id
    ) temp
)
OR c_count IN (
    -- 2. KOSUL: Sadece 1 kişinin ürettiği sayıları bulan alt sorgu (Unique counts)
    SELECT temp2.cnt
    FROM (
        SELECT COUNT(challenge_id) AS cnt
        FROM Challenges
        GROUP BY hacker_id
    ) temp2
    GROUP BY temp2.cnt
    HAVING COUNT(temp2.cnt) = 1
)
ORDER BY c_count DESC, h.hacker_id;
