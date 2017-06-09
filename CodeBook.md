Getting and Cleaning data project
Overview - This project aims at creating a tidy data set for futher analysis. Please refer to the readme file for instructions
Source data - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The data was obtained from : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Below is some information that will be useful to run the script:

1 - Download and extract the zip file in your current working directly. Copy the folder UCI HAR Dataset in your current working directory for the code to run without modeifcation
2 - Once the files are extracted. the data from the training and test files(set and labels) are merged together followed by the merging of the subject files
3 - After that only mean and standard deviation data is extracted from the train and test data
4 - Descritive names are given to the columns in label ans subject dataset
5- All the three data sets are merged together and decriptive names are given to columns where relevant
6- After that the data is aggregated and ordered at the subject activity level
7 - The output file has been uploaded as tidydata.txt

Dataset name - tidydata.txt
Variables: Subject, Activity - Same as the source read me V1-V543 - mean of test values at subject and activity level
