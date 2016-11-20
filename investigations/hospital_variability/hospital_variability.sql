SELECT m.measure_id, FIRST(m.measure_name), ROUND(FIRST(m.score_avg), 2) avg, ROUND(FIRST(m.score_sd), 2) sd,
    ROUND(MAX(s.std_score) - MIN(s.std_score), 2) range
FROM Measures m
    INNER JOIN Scores s ON s.measure_id = m.measure_id
WHERE !m.reverse_score
GROUP BY m.measure_id
ORDER BY sd DESC
LIMIT 10;