#Simple Linear Regression 

#Read CVS file

data = read.csv("C:/data Science/Machine Learning-A-Z-Codes-Datasets/Machine Learning A-Z (Codes and Datasets)/Part 2 - Regression/Section 4 - Simple Linear Regression/R/Salary_Data.csv")

str(data)
summary(data)
li
#Splitting the data training and testing 
#install.packages("caTools")
library(caTools)
set.seed(123)
split = sample.split(data$Salary, SplitRatio =2/3)
training_set = subset(data, split == TRUE)
testing_set = subset(data,split == FALSE)

#Feature scaling
#Training_set[,2:3] = scala(training_set[, 2:3])
#testing_set[, 2:3]=scala(testing_set[, 2:3])

#Fitting Simple Linear Regression  to Training set
regressor = lm(formula = Salary ~ YearsExperience, data = training_set)
summary(regressor)

#predict the test set result
Y_pred = predict(regressor, newdata = testing_set)

#Visualising the traing set
install.packages('ggplot2')
library(ggplot2)
ggplot()+
geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
colour = 'red')+
geom_line(aes(x= training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
colour = 'blue')+
ggtitle('Salary vs Experience(Training_set)')+
xlab("YearsExperience")+
ylab("Salary")

