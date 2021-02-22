#- PRACTISE QUESTION 1 - EQUAL VARIENCE

getwd()
setwd("//peter/ZDrive/00009987/Desktop/tutorials/isds/week-05/Data/Data")
methods <- read.csv("new_standard_methods.csv")

# check data structure
str(methods)

# convert the gender to factor variable
methods$methods <- as.factor(methods$methods)
str(methods)

# check what is t.test() function
?t.test

a <- t.test(results ~ methods, data = methods, var.equal = TRUE, alternative = "greater")
str(a$statistic)

t.test(results ~ methods, data = methods, var.equal = TRUE, alternative = "greater")
t.test(results ~ methods, data = methods, var.equal = FALSE, alternative = "greater")


#   TASK 1
bonus <- read.csv("bonus.csv")
str(bonus)

bonus$gender <- as.factor(bonus$gender)

t.test(bonus ~ gender, data = bonus, var.equal = TRUE, alternative = "two.side")

# Y ~ X => y = a + bx
# Y is dependent on X

#   TASK 2
t.test(bonus ~ gender, data = bonus, var.equal = FALSE, alternative = "less")


