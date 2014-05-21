## Study design

### Data Collection(Data Source)
The data is original from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  web site that is the result of  experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz ware captured.
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
Coursera also provided the zipped row data on the course website https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

### Data Clean up and transformation done on the row data
1. The training and test datasets ware merged to produce one complete experment dataset
2. Only mean and standard deviation measurments ware extracted which are about 66 columns
3. Columns headers ware formated to make them more human readable
4. The activities list dataset was also formated to increase consistancy and readability
5. The activities column was transformed to the equivellente readable lables generated in 4 instade of numeric values
6. This data set is then aggrigated by taking the mean of the measurment variables for each subject and activity type to produce the final dataset

## Code Book
The Following are the final list of variables
### ID Variables
* subject
* activity 
### Measurment variables
* tBodyAccMeanX
* tBodyAccMeanY 
* tBodyAccMeanZ 
* tBodyAccStdX 
* tBodyAccStdY 
* tBodyAccStdZ 
* tGravityAccMeanX 
* tGravityAccMeanY
* tGravityAccMeanZ 
* tGravityAccStdX 
* tGravityAccStdY
* tGravityAccStdZ
* tBodyAccJerkMeanX
* tBodyAccJerkMeanY
* tBodyAccJerkMeanZ
* tBodyAccJerkStdX
* tBodyAccJerkStdY
* tBodyAccJerkStdZ
* tBodyGyroMeanX
* tBodyGyroMeanY 
* tBodyGyroMeanZ 
* tBodyGyroStdX
* tBodyGyroStdY
* tBodyGyroStdZ
* tBodyGyroJerkMeanX
* tBodyGyroJerkMeanY
* tBodyGyroJerkMeanZ
* tBodyGyroJerkStdX
* tBodyGyroJerkStdY
* tBodyGyroJerkStdZ
* tBodyAccMagMean
* tBodyAccMagStd
* tGravityAccMagMean
* tGravityAccMagStd
* tBodyAccJerkMagMean
* tBodyAccJerkMagStd
* tBodyGyroMagMean
* tBodyGyroMagStd
* tBodyGyroJerkMagMean
* tBodyGyroJerkMagStd
* fBodyAccMeanX
* fBodyAccMeanY
* fBodyAccMeanZ
* fBodyAccStdX
* fBodyAccStdY
* fBodyAccStdZ
* fBodyAccJerkMeanX
* fBodyAccJerkMeanY
* fBodyAccJerkMeanZ
* fBodyAccJerkStdX
* fBodyAccJerkStdY
* fBodyAccJerkStdZ
* fBodyGyroMeanX
* fBodyGyroMeanY
* fBodyGyroMeanZ
* fBodyGyroStdX
* fBodyGyroStdY
* fBodyGyroStdZ
* fBodyAccMagMean
* fBodyAccMagStd
* fBodyBodyAccJerkMagMean
* fBodyBodyAccJerkMagStd
* fBodyBodyGyroMagMean
* fBodyBodyGyroMagStd
* fBodyBodyGyroJerkMagMean
* fBodyBodyGyroJerkMagStd
