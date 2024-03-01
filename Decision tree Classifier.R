#Decision tree Classifier:

dataset = read.csv("C:/data Science/Machine Learning-A-Z-Codes-Datasets/Machine Learning A-Z (Codes and Datasets)/Part 3 - Classification/Section 19 - Decision Tree Classification/R/Social_Network_Ads.csv")
dataset = dataset[3:5]

str(dataset)
summary(dataset)

#Splitting the dataset
library(caTools)
split = sample.split(dataset$Purchased,SplitRatio = 0.75)
training_set = subset(dataset, split ==TRUE)
test_set = subset(dataset,split == FALSE)

#Feature scaling:
training_set[-3] = scale(training_set[-3])
training_set[-3] = scale(training_set[-3])

#train the decision tree classification to dataset
#install.packages('rpart')
library(rpart)
classifier = rpart(formula = Purchased~., data = training_set)

#predict the test set 
y_pred = predict(classifier, newdata = test_set[-3], type = 'class')


#making confution matrix 
cm = table(test_set[,3],y_pred)

#visualisation of train dataset
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[,1]-1, max(set[,1]+1 ,by = 0.01)
X2 = seq(min(set[,2]-1, max(set[,2]+1 ,by = 0.01)
grid_set = expand.grid(X1,X2)
colnames(grid_set) = c('Age','EstimatedSalary')
y_grid = predict(classifier,newdata = grid_set,type = 'class')
plot(set[,-3],
	main = 'Decision tree classifier(Training set)',
xlab = 'Age', ylab = 'EstimatedSalary',
xlim = range(X1),ylim = range(X2))
contour(X1,X2,matrix(as.numeric(y_grid),length(X1),length(X2)),add = TRUE)
points(grid_set, pch = '.',col = ifelse(y_grid == 1,'dodgerblue', 'salmon'))
points(set,pch = 21,bg = ifelse(set[,3]==1, 'dodgerblue3', 'salmon3'))

#Visualising the test set
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[,1]-1, max(set[,1]+1 ,by = 0.01)
X2 = seq(min(set[,2]-1, max(set[,2]+1 ,by = 0.01)
grid_set = expand.grid(X1,X2)
colnames(grid_set) = c('Age','EstimatedSalary')
y_grid = predict(classifier,newdata = grid_set, type = 'class')
plot(set[,-3],
	main = 'Decision tree classifier(Training set)',
xlab = 'Age', ylab = 'EstimatedSalary',
xlim = range(X1),ylim = range(X2))
contour(X1,X2,matrix(as.numeric(y_grid),length(X1),length(X2)),add = TRUE)
points(grid_set, pch = '.',col = ifelse(y_grid == 1,'dodgerblue', 'salmon'))
points(set,pch = 21,bg = ifelse(set[,3]==1, 'dodgerblue3', 'salmon3'))

#plot the decision tree
plot(classifier)
text(classifier)




