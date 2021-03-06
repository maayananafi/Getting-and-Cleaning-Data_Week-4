#Download and unzip file
> if(!file.exists("./data")){dir.create("./data")}
> fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
> download.file(fileURL,destfile = "./data/ActivityDataset.zip")

#Read training tables
> x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
> y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
> subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

#Read testing tables
> x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
> y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
> subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

#Read feature vector
> features <- read.table('./data/UCI HAR Dataset/features.txt')

#Read activity labels
> activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

# Assign column names
> colnames(x_train) <- features[,2] 
> colnames(y_train) <-"activityId"
> colnames(subject_train) <- "subjectId"
> colnames(x_test) <- features[,2] 
> colnames(y_test) <- "activityId"
> colnames(subject_test) <- "subjectId"
> colnames(activityLabels) <- c('activityId','activityType')

# Merge data
> mrg_train <- cbind(y_train, subject_train, x_train)
> mrg_test <- cbind(y_test, subject_test, x_test)
> setAllInOne <- rbind(mrg_train, mrg_test)

#Extract measurements for mean and standard deviation
> colNames <- colnames(setAllInOne)
> mean_and_std <- (grepl("activityId" , colNames) | 
+                      grepl("subjectId" , colNames) | 
+                      grepl("mean.." , colNames) | 
+                      grepl("std.." , colNames) 
+ )
> setForMeanAndStd <- setAllInOne[ , mean_and_std == TRUE]

#Label data with activity names
> setWithActivityNames <- merge(setForMeanAndStd, activityLabels,
+                               by='activityId',
+                               all.x=TRUE)

#Make second dataset with averages
> secTidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
> secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]
> write.table(secTidySet, "secTidySet.txt", row.name=FALSE)

