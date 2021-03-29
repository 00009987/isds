setwd('//peter/ZDrive/00009987/Desktop/tutorials/isds/week-10')

install.packages("ISLR")
library(ISLR)
data(Carseats) 
model <- lm(Sales ~ CompPrice + Income + ShelveLoc, data = Carseats)
summary(model)

# Correlation matrix and corrplot
library(corrplot)
carseats <- Carseats[, c(2:4)]
r <- round(cor(carseats),2)
corrplot(r)

# Residual plot to check for Homoscedasticity
plot(Carseats$Income, model$residuals)
plot(Carseats$Advertising, model$residuals)

# Normality (QQ) plot
qqnorm(model$residuals)

# Example: Insurance Data
insurance <- read.csv("insurance.csv", colClasses = c("numeric", "factor", "numeric", "numeric", "factor", "factor", "numeric"))
str(insurance)
model <- lm(charges ~ age + sex + bmi+ smoker, data = insurance)
summary(model)

# Exercise 1
movies <- read.csv("movies.csv")
str(movies)
movies$Rating <- as.factor(movies$Rating)

model <- lm(USRevenue ~ Budget + Opening + Rating, data = movies)
summary(model)

# Normality
qqnorm(model$residuals)

# Multicolliniarity
cor(movies$Budget, movies$Opening)

# Homoscedasticity
plot(movies$Budget, model$residuals)

model2 <- lm(USRevenue ~ Budget + Opening + Rating + Opinion, data = movies)
summary(model2)
