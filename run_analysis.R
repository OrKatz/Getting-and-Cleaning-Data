library(plyr)

# Q: 1
# Merge the training and test sets 


xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subtrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
subtest <- read.table("UCI HAR Dataset/test/subject_test.txt")

# create 'x' data set
xdata <- rbind(xtrain, xtest)

# create 'y' data set
ydata <- rbind(ytrain, ytest)

# create 'subject' data set
subdata <- rbind(subtrain, subtest)

# Q: 2
# mean and standard deviation for each measurement

features <- read.table("UCI HAR Dataset/features.txt")

# get columns with mean() or std() in their names
mean_and_std <- grep("-(mean|std)\\(\\)", features[, 2])

xdata <- xdata[, mean_and_std]

names(xdata) <- features[mean_and_std, 2]

# Q: 3
# Use descriptive activity names to name the activities in the data set

activities <- read.table("UCI HAR Dataset/activity_labels.txt")

ydata[, 1] <- activities[ydata[, 1], 2]

names(ydata) <- "activity"

# Q: 4
# Appropriately label the data set with descriptive variable names

# correct column name
names(subdata) <- "subject"

# bind all the data in a single data set
all_data <- cbind(xdata, ydata, subdata)

# Q: 5
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject

averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages_data, "UCI HAR Dataset/averages_data.txt", row.name=FALSE)

