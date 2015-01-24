#change the https to http
fileurl ="http://d396qusza40orc.cloudfront.net/stats1%2Fdatafiles%2FStats1.13.HW.06.txt"


HW6data <- read.table( fileurl , header = TRUE );


#########################################################################################
# Question 1
# In a model predicting salary, what is the unstandardized regression coefficient for 
# years, assuming years is the only predictor variable in the model?


#########################################################################################
# Question 2
# In a model predicting salary, what is the 95% confidence interval for the unstandardized 
# regression coefficient for years, assuming years is the only predictor variable in the 
# model?


#########################################################################################
# Question 3
# In a model predicting salary, what is the unstandardized regression coefficient for years, 
# assuming years and courses are both included as predictor variables in the model?


#########################################################################################
# Question 4
# In a model predicting salary, what is the 95% confidence interval for the unstandardized 
# regression coefficient for years, assuming years and courses are both included as 
# predictor variables in the model?

#########################################################################################

# Subset the Data for upcoming questions

HW6.teach=HW6data[HW6$profession=="teacher",]
HW6.law=HW6data[HW6$profession=="lawyer",]
HW6.doct=HW6data[HW6$profession=="doctor",]



#########################################################################################
# Question 5
# What is the predicted difference in salary between Doctors and Lawyers assuming an equal 
# and average number of years and courses?

#########################################################################################

# Question 6
# Is the predicted difference between Doctors and Lawyers statistically significant?

# Based on t-test
# Answer = Yes

#########################################################################################
# Question 7
# What is the predicted difference in salary between Doctors and Teachers assuming an 
# equal and average number of years and courses?

#########################################################################################

# Question 8
# Is the predicted difference between Doctors and Teachers statistically significant?
#
# Based on t-test
# Answer = YES

#########################################################################################

# Question 9
# What is the actual difference in mean salary between Doctors and Teachers?

by(HW6data$salary, HW6data$profession,mean)
# HW6data$profession: doctor
# [1] 87344.77
# ------------------------------------------------------------ 
# HW6data$profession: lawyer
# [1] 73489.21
# ------------------------------------------------------------ 
# HW6data$profession: teacher
# [1] 62733.67
#
# 87344.77-62733.67 = 24611.1


#########################################################################################

# Question 10
# What combination of predictors represents the best model in terms of predicting salary?
# - Years and courses
# - Years and profession
# - Courses and profession
# - Years, courses, and profession
#########################################################################################
# 1   5638
# 2   4930 6345
# 3   4807
# 4   4140 5473
# 5   9204
# 6   YES
# 7   15903
# 8   YES
# 9   24611.1
#10   ALL
#####################################################################
#change the https to http
fileurl ="http://d396qusza40orc.cloudfront.net/stats1%2Fdatafiles%2FStats1.13.HW.06.txt"


HW6data <- read.table( fileurl , header = TRUE );

names(HW6data)

Fit1 <- lm(salary ~ year, data=HW6data) 
coef(Fit1)
confint(Fit1)

#####################################################################

Fit2 <- lm(salary ~ year+courses, data=HW6data) 
coef(Fit2)

#####################################################################

HW6.teach=HW6data[HW6data$profession=="teacher",]
HW6.law=HW6data[HW6data$profession=="lawyer",]
HW6.doct=HW6data[HW6data$profession=="doctor",]


prof.code = C(HW6data$profession, treatment)
model4 = lm(HW6data$salary ~ HW6data$years + HW6data$courses + (prof.code)) 
summary(model4)

# Question 5
9204

#####################################################################
# Question 10
# What combination of predictors represents the best model in terms of predicting salary?
# - Years and courses
# - Years and profession
# - Courses and profession
# - Years, courses, and profession

AIC(lm(salary ~ years+courses, data=HW6data))
AIC(lm(salary ~ years+profession, data=HW6data))
AIC(lm(salary ~ courses+profession, data=HW6data))
AIC(lm(salary ~ years+courses+profession, data=HW6data))  #ALL
#####################################################################
