# Getting and Cleaning Data - Course Project

This repository contains the following files:

* README.md, this file, which provides an overview of the data set and how it was created.
* avergesData.txt, which contains the data set.
* CodeBook.md, the code book, which describes the contents of the data set (data, variables and transformations used to generate the data).
* run_analysis.R, the R script that was used to create the data se

# Creating the data set

The R script run_analysis.R can be used to create the data set. It contains the source data set and transforms it to produce the final data set by implementing the following steps:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The end result is shown in the file `averagesData.txt`.
