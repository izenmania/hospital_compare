DROP TABLE SurveyResults;
CREATE TABLE SurveyResults AS
SELECT
    provider_id,
    CAST(SPLIT(comm_nurse_achieve, ' ')[0] AS FLOAT) comm_nurse,
    CAST(SPLIT(comm_doctor_achieve, ' ')[0] AS FLOAT) comm_doctor,
    CAST(SPLIT(staff_response_achieve, ' ')[0] AS FLOAT) staff_response,
    CAST(SPLIT(pain_management_achieve, ' ')[0] AS FLOAT) pain_management,
    CAST(SPLIT(comm_medicine_achieve, ' ')[0] AS FLOAT) comm_medicine,
    CAST(SPLIT(clean_quiet_achieve, ' ')[0] AS FLOAT) clean_quiet,
    CAST(SPLIT(discharge_info_achieve, ' ')[0] AS FLOAT) discharge_info,
    CAST(SPLIT(hospital_overall_achieve, ' ')[0] AS FLOAT) hospital_overall
FROM ext_survey_responses;