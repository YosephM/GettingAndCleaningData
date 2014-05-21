Response to the Coursera's course "Getting and Cleaning Data" Project

run_analysis.R is written to clean up and prepare for further anlysis the "Human Activity Recognition Using Smartphones" Data Set 
originally collected from the accelerometers from the Samsung Galaxy S smartphone on 30 volunteers within an age bracket of 19-48 years
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and provided for students 
via https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

## How to Run the run_analysis.R Script
* download the script into your working directory
* download the data in the above link in a subdirectory  'data' under your working directory
* open the script in Rstudio
* make sure the current working directory is correctly set at the top of the script
* run the script

## Outputs
The script results in two files written out to the working directory
  1. tidy_data.txt,  which is a cleaned data before any aggrigation is done.
  2. aggrigated_by_mean_tidy_data.txt, the final cleaned and aggrigated data.

##The Goal for the run_analysis.R  script is :
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive activity names.
  5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
##The detail steps followed while writting to met the above set goal are given below:
###set your working directory. I used #setwd("D:/Trainings/R/Project")
###reading data from files
  1. read both training and test data
  2. read both training and test activities data
  3. read subjects of both training and test
  4. read Features list
  5. read Activities names from file
  
###Merges the training and the test sets to create one data set.
  1. Merging the training and test data
  2. Merging the training and test activities data
  3. Merging the training and test subjects
  
###Extracts only the measurements on the mean and standard deviation for each measurement. 
  1. Indentify columns that represent means or standard deviations by greping out from the Features list those that contain mean(), or std()
  2. Filter out the portion of the dataset that represents only the mean and standard deviations identified above
  3. Format column header by removing non alphanumeric characters such as "(,),-"  and camale casing for multi-word headers
  
###Uses descriptive activity names to name the activities in the data set
  1. review the list of activities read from file to check for inconsistancy and less human readable once
  2. remove all none alphanumeric characters such as underscores and convert all tolower case
  3. change to camele case format for the multi-word names
  
###Appropriately labels the data set with descriptive activity names. 
  1. apply the formated activity names above to the merged activity data labels
  2  give proper column name for activities data and jubject data
  3. now we are ready to combine the pices into a single tidy data
  4. write out the output dataset to file, in my case in to a file called "tidy_data.txt"

###Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
NOTE: I have used the reshape2 library to reshape and produce the aggreted dataframe
  1. install if not available and include the reshape2 library
  2. melt the tidy dataframe produced above with ids "subject", "activity" to prepare the dataset for aggrigation
  3. dcast the melted dataframe with "mean" function to produce the required aggrigate data.
  4. writting the tidy aggrigated data to file, in my case into a file named "aggrigated_by_mean_tidy_data.txt"
  
