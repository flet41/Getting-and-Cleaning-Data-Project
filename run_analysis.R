
 
rm(list=ls())

##Download file and place in folder

if(!file.exists(".data")){dir.create("/data")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
download.file(fileUrl, destfile = "./data/assignment/ProjectData.zip")

##Unzip file 

unzip(zipfile="./data/assignment/ProjectData.zip", exdir = "./data/assignment")





## Read Data

#Read train tables
x_train<-read.table("./data/assignment/UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("./data/assignment/UCI HAR Dataset/train/y_train.txt") 
subject_train<-read.table("./data/assignment/UCI HAR Dataset/train/subject_train.txt") 


  #Read test tables 
x_test<-read.table("./data/assignment/UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("./data/assignment/UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("./data/assignment/UCI HAR Dataset/test/subject_test.txt")

  #Read feature vector
features<-read.table("./data/assignment/UCI HAR Dataset/features.txt")


  #Read activity labels
activity_labels<-read.table("./data/assignment/UCI HAR Dataset/activity_labels.txt")



## Combine Data 

  #combine and label x data
x<-rbind(x_train, x_test)
colnames(x)<-features[, 2]
  
  #combine and label y data 
y<-rbind(y_train,y_test)
colnames(y)<-"activityId" 

  #combine x and y 
xy<-cbind(y, x)

  #combine and label subject data sets   
subject<-rbind(subject_test, subject_train)
colnames(subject)<-"SubjectId"


  #combine subject with dataset to bring all data into one dataset 
AllData<-cbind(subject, xy)



##Extract only mean and standard deviation columns and including activity and subject names 
##Names applied in previous steps 
meanStdData<-AllData[grep("mean|std|Subject|activity", colnames(AllData))]

##Create second tidy data set with the average of each variable for each activity and each subject
  #Make set
secondSet<-aggregate(. ~SubjectId + activityId, meanStdData, mean)
secondSet <- secondSet[order(secondSet$SubjectId, secondSet$activityId),]
  
  #write a second tidy set 
write.table(secondSet, file="./data/assignment/tidyData.txt", row.names = FALSE)
  


  














