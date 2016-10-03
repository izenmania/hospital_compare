SELECT
    p.provider_id,
    p.hospital_name,
    avg_scores.avg_score,
    s.hospital_overall/10
FROM Providers p
    INNER JOIN (
        SELECT provider_id, avg(std_score) avg_score
        FROM Scores
        GROUP BY provider_id
    ) avg_scores ON avg_scores.provider_id = p.provider_id
    LEFT JOIN SurveyResults s ON s.provider_id = p.provider_id
ORDER BY avg_scores.avg_score DESC
LIMIT 10;