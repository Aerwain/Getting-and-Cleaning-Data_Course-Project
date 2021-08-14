#Getting and Cleaning Data Course Project

##Preliminary operations
###Downloading and unzipping data

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

unzip(zipfile="./data/Dataset.zip",exdir="./data")

###Reading data
Activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names=c("symbol", "activity"))
Features <- read.table("./data/UCI HAR Dataset/features.txt", col.names=c("symbol", "feature"))

SubjectTest  <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header=FALSE, col.names="subject")
SubjectTrain <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header=FALSE, col.names="subject")

ActivityTest  <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header=FALSE, col.names="symbol")
ActivityTrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header=FALSE, col.names="symbol")

FeatureTest  <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header=FALSE, col.names=Features$feature)
FeatureTrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header=FALSE, col.names=Features$feature)

##Merging the training and the test sets to create one data set
SubjectAll <- rbind(SubjectTrain, SubjectTest)
ActivityAll <- rbind(ActivityTrain, ActivityTest)
FeatureAll <- rbind (FeatureTrain, FeatureTest)

DataAll <- cbind(FeatureAll, SubjectAll, ActivityAll)

##Extracting only the measurements on the mean and standard deviation for each measurement. 
columns <- c(grep("mean\\(\\)|std\\(\\)", Features$feature), grep("subject", colnames(DataAll)), grep("symbol", colnames(DataAll)))

DataAll2 <- DataAll[,columns]

##Using descriptive activity names to name the activities in the data set

DataAll2 <- merge(DataAll2, Activities, by="symbol",all.x=TRUE)

##Appropriately labeling the data set with descriptive variable names. 

names(DataAll2) <- gsub("\\.\\.\\.", "()", names(DataAll2))
names(DataAll2) <- gsub("\\.\\.", "()", names(DataAll2))
names(DataAll2) <- gsub("Acc","Accelerometer", names(DataAll2))
names(DataAll2) <- gsub("Gyro","Gyroscope", names(DataAll2))
names(DataAll2) <- gsub("Mag","Magnitude", names(DataAll2))
names(DataAll2) <- gsub("^t","time", names(DataAll2))
names(DataAll2) <- gsub("^f","frequency", names(DataAll2))
names(DataAll2) <- gsub("BodyBody", "Body",names(DataAll2))

##From the data set in step 4, creating a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)

TidyDS<-group_by(DataAll2, activity,subject)
TidyDS<-summarise_all(TidyDS, mean)
TidyDS$symbol<-NULL

write.table(TidyDS, file = "TidyDataset.txt",row.name=FALSE)
