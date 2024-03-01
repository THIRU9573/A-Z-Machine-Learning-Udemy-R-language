#Naive Bayes Theorem:

dataset = read.csv("C:/data Science/Machine Learning-A-Z-Codes-Datasets/Machine Learning A-Z (Codes and Datasets)/Part 3 - Classification/Section 16 - Support Vector Machine (SVM)/R/Social_Network_Ads.csv")

dataset = dataset[,3:5]

str(dataset)
summary(dataset)

#Fitting the training and testing model
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased,SplitRatio = 0.75)
training_set = subset(dataset,split == TRUE)
test_set = subset(dataset,split == FALSE)

#Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

#train the naiveBayes to the dataset
#install.packages('e1071')
library(e1071)
classifier = naiveBayes(x = training_set[-3],
				y = training_set$Purchased )

#Predict the test result:
y_pred = predict(classifier,newdata = test_set[-3])

#Make the confusion matrix
cm = table(test_set[, 3],y_pred)


#Visualising the training set
library(ElemstatLearn)
set = training_set
X1 = seq(min(set[,1])-1,max(seq[,1])+1,by = 0.01)
X2 = seq(min(set[,2])-1,max(seq[,2])+1,by =0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age','EstimatedSalary')
prob_set = predict(classifier, type  = 'response',newdata = grid_set)
y_grid = predict(classifier,newdata = grid_set)
plot(set[,-3],
	main = 'Naive Bayes(Training set)',
xlab = 'Age', ylab = 'EstimatedSalary',
xlim = range(X1),ylim = range(X2))
contour(X1,X2,matrix(as.numeric(y_grid),length(X1),length(X2)),add = TRUE)
points(grid_set, pch = '.',col = ifelse(y_grid == 1,'springgreen3','tomato'))
points(set,pch = 21,bg = ifelse(set[,3]==1,'green4','red3'))

#Visualising the test set
library(ElemstatLearn)
set = test_set
X1 = seq(min(set[,1])-1,max(seq[,1])+1,by = 0.01)
X2 = seq(min(set[,2])-1,max(seq[,2])+1,by =0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age','EstimatedSalary')
prob_set = predict(classifier, type  = 'response',newdata = grid_set)
y_grid = predict(classifier,newdata = grid_set)
plot(set[,-3],
	main = 'Naive bayes(Test set)',
xlab = 'Age', ylab = 'EstimatedSalary',
xlim = range(X1),ylim = range(X2))
contour(X1,X2,matrix(as.numeric(y_grid),length(X1),length(X2)),add = TRUE)
points(grid_set, pch = '.',col = ifelse(y_grid == 1,'springgreen3','tomato'))
points(set,pch = 21,bg = ifelse(set[,3]==1,'green4','red3'))


