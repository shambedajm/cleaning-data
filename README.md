This readme file explains the run_analysis R script.
The script and associated files were created as part of the Getting and Cleaning Data coursera class
***********************************************

##1) Script purpose:

This script takes a dataset from UC Irvine researching Human Activity Recognition and creates a tidy dataset out of the UCI data. The original dataset is from this URL: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
         
According to the course assignment the script performs the following tasks:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

***********************************************        

##2) Script Requirements

The UCI HAR dataset folder should be in the R working directory. This folder should be unmodified from the original source (see URL in the Script Purpose)

The script requires the R package "dplyr" be available
***********************************************

##3) Script usage

Use R to call run_analysis.R while the UCI data folder is in the current working directory.

Note that the script is fairly slow while reading X_train.txt and X_test.txt, so it may take more than 30 seconds for the script to complete

run_analysis will return a 180x81 dataframe meeting the parameters in Script purpose

No changes are made to the source data
***********************************************

##4) Sample usage
> source('run_analysis.R') 

> result<-run_analysis()

            