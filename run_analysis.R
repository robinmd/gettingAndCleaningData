features  <- read.table("data/features.txt")
labels <- read.table("data/activity_labels.txt")
trainData <- read.table("data/train/x_train.txt", col.names=features$V2)
testData <- read.table("data/test/x_test.txt", col.names=features$V2)

trainLabel <- read.table("data/train/y_train.txt")
testLabel <- read.table("data/test/y_test.txt")

trainSubject <- read.table("data/train/Subject_train.txt")
testSubject <- read.table("data/test/subject_test.txt")

#trainData$activity <- labels$V2[trainLabel$V1]
#testData$activity <- labels$V2[testLabel$V1]

#trainData$subject <- trainSubject$V1
#testData$subject <- testSubject$V1

trainData <- cbind(labels$V2[trainLabel$V1],trainData)
colnames(trainData)[1] <- "activity"

trainData <- cbind(trainSubject$V1,trainData)
colnames(trainData)[1] <- "subject"

testData <- cbind(labels$V2[testLabel$V1],testData)
colnames(testData)[1] <- "activity"

testData <- cbind(testSubject$V1,testData)
colnames(testData)[1] <- "subject"

allData <- dplyr::bind_rows(trainData,testData)


#grep("max",features)
#wanted <- grepl("Mean",features$V2) | grepl("mean",features$V2) | grepl("std",features$V2)
myData <- dplyr::select(allData,matches(".ean.|.std.|subject|activity"))
write.table(myData,file="smartPhone.txt",row.name=FALSE)
