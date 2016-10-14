DROP TABLE Scores;
CREATE TABLE Scores AS
SELECT
    provider_id,
    eee.measure_id,
    CAST(IF(score == "Not Available", NULL, score) AS float) real_score,
    (IF(reverse_score, -1, 1) * (CAST(IF(score == "Not Available", NULL, score) AS float) - score_avg) / score_sd) std_score
FROM ext_effective_care eee
    INNER JOIN Measures m ON m.measure_id = eee.measure_id

WHERE eee.measure_id != "EDV"

UNION

SELECT
    provider_id,
    readmit.measure_id,
    CAST(IF(score == "Not Available", NULL, score) AS float) real_score,
    (IF(reverse_score, -1, 1) * (CAST(IF(score == "Not Available", NULL, score) AS float) - score_avg) / score_sd) std_score
FROM ext_readmissions readmit
    INNER JOIN Measures meas ON meas.measure_id = readmit.measure_id;