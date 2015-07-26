# README
## Getting and Cleaning Data COURSE PROJECT

### INTRODUCTION

This project is a part of assignment for [Getting and Cleaning Data Course](https://class.coursera.org/getdata-030/) at COURSERA.
The purpose of this project is to demonstrate student's ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

Student need to create a script called run_analysis.R that will does the following.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### DATASET
The dataset given is represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

Here are the data for the project: 

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### PROJECT'S FILES
This repository contain:
* run_analysis.R
* README.md
* CODEBOOK.md

### INSTRUCTIONS
1.	Please do make sure user have to install reshape2 package before start used the code.
2. 	Clone the git repo from [https://github.com/marvelEle/Getting-and-Cleaning-Data](https://github.com/marvelEle/Getting-and-Cleaning-Data)
3. 	run the run_analysis.R
4. 	This script will generate ```./data``` folder in the working directory contain dataset.zip
5. 	```./UCI HAR Dataset``` folder will created in working directory contain dataset.zip that being unzip.
6. 	For step 1-4 : dataset ```extractData``` created
7. 	For step 5 : dataset ```tidyData``` created
8.	Lastly, ```./output``` folder created and contain tidyData dataset being save in tidyData.txt file

That's it. Thank you.

### Notes
1.	For step 2, I only grab data with ```-mean()``` label for mean and ```-std()``` label for standard deviation.


