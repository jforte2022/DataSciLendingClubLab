# LendingClub Direction
# The data set was available to the public in the past from this url( http://www.lendingclub.com/info/download-data.action"), which is not the case anymore. Just pretend that you have download the data from YEAR 2007-2011 in a csv format.
# save your file  LoanStats3a.csv  Download LoanStats3a.csvin the Introduction to Data Science folder. 


#Q1: Set the directory to the Introduction to Data Science folder.
#setwd("C:/Users/lonihagen/Desktop/Intro.Data.Science") ### This is my directory. Change the directory to yours.
setwd("C:/Users/andre/OneDrive/Desktop/IntroDataSci")

#Q2: read the csv file using read.csv. set "stringAsFactors=FALSE" and create a dataframe called "data" 
data <- data.frame(read.csv("C:/Users/andre/Downloads/LoanStats3a.csv", stringsAsFactors = FALSE))

#Q3: Print the first and the last six rows using "head" and "tail" functions
head(data, 6)
tail(data, 6)

#Q4: Investigate the first line. If you think the first row is not necessary, then delete the first row of the dataframe and assign the result to the dataframe "data" The data should now include headers in the first row.
colnames(data) <- data[1,]


#Q5: Related with the #Q4, R program may not know the first row is a header. You may let R know that the first row is a "header." HINT: You can do this by using "colnames" function and assign the first row (data[1, ]) as column names of the data frame. Then delete the old first row so that you don't have the identical row appearing in the first row.
data <- data[-1,]

# Next, replace "id" column with serial numbers.
colnames(data)[colnames(data) == "id"] <- "serialNumbers"

#Q6: create a vector with 1 through the number of rows. use "nrows" The length of the rows should be over 42000.
serialNumberVector <- c(1:nrow(data))

#Q7: replace "id" column with the new vector you just created. Now, "id" column is populated with serial numbers rather than empty.
data$serialNumbers <- serialNumberVector

# Next, you will drop all the columns starting from "annual_inc_joint" (the index of this column is 54) through the end of the columns
# For your information:
#a <-grep("annual_inc_joint", colnames(data))
#a
# will yield 54
data <- data[,-54:-ncol(data)]

#create a vector containing the names of all the variables that are empty.
#empty columns are ("member_id", "emp_title","url", "desc","mths_since_last_delinq", "mths_since_last_record", "next_pymnt_d", "mths_since_last_major_derog")
#list <-c("member_id", "emp_title","url", "desc","mths_since_last_delinq", "mths_since_last_record", "next_pymnt_d", "mths_since_last_major_derog")
#list
# And the column indices of the empty columns are as below:
#match(list, names(data))
#[1] 2 11 19 20 29 30 48 51
list <- c("member_id", "emp_title","url", "desc","mths_since_last_delinq", "mths_since_last_record", "next_pymnt_d", "mths_since_last_major_derog")
match(list, names(data))

#Q8. Delete the columns indexed: (2, 11, 19, 20, 29, 30, 48, 51) and assign the result to the dataframe "data"
data <- data[, -match(list, names(data))]

#Q9. If you look at your Global Environment, you will find several numeric variables are "char" (character variables). Switch these columns (loan_amt, funded_amnt, funded_amnt_inv, annual_inc), which are character vectors, to numeric vectors. Then assign this to the dataframe "data"
data$loan_amnt <- as.numeric(data$loan_amnt)
data$funded_amnt <- as.numeric(data$funded_amnt)
data$funded_amnt_inv <- as.numeric(data$funded_amnt_inv)
data$annual_inc <- as.numeric(data$annual_inc)

#Q10. Save the data frame as a csv file. Upload your csv file.
write.csv(data, "LendingClubLab.JF.csv")
save.image(file = 'Forte.RData')