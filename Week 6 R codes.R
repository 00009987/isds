# ----------------- #
# SEMESTER 2 WEEK 6 #
# ----------------- #
#   ONE WAY ANOVA   #   
# ----------------- #

##          ##
## SCENARIO ##
##          ##   

## Let's import our data

setwd('//peter/ZDrive/00009987/Desktop/tutorials/isds/week-06')
crop <- read.csv("Anova-Data/crop.data.csv")

crop <- read.csv("Anova-Data/crop.data.csv", colClasses = c("factor", "factor", "factor", "numeric"))


## Let's start with checking for data structure as usual
str(crop)

## Running one-way ANOVA test
one.way <- aov(yield ~ fertilizer, data = crop)
summary(one.way)


##           ##
## EXERCISES ##
##           ##

# Q1 - National Transportation Safety Board

## Creating a data.frame:
ntsb <- data.frame(
  types = as.factor(c("compact","compact", "compact", "midsize", "midsize", "midsize", "fullsize", "fullsize","fullsize")),
  pressure = c(643, 655, 702, 469, 427, 525, 484, 456, 402)
)
## Running one-way ANOVA test:
one.way <- aov(pressure ~ types, data = ntsb)
summary(one.way)


#Q2 - Girls Soccer

## file import
soccer <- read.csv("Anova-Data/Soccer.csv", colClasses = c("factor", "numeric"))

## Running one-way ANOVA test:
one.way <- aov(Goals ~ Team, data = soccer)
summary(one.way)



#Q3 - Commute mileage

## file import
mileage <- read.csv("Anova-Data/commute.csv", colClasses = c("factor", "numeric"))

## Running one-way ANOVA test:
one.way <- aov(mileage ~ group, data = mileage)
summary(one.way)


#Q4 -  Golf

## file import
golf <- read.csv("Anova-Data/golf.csv", colClasses = c("factor", "numeric"))

## Running one-way ANOVA test:
one.way <- aov(distance ~ brand, data = golf)
summary(one.way)


#Q5 -  HOMEWORK

## file import
homework <- read.csv("gpa.csv")

## data structure
str(homework)

## Factor conversion
homework$groups <- as.factor(homework$groups)

## Running one-way ANOVA test:
one.way <- aov(gpa ~ groups, data = homework)
summary(one.way)




