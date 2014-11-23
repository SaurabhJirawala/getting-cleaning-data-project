getting-cleaning-data-project
=============================
#system description on which script is created
R 3.1.2(64 bit)
Rstudio 0.98.1091

#input
1. Data set from : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#code
 run_analysis.R contains the script to obtain output
 
#prequisite
The data set should be unziped in the current working directory
dplyr package instaled on your system.
set the current working directory where the data folder resites.

#output
tidydata.txt
finaldata - data frame containing the merged data

#note
user can comment the rm command to know the intermediate output
