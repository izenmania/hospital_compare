DROP TABLE Measures;
CREATE TABLE Measures AS
SELECT
    ext_measures.measure_id,
    measure_name,
    CAST(measure_start_date AS TIMESTAMP) measure_start_date,
    CAST(measure_end_date AS TIMESTAMP) measure_end_date,
    ext_measures.measure_id IN("ED_1b", "ED_2b", "OP_1", "OP_18b", "OP_20", "OP_21", "OP_3b", "OP_5", "OP_22", "PC_01", "VTE_6") reverse_score,
    score_avg,
    score_sd
FROM ext_measures
    INNER JOIN (
        SELECT
            measure_id,
            AVG(CAST(score AS FLOAT)) score_avg,
            STDDEV_POP(CAST(score AS FLOAT)) score_sd
        FROM ext_effective_care
        GROUP BY measure_id
    ) effect ON effect.measure_id = ext_measures.measure_id
    
WHERE ext_measures.measure_id != "EDV"

UNION
    
SELECT
    ext_measures.measure_id,
    measure_name,
    CAST(measure_start_date AS TIMESTAMP) measure_start_date,
    CAST(measure_end_date AS TIMESTAMP) measure_end_date,
    TRUE reverse_score,
    score_avg,
    score_sd
FROM ext_measures
    INNER JOIN (
        SELECT measure_id,
            AVG(CAST(score AS FLOAT)) score_avg,
            STDDEV_POP(CAST(score AS FLOAT)) score_sd
        FROM ext_readmissions
        GROUP BY measure_id
    ) readmit ON readmit.measure_id = ext_measures.measure_id;