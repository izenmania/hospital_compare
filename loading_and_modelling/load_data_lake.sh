#!/bin/bash

## TODO: incorporate better paths

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

# Import all csv files from the data folder into their own folders in hdfs
ls -1 ../data/ | awk -F"." '{ print $1 }' | xargs -I {} hdfs dfs -mkdir -p /user/w205/hospital_compare/{}
ls -1 ../data/ | awk -F"." '{ print $1 }' | xargs -I {} hdfs dfs -put ../data/{}.csv /user/w205/hospital_compare/{}/
