#Import packages to run the analysis
library(tidyverse)

#Import the turtle_sales.csv data file, 
sales <- read.csv(file.choose(), header=T)

#Explore the data set.
head(sales)

#View the data set

# Convert data frame to a tibble.
as_tibble(sales)


# Use the glimpse() function.
glimpse(sales)


# Use the summary() function.
summary(sales)

#Remove redundant columns (Ranking, Year, Genre, Publisher) 
#by creating a subset of the data frame.
sales_1 <- select(sales, -Ranking, -Year, -Genre, -Publisher)

# Check the new data frame.
head(sales_1)

#Check for missing values
sum(is.na(sales_1))

#Summary of the new data frame.
summary(sales_1)

#Create a histogram for NA_Sales
qplot(NA_Sales, data=sales_1)

#Reducing the number of bins to 5
qplot(NA_Sales, bins=5, data=sales_1)


#Create a histogram for EU_Sales
qplot(EU_Sales, data=sales_1)

#Reducing the number of bins to 5
qplot(EU_Sales, bins=5, data=sales_1)


#Create a histogram for Global_Sales
qplot(Global_Sales, data=sales_1)

#Reducing the number of bins to 5
qplot(Global_Sales, bins=5, data=sales_1)




#Creating a Scatterplot based on the platform for NA_Sales
qplot(NA_Sales, Product, data=sales_1)


#Creating a Scatterplot based on the platform for NA_Sales
qplot(EU_Sales, Product, data=sales_1)


#Creating a Scatterplot based on the platform for NA_Sales
qplot(Global_Sales, Product, data=sales_1)




#Creating a boxplot that shows the relationship between Product and NA_Sales
qplot(NA_Sales, Product, data=sales_1, geom='boxplot')

#Creating a boxplot that shows the relationship between Product and EU_Sales
qplot(EU_Sales, Product, data=sales_1, geom='boxplot')


#Creating a boxplot that shows the relationship between Product and Global_Sales
qplot(Global_Sales, Product, data=sales_1, geom='boxplot')
