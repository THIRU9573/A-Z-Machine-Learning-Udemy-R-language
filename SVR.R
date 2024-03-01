#Support Vector Regression:

dataset = read.csv("C:/data Science/Machine Learning-A-Z-Codes-Datasets/Machine Learning A-Z (Codes and Datasets)/Part 2 - Regression/Section 7 - Support Vector Regression (SVR)/R/Position_Salaries.csv")

str(dataset)
summary(dataset)
dataset = dataset[2:3]

#Splitting the data into training and testing set: 
#library(caTools)
#set.seed(123)
#split = sample.split(data$Saraly,SplitRatio = 0.8)
#training_set = subset(data, split == TRUE)
#test_set = subset(data, split == FALSE)


#Fitting the  Regression Model on dataset:
install.packages('e1071')
library(e1071)
regressor = svm(formula = Salary ~.,data = dataset,type  = 'eps-regression')


# predict the new result with Linear Regression:
y_pred = predict(regressor, data.frame(Level = 6.5))


#Visualising the Regression Model:
library(ggplot2)
ggplot()+
geom_point(aes(x = dataset$Level, y = dataset$Salary),
colour = 'red')+
geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
colour = 'blue')+
ggtitle('Regression Model')+
xlab("Level")
ylab("Salary")


#Visualising the Regression Model(higher resolution and smooter curve ):
library(ggplot2)
x_grid = seq(min(dataset$Level),max(dataset$Level),0.1)
ggplot()+
geom_point(aes(x = dataset$Level, y = dataset$Salary),
colour = 'red')+
geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = data.frame(x_grid)),
colour = 'blue')+
ggtitle('Regression Model')+
xlab("Level")
ylab("Salary")






