DROP TABLE ext_effective_care;
CREATE EXTERNAL TABLE ext_effective_care(
	provider_id STRING,
	hospital_name STRING,
	address STRING,
	city STRING,
	state STRING,
	zip_code STRING,
	county STRING,
	phone STRING,
	condition STRING,
	measure_id STRING,
	measure_name STRING,
	score STRING,
	sample INT,
	footnote STRING,
	measure_start_date STRING,
	measure_end_date STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"separatorChar" = ",",
	"quoteChar" = '"',
	"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care';



DROP TABLE ext_effective_care_national;
CREATE EXTERNAL TABLE ext_effective_care_national(
	measure_name STRING,
	measure_id STRING,
	condition STRING,
	category STRING
	score STRING,
	footnote STRING,
	measure_start_date date,
	measure_end_date date
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"separatorChar" = ",",
	"quoteChar" = '"',
	"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care_national';



DROP TABLE ext_effective_care_state;
CREATE EXTERNAL TABLE ext_effective_care_state(
	state,
	condition,
	measure_name,
	measure_id,
	score,
	footnote,
	measure_start_date,
	measure_end_date
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"separatorChar" = ",",
	"quoteChar" = '"',
	"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care_state';



DROP TABLE ext_hospital_surveys;
CREATE EXTERNAL TABLE ext_hospital_surveys(
	provider_id STRING,
	hospital_name STRING,
	address STRING,
	city STRING,
	state STRING,
	zip_code STRING,
	county STRING,
	phone STRING,
	hcahps_measure_id STRING,
	hcahps_question STRING,
	hcahps_answer_desc STRING,
	patient_survey_star_rating STRING,
	patient_survey_star_rating_footnote STRING,
	hcahps_answer_percent INT,
	hcahps_answer_percent_footnote STRING,
	number_completed_surveys INT,
	number_completed_surveys_footnote STRING,
	survey_response_rate_percent INT,
	survey_response_rate_percent_footnote STRING,
	measure_start_date TIMESTAMP,
	measure_end_date TIMESTAMP
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"separatorChar" = ",",
	"quoteChar" = '"',
	"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospital_surveys';



DROP TABLE ext_hospitals;
CREATE EXTERNAL TABLE ext_hospitals(
	provider_id STRING,
	hospital_name STRING,
	address, STRING,
	city, STRING,
	state, STRING,
	zip_code STRING,
	county STRING,
	phone STRING,
	type STRING,
	ownership STRING,
	emergency_services STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"separatorChar" = ",",
	"quoteChar" = '"',
	"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';



DROP TABLE ext_measures;
CREATE EXTERNAL TABLE ext_measures(
	measure_name STRING,
	measure_id STRING,
	measure_start_quarter STRING,
	measure_start_date TIMESTAMP,
	measure_end_quarter STRING,
	measure_end_date TIMESTAMP
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"separatorChar" = ",",
	"quoteChar" = '"',
	"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures';



DROP TABLE ext_readmissions;
CREATE EXTERNAL TABLE ext_readmissions(
	provider_id STRING,
	hospital_name STRING,
	address STRING,
	city STRING,
	state STRING,
	zip_code STRING,
	county STRING,
	phone STRING,
	measure_name STRING,
	measure_id STRING,
	compared_to_national STRING,
	denominator INT,
	score STRING,
	lower_estimate STRING,
	higher_estimate STRING,
	footnote STRING,
	measure_start_date TIMESTAMP,
	measure_end_date TIMESTAMP
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"separatorChar" = ",",
	"quoteChar" = '"',
	"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions';



DROP TABLE ext_survey_responses;
CREATE EXTERNAL TABLE ext_survey_responses(
	provider_id STRING,
	hospital_name STRING,
	address STRING,
	city STRING,
	state STRING,
	zip_code STRING,
	county STRING,
	comm_nurse_achieve STRING,
	comm_nurse_improve STRING,
	comm_nurse_dimension STRING,
	comm_doctor_achieve STRING,
	comm_doctor_improve STRING,
	comm_doctor_dimension STRING,
	staff_response_achieve STRING,
	staff_response_improve STRING,
	staff_response_dimension STRING,
	pain_management_achieve STRING,
	pain_management_improve STRING,
	pain_management_dimension STRING,
	comm_medicine_achieve STRING,
	comm_medicine_improve STRING,
	comm_medicine_dimension STRING,
	clean_quiet_achieve STRING,
	clean_quiet_improve STRING,
	clean_quiet_dimension STRING,
	discharge_info_achieve STRING,
	discharge_info_improve STRING,
	discharge_info_dimension STRING,
	hospital_overall_achieve STRING,
	hospital_overall_improve STRING,
	hospital_overall_dimension STRING,
	hcahps_base_score STRING,
	hcahps_consistency_score STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"separatorChar" = ",",
	"quoteChar" = '"',
	"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/survey_responses';