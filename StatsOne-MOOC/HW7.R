detach(Hw7data)
#change the https to http
quizurl <- "http://d396qusza40orc.cloudfront.net/stats1%2Fdatafiles%2FStats1.13.HW.07.txt"

HW7data <- read.table( quizurl , header = TRUE );

names(HW7data)
# [1] "diverse" "happy"   "extra"  
attach(HW7data)

# > cor(HW7data)
#           diverse     happy     extra
# diverse 1.0000000 0.2107102 0.2096778
# happy   0.2107102 1.0000000 0.1937270
# extra   0.2096778 0.1937270 1.0000000

######################################################

# Question 1
# What is the correlation between extraversion and happiness?

#Good
ANS1 <- cor(extra,happy)

######################################################

# Question 2
# What is the correlation between extraversion and diversity of life experience?


#Good
ANS2 <- cor(extra,diverse)

######################################################

# Question 3
# What is the correlation between diversity of life experience and happiness?



#Good
ANS3 <- cor(happy,diverse)

######################################################

# Question 4
# What percentage of variance in happiness is explained by extraversion?

summary(lm(happy~extra))

#Good

ANS4 <- summary(lm(happy~extra))$r.squared
######################################################

# Question 5
# What percentage of variance in happiness is explained by a model with both extraversion and diversity of life experience as predictors?

#Good
ANS5 <- summary(lm(happy~extra+diverse))$r.squared
######################################################

# Question 6
# What is the 95% confidence interval for the regression coefficient for extraversion when it is the only predictor of happiness?

ANS6 <- confint(lm(happy~extra),parm="extra")
# suppose answer is 0.05300 0.15700
# give answer as ".05 .16"
######################################################

# Question 7
# What is the 95% confidence interval for the regression coefficient for extraversion when it and diversity of life experience are both predictors of happiness?

ANS7 <- confint(lm(happy~extra+diverse))#

# suppose answer is 0.05300 0.15700
# give answer as ".05 .16"
######################################################

# install.packages("multilevel")
# library(multilevel)

######################################################
# Question 8
# What is the unstandardized regression estimate of the indirect effect?

indirect = sobel(extra, diverse, happy)
ANS8 <- indirect$Indirect.Effect
######################################################

# Question 9
# What is the z-value of the Sobel test?

#
ANS9 <- indirect$z.value
######################################################

# Question 10
# Do these analyses suggest full mediation, partial mediation, or no mediation?
# - Full mediation
# - Partial mediation
# - No mediation

#####################################################
list(ANS1,ANS2,ANS3,ANS4,ANS5,ANS6,ANS7,ANS8,ANS9)
