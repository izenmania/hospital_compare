SELECT p.state, COUNT(DISTINCT p.provider_id), 
    ROUND(AVG(s.std_score), 2), ROUND(SUM(CAST(s.std_score > 0 AS INT))/COUNT(s.std_score), 2),
    ROUND(MIN(s.std_score), 2), ROUND(MAX(s.std_score), 2)
FROM Providers p
    INNER JOIN Scores s ON s.provider_id = p.provider_id
GROUP BY p.state
ORDER BY AVG(s.std_score) DESC
LIMIT 10;