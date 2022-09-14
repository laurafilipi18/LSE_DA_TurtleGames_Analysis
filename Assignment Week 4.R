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

#Create a histogram for NA_sales
# First pass the x-variable, then specify the data source. 
qplot(NA_Sales, data=sales_1)

# Correcting the nr of bins by lowering it from 30 to 10. 
qplot(NA_Sales, bins=10, data=sales_1)

#As the nr of bins is still high, it'll be reduced to 5
qplot(NA_Sales, bins=5, data=sales_1)


#Create a histogram for EU_Sales
# First pass the x-variable, then specify the data source. 
qplot(EU_Sales, data=sales_1)

#Reducing the number of bins to 5
qplot(EU_Sales, bins=5, data=sales_1)


#Create a histogram for Global_Sales
# First pass the x-variable, then specify the data source. 
qplot(Global_Sales, data=sales_1)

#Reducing the number of bins to 5
qplot(Global_Sales, bins=5, data=sales_1)




#Creating a Scatterplot based on the platform for NA_Sales
# Specify X as NA_Sales, y as Platform , and sales_1 as the data source 
qplot(NA_Sales, Platform, data=sales_1)

# Specifying X as EU_Sales, y as Platform , and sales_1 as the data source 
qplot(EU_Sales, Platform, data=sales_1)

# Specifying X as Global_Sales, y as Platform , and sales_1 as the data source 
qplot(Global_Sales, Platform, data=sales_1)

#Creating a Scatterplot based on the Product for NA_Sales
# Specify X as NA_Sales, y as Product , and sales_1 as the data source 
qplot(NA_Sales, Product, data=sales_1)

# Specifying X as EU_Sales, y as Product , and sales_1 as the data source 
qplot(EU_Sales,Product, data=sales_1)

# Specifying X as Global_Sales, y as Product, and sales_1 as the data source 
qplot(Global_Sales, Product, data=sales_1)


#Creating a boxplot that shows the relationship between Platform and EU_Sales
qplot(Platform, EU_Sales, data=sales_1, geom='boxplot')

#Creating a boxplot that shows the relationship between Platform and NA_Sales
qplot(Platform, NA_Sales, data=sales_1, geom='boxplot')

#Creating a boxplot that shows the relationship between Platform and Global_Sales

qplot(Platform, Global_Sales, data=sales_1, geom='boxplot')
