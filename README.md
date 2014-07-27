# Getting and Cleaning Data Course Project

### The objective of the assignment is to
# Merge the training and the test sets to create one data set.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive activity names. 
# Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Read, assign headings and merge train and test data set
# Read the train x and y sets and assign headings to read easily

# Read the test x and y sets and assign headings to read easily

# transfer headings to data set of test and train

# change V1 variable to "activity" to make easily readable

# change data values in yTest according to activity_labels.txt file

# convert variable names to lowercase

# convert $activity to factor and add descriptive labels

# change subject variable name to be descriptive

# combine (x,y,subject) for the training and test sets

# Merge the training and the test sets to create new data set.

### Data Extraction: 
# Extract only the measurements on the mean and standard deviation for each measurement and keep the activity column as well


# tidy up variable names
# Don't use underscores ( _ ) or hyphens ( - ) in identifiers
# remove parentheses, dash, commas

# summarize data

# write file to output
