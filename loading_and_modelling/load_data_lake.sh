#!/bin/bash

# Rename files in ../data/, and strip the header lines
mkdir ../data/tmp
tail -n +2 ../data/HCAHPS\ -\ Hospital.csv > ../data/tmp/hospital_surveys.csv
tail -n +2 ../data/Hospital\ General\ Information.csv > ../data/tmp/hospitals.csv
tail -n +2 ../data/hvbp_hcahps_05_28_2015.csv > ../data/tmp/survey_responses.csv
tail -n +2 ../data/Measure\ Dates.csv > ../data/tmp/measures.csv
tail -n +2 ../data/Readmissions\ and\ Deaths\ -\ Hospital.csv > ../data/tmp/readmissions.csv
tail -n +2 ../data/Timely\ and\ Effective\ Care\ -\ Hospital.csv > ../data/tmp/effective_care.csv
tail -n +2 ../data/Timely\ and\ Effective\ Care\ -\ National.csv > ../data/tmp/effective_care_national.csv
tail -n +2 ../data/Timely\ and\ Effective\ Care\ -\ State.csv > ../data/tmp/effective_care_state.csv
rm ../data/*.csv
mv ../data/tmp/* ../data/
rmdir ../data/tmp

# Create the HDFS directory for this data
hdfs dfs -mkdir /user/w205/hospital_compare

# Push contents of ../data/ to HDFS
hdfs dfs -put ../data/* /user/w205/hospital_compare/
