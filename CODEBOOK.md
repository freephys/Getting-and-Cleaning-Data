---
title: "Codebook Getting and Cleaning Course Project"
author: "Ele Elyiana"
date: "26th July 2015"
---

## About Project
This project is to get a tidy dataset from [Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) source data.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Please refer to README.txt and features_info.txt for more details.

In order to get the tidy dataset, with this folder attached run_analysis.R

## Tidy Dataset

Tidy Dataset is created by running ```run_analysis.R```

The Dataset is combining data from the file list below:
* 'UCI HAR Dataset/train/X_train.txt': Training set.

* 'UCI HAR Dataset/train/y_train.txt': Training labels (The activity column).

* 'UCI HAR Dataset/test/X_test.txt': Test set.

* 'UCI HAR Dataset/test/y_test.txt': Test labels (The activity column).

* 'UCI HAR Dataset/test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample.

* 'UCI HAR Dataset/train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample.

* 'UCI HAR Dataset/features.txt': List of all features.

* 'UCI HAR Dataset/activity_labels.txt': Links the class labels with their activity name.

All the data above combine. Than it will only extract Subject, Activity, Mean ```mean()``` and Standard Deviation ```std()``` data. 
After that, all the name columnes being rename in order to give more descriptive name.

The tidy dataset contain the average of each variable for each activity and each subject. Final results will give 68 columns and 180 rows.
Where there are 30 subjects which doing 6 activities and mesured by 66 features.

## Columns

1.	"Subject" - Subject who perform the activity. Its range is from 1 to 30.

2.	"Activity" - List of activities that being done by Subject. There are six (6) activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

3. 	Features
	All features have been rename to below format.
	[domain][sensor]_[measurement type]_[axial signals]

* ``` domain ```
	* Freq - Frequency domain signal
	* Time - Time domain Signal

* ``` sensor ```
	* Acc - acceleratometer
	* Gyro - gyroscope
	* Body - Body Acceleration Signal
	* Gravity - Gravity Acceleration Signal
	* Jerk - jerk signals
	* Mag - magnitude of these three-dimensional signals were calculated using the Euclidean norm 

* ```mesurement type```
	* mean - mean
	* std - standard deviation

* ```axial signals```
	* X
	* Y
	* Z

For example: TimeBodyAccJerk_mean_Y, FreqBodyAccMag_std

## Notes
The are fixes being done on features label. ```BodyBody``` is fixed to ```Body``` only. Example: ```fBodyBodyGyroMag``` rename to ```fBodyGyroMag```