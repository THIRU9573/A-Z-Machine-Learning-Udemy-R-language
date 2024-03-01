#Polynomial Regression:

dataset = read.csv("C:/data Science/Machine Learning-A-Z-Codes-Datasets/Machine Learning A-Z (Codes and Datasets)/Part 2 - Regression/Section 6 - Polynomial Regression/R/Position_Salaries.csv")
str(dataset)
summary(dataset)
dataset = dataset[2:3]

#Splitting the data into training and testing set: 
#library(caTools)
#set.seed(123)
#split = sample.split(data$Saraly,SplitRatio = 0.8)
#training_set = subset(data, split == TRUE)
#test_set = subset(data, split == FALSE)


#Fitting the Linear Regression model on dataset
regressor  = lm(formula = Salary ~ .,  
             data = dataset) 
summary(regressor)

#Fitting the Polynomial Regression Model on dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
poly_reg = lm(formula = Salary ~.,
                  data = dataset)
summary(poly_reg)

#Visualising the Linear Regression model:
#install.packages('ggplot2')
library(ggplot2)
ggplot()+
geom_point(aes(x = dataset$Level, y = dataset$Salary),
colour = 'red')+
geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
colour = 'blue')+
ggtitle('Linear Regression')+
xlab("Level")
ylab("Salary")


#Visualising the Polynomial Regression:
ggplot()+
geom_point(aes(x = dataset$Level, y = dataset$Salary),
colour = 'red')+
geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
colour = 'blue')+
ggtitle('Polynomial Linear Regression')+
xlab("Level")
ylab("Salary")

# predict the new result with Linear Regression:
y_pred = predict(regressor, data.frame(Level = 6.5))

#predict the new resukt with Polynomial Regression:
y_pred = predict(poly_reg, data.frame(Level = 6.5,
                                         Level2 = 6.5^2,
                                         Level3 = 6.5^3))
