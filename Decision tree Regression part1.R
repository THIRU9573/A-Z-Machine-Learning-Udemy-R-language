#Decision Tree Regression 

dataset = read.csv("C:/data Science/Machine Learning-A-Z-Codes-Datasets/Machine Learning A-Z (Codes and Datasets)/Part 2 - Regression/Section 8 - Decision Tree Regression/Python/Position_Salaries.csv")

str(dataset)
summary(dataset)
dataset = dataset[2:3]

#import library
library(rpart)

#apply regresion model
regressor = rpart(formula = Salary ~., data = dataset, control = rpart.control(minsplit = 1))

#make prediction

y_pred = predict(regressor, data.frame(Level = 6.5))

#visualisation of Decision tree regression

library(ggplot2)
ggplot()+
geom_point(aes(x = dataset$Level ,y =dataset$Salary ), colour = 'red')+
geom_line(aes(x =dataset$Level ,y = predict(regressor, newdata = dataset)),colour = 'blue')
ggtitle('Decision Tree Regression')
xlab('Level')+
ylab('Salary')

#visualising the decision tree regression(for higher resolution

library(ggplot2)
x_grid = seq(min(dataset$Level),max(dataset$Level),0.01)
ggplot()+
geom_point(aes(x = dataset$Level, y = dataset$Salary),colour = 'red')+
geom_line(aes(x= x_grid,y = predict(regressor,newdata = data.frame(Level = x_grid))),colour = 'blue')+
ggtitle('Decision tree Regression')
xlab('Level')
ylab('Salary')

#plot the decision tree
plot(regressor)
text(regressor)


  