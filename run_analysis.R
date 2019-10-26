##Coursera3 week4 project
#Question 1 Merges the training and the test sets to create one data set.
setwd("/Users/Apple/data/l3w4course project/UCI HAR Dataset")
#merge the test files
subject_text<-read.table("./test/subject_test.txt")
x_text<-read.table("./test/X_test.txt")
y_text<-read.table("./test/y_test.txt")
alltext<-cbind(subject_text,x_text,y_text)
#merge the train files
subject_train<-read.table("./train/subject_train.txt")
x_train<-read.table("./train/X_train.txt")
y_train<-read.table("./train/y_train.txt")
alltrain<-cbind(subject_train,x_train,y_train)
#merge the test set and the train set
alldata<-rbind(alltext,alltrain)

#Question2 Extracts only the measurements on the mean and standard deviation for each measurement.
#Add colnames
features<-read.table("features.txt")
colnames(alldata)[2:562]<-as.character(features[,2])
#Select the mean and standard deviation for each measurement
alldata1<-alldata[,grep("mean()|std()|V1",names(alldata))]

#Question3 Uses descriptive activity names to name the activities in the data set
activity_labels<-read.table("activity_labels.txt")
library(dplyr)
alldata2<-merge(alldata1,activity_labels,by.x = "V1.1",by.y = "V1")

#Question4 Appropriately labels the data set with descriptive variable names.
names(alldata2)<-gsub("^t","time",names(alldata2))
names(alldata2)<-gsub("\\()","",names(alldata2))
names(alldata2)<-gsub("^f","frequency",names(alldata2))
names(alldata2)<-gsub("V2","actvity_labels",names(alldata2))

#Question5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
alldata_new<-alldata2[,grep("mean|actvity_lables|V1.1|V1",names(alldata2))]
write.table(alldata_new,"Second data.txt")
