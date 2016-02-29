wd=getwd()
setwd("C:/Users/pjrDa/Dropbox/Data Science Mooc/03 Assignments/w4/")

download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', destfile='dataset.zip')
unzip('dataset.zip')

setwd(wd)
