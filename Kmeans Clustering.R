# KMeans Clustering 

data = read.csv("C:/Users/thiru/Downloads/Machine Learning A-Z (Codes and Datasets)/Part 4 - Clustering/Section 24 - K-Means Clustering/R/mall.csv")
X <- data[4:5]

#Using elbow method find the number of clusters
set.seed(6)
wcss <- vector()
for (i in 1:10) wcss[i]<- sum(kmeans(X,i)$withinss)
plot(1:10,wcss,type = "b",main = paste('Cluster of client'),xlab = "Number of cluster",ylab = "WCSS")

#Applaing the K- means to the datset
set.seed(29)
kmeans <- kmeans(X,5,iter.max = 300, nstart = 10)

# Visualising the plot
library(cluster)
clusplot(X,
         kmeans$cluster,
	   lines = 0,
	   shade = TRUE,
	   color = TRUE,
	   labels = 2,
	   plotchar = FALSE,
	   span = TRUE,
	   main = paste('Cluster of client'),
	   xlab = "Annual Income",
	   ylab = "spending Score")