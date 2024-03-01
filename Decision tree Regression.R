#Decision Tree Regression:

dataset = read.csv("C:/data Science/Machine Learning-A-Z-Codes-Datasets/Machine Learning A-Z (Codes and Datasets)/Part 2 - Regression/Section 8 - Decision Tree Regression/Python/Position_Salaries.csv")

str(dataset)
summary(dataset)


#Fitting the Decision tree Regression
install.packages('rpart')
library(rpart)
#Apply regressoin model on data

regressor = rpart(formula = Salary ~ .,data = dataset)

#predict the values
y_pred = predict(regressor,matrix(6.5))

#visualising the decision tree results

