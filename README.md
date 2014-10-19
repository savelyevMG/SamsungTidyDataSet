###SamsungTidyDataSet
==================
##Course Project

Writing a lot of text in English is a challenge for me :)

Here is a R script, which makes some data tiding.

The original data is situated [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

This is a data of measurement of activity of different subjects which was recorded by Samsung Galaxy device. A full description  is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Script will download these data into Dataset.zip file and unzip this file by itself.

Here is test and training data in the files. So, this script will load these data and tidy them into one nice dataset, with descriptive variable names, and only the data of the mean and standard deviation of each measurement.

The last step is write to file "SamsungTidyDataSet.csv" a data where only average of each variable for each activity and each subject is calculated.

This file could be loaded into R with the next command:

*dt<-read.table("SamsungTidyDataSet.csv",sep=",",header=TRUE)*
