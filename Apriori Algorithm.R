#Apriori  Algorithms:

#DataPreprocessing:

#install.packages('arules')

library(arules)

dataset = read.csv("C:/Users/thiru/Downloads/Resume/Machine Learning A-Z (Codes and Datasets)/Part 5 - Association Rule Learning/Section 28 - Apriori/R/Market_Basket_Optimisation.csv", header = FALSE)

dataset = read.transactions("C:/Users/thiru/Downloads/Resume/Machine Learning A-Z (Codes and Datasets)/Part 5 - Association Rule Learning/Section 28 - Apriori/R/Market_Basket_Optimisation.csv", sep = ',', rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset,topN = 10)

#Training Apriori on dataset:

rules = apriori(data = dataset,parameter = list(support = 0.003,confidence = 0.4))

#Visualising the result:
inspect(sort(rules, by = 'lift')[0:10])