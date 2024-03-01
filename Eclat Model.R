#Eclat Model

library(arules)
 

dataset = read.csv("C:/Users/thiru/Downloads/Resume/Machine Learning A-Z (Codes and Datasets)/Part 5 - Association Rule Learning/Section 29 - Eclat/Python/Market_Basket_Optimisation.csv",header = FALSE)

dataset = read.transactions("C:/Users/thiru/Downloads/Resume/Machine Learning A-Z (Codes and Datasets)/Part 5 - Association Rule Learning/Section 28 - Apriori/R/Market_Basket_Optimisation.csv", sep = ',', rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset,topN = 10)

#Training Eclat on dataset:

rules = eclat(data = dataset,parameter = list(support = 0.003,minlen = 2))

#Visualising the result:
inspect(sort(rules, by = 'support')[0:10])