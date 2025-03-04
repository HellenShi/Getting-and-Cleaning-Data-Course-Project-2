A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.
Study Design:
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Code Book:
(1)Merges the training and the test sets to create one data set.
#merge the test files:including subject_text、x_test、y_test、subject_train、x_train、y_train
#using "rbind"function merge the test set and the train set:alldata
(2)Extracts only the measurements on the mean and standard deviation for each measurement.
#Add colnames
features
#Select the mean and standard deviation for each measurement
alldata1
(3)Uses descriptive activity names to name the activities in the data set
#Using "merge"function to add activity names of the data set
alldata2
(4)Appropriately labels the data set with descriptive variable names.
#Using "gsub"function
(5)From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#Using "write.table"function
alldata_new、"Second data.txt"
