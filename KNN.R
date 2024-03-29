#KNN - K Nearest Neighbors:

dataset = read.csv("C:/data Science/Machine Learning-A-Z-Codes-Datasets/Machine Learning A-Z (Codes and Datasets)/Part 3 - Classification/Section 15 - K-Nearest Neighbors (K-NN)/R/Social_Network_Ads.csv")

dataset = dataset[:,3:5]


str(dataset)
summary(dataset)

#Splitting the dataset into training set and test set
library(caTools)
split = sample.split(dataset$Purchased,SplitRatio = 0.75)
training_set = subset(dataset,split = TRUE)
test_set = subset(dataset,split = FALSE)

#Feature Scaling
training_set[,1:2] = scale(training_set[,1:2])
test_set[,1:2] = scale(test_set[,1:2])

#Fitting the KNN to training set
library(class)
y_pred = knn(train = training_set[,-3],
		test = test_set[,-3],
		cl = training_set[, 3],
		k = 5)

#Making the Confusion matrix
cm = table(test_set[,3],y_pred)

#Visualising the training set result
#install.packages('ElemStatLearn')
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[,1])-1, max(set[,1])+1,by = 0.01)
X2 = seq(min(set[,2])-1, max(set[,2])+1,by = 0.01)
grid_set = expand.grid(X1,X2)
colnames(grid_set) = c('Age','EstimatedSalary')
prob_set = predict(classifier,type = 'response',newdata = grid_set)
y_grid = knn(train = training_set[,-3],
		test = test_set[,-3],
		cl = training_set[, 3],
		k = 5)
 
plot(set[,-3],
	main = 'Logistic Regression(Training set)',
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
y_grid = knn(train = training_set[,-3],
		test = test_set[,-3],
		cl = training_set[, 3],
		k = 5)

plot(set[,-3],
	main = 'Logistic Regression(Test set)',
	xlab = 'Age',ylab = 'Estimated Salary',
	xlim = range(X1),ylim = range(X2))
contour(X1,X2,matrix(as.numeric(y_grid),length(X1),length(X2)),add = TRUE)
points(grid_set, pch = '.',col = ifelse(y_grid == 1,'springgreen3','tomato'))
points(set,pch = 21,bg = ifelse(set[,3]==1,'green4','red3'))
	




 



