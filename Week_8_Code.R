
#Lecture example
dat <- matrix(c(20, 35, 8, 12, 25, 25, 15, 10), ncol = 4, nrow = 2)
colnames(dat) <- c("ECwF", "BIS", "BABM", "Fin")
rownames(dat) <- c("Female", "Male")

wiut <- chisq.test(dat) 
round(wiut$residuals, 3)

# Let's visualize Pearson residuals using the package corrplot:
install.packages("corrplot")
library(corrplot)
corrplot(wiut$residuals, is.cor = FALSE)

# exercise 1

ex1 <- matrix(c(151, 25, 38, 4, 76, 22), ncol = 3, nrow = 2)
colnames(ex1) <- c("Single Vehicle", "Lead Vehicle", "Following Vehicle")
rownames(ex1) <- c("Complete Stop", "Not Complete Stop")

ex1Answer <- chisq.test(ex1)
round(ex1Answer$residuals, 3)

#Exercise 2

getwd()
setwd('//peter/ZDrive/00009987/Desktop/tutorials/isds/week-08')
dat <- read.csv("StarTrek.csv")
str(dat)
ex2 <- chisq.test(dat[,-1])
ex2$statistic


#Exercise 3.
file_path <- "http://www.sthda.com/sthda/RDoc/data/housetasks.txt"
housetasks <- read.delim(file_path, row.names = 1)
ex3 <- chisq.test(housetasks)

corrplot(ex3$residuals, is.cor = FALSE)
