fileurl <- "http://spark-public.s3.amazonaws.com/stats1/datafiles/Stats1.13.HW.04.txt"; 

HW4 <- read.table( fileurl , header = TRUE );


names(HW4)

# [1] "ID"      "salary"  "years"   "courses"

attach(HW4)

#########################################
# # Question 1
# What is the correlation between salary and years of professional experience?

ANS1 <- cor(salary,years)
ANS1 <- round(ANS1,2)
ANS1
#########################################

# Question 2
# What is the correlation between salary and courses completed?


ANS2 <- cor(salary,courses)
ANS2 <-round(ANS2,2)
ANS2
#########################################

# Question 3
# What is the percentage of variance explained in a regression model with salary as the outcome variable and professional experience as the predictor variable?

FitQ3 <- lm(salary~years)
ANS3 <-summary(FitQ3)$r.squared
ANS3

#Express this answer as a percentage.
# e.g. 0.7911 = 79 %

ANS3 <-floor(ANS3*100)

#########################################

# Question 4
# Compared to the model from # Question 3, would a regression model predicting salary from the number of courses be considered a better fit to the data?

FitQ4 <- lm(salary~courses)
ANS4.a <-summary(FitQ4)$r.squared
c(ANS3,ANS4.a)

#Which of the two is larger?
ANS4 <-c("No")
#########################################

# Question 5
# Now let's include both predictors (years of professional experience and courses completed) in a regression model with salary as the outcome. 
# Now what is the percentage of variance explained?

FitQ5 <- lm(salary~years+courses)
ANS5 <-summary(FitQ5)$r.squared
ANS5

ANS5 <-floor(ANS5*100)

#Express this answer as a percentage.
# e.g. 0.7911 = 79 %

#########################################

# Question 6
# What is the standardized regression coefficient for years of professional experience, predicting salary?
# N.B. Same model as Q3



FitQ6 <- lm(scale(salary) ~ scale(years))
summary(FitQ6)
coef(FitQ6)

#More precisely - to two decimal places
ANS6 <- round(coef(FitQ6)[2],2)

#########################################

# Question 7
# What is the standardized regression coefficient for courses completed, predicting salary?
# N.B. Same model as Q4

FitQ7 <- lm(scale(salary) ~ scale(courses))
summary(FitQ7)
coef(FitQ7)


#More precisely - to two decimal places
ANS7 <- round(coef(FitQ7)[2],2)

#########################################

# Question 8
# What is the mean of the salary distribution predicted by the model including both years of professional experience 
# and courses completed as predictors? (with 0 decimal places)

ANS8 <- mean(fitted(FitQ5))

#With no decimal places
ANS8 <- round(ANS8,0)
ANS8

# Correct Answwer 75426
#########################################

# Question 9
# What is the mean of the residual distribution for the model predicting salary from both years of professional experience and courses completed? (with 0 decimal places)
ANS9 <- mean(residuals(FitQ5))

ANS9 <- round(ANS9,0)
ANS9


# By Definition, the answer must be 0.

#########################################

# Question 10
# Are the residuals from the regression model with both predictors normally distributed?
Resids=resid(FitQ5)
shapiro.test(Resids)
# High p-value
# Can Conclude residuals are normally distributed.
ANS10 <- c("YES")
#########################################

detach(HW4)
