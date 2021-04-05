#Lecture
housing <- data.frame(price = c(45, 31, 27, 30, 19, 22, 40, 32, 31, 25),
                      size = c(80, 65, 55, 63, 32, 35, 54, 50, 54, 48))

lm.model <- lm(price ~ size, data = housing)
summary(lm.model)


# Multiple Linear Regression

install.packages("datarium")
library(datarium)
setwd('//peter/ZDrive/00009987/Desktop/tutorials/isds/week-09')
data("marketing")
head(marketing, 4)

model <- lm(sales ~ youtube + facebook + newspaper, data = marketing)
summary(model)

# Categorical Variables (Carseat Data)
install.packages("ISLR")
library(ISLR)
data(Carseats)    # Load the Carseats Dataset
names(Carseats)   # check out the names of variables
head(Carseats)    # prints first 6 rows
str(Carseats)     # make sure categorical variables are stored as factors

model <- lm(Sales ~ CompPrice + Income + ShelveLoc, data = Carseats)
summary(model)

# If you want to assign one of the levels manually to reference (base) level, you can do so by the following code:
# Option 1: using dplyr package
library(dplyr)    
Carseats <- Carseats %>%
  mutate(ShelveLoc = relevel(ShelveLoc, ref = "Good"))
model <- lm(Sales ~ CompPrice + Income + ShelveLoc, data = Carseats)
summary(model)

# Option 2: using base package
Carseats$ShelveLoc <- factor(Carseats$ShelveLoc, levels = c("Good", "Bad", "Medium"))
model <- lm(Sales ~ CompPrice + Income + ShelveLoc, data = Carseats)
summary(model)
