wd=getwd()
setwd("C:/Users/pjrDa/Dropbox/Data Science Mooc/03 Assignments/w4/")

library(dplyr)

data.dir="UCI HAR Dataset"


########################################################################
# 1. Merge the training and the test sets to create one data set.

# read the test datasets
test.data <- read.table(paste0(data.dir,"/test/X_test.txt"))
test.label <- read.table(paste0(data.dir,"./test/y_test.txt"))
test.subject <- read.table(paste0(data.dir,"./test/subject_test.txt"))

#read the training datasets
train.data <- read.table(paste0(data.dir,"./train/X_train.txt"))
train.label <- read.table(paste0(data.dir,"./train/y_train.txt"))
train.subject <- read.table(paste0(data.dir,"./train/subject_train.txt"))

#append the test and train datasets together
all.data <- rbind(test.data, train.data)
all.label <- rbind(test.label, train.label)
all.subject <- rbind(test.subject, train.subject)


########################################################################
# 2. Extract only the measurements on the mean and standard deviation for each measurement.

# read the features and keep only the mean/std named columns
feature.labels <- read.table(paste0(data.dir,"./features.txt"))
feature.set <- grep("-mean\\(\\)|std\\(\\)", feature.labels[, 2])
all.data <- all.data[, feature.set]

# now clean the feature set and name the data columns
names(all.data) <- feature.labels[feature.set,2]
names(all.data) <- gsub("\\(\\)", "", names(all.data))
feature.names <- names(all.data)

########################################################################
#3. Use descriptive activity names to name the activities in the data set

# read the activity labels and then label the rows of the dataset
activity.labels <- read.table(paste0(data.dir,"./activity_labels.txt"))
all.activities <- activity.labels[all.label[, 1], 2]
all.label[, 1] <- all.activities
names(all.label) <- "activity"
all.data <- cbind(all.label, all.data)

#and also include the subject number
names(all.subject) <- "subject"
all.data <- cbind(all.subject, all.data)


########################################################################
# 4. Appropriately label the data set with descriptive variable names.

#subject and activity are named
#and the other column names look clean

# so just write out the data set
write.table(all.data, "merged_data.txt", row.names=FALSE)
write.table(all.data, "merged_data.csv", row.names=FALSE,sep=",")


########################################################################
# 5. create a second, independent tidy data set with the average of each 
#    variable for each activity and each subject.

all.aggregate <- all.data%>%
                  group_by(subject,activity) %>%
                  summarise_each(funs(mean))
write.table(all.aggregate, "aggregate_data.txt", row.names=FALSE)
write.table(all.aggregate, "aggregate_data.csv", row.names=FALSE,sep=",")


#and finally clean up the mess
setwd(wd)
rm(activity.labels)
rm(feature.labels); rm(feature.names); rm(feature.set)
rm(all.aggregate); rm(all.activities)
rm(all.data); rm(all.label); rm(all.subject)
rm(test.data);  rm(test.label);  rm(test.subject)
rm(train.data); rm(train.label); rm(train.subject)
rm(data.dir)
rm(wd)
