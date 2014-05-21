setwd("D:/Trainings/R/Project")
#reading data from file
  #1. data
  trainData <- read.table("./data/train/X_train.txt")
  dim(trainData) # 7352*561

  testData <- read.table("./data/test/X_test.txt")
  dim(testData) # 2947*561

  #2. labels
  trainLabel <- read.table("./data/train/y_train.txt")
  table(trainLabel)

  testLabel <- read.table("./data/test/y_test.txt") 
  dim(testLabel) 

  #3. subject
  trainSubject <- read.table("./data/train/subject_train.txt")
  dim(trainSubject)
  table(trainSubject)

  testSubject <- read.table("./data/test/subject_test.txt")
  
  #4.Features
  features <- read.table("./data/features.txt")
  dim(features)  # 561*2

  #5. Activities names from file
  activities <- read.table("./data/activity_labels.txt")
  dim(activities)
  

#Q1. Merges the training and the test sets to create one data set.

  #1.Merging the training and test data
  mergedData <- rbind(trainData, testData)
  dim(mergedData) # 10299*561
  #2.Merging the training and test labels
  mergedLabel <- rbind(trainLabel, testLabel)
  dim(mergedLabel) # 10299*1
  #3.Merging the training and test subjects
  mergedSubject <- rbind(trainSubject, testSubject)
  dim(mergedSubject) # 10299*1


# Q2. Extracts only the measurements on the mean and standard deviation for each measurement. 

  #indentify columns that represent means or standard deviations
  meanStadDevCols <- grep("mean\\(\\)|std\\(\\)", features[, 2])
  length(meanStadDevCols) # 66

  #Select only columns of mean or standard deviation
  meanStadDevData <- mergedData[, meanStadDevCols]
  dim(meanStadDevData) # 10299*66
  # Format column header by removing "()"  capitalizing M in mean,  capitalize S  in std  and removing "-" in column names
  names(meanStadDevData) <- gsub("\\(\\)", "", features[meanStadDevCols, 2]) 
  names(meanStadDevData) <- gsub("mean", "Mean", names(meanStadDevData)) 
  names(meanStadDevData) <- gsub("std", "Std", names(meanStadDevData)) 
  names(meanStadDevData) <- gsub("-", "", names(meanStadDevData))  

# Q3. Uses descriptive activity names to name the activities in the data set
  #1.review the list of activities read from file
  activities  
  #2.remove all underscores and convert to lower case
  activities[, 2] <- tolower(gsub("_", "", activities[, 2]))
  #3.change to camele case format for the multi-word names
  substr(activities[2, 2], 8, 8) <- toupper(substr(activities[2, 2], 8, 8))
  substr(activities[3, 2], 8, 8) <- toupper(substr(activities[3, 2], 8, 8))
  

# Q4. Appropriately labels the data set with descriptive activity names. 
  #1.apply the formated activity names above to the merged activity data labels
  activityLabel <- activities[mergedLabel[, 1], 2]
  mergedLabel[, 1] <- activityLabel
  #2 give proper column name for activities data and jubject data
  names(mergedLabel) <- "activity"
  names(mergedSubject) <- "subject"
  #3. now we are ready to combine the dataset into a single tidy data
  tidyData <- cbind(mergedSubject, mergedLabel, meanStadDevData)
  dim(tidyData) # 10299*68
  #4.write out the output dataset to file
  write.table(tidyData, "tidy_data.txt") 

# Q5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

  # use the reshape2 library to reshape and produce the aggreted dataframe
  library(reshape2)
  melted <- melt(tidyData, id = c("subject", "activity"))
  aggrigated<-dcast(melted, subject + activity ~variable, mean)
    
  #writting the result to file
  write.table(aggrigated,"aggrigated_by_mean_tidy_data.txt")
