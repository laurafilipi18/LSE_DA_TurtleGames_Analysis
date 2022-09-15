#week 5 Assignment

#Import packages to run the analysis
library(tidyverse)

#Import the turtle_sales.csv data file, 
sales <- read.csv(file.choose(), header=T)

#Sense check the data 
View(sales_1)

tibble(sales_1)

head(sales_1)

tail(sales_1) 

dim(sales_1)

str(sales_1)

glimpse(sales_1) 

#calculate the mean for all three columns
aggregate(NA_Sales+EU_Sales+Global_Sales~Product,sales_1, mean)


#calculate the min for all three columns
aggregate(NA_Sales+EU_Sales+Global_Sales~Product,sales_1, min)

#calculate the max for all three columns
aggregate(NA_Sales+EU_Sales+Global_Sales~Product,sales_1, max)

summary(sales_1)

class(sales_1)

# Group by the whole data frame.
#group_by(sales_1) %>% sum(product_id=Product)

sales_1 %>% group_by(Product) %>% summarize(sum(NA_Sales+EU_Sales+Global_Sales))



# Specify qqnorm function (draw a qqplot).
qqnorm(sales_1$Global_Sales)

# Specify qqline function.
qqline(sales_1$Global_Sales) 


# Specify shapiro.test function (Shapiro-Wilk test).
shapiro.test(sales_1$EU_Sales)
shapiro.test(sales_1$NA_Sales)
shapiro.test(sales_1$Global_Sales)


# Install the moments package and load the library.
install.packages('moments') 
library(moments)

# Specify the skewness and kurtosis functions.
skewness(sales_1$EU_Sales)
kurtosis(sales_1$EU_Sales)
skewness(sales_1$NA_Sales)
kurtosis(sales_1$NA_Sales)
skewness(sales_1$Global_Sales)
kurtosis(sales_1$Global_Sales)

#Determine correlation in the sales data set

#Removing unnecessary columns 
sales_2 <- select(sales_1, -Platform) 

# Round the values to two decimals places.
sales_3 <- round(sales_2, digits=2)

# Convert the data set into a tibble.
head(sales_3)

# Determine the correlation for the sales data.
round (cor(sales_3),
       digits=2)



#Drawing the line of Best fit for EU_Sales

ggplot(data=sales_1,
       mapping=aes(x=NA_Sales, y=EU_Sales)) +
  geom_point(color='red',
             alpha=.5,
             # A plus symbol adds another layer to our plot.
             size=3) +  
  # Add the line-of-best-fit to the plot.
  geom_smooth(formula = y ~ x, method='lm')
  labs(title="NA_Sales and EU_Sales")
  
  
#Drawing the line of Best fit for NA_Sales

ggplot(data=sales_1,
         mapping=aes(x=EU_Sales, y=NA_Sales)) +
    geom_point(color='red',
               alpha=.5,
               # A plus symbol adds another layer to our plot.
               size=3) +  
    # Add the line-of-best-fit to the plot.
    geom_smooth(formula = y ~ x, method='lm')
  #labs(title="NA_Sales per Product")
  
#Drawing the line of Best fit for Global_Sales
  
ggplot(data=sales_1,
         mapping=aes(x=Global_Sales, y=NA_Sales)) +
    geom_point(color='red',
               alpha=.5,
               # A plus symbol adds another layer to our plot.
               size=3) +  
# Add the line-of-best-fit to the plot.
    geom_smooth(formula = y ~ x, method='lm')
  #labs(title="Global_Sales per Product")
  
  

# For a publication:
ggplot(sales_1, aes(x=EU_Sales, fill=Product)) +
  geom_bar() +
  theme_classic()


# We have chosen the Product vs EU_Sales.
ggplot(sales_1, aes(x=EU_Sales, y=Product)) +
  geom_boxplot(fill='green',
               notch=TRUE,
               outlier.color='blue')


# Plot age on a histogram.
ggplot(sales_1, aes(x=Product)) +
  geom_histogram(stat='count',
                 fill='blue')


  

    
  