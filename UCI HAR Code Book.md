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

	- walking
 	- walking upstairs
	- walking downstairs
	- sitting
	- standing
	- laying

4. Labels the data set with descriptive names appropriately; 
	- underscores and brackets () are removed. 
	- all feature names (attributes) and activity names are converted to lower case
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
 - Note that measurements are normalised and so unitlless.

Variables:
----------
- subject : contains the subject who performed the activity. values are between 1 and 30
- activity: Activity descrition. There are 6 different activities mentioned above.- 
- tbodyacc-mean-x : mean of time body acceleration in the x-axis
- tbodyacc-mean-y : mean of time body acceleration in the y-axis
- tbodyacc-mean-z : mean of time body acceleration in the z-axis
- tbodyacc-std-x 	: standard deviation of time body acceleration in the x-axis
- tbodyacc-std-y 	: standard deviation of time body acceleration in the y-axis
- tbodyacc-std-z 	: standard deviation of time body acceleration in the z-axis
- tgravityacc-mean-x : mean of time gravity acceleration in the x-axis
- tgravityacc-mean-y : mean of time gravity acceleration in the y-axis
- tgravityacc-mean-z : mean of time gravity acceleration in the z-axis
- tgravityacc-std-x  : standard deviation of time gravity acceleration in the x-axis
- tgravityacc-std-y  : standard deviation of time gravity acceleration in the y-axis
- tgravityacc-std-z  : standard deviation of time gravity acceleration in the z-axis
- tbodyaccjerk-mean-x : mean of body acceleration Jerk signal in the x-axis
- tbodyaccjerk-mean-y : mean of body acceleration Jerk signal in the y-axis
- tbodyaccjerk-mean-z : mean of body acceleration Jerk signal in the z-axis
- tbodyaccjerk-std-x  : standard deviation of body acceleration Jerk signal in the x-axis
- tbodyaccjerk-std-y  : standard deviation of body acceleration Jerk signal in the y-axis
- tbodyaccjerk-std-z  : standard deviation of body acceleration Jerk signal in the z-axis
- tbodygyro-mean-x : mean of body gyro signal in the x-axis
- tbodygyro-mean-y : mean of body gyro signal in the y-axis
- tbodygyro-mean-z : mean of body gyro signal in the z-axis
- tbodygyro-std-x : standard deviation of body gyro signal in the x-axis
- tbodygyro-std-y : standard deviation of body gyro signal in the y-axis
- tbodygyro-std-z	: standard deviation of body gyro signal in the z-axis
- tbodygyrojerk-mean-x : mean of body gyro Jerk signal in the x-axis
- tbodygyrojerk-mean-y : mean of body gyro Jerk signal in the y-axis
- tbodygyrojerk-mean-z : mean of body gyro Jerk signal in the z-axis
- tbodygyrojerk-std-x  : standard deviation of body gyro Jerk signal in the x-axis
- tbodygyrojerk-std-y  : standard deviation of body gyro Jerk signal in the y-axis
- tbodygyrojerk-std-z  : standard deviation of body gyro Jerk signal in the z-axis
- tbodyaccmag-mean : mean of magnitude of body acceleration
- tbodyaccmag-std  : standard deviation of body of gravity acceleration
- tgravityaccmag-mean : mean of magnitude of magnitude acceleration
- tgravityaccmag-std  : standard deviation of magnitude of gravity acceleration
- tbodyaccjerkmag-mean : mean of magnitude of body acceleration Jerk signal 
- tbodyaccjerkmag-std  : standard deviation of magnitude of body acceleration Jerk signal
- tbodygyromag-mean   : mean of magnitude of body gyro
- tbodygyromag-std    : standard deviation of magnitude of body gyro
- tbodygyrojerkmag-mean: mean of magnitude of body gyro Jerk signal
- tbodygyrojerkmag-std : standard deviation of magnitude of body gyro Jerk signal
- fbodyacc-mean-x	: mean of frequency body acceleration in the x-axis
- fbodyacc-mean-y : mean of frequency body acceleration in the y-axis
- fbodyacc-mean-z : mean of frequency body acceleration in the z-axis
- fbodyacc-std-x  : standard deviation of frequency body acceleration in the x-axis
- fbodyacc-std-y  : standard deviation of frequency body acceleration in the y-axis
- fbodyacc-std-z  : standard deviation of frequency body acceleration in the z-axis
- fbodyaccjerk-mean-x : mean of frequency body acceleration Jerk signal in the x-axis
- fbodyaccjerk-mean-y : mean of frequency body acceleration Jerk signal in the y-axis
- fbodyaccjerk-mean-z : mean of frequency body acceleration Jerk signal in the z-axis
- fbodyaccjerk-std-x  : standard deviation of frequency body acceleration Jerk signal in the x-axis
- fbodyaccjerk-std-y  : standard deviation of frequency body acceleration Jerk signal in the y-axis
- fbodyaccjerk-std-z  : standard deviation of frequency body acceleration Jerk signal in the z-axis
- fbodygyro-mean-x  : mean of frequency body gyro in the x-axis
- fbodygyro-mean-y  : mean of frequency body gyro in the y-axis
- fbodygyro-mean-z  : mean of frequency body gyro in the z-axis
- fbodygyro-std-x  : standard deviation of frequency body gyro in the x-axis
- fbodygyro-std-y  : standard deviation of frequency body gyro in the y-axis
- fbodygyro-std-z  : standard deviation of frequency body gyro in the z-axis
- fbodyaccmag-mean : mean of frequency of body acceleration magnitude 
- fbodyaccmag-std  : standard deviation of frequency of body acceleration magnitude
- fbodybodyaccjerkmag-mean : mean of frequency of body acceleration Jerk signal magnitude 
- fbodybodyaccjerkmag-std  : standard deviation of frequency of body acceleration Jerk signal magnitude 
- fbodybodygyromag-mean : mean of frequency of body gyro magnitude
- fbodybodygyromag-std  : standard deviation of frequency of body gyro magnitude
- fbodybodygyrojerkmag-mean : mean of frequency of body gyro Jerk signal magnitude
- fbodybodygyrojerkmag-std  : standard deviation of frequency of body gyro Jerk signal magnitude

