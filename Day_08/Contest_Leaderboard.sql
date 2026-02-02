SELECT h.hacker_id, h.name, SUM(max_scores.max_s) AS total_score
FROM Hackers h
JOIN (
    SELECT hacker_id, challenge_id, MAX(score) AS max_s
    FROM Submissions
    GROUP BY hacker_id, challenge_id
) AS max_scores ON h.hacker_id = max_scores.hacker_id
GROUP BY h.hacker_id, h.name
HAVING total_score > 0
ORDER BY total_score DESC, h.hacker_id ASC;
