## Set the working directory to the uncompressed file.

## To read the txt files
## TEST
test_subject <- read.table("test/subject_test.txt")
test_label <- read.table("test/y_test.txt")
test <- read.table("test/X_test.txt")
## TRAIN
train_subject <- read.table("train/subject_train.txt")
train_label <- read.table("train/y_train.txt")
train <- read.table("train/X_train.txt", sep = "")
## FEATURES
features <- read.table("features.txt")
## ACTIVITY LABELS
activity_labels <- read.table("activity_labels.txt")

## Set the column names
colnames(test) <- features$V2
colnames(train) <- features$V2

## Adding the activity column
test$activity <- test_label
train$activity <- train_label
test$activity[test$activity == 1] <- "WALKING"
test$activity[test$activity == 2] <- "WALKING_UPSTAIRS"
test$activity[test$activity == 3] <- "WALKING_DOWNSTAIRS"
test$activity[test$activity == 4] <- "SITTING"
test$activity[test$activity == 5] <- "STANDING"
test$activity[test$activity == 6] <- "LAYING"
train$activity[train$activity == 1] <- "WALKING"
train$activity[train$activity == 2] <- "WALKING_UPSTAIRS"
train$activity[train$activity == 3] <- "WALKING_DOWNSTAIRS"
train$activity[train$activity == 4] <- "SITTING"
train$activity[train$activity == 5] <- "STANDING"
train$activity[train$activity == 6] <- "LAYING"

## Adding the subject column
test$subject <- test_subject
train$subject <- train_subject
colnames(test[, 562]) <- "activity"
colnames(test[, 563]) <- "subject"
colnames(train[, 562]) <- "activity"
colnames(train[, 563]) <- "subject"

## Merge test and train
data <- rbind(train, test)

## Extracts only the measurements on the mean and standard deviation for each measurement
selectedCol <- c(grep("subject", colnames(data)), grep("activity", colnames(data)), 
                 grep("mean\\(\\)", colnames(data)), grep("std\\(\\)", colnames(data)))
data <- data[, selectedCol]

## Tidy data
library(dplyr)
library(tidyr)
data2 <- tbl_df(data)

tidyData <- (data2 %>%
      gather(signal, value, -subject, -activity) %>%
      group_by(subject, activity, signal) %>%
      mutate(average = mean(value)) %>%
      select(subject, activity, signal, average) %>%
      unique)
