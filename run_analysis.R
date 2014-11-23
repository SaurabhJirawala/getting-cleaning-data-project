test <- read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"")
train <- read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"")
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt", quote="\"")
testactivity <- read.table("./UCI HAR Dataset/test/y_test.txt", quote="\"")
trainactivity <- read.table("./UCI HAR Dataset/train/y_train.txt", quote="\"")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt", quote="\"")
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", quote="\"")
labels <- read.table("./UCI HAR Dataset/features.txt", quote="\"")
labelindex<-grep("(mean|std)",labels$V2)
requiredtest<-test[,labelindex]
requiredtrain<-train[,labelindex]
rm(test)
rm(train)
names(subjecttest)<-"subject"
names(subjecttrain)<-"subject"
names(requiredtrain)<-labels$V2[labelindex]
names(requiredtest)<-labels$V2[labelindex]
rm(labels)
requiredtestwithactivity<-cbind(subjecttest,testactivity,requiredtest)
requiredtrainwithactivity<-cbind(subjecttrain,trainactivity,requiredtrain)
rm(requiredtest)
rm(requiredtrain)
rm(subjecttest,subjecttrain)
rm(labelindex)
names(requiredtestwithactivity)[2]<-"activityid"
names(requiredtrainwithactivity)[2]<-"activityid"
names(activitylabels)<-c("activityid","activity")
testdata<-merge(activitylabels,requiredtestwithactivity,by="activityid")
traindata<-merge(activitylabels,requiredtrainwithactivity,by="activityid")
rm(activitylabels)
finaldata<-rbind(testdata,traindata)
rm(testactivity,traindata,trainactivity,testdata)
rm(requiredtestwithactivity,requiredtrainwithactivity)
library("dplyr")
finaldata<-select(finaldata,-activityid)
finaldata$subject<-as.factor(finaldata$subject)
finaldata$activity<-as.factor(finaldata$activity)
tidydata <- ddply(finaldata, .(subject, activity), .fun=function(x){ colMeans(x[,-(1:2)]) })
write.table(tidydata,file = "./tidydata.txt",row.names = FALSE)
