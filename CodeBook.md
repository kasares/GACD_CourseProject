
The tidy data set contains four variables:

  - subject: type int. They are the persons that realize the study.
  
  - activity: type chr. There are six kinds of activities (standing, sitting, laying, walking, walking_downstairs, walking_upstairs.
  - signal: type factor. The features selected come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). These signals were used to estimate variables of the feature vector for each pattern:
    * tBodyAcc-XYZ
    * tGravityAcc-XYZ
    * tBodyAccJerk-XYZ
    * tBodyGyro-XYZ
    * tBodyGyroJerk-XYZ
    * tBodyAccMag
    * tGravityAccMag
    * tBodyAccJerkMag
    * tBodyGyroMag
    * tBodyGyroJerkMag
    * fBodyAcc-XYZ
    * fBodyAccJerk-XYZ
    * fBodyGyro-XYZ
    * fBodyAccMag
    * fBodyAccJerkMag
    * fBodyGyroMag
    * fBodyGyroJerkMag
    
    The set of variables that were estimated from these signals are:
    
    * mean(): Mean value
    * std(): Standard deviation
    
  - average: type num. Is the mean of the measurement of each signal.
  
We must perform the next steps to tidy the data:

  - First we set the working directory to the local directory where we are downloaded and unzipped the original data.
  - We've got two datasets: test and train. We stablish the column names of this data set from 'features'.
  - Next we add the 'activity' column to both data sets. We change the numeric values of this column to the corresponding character description.
  - We add the 'subject' column to both data sets and we stablish both columns names.
  - Merge both data sets (test and train) to obtain an unique data set called 'data'.
  - We make use of the tidyr and dplyr libraries to obtain a final tidy data set.
  - To tidy the data, we first gather the signal columns into a unique column called 'signal', then we group by 'subject', 'activity' and 'signal' columns in this order. Next we mutate the data set to create a new column with the mean of the value colum, then we select all the columns except value and finally we erase the duplicates rows.
