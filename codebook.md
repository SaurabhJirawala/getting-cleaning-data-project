---
title: "CodeBook"
output: html_document
---
#library
dplyr is used to obtain output

#Output
1. tidydata.txt
2. finaldata - dataframe

#description of transformation
This is a codebook for the coursera project for getting and cleaning data.

Final Output of the Script will not contain the temporary variables used during transformation. They were removed from the the workspace to free up space.

Transformation used:
1. cbind :
This is used to add up subject ,activity, and data into one data set.
example code:

requiredtestwithactivity<-cbind(subjecttest,testactivity,requiredtest)

2. rbind:
this is used to merge training and test data. obtained from cbind trainsformation

3. merge(joins) :
this is used to link up activity name to data set.

4. ddply : is used to summarize the data according to subject and activity
