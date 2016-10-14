SELECT p.provider_id, FIRST(p.hospital_name),
    ROUND(SUM(s.std_score)/52, 2), ROUND(avg(s.std_score), 2), 
    ROUND(min(s.std_score), 2), ROUND(max(s.std_score), 2), 
    count(s.std_score)
FROM Providers p
    INNER JOIN Scores s ON s.provider_id = p.provider_id
GROUP BY p.provider_id
ORDER BY sum(s.std_score) DESC
LIMIT 10;