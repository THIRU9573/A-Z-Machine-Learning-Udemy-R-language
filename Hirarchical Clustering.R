#Hierarchical Clustering :


dataset = read.csv("C:/Users/thiru/Downloads/Machine Learning A-Z (Codes and Datasets)/Part 4 - Clustering/Section 25 - Hierarchical Clustering/R/mall.csv")
X <- data[4:5]

#Using dedrogram to find the optimal number of clusters

dendrogram = hclust(dist(X,method = 'euclidean'),method = 'ward.D')
plot(dendrogram,
	main = paste('dendrogram'),
	xlab = 'customers',
	ylab = 'euclidean distance')

#fitting hierarachical clustering to the dataset

hc = hclust(dist(X,method = 'euclidean'),method = 'ward.D')
y_hc = cutree(hc,5)

#Visualizing the clusters

library(cluster)
clusplot(X,
	   y_hc,
	   lines = 0,
	   shade = TRUE,
	   color = TRUE,
	  labels = 2,
	  plotchar = FALSE,
	  span = TRUE,
	  main = paste('Cluster of customers'),
	  xlab = 'AnnualIncome',
	  ylab = 'Spending Score')