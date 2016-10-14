SELECT ROUND(CORR(ps.score, sr.hospital_overall), 2), ROUND(CORR(ps.dev, sr.hospital_overall), 2)
FROM (
    SELECT p.provider_id, AVG(s.std_score) score, STDDEV(s.std_score) dev
    FROM Providers p
        INNER JOIN Scores s ON s.provider_id = p.provider_id
    GROUP BY p.provider_id
    ) ps
    INNER JOIN SurveyResults sr ON sr.provider_id = ps.provider_id
WHERE sr.hospital_overall IS NOT NULL;