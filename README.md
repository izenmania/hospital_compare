# hospital_compare

## Data loading

Before running load_data_lake.sh, please place the following data files in the data/ folder, at the root of this repository.

* HCAHPS - Hospital.csv
* Hospital General Information.csv
* hvbp_hcahps_05_28_2015.csv
* Measure Dates.csv
* Readmissions and Deaths - Hospital.csv
* Timely and Effective Care - Hospital.csv
* Timely and Effective Care - National.csv
* Timely and Effective Care - State.csv

Alternately, you should be able to put all of the files here, rather than just this subset.

The load_data_lake.sh script should be run from its own directory, since it relies on relative paths to find the data files.