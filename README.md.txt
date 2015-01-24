==============================================================================================
Wearable Company Analysis
==============================================================================================
One of the most exciting areas in all of data science right now is wearable computin. Companies 
are racing to develop the most advanced algorithms to attract new users.

The purpose of this project is to create a tidy dataset for Wearable Company in order to do 
further analysis for it. For more information about the company business check the below address
 
http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/

Data has been collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

to get the full data for the project go to: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

All project's files are available on:
https://github.com/Amalda/GettingandCleaningData

GettingandCleaningData repository includes the following files:
===============================================================
- README.md
- run_analysis.R : The script written to do the following:
		- Merges the training and the test sets to create one data set.
		- Extracts only the measurements on the mean and standard deviation for each measurement. 
		- Uses descriptive activity names to name the activities in the data set
		- Appropriately labels the data set with descriptive variable names. 
		- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

- UCI HAR Code Book.md : which describes the variables, the data, and work performed to clean up the data

Steps to run the project
========================
-Get project data from the below link
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

-Unzip the source data into you working directory and make sure that folder name is "UCI HAR Dataset"

-Put "run_analysis.R" file in your working directory

-In RStudio run the following command: 
    source("run_analysis.R")

-You can check the generated files on your working directory 
 step 4 result --> cleanData.txt
 step 5 result --> avgData.txt

Or you can read the final dataset on RStudio by running the below Command:
 result <- read.table("avgData.txt",header=TRUE)