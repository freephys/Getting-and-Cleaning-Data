# run_analysis.R
# @author : Ele Elyiana

# set your working directory.
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

print(paste("Set working directory into ",getwd()))


# Download and unzip data
downloadDir <- "data"
if(!file.exists(unzipDir)){
        
        if(!file.exists(downloadDir)){
                dir.create(downloadDir)
        }

        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

        zipDir <- "./data/dataset.zip"

        if(!file.exists(zipDir)){
                print("Downloading data. This will take a while.")
        
                if (grepl("Windows", sessionInfo()$running)) {
                        download.file(fileUrl ,destfile = zipDir)
                }
                else {
                        download.file(fileUrl ,destfile = zipDir, method = "curl")
                }
        }


        unzipDir <- "UCI HAR Dataset"

        unzip(zipDir, exdir = ".")
}


features <- as.character(read.table(paste(unzipDir, "features.txt", sep ="/"), header = FALSE)[,2])
activityLabel <- read.table(paste(unzipDir, "activity_labels.txt", sep ="/"), header = FALSE)

# process train data
print("process train data")

xTrain <- read.table(paste(unzipDir, "train/X_train.txt", sep ="/"), col.names = features, header = FALSE)
yTrain <- read.table(paste(unzipDir, "train/y_train.txt", sep ="/"), col.names = c('Activity'), header = FALSE)
subjectTrain <- read.table(paste(unzipDir, "train/subject_train.txt", sep ="/"), col.names = c('Subject'), header = FALSE)
training <- cbind(subjectTrain, yTrain, xTrain)

# process test data
print("process test data")

subjectTest <- read.table(paste(unzipDir, "test/subject_test.txt", sep ="/"), col.names = c('Subject'), header = FALSE)
xTest <- read.table(paste(unzipDir, "test/X_test.txt", sep ="/"), col.names = features, header = FALSE)
yTest <- read.table(paste(unzipDir, "test/y_test.txt", sep ="/"), col.names = c('Activity'), header = FALSE)
testing <- cbind(subjectTest, yTest, xTest)

# combine training and testing data
print("merged training and processing data")
combineData <- rbind(training,testing)

# get only subject, activity, mean and std deviation column
print("Select only Subject, Activity, Mean and Standard Deviation column")
cols <- grep("(-mean|-std)\\(\\)",features,value=TRUE)
cols <- gsub("-",".",cols)
cols <- gsub("\\(\\)","..",cols)

cols <- c(c("Subject","Activity"),cols)

extractData <- combineData[,cols]

print("rename column and map activity value to label")
# set meaningful variable to activity data and also data label
extractData$Activity <- activityLabel$V2[extractData$Activity]

# data column rename to meaningful name
# prefix 't' to denote time
# Note the 'f' to indicate frequency domain signals
# remove brackets () and dash -
# rename BodyBody to Body
names(extractData) <- gsub("^t","Time",names(extractData))

names(extractData) <- gsub("^f","Freq",names(extractData))

names(extractData) <- gsub("\\.\\.\\.", "_", names(extractData))

names(extractData) <- gsub("\\.\\.", "", names(extractData))

names(extractData) <- gsub("\\.","_",names(extractData))

names(extractData) <- gsub("\\(\\)","",names(extractData))

names(extractData) <- gsub("BodyBody","Body",names(extractData))

# Step 5. creates a second, independent tidy data set with the average of each variable for each activity and each subject.
print("Summarize data")
library(reshape2)
meltData <-  melt(extractData,id=c("Subject","Activity"),measure.vars = grep("std|mean",names(extractData),value=TRUE))
tidyData <- dcast(meltData,Subject+Activity~variable,mean)

if (!file.exists("./output")) {
        dir.create("./output")
}
write.table(tidyData,file="./output/tidyData.txt",row.names = FALSE)

print(paste("The tidy data has been saved at ",getwd(),"/output/tidyData.txt"))

print("Done")

















