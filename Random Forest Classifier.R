#Random Forest classifier:

dataset = read.csv("C:/data Science/Machine Learning-A-Z-Codes-Datasets/Machine Learning A-Z (Codes and Datasets)/Part 3 - Classification/Section 20 - Random Forest Classification/R/Social_Network_Ads.csv")
dataset = dataset[3:5]

str(dataset)
summary(dataset)

#Encoding the target features as factor
dataset$Purchased = factor(dataset$Purchased,levels = c(0,1))

#Splite the dataset into training and test
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset,split == FALSE)

#Feature Scaling:
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(training_set[-3])

#train the Random Forest Classifier to dataset
#install.packages('randomForest')
library(randomForest)
classifier = randomForest(x = training_set[-3],
				  y = training_set$Purchased,
				  ntree = 10) 
#predict the test result
y_pred = predict(classifier,newdata = test_set[-3])

#Find Confusion matrix 
cm = table(test_set[, 3],y_pred)




#Visualising the training set result
#install.packages('ElemStatLearn')
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[,1])-1, max(set[,1])+1,by = 0.01)
X2 = seq(min(set[,2])-1, max(set[,2])+1,by = 0.01)
grid_set = expand.grid(X1,X2)
colnames(grid_set) = c('Age','EstimatedSalary')
prob_set = predict(classifier,type = 'response',newdata = grid_set)
y_grid = ifelse(prob_set > 0.5,1,0)
plot(set[,-3],
	main = 'Random Forest Classifier(Training set)',
	xlab = 'Age',ylab = 'Estimated Salary',
	xlim = range(X1),ylim = range(X2))
contour(X1,X2,matrix(as.numeric(y_grid),length(X1),length(X2)),add = TRUE)
points(grid_set, pch = '.',col = ifelse(y_grid == 1,'springgreen3','tomato'))
points(set,pch = 21,bg = ifelse(set[,3]==1,'green4','red3'))
	
#Visualising the Test set result
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[,1])-1, max(set[,1])+1,by = 0.01)
X2 = seq(min(set[,2])-1, max(set[,2])+1,by = 0.01)
grid_set = expand.grid(X1,X2)
colnames(grid_set) = c('Age','EstimatedSalary')
prob_set = predict(classifier,type = 'response',newdata = grid_set)
y_grid = ifelse(prob_set > 0.5,1,0)
plot(set[,-3],
	main = 'Random forest classifier(Test set)',
	xlab = 'Age',ylab = 'Estimated Salary',
	xlim = range(X1),ylim = range(X2))
contour(X1,X2,matrix(as.numeric(y_grid),length(X1),length(X2)),add = TRUE)
points(grid_set, pch = '.',col = ifelse(y_grid == 1,'springgreen3','tomato'))
points(set,pch = 21,bg = ifelse(set[,3]==1,'green4','red3'))
	
