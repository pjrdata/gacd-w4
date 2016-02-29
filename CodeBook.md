#Assignment: Getting and Cleaning Data - Course Project
##CodeBook file - describing the analysis code

by Peter Robinson, February 2016

##Tidying the Movement Tracking Data

To avoid repeatedly downloading the large data file, the process is broken into two phases and for this there are two scripts, the first downloads and unzips the data file and the second processes and tidies the data after it's been unzipped.

##download.R
This file downloads and unzips the data file.
It saves the working directory, changes to the required directory, downloads the zipped data file, unzips the zipped data file and then restores the working directory.

###Variables used
1 wd - this is used to store the current working directory so it can be restored at the end of the execution of the script.

##run_analysis.R
This file merges and cleans the data, writes out a tidy version of the merged data and then summarises it and writes out that summary data.

###Variables used
1 wd - this is used to store the current working directory so it can be restored at the end of the execution of the script.

2 test.data, test.label and test.subject are the three data frames that store the test observations, their activity labels and subject numbers. They are read from the unzipped data files.

3 train.data, train.label and train.subject are the three data frames that store the training observations, their activity labels and subject numbers. They are read from the unzipped data files.

4 all.data, all.label and all.subject are the three data frames that store the merged test and training observations, their activity labels and subject numbers. These are produced by usng the rbind function which appends the test and train data.

5 feature.labels contains the column names for the observation data that was read and merged. It stores each feature label as a row; the feature number is column 1 and the feature name is column 2.

6 feature.set contains the row numbers of all the feature labels that are averages or standard deviation values. It is produced by using grep to search the feature.labels for rows that contain either avg() or std(). It is later used to select the required label names.

7 activity.labels contains the names of the various activities found in the observation data that was read and merged. It stores each activity label as a row; the activity number is column 1 and the activity name is column 2.

8 all.activities is a vector that contains the activity name for each of the observations in the merged dataset. The activity names are looked up in the activity.labels data using the activity number associated with each of the observations. These activity names are to be merged into the observation data.

9 all.aggregate contains the summary or the merged data, by subject and activity and contains the mean of each of the columns (mean & std) that were selected previously.


###Naming the columns in the observation data

First the feature labels were read and used to select the required columns, then name the columns with the default names from the label file. After that, the following steps were taken in tidying the set of data produced by merging the training and test data sets.

1 remove "()" from the column names
2 replace "t" and "f" at the start of each line with "time" and "frequency"
3 replace a number of partial words with their full version for readability
4 hyphens were included at the end of each replacement to make the column names more readable and so a final step of removing some extra hypens is required by replacing -- with -

###Output files
There are two files produced by the analysis.
1. merged_data.csv contains the merged, cleaned and tidied data, written out to a csv file for re-use and for validation that it is correct. this file is the result of parts 1-4 of the assignment.
2. aggregate_data.csv contains the final output from the summary by activity and subject as requested in part 4 of the assignment

##Reproducing the results
To reproduce this analysis, perform the following steps
1. edit the setwd command in the second line of the download.R script to point to the desired working directory
2. run the download.R script
3. edit the setwd command in the second line of the run_analysis.R script to point to the same working directory where the zip file was downloaded in step 1 & 2
4. run the run_analysis.R script
5. review the output csv files
