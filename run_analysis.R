library(plyr)
library(data.table)

#Files are already downloaded and extracted in the current working directory for ease of use.

# 1 Merging the training and the test sets to create one data set.
xtrain <- read.table('./UCI HAR Dataset/train/X_train.txt',header=FALSE)
ytrain <- read.table('./UCI HAR Dataset/train/y_train.txt',header=FALSE)
xtest <- read.table('./UCI HAR Dataset/test/X_test.txt',header=FALSE)
ytest <- read.table('./UCI HAR Dataset/test/y_test.txt',header=FALSE)
subtrain = read.table('./UCI HAR Dataset/train/subject_train.txt',header=FALSE)
subtest = read.table('./UCI HAR Dataset/test/subject_test.txt',header=FALSE)

xds <- rbind(xtrain,xtest)
yds <- rbind(ytrain,ytest)
subds <- rbind(subtrain,subtest)

# 2 Extracting only the measurements on the mean and standard deviation for each measurement.
features <- read.table('./UCI HAR Dataset/features.txt')
mean_sd <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
xds_m_sd <- xds[, mean_sd]

# 3 Giving descriptive activity names to name the activities in the data set
yds[, 1] <- read.table("./UCI HAR Dataset/activity_labels.txt")[yds[, 1], 2]
names(yds) <- "Activity"
names(subds) <- "Subject"


# 4 Combining three datasets into one  and appropriately labeling the data set with descriptive variable names.with descriptive names to columns
singleds <- cbind(xds_m_sd, yds, subds)
names(singleds) <- make.names(names(singleds))
names(singleds) <- gsub('Acc',"Acceleration",names(singleds))
names(singleds) <- gsub('GyroJerk',"AngularAcceleration",names(singleds))
names(singleds) <- gsub('Gyro',"AngularSpeed",names(singleds))
names(singleds) <- gsub('Mag',"Magnitude",names(singleds))
names(singleds) <- gsub('^t',"TimeDomain.",names(singleds))
names(singleds) <- gsub('^f',"FrequencyDomain.",names(singleds))
names(singleds) <- gsub('\\.mean',".Mean",names(singleds))
names(singleds) <- gsub('\\.std',".StandardDeviation",names(singleds))
names(singleds) <- gsub('Freq\\.',"Frequency.",names(singleds))
names(singleds) <- gsub('Freq$',"Frequency",names(singleds))
write.table(singleds, './UCI HAR Dataset/singleds.txt', row.names = F)

# 5 Creating a second, independent tidy data set with the average of each variable for each activity and each subject.
ds2<-aggregate(. ~Subject + Activity, singleds, mean)
ds2<-ds2[order(ds2$Subject,ds2$Activity),]
write.table(ds2, file = "./UCI HAR Dataset/tidydata.txt",row.name=FALSE)