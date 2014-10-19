setwd("D:\\#coursera\\Data Science\\03 Data cleaning\\Course Project\\data")

fileUrl   <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fName     <- "Dataset.zip"
folder    <- "UCI HAR Dataset"
fNameOut  <- "SamsungTidyDataSet.csv"

if (!file.exists(fName))
{
        download.file(fileUrl,fName,mode="wb")
}

unzip(fName)

#------------------------------------------------------------------------------read features list
features       <- read.table(paste(folder,"\\features.txt",sep=""),stringsAsFactors=FALSE)
names(features)<- c("feature_id","feature_name")

#------------------------------------------------------------------------------read activity labels
activities              <- read.table(paste(folder,"\\activity_labels.txt",sep=""),stringsAsFactors=FALSE)
names(activities)       <- c("activity_id","activity_name")

#------------------------------------------------------------------------------read test&train data
subject_test            <- read.table(paste(folder,"\\test\\subject_test.txt",sep=""))
X_test                  <- read.table(paste(folder,"\\test\\X_test.txt",sep=""))
y_test                  <- read.table(paste(folder,"\\test\\y_test.txt",sep=""))

subject_train           <- read.table(paste(folder,"\\train\\subject_train.txt",sep=""))
X_train                 <- read.table(paste(folder,"\\train\\X_train.txt",sep=""))
y_train                 <- read.table(paste(folder,"\\train\\y_train.txt",sep=""))

#-----------------------------------------------------------------------------------
# 1. Merges the training and the test sets to create one data set               DONE
# 3. Uses descriptive activity names to name the activities in the data set     DONE
# 4. Appropriately labels the data set with descriptive variable names          DONE
#-----------------------------------------------------------------------------------
subject_col             <- rbind(subject_test,subject_train)
names(subject_col)      <- c("subject_id")

activity_col            <- rbind(y_test, y_train)
names(activity_col)     <- c("activity_id")

dataset                 <- rbind(X_test, X_train)                       #now it's a 10299x561 data frame   
names(dataset)          <- features$feature_name                        #give a names to all 561 attributes
dataset                 <- cbind (dataset, subject_col, activity_col)   #add subject and activity columns

dataset                 <- merge(dataset, activities, by="activity_id") #join acitivity's names

#------------------------------------------------------------------------------remove temporary data frames
rm(X_test)
rm(X_train)
rm(subject_test)
rm(subject_train)
rm(y_test)
rm(y_train)
rm(subject_col)
rm(activity_col)

#----------------------------------------------------------------------------------------------------------
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.           DONE
#----------------------------------------------------------------------------------------------------------
dataset <- dataset[,c(grep("(mean\\(\\)|std\\(\\))$",names(dataset)),563,564)]

#----------------------------------------------------------------------------------------------------------
# 5. From the data set in step 4, creates a second, independent tidy data set                          DONE
# with the average of each variable for each activity and each subject.
#----------------------------------------------------------------------------------------------------------

dataset2 <- dataset %>%
gather(attribute_name, attribute_value,-subject_id, -activity_name) %>%
group_by(subject_id,activity_name,attribute_name) %>%
transmute(avg=sum(attribute_value)/n()) %>%
unique()


#---------------------------------------------------------------------------write the result to file
write.table(dataset2, fNameOut,row.names=FALSE,sep=",")