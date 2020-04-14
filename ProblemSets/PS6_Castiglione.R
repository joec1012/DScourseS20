library(rvest)
library(readr)
library(DT)


#Strength Coach Salary Cleaning

#Getting rid of Dollar Signs
Salary$`School Pay`<- parse_number(Salary$`School Pay`)
Salary$`Total Pay`<- parse_number(Salary$`Total Pay`)
Salary$`Max Bonus` <-  parse_number(Salary$`Max Bonus`)

#Getting rid of empty values and replacing with NA
is.na(Salary)<-Salary == "--"

#Removing last column
Salary = Salary[-132,]

#Salary Visualization
library(ggplot2)
#Scatter Plot of Base Salary
 
#Histogram on Salary
ggplot() + geom_histogram(data=Salary, aes(x = Salary$`Total Pay`)) +xlab("Total Pay") + ylab("Count") + ggtitle('Divsion 1 Strength Coach Salary')
+  scale_x_discrete(label=function(x) format(x, scientific = FALSE))

#Box Plot
ggplot()+
geom_boxplot(data=Salary,aes(x = Salary$`Total Pay`, y = Salary$Conf))

#Scatter Plot
ggplot(Salary, aes(x=as.factor(Salary$Conf), y = Salary$`Total Pay`)) + 
  geom_point() + scale_y_continuous(label=function(y) format(y, scientific = FALSE))


