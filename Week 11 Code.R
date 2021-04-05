setwd('//peter/ZDrive/00009987/Desktop/tutorials/isds/week-11')

# Lecture material
# Insurance Data
insurance <- read.csv("insurance.csv")
insurance$gender <- ifelse(insurance$sex == "male", 1,0) # create a dummy variable for gender, male = 1, female = 0
str(insurance)
model <- lm(gender ~ charges, data = insurance)
summary(model)
plot(gender~charges, data = insurance)       # plot the regression line
abline(lm(gender ~ charges, data = insurance))


# Example: Titanic Dataset
titanic <- read.csv("titanic.csv")
fit <- glm(Survived ~ Fare, data = titanic, family = binomial)
summary(fit)
# Plot the logit model
newdat <- data.frame(Fare=seq(min(titanic$Fare), max(titanic$Fare),len=100))
newdat$Survived = predict(fit, newdata=newdat, type="response")
plot(Survived~Fare, data=titanic, col="red4")
lines(Survived~Fare, data = newdat, col="green4", lwd=2)

# Multiple Logit Regression
str(titanic)
titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Sex <- factor(titanic$Sex, levels = c("male", "female"))

train <- titanic[1:700,]
test <-  titanic[-(1:700),]

logit.fit <- glm(Survived ~ Pclass + Sex + Age + Fare, data = train, family = binomial)
summary(logit.fit)

logit.pred <- predict(logit.fit, newdata = test, type = "response")
predictions <- ifelse(logit.pred > 0.5, 1, 0) # If the probability is higher than 0.5, we classify as survived (1), otherwise as perished (0).          
#tb1 <- table(predictions, test$Survived)  
tb <- table(test$Survived, predictions, dnn = c("Actual", "Predicted")) # Confusion Matrix





findex <- read.csv("findex_uzb.csv")
# s <- sample(1: 1000, 800) ====== random 

train <- findex[1:800,] # first 800
test <- findex[-(1:800),] # rest of the data 1000 - 800

str(findex)
findex$Age <- as.numeric(findex$Age)
findex$Education <- as.factor(findex$Education)
findex$Income_status <- as.factor(findex$Income_status)
findex$ï..Gender <- as.factor(findex$ï..Gender)

# logit Modul
logit.fit <- glm(Saved ~ Age + ï..Gender + Education + Employment, data = train, family="binomial")
summary(logit.fit)

f <- data.frame(Age = 30, ï..Gender = as.factor('Female'), Education = as.factor("secondary"), Employment = 1)
predict(logit.fit, f, type="response")































