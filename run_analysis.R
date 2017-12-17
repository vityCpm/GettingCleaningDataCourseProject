library(dplyr)
library(plyr)


# Download the data for the project
if (!file.exists("getdata_dataset.zip"))
{
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, filename, method="curl")
}

if (!file.exists("UCI HAR Dataset")) 
{ 
        unzip(filename) 
}

# Load the needed datasets
xtestDs <- read.table("test/X_test.txt")
ytestDs <- read.table("test/Y_test.txt")
subjectTestDs <- read.table("test/subject_test.txt")

xtrainDs <- read.table("train/X_train.txt")
ytrainDs <- read.table("train/Y_train.txt")
subjectTrainDs <- read.table("train/subject_train.txt")

features <- read.table("features.txt")

activities <- read.table("activity_labels.txt")

# Step 1.
# Merges the training and the test sets to create one data set.
testDs <- cbind(subjectTestDs, ytestDs, xtestDs)
trainDs <- cbind(subjectTrainDs, ytrainDs, xtrainDs)
mergedDs <- rbind(trainDs, testDs)

# Step 2.
# Extracts only the measurements on the mean and standard deviation for each measurement.
colNames<-c("subject","activity",as.character(features$V2))
names(mergedDs)<-colNames

selectedCols <- grep("subject|activity|mean|std", colnames(mergedDs))
mergedDs <- mergedDs[, selectedCols]

# Step 3.
# Uses descriptive activity names to name the activities in the data set
mergedDs$activity_num <- factor(mergedDs$activity,levels = activities[, 1], labels = activities[, 2])

# Step 4.
# Appropriately labels the data set with descriptive variable names.

# Done in Step 2
 
# Step 5.
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
averagesDs <- ddply(mergedDs, .(subject, activity_num), function(x) colMeans(x[, 3:81]))
write.table(averagesDs, "averagesData.txt", row.name=FALSE)
