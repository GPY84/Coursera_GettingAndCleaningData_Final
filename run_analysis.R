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
  
  
  features_lbl <- read_table("./UCI HAR Dataset/features.txt", col_names = FALSE)
  
  
  activity_lbl <- read_table("./UCI HAR Dataset/activity_labels.txt", col_names = FALSE)


# Task 1 - Merges the training and the test sets to create one data set

  data <- rbind(data_train, data_test)
  activity <- rbind(activity_train, activity_test)
  subject <- rbind(subject_train, subject_test)
  
  all_data <- cbind(activity,subject,data)


# Task 2 - Extracts only the measurements on the mean and standard deviation for each measurement

  # Name the Dataset (Task 4)

    c_name <- tbl_df(c("activity","subject"))
    c_name <- rename(c_name, X1 = value) 
    c_name <- rbind(c_name, features_lbl)
    colnames(all_data) <- c(c_name$X1)

  # Filter Data for mean and std
  
    c_name_stay <- grepl("mean|std|activity|subject", colnames(all_data))
    
    sel_data <- all_data[,c_name_stay]

    
# Task 3 - Uses descriptive activity names to name the activities in the data set
  
    sel_data$activity <- factor(sel_data$activity, levels = activity_lbl$X1, labels = activity_lbl$X2)

    
# Task 4 - Appropriately labels the data set with descriptive variable names
  
  # Already done in Task 2 - Name the Dataset
  
    # c_name <- tbl_df(c("activity","subject"))
    # c_name <- rename(c_name, X1 = value) 
    # c_name <- rbind(c_name, features_lbl)
    # colnames(all_data) <- c(c_name$X1)
  
  
# Task 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

  
  tidy_data <- sel_data %>% 
    group_by(subject, activity) %>% 
    summarize_all(funs(mean))
 
  # Store Tidy Data to HD
   
  write.table(tidy_data, "./Tidy_Data.txt", row.name=FALSE)


  