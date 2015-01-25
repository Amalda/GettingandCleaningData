## Read files and combine test and train different file types
#Read data sets and merge them to create one dataset 
trainData <- read.table("UCI HAR Dataset/train/X_train.txt")
testData <- read.table("UCI HAR Dataset/test/X_test.txt")
dataSet <- rbind(trainData, testData)

#Read Labels and merge them to create one label set 
trainLabels <- read.table("UCI HAR Dataset/train/y_train.txt")
testLabels <- read.table("UCI HAR Dataset/test/y_test.txt")
labels <- rbind(trainLabels, testLabels)

#Read Subject files and merge them to create one data frame
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
Subjects <- rbind(trainSubject,testSubject)
names(Subjects) <- "subject"

##Read features, filter dataset according to mean and std columns and rename columns 
#Read features names
features <- read.table("UCI HAR Dataset/features.txt")

#get indices for mean and standard deviation features only 
featureInd <- grep("-mean\\(\\)|-std\\(\\)",features$V2)

#filter dataset based on mean and std indecies
filteredData <- dataSet[,featureInd]

#rename columns
names(filteredData) <- features$V2[featureInd]
names(filteredData) <- gsub("\\(|\\)", "", names(filteredData))
names(filteredData) <- tolower(names(filteredData))

##Read activity labels and modify labels to represent a description instead of code
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels$V2 <- gsub("_"," ",tolower(as.character(activityLabels$V2)))
labels$V1 <- activityLabels[labels$V1,2]
names(labels) <- "activity"
                          
#merge filtered dataset with new descriptive labels and subject
cleanData <- cbind(Subjects,labels,filteredData)
                      
#write the clean data set into a file
write.table(cleanData, "cleanData.txt", row.name=FALSE)
                          
##create a new dataset from the cleaned data which contains mean for all variables
#based on subject and activity 
              
subjects = unique(Subjects$subject)
numSub = length(unique(Subjects$subject))
numAct = length(activityLabels$V2)
colNum = ncol(cleanData)
result = cleanData[1:(numSub*numAct), ]
              
row = 1
for (s in 1:numSub) {
    for (a in 1:numAct) {
        result[row, 1] = subjects[s]
        result[row, 2] = activityLabels$V2[a]
        tmp <- cleanData[cleanData$subject==s & cleanData$activity==activityLabels$V2[a], ]
        result[row, 3:colNum] <- colMeans(tmp[, 3:colNum])
        row = row+1
         }
     }
write.table(result, "avgData.txt", row.name=FALSE)
                          