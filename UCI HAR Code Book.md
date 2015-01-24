=========================
UCI HAR Project Code Book
=========================
The original data have been collected from the address: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The R script (run_analysis.R) prepares a tidy data set through the following steps:
-----------------------------------------------------------------------------------
1. Merges the training and test sets to create one data set as follow: 

	- train/X_train.txt with test/X_test.txt:
	the result of which is a 10299x561 ("Number of Instances: 10299" and "Number of Attributes: 561") data frame, 

	- train/subject_train.txt with test/subject_test.txt:
	the result of which is a 10299x1 ("Number of Instances: 10299" and "Number of Subjects: 1") data frame with subject IDs

	- train/y_train.txt with test/y_test.txt: 
	the result of which is also a 10299x1 ("Number of Instances: 10299" and "Number of Activities: 1") data frame with activity IDs.

2. Reads features.txt and extracts only the measurements on the mean and standard deviation for each measurement. 
The result is a 10299x66 data frame, because only 66 out of 561 attributes are measurements on the mean and 
standard deviation. All measurements appear to be floating point numbers in the range (-1, 1).

3. Reads activity_labels.txt and applies descriptive activity names to name activities in the data set:

	- WALKING
 	- WALKING UPSTAIRS
	- WALKING DOWNSTRAIRS
	- SITTING
	- STANDING
	- LAYING

4. Labels the data set with descriptive names appropriately; 
	- underscores and brackets () are removed. 

Then it merges the 10299x66 data frame containing features with 10299x1 data frames containing activity labels 
and subject IDs into a 10299x68 data frame. The result will be exposed into a file named: cleanData.txt 

5. The script creates a 2nd independent tidy data set with the average of each measurement for each activity 
and each subject. There are 30 subjects and 6 activities, thus 180 rows will be generated. 
The result is written into a file named avgData.txt with a 180x68 data frame

Resulting Files Dectionary
--------------------------
Notes: 
 - Variables from 3 to the end indicate a single value in cleanData.txt and avarage value in avgData.txt
 - prefix 't' to denote time
 - prefix 'f' to indicate frequency domain signals

Variables:
----------
- Subject : contains the subject who performed the activity. values are between 1 and 30
- Activity: Activity descrition. There are 6 different activities mentioned above.- 
- tBodyAcc-mean-X : mean of time body acceleration in the x-axis
- tBodyAcc-mean-Y : mean of time body acceleration in the y-axis
- tBodyAcc-mean-Z : mean of time body acceleration in the z-axis
- tBodyAcc-std-X 	: standard deviation of time body acceleration in the x-axis
- tBodyAcc-std-Y 	: standard deviation of time body acceleration in the y-axis
- tBodyAcc-std-Z 	: standard deviation of time body acceleration in the z-axis
- tGravityAcc-mean-X : mean of time gravity acceleration in the x-axis
- tGravityAcc-mean-Y : mean of time gravity acceleration in the y-axis
- tGravityAcc-mean-Z : mean of time gravity acceleration in the z-axis
- tGravityAcc-std-X  : standard deviation of time gravity acceleration in the x-axis
- tGravityAcc-std-Y  : standard deviation of time gravity acceleration in the y-axis
- tGravityAcc-std-Z  : standard deviation of time gravity acceleration in the z-axis
- tBodyAccJerk-mean-X : mean of body acceleration Jerk signal in the x-axis
- tBodyAccJerk-mean-Y : mean of body acceleration Jerk signal in the y-axis
- tBodyAccJerk-mean-Z : mean of body acceleration Jerk signal in the z-axis
- tBodyAccJerk-std-X  : standard deviation of body acceleration Jerk signal in the x-axis
- tBodyAccJerk-std-Y  : standard deviation of body acceleration Jerk signal in the y-axis
- tBodyAccJerk-std-Z  : standard deviation of body acceleration Jerk signal in the z-axis
- tBodyGyro-mean-X : mean of body gyro signal in the x-axis
- tBodyGyro-mean-Y : mean of body gyro signal in the y-axis
- tBodyGyro-mean-Z : mean of body gyro signal in the z-axis
- tBodyGyro-std-X : standard deviation of body gyro signal in the x-axis
- tBodyGyro-std-Y : standard deviation of body gyro signal in the y-axis
- tBodyGyro-std-Z	: standard deviation of body gyro signal in the z-axis
- tBodyGyroJerk-mean-X : mean of body gyro Jerk signal in the x-axis
- tBodyGyroJerk-mean-Y : mean of body gyro Jerk signal in the y-axis
- tBodyGyroJerk-mean-Z : mean of body gyro Jerk signal in the z-axis
- tBodyGyroJerk-std-X  : standard deviation of body gyro Jerk signal in the x-axis
- tBodyGyroJerk-std-Y  : standard deviation of body gyro Jerk signal in the y-axis
- tBodyGyroJerk-std-Z  : standard deviation of body gyro Jerk signal in the z-axis
- tBodyAccMag-mean : mean of magnitude of body acceleration
- tBodyAccMag-std  : standard deviation of body of gravity acceleration
- tGravityAccMag-mean : mean of magnitude of magnitude acceleration
- tGravityAccMag-std  : standard deviation of magnitude of gravity acceleration
- tBodyAccJerkMag-mean : mean of magnitude of body acceleration Jerk signal 
- tBodyAccJerkMag-std  : standard deviation of magnitude of body acceleration Jerk signal
- tBodyGyroMag-mean   : mean of magnitude of body gyro
- tBodyGyroMag-std    : standard deviation of magnitude of body gyro
- tBodyGyroJerkMag-mean: mean of magnitude of body gyro Jerk signal
- tBodyGyroJerkMag-std : standard deviation of magnitude of body gyro Jerk signal
- fBodyAcc-mean-X	: mean of frequency body acceleration in the x-axis
- fBodyAcc-mean-Y : mean of frequency body acceleration in the y-axis
- fBodyAcc-mean-Z : mean of frequency body acceleration in the z-axis
- fBodyAcc-std-X  : standard deviation of frequency body acceleration in the x-axis
- fBodyAcc-std-Y  : standard deviation of frequency body acceleration in the y-axis
- fBodyAcc-std-Z  : standard deviation of frequency body acceleration in the z-axis
- fBodyAccJerk-mean-X : mean of frequency body acceleration Jerk signal in the x-axis
- fBodyAccJerk-mean-Y : mean of frequency body acceleration Jerk signal in the y-axis
- fBodyAccJerk-mean-Z : mean of frequency body acceleration Jerk signal in the z-axis
- fBodyAccJerk-std-X  : standard deviation of frequency body acceleration Jerk signal in the x-axis
- fBodyAccJerk-std-Y  : standard deviation of frequency body acceleration Jerk signal in the y-axis
- fBodyAccJerk-std-Z  : standard deviation of frequency body acceleration Jerk signal in the z-axis
- fBodyGyro-mean-X  : mean of frequency body gyro in the x-axis
- fBodyGyro-mean-Y  : mean of frequency body gyro in the y-axis
- fBodyGyro-mean-Z  : mean of frequency body gyro in the z-axis
- fBodyGyro-std-X  : standard deviation of frequency body gyro in the x-axis
- fBodyGyro-std-Y  : standard deviation of frequency body gyro in the y-axis
- fBodyGyro-std-Z  : standard deviation of frequency body gyro in the z-axis
- fBodyAccMag-mean : mean of frequency of body acceleration magnitude 
- fBodyAccMag-std  : standard deviation of frequency of body acceleration magnitude
- fBodyBodyAccJerkMag-mean : mean of frequency of body acceleration Jerk signal magnitude 
- fBodyBodyAccJerkMag-std  : standard deviation of frequency of body acceleration Jerk signal magnitude 
- fBodyBodyGyroMag-mean : mean of frequency of body gyro magnitude
- fBodyBodyGyroMag-std  : standard deviation of frequency of body gyro magnitude
- fBodyBodyGyroJerkMag-mean : mean of frequency of body gyro Jerk signal magnitude
- fBodyBodyGyroJerkMag-std  : standard deviation of frequency of body gyro Jerk signal magnitude

