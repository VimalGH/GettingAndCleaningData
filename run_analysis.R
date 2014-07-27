# Getting and Cleaning Data Course Project

# Merges the training and the test sets to create one data set.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive activity names. 
# Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# this working directory have to be changed as per data available at your machine
setwd('C:/MyFiles/FileWorld/miscellaneous/Certifications/Coursera/Data_Science/GettingandCleaningData/project')

# load libraries
library(plyr)

# headings to read easily
# train set
xTrain = read.table("./train/X_train.txt")
yTrain = read.table("./train/y_train.txt")
subjectTrain = read.table("./train/subject_train.txt")

# test set
xTest = read.table("./test/X_test.txt")
yTest = read.table("./test/y_test.txt")
subjectTest = read.table("./test/subject_test.txt")

# load headings from file
featuresdf = read.table("./features.txt")
headings = featuresdf$V2

# transfer headings to data set
colnames(xTrain) = headings
colnames(xTest) = headings

# change V1 variable to easily readable as "activity"
yTest <- rename(yTest, c(V1="activity"))
yTrain <- rename(yTrain, c(V1="activity"))

# change data values in yTest according to activity_labels.txt file
activitydf  = read.table("./activity_labels.txt")

# convert variable names to lowercase
activityLabels = tolower(levels(activitydf$V2))

# convert $activity to factor and add descriptive labels
yTrain$activity = factor(
  yTrain$activity, 
  labels = activityLabels
)

yTest$activity = factor(
  yTest$activity, 
  labels = activityLabels
)

# change subject variable name to be descriptive
subjectTrain <- rename(subjectTrain, c(V1="subjectid"))
subjectTest <- rename(subjectTest, c(V1="subjectid"))

# combine (x,y,subject) for the training and test sets
train = cbind(xTrain, subjectTrain, yTrain)
test = cbind(xTest, subjectTest, yTest)

# Merge the training and the test sets to create new data set.
fullData = rbind(train, test)

### Data Extraction: 
# Extract only the measurements on the mean and standard deviation for each measurement and keep the activity column as well

pattern = "mean|std|subjectid|activity"
tidyData = fullData[,grep(pattern , names(fullData), value=TRUE)]

# tidy up variable names
# Don't use underscores ( _ ) or hyphens ( - ) in identifiers
# remove parentheses, dash, commas
cleanNames = gsub("\\(|\\)|-|,", "", names(tidyData))
names(tidyData) <- tolower(cleanNames)

# summarize data
result = ddply(tidyData, .(activity, subjectid), numcolwise(mean))

# write file to output
write.table(result, file="data.txt", sep = "\t", append=F)