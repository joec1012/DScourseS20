library(mice)
library(stargazer)

#4
library(readr)

wages <- read.csv("ModelingOptimization/wages.csv")
View(wages)
#5

wages<- wages[!is.na(wages$hgc), ]
wages<- wages[!is.na(wages$tenure), ]
#6

library('stargazer')
stargazer(wages)

# 7
est.1 <- lm(logwage ~ hgc + college + tenure + tenure^2 + age + married, data = wages)
stargazer(est.1)

df.mean.imp <- wages
mean.log.wage <- mean(wages$log.wage, na.rm=TRUE)
df.mean.imp$logwage[is.na(wages$logwage)] <-mean.log.wage
stargazer(df.mean.imp)

est.2 <- lm(logwage ~ hgc + college + tenure +tenure^2 + age + married , data = df.mean.imp)
stargazer(est.2)

df.mar <- wages
df.mar$mar.logwage <-predict(est.1, df.mar)
df.mar$logwage[is.na(wages$logwage)] <-df.mar$mar.logwage[is.na(wages $logwage)]

est.3 <- lm(logwage ~ hgc + college + tenure +tenure^2 + age + married , data = df.mar)


df.mice <- mice(wages, seed = 1234)
est.4 <- lm(logwage ~ hgc + college + tenure +tenure^2 + age + married , data = df.mice$data)

stargazer(est.1,est.2, est.3, title = "RegressionResults")
