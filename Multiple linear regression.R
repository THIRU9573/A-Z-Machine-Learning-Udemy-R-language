# Multiple  Linear Regression:

data = read.csv("C:/data Science/Machine Learning-A-Z-Codes-Datasets/Machine Learning A-Z (Codes and Datasets)/Part 2 - Regression/Section 5 - Multiple Linear Regression/R/50_Startups.csv")

str(data)
summary(data)

#Encoding the categorical data:
data$State = factor(data$State,
                    levels = c('New York','California','Florida'),
                    labels = c(1,2,3))

#Split the dataset into training  and test set:
library(caTools)
set.seed(123)
split = sample.split(data$Profit,SplitRatio = 0.8)
training_set =subset(data, split == TRUE)
test_set = subset(data, split == FALSE) 

#Fitting the Multiple Linear Regression:
regressor = lm(formula = Profit~.,
                data = training_set)
summary(regressor)

#predict the test set result:
y_pred = predict(regressor,newdata = test_set)

#Built the optimal model using the backward elimination:
regressor = lm(formula = Profit ~ R.D.Spend+Administration+Marketing.Spend+State,
                data = data)
summary(regressor)


regressor = lm(formula = Profit ~ R.D.Spend+Administration+Marketing.Spend,
                data = data)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend+Marketing.Spend,
                data = data)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend,
                data = data)
summary(regressor)




