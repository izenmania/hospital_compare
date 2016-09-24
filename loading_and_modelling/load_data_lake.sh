#!/bin/bash

# Rename files in ../data/
#mv ../data/HCAHPS\ -\ Hospital.csv ../data/hospital_surveys.csv
#mv ../data/Hospital\ General\ Information.csv ../data/hospitals.csv
#mv ../data/hvbp_hcahps_05_28_2015.csv ../data/survey_responses.csv
#mv ../data/Measure\ Dates.csv ../data/measures.csv
#mv ../data/Readmissions\ and\ Deaths\ -\ Hospital.csv ../data/readmissions.csv
#mv ../data/Timely\ and\ Effective\ Care\ -\ Hospital.csv ../data/effective_care.csv
#mv ../data/Timely\ and\ Effective\ Care\ -\ National.csv ../data/effective_care_national.csv
#mv ../data/Timely\ and\ Effective\ Care\ -\ State.csv ../data/effective_care_state.csv

# Create the HDFS directory for this data
hdfs dfs -mkdir /user/w205/hospital_compare

# Push contents of ../data/ to HDFS
hdfs dfs -put ../data/* /user/w205/hospital_compare/
