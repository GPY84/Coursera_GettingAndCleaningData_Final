# Coursera Modul 4 Woche 

# Load Packages

library(tidyverse)

# Read all Data

setwd("C:/temp/Coursera/M3W4")

data_train <- read_table("./UCI HAR Dataset/train/X_train.txt", col_names = FALSE)
data_test <- read_table("./UCI HAR Dataset/test/X_test.txt", col_names = FALSE)

activity_train <- read_table("./UCI HAR Dataset/train/Y_train.txt", col_names = FALSE)
activity_test <- read_table("./UCI HAR Dataset/test/Y_test.txt", col_names = FALSE)

subject_train <- read_table("./UCI HAR Dataset/train/subject_train.txt", col_names = FALSE)
subject_test <- read_table("./UCI HAR Dataset/test/subject_test.txt", col_names = FALSE)


features <- read_table("./UCI HAR Dataset/features.txt", col_names = FALSE)


activity <- read_table("./UCI HAR Dataset/activity_labels.txt", col_names = FALSE)

# Task 1 - Joining test- and training data

data <- rbind(data_train, data_test)
activity <- rbind(activity_train, activity_test)
subject <- rbind(subject_train, subject_test)

all_data <- cbind(activity,subject,data)

            # Name the Dataset

            class(features)
            c_name <- tbl_df(c("Test","Test2"))

            c_name <- rbind(c(c_name), c(features))
            

            colnames(all_data) <- c(c_name)

# Task 2