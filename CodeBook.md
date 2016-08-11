---
title: "CodeBook"
author: "Robert Fletes"
date: "August 10, 2016"
output: word_document
---



Utilize R studio to download and unzip the source data file references below.  


Source Data: 
      
      This project references the Human Activity Recognition Using Smartphones Data Set.  More information is available at the website: 
      
      http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
      Data for the project can be found here: 
        https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
    
    R Script:
    
    Run_analysis.R 
.	Contains all the code used to perform the analyses described in the 5 steps.

.	Code

o	  Creates a directory, downloads, and unzips file
o	  Reads the training data, testing data, features  vector, and activity labels 
o	  Merges and labels test and training Data
o	  Merges and labels subject data sets 
o	  Merges test, train, and subject data into one data set with labels
o	  Extracts the mean and standard deviation columns including activity and subject names 
o	  Create a second tidy dataset called secondSet.txt that includes the average of each variable for each activity and each subject 
    
    Variables:
    
o x_train, y_train, x_test, Y-test, subject_train, subject_test contain the data from the files provided in the downloaded zip file
o x,y,xy,subject, and AllData merge and label the datasets above 
o meanStdData extracts the mean and standard deviation columns of the merged dataset 
o secondSet take the average of each subject and activity and orders it by each subject 

    
     
      

