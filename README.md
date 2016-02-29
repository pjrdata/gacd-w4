#Assignment: Getting and Cleaning Data - Course Project
##Readme File - describing the cleaning process

by Peter Robinson, February 2016

##Tidying the Movement Tracking Data

To avoid repeatedly downloading the large data file, the process is broken into two phases and for this there are two scripts, the first downloads and unzips the data file and the second processes and tidies the data after it's been unzipped.

##download.R
This file downloads and unzips the data file.

##run_analysis.R
This file merges and cleans the data, writes out a tidy version of the merged data and then summarises it and writes out that summary data.

###Tidying the data files
There are three main rules for tidy data and the following sections list them and describe how this analysis has met the criteria:

1 Each variable forms a column.
Reviewing the merged dataset, there were no columns that had multiple types of data within them. All columns contained just a single column, or type of data and the process did not change that in any way. There are some variables with names that at first appear to encode some sort of value in the header (eg body, gravity, gyroscope) but I decided they are actually just the names of the variables and it was tidier to not split them into separate rows.

2 Each observation forms a row.
I considered splitting some of the rows into different classes of data (eg by body, gravity and gyroscope), but they are all variables related to a single observation so, even though they could be split apart, it is tidier to keep them together.

3 Each type of observational unit forms a table.
There were two sets of data, the training set and the test set. These two sets were merged so that all the data rows were in a single data set or file.
Related to that set of observations were two other files, one contained the Activity names and the other was the Subject details. These were merged into the one data set so that all the variables related to each observation could be kept together.
Additionally, the variable names were stored in a separate file so these were read and the columns named appropriately (with some cleaning up of the names so they were more readable)

###Output files
There are four files produced by the analysis, two csv and two txt files.

1 merged_data.txt contains the merged, cleaned and tidied data, written out to a text file. It is for validation. This file is the intermediate result of parts 1-4 of the assignment.

2 merged_data.csv is a comma separated version of the text data file of the same name. This one is produced because it's easier to open in ms excel for viewing/validation.

3 aggregate_data.txt contains the final output from the summary by activity and subject. It is the file requested in part 5 of the assignment

4 aggregate_data.csv is a comma separated version of the text data file of the same name. This one is produced because it's easier to open in ms excel for viewing/validation.
