###Getting And Cleaning Data - Course Project
#SamsungTidyDataSet
==================

Writing a lot of text in English is a challenge for me :)

Here is my Course project for "Getting and Cleaning Data" course of the "Data Science" specialization.

Here is a R script, which makes some data tiding.




Script run_analysis.R contains the R code which do the following:

1. It download and unzip file from [HERE](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

This is a data of measurement of activity of different subjects which was recorded by Samsung Galaxy device. A full description  is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here is test and training data in the files. 

2. Data from inside of archive is used as input for script, which merge all these files together and create a data matrix of 10299 rows of variables, captured during some exploration with Samsung Galaxy. It extract only variables which present a mean and standart deviation of values.


3. Next it produce a tidy narrow dataset, where only average value is presented for each subject and each activity and each variables of previous dataset. Tidy dataset is writed to file "SamsungTidyDataSet.csv".

This file could be loaded into R with the next command:

*dt<-read.table("SamsungTidyDataSet.csv",sep=",",header=TRUE)*

You can look this dataset with command:

*head(dt,5)*

or

*dt*







