#step 0
## load required packages

library(dplyr)

#step 1
##reading in all the raw data

X_train <- read.table("./train/X_train.txt", header= F)
X_test<- read.table("./test/X_test.txt", header= F)
y_train <- read.table("./train/y_train.txt", header= F)
y_test <- read.table("./test/y_test.txt", header= F)
subject_train <- read.table("./train/subject_train.txt", header= F)
subject_test <- read.table("./test/subject_test.txt", header= F)

##appending training and testing data

X_data <- rbind(X_train, X_test)
Y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

##labling data part 1

names(Y_data) <- c('activity_cd')
names(subject_data) <- c('Subject')
X_names <- read.table("features.txt", header=F)
names(X_data) <- X_names$V2

#step 2
##selecting features

indexMean <- grep("mean", X_names$V2, ignore.case = T)
indexStd <- grep("std", X_names$V2, ignore.case = T)
vars <- sort(c(indexMean, indexStd))
X_data_sel <- X_data[,vars]

#step 3
##reading descriptive activity values and labels - merge at the end

activityLabels <- read.table("activity_labels.txt", header=F)
names(activityLabels) <- c('activity_cd','activity_desc')

#step 4
##making variable names more clear

names(X_data_sel)<-gsub("^t", "time", names(X_data_sel))
names(X_data_sel)<-gsub("^f", "frequency", names(X_data_sel))
names(X_data_sel)<-gsub("Acc", "Accelerometer", names(X_data_sel))
names(X_data_sel)<-gsub("Gyro", "Gyroscope", names(X_data_sel))
names(X_data_sel)<-gsub("Mag", "Magnitude", names(X_data_sel))
names(X_data_sel)<-gsub("BodyBody", "Body", names(X_data_sel))

## creating the final dataset
bindData <- cbind(subject_data, Y_data, X_data_sel)
finalData <- merge(bindData,activityLabels, by.x = "activity_cd", by.y = "activity_cd", all.x = T)


#step 5
##tidy dataset with averages added
tidyData <- finalData %>% group_by(Subject, activity_desc) %>% summarise_each(funs(mean))

## output to tidyData.txt
write.table(tidyData, file="tidyData.txt", row.names = F)
