#DATA PREPROCESSING:

#IMPORTING THE DATA:

data = read.csv("C:/data Science/Machine Learning-A-Z-Codes-Datasets/Machine Learning A-Z (Codes and Datasets)/Part 1 - Data Preprocessing/Section 2 -------------------- Part 1 - Data Preprocessing --------------------/R/Data.csv")
#data = data[, 2:3]
# taking care of missing values

data$Age = ifelse(is.na(data$Age),ave(data$Age, 
            FUN = function(x)mean(x,na.rm = TRUE)),
            data$Age)
data$Salary = ifelse(is.na(data$Salary),ave(data$Salary,
		   FUN = function(x)mean(x,na.rm = TRUE)),
			data$Salary)

#Encoding the categorical data:
data$Country = factor(data$Country,
                       levels = c('France','Spain','Germany'),
                       labels = c(1,2,3))
data$Purchased = factor(data$Purchased,
                        levels = c('No','Yes'),
                        labels = c(0,1))

#Splitting the dataset into trainig set and testing set
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(data$Purchased,SplitRatio = 0.8)

training_set = subset(data, split == TRUE)
test_set = subset(data, split == FALSE)

#install 'utils' packages for view
install.packages('utils')
library(utils)
view(training_set)

#Feature Scaling:
training_set = scale(training_set)
test_set = scale(test_set)

# training_set = scale(training_set)
#Error in colMeans(x, na.rm = TRUE) : 'x' must be numeric
#> test_set = scale(test_set)
#Error in colMeans(x, na.rm = TRUE) : 'x' must be numeric

#Feature Scaling:
training_set[, 2:3] = scale(training_set[,2:3])
test_set[,2:3] = scale(test_set[,2:3])


 







