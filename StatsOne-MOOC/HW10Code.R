# Welcome to assignment 10! This week we are going to work on an example at the 
# intersection of decision-making and global warming. 
# The simulated dataset includes a dependent variable, change, for a list of 27 countries. 
# Change indicates whether these countries are willing to take action now 
# against global warming, or if they would rather wait and see (1 = act now, 0 = wait and see). 
# Predictors include: median age (age), education index (educ), 
# gross domestic product (gdp), and CO2 emissions (co2).

# Question 1
describeBy(data$age, data$change=="1")

# Question 2
fit = glm(data$change ~ data$educ + data$age + data$gdp + data$co2, family = binomial) 
summary(fit)

# Question 3
# Not - Educ and change are negatively correlated

# Question 4
confint(fit)

# Question 5
confint.default(fit)

# Question 6
with(fit, null.deviance - deviance)

# Question 7 
with(fit, df.null - df.residual)

# Question 8 
with(fit, pchisq(null.deviance-deviance, df.null-df.residual, lower.tail = FALSE))

# Question 9 
library(aod)
wald.test(b = coef(fit), Sigma = vcov(fit), Terms = 2)

# Question 10
ClassLog(fit, data$change)
