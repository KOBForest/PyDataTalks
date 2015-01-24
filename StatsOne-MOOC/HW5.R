fileurl <- "http://spark-public.s3.amazonaws.com/stats1/datafiles/Stats1.13.HW.04.txt"; 

# Same Data Set as Week 4
HW4 <- read.table( fileurl , header = TRUE );


names(HW4)
# [1] "ID"      "salary"  "years"   "courses"

attach(HW4)

##############################################################################
# Question 1
# Run a regression model with salary as the outcome variable and years of experience as the predictor variable. 
# What is the 95% confidence interval for the regression coefficient? 
# Type your answer exactly as it appears in R but include only two decimal places 
# (for example, if the 95% confidence interval is -1 to +1 then type -1.00 1.00)

FitQ1 <- lm(salary~years)
confint(FitQ1)
confint(FitQ1)[2,]

##############################################################################
# Question 2
# Run a regression model with salary as the outcome variable and courses as the predictor variable. 
# What is the 95% confidence interval for the regression coefficient?

FitQ2 <- lm(salary~courses)
confint(FitQ2)
confint(FitQ2)[2,]

##############################################################################
# Question 3
# Run a multiple regression model with both predictors and compare it with both the model 
# from Question 1 and the model from Question 2. 
# Is the model with both predictors significantly better than:

# a - both single predictor models
# b - the single predictor model based on years of experience
# c - the single predictor model based on courses
# d - none of the above

FitQ3 <- lm(salary~years+courses)

AIC(FitQ1) # 
AIC(FitQ2) #
AIC(FitQ3) # Both


##############################################################################
# Question 4
# Run a standardized multiple regression model with both predictors. 
# Do the confidence interval values differ from the corresponding unstandardized model?

# Use the scale() function
FitQ4 <- lm(scale(salary)~scale(years)+scale(courses))

##############################################################################
# Question 5
# What function could you use to take a random subset of the data?

# sample()

##############################################################################
# Question 6
# Run the following command in R: set.seed(1). 
# Now take a random subset of the original data so that N=15. 
# Is the correlation coefficient between salary and years of experience in this sample higher or lower than in the whole data set?
# Higher/ Lower

##############################################################################
# Question 7
# Take a subset of the original data from row 51 to 70. 
# What is the percentage of variance explained by a multiple regression model with both predictors
# (Provide your result with no decimal place)

##############################################################################
# Question 8
# Using model comparison, which model provides the best fit for the subsetted data from Question 7?

# a - model1.subset = lm(data.subset$salary ~ data.subset$years)
# b - model2.subset = lm(data.subset$salary ~ data.subset$courses)
# c - model3.subset = lm(data.subset$salary ~ data.subset$years + data.subset$courses)
# d - They are all equal
##############################################################################
# Question 9
# What is the correlation between the salary values predicted by the multiple 
# regression model and the actual salary scores in the subsetted data? 
# (Provide your result rounded to 2 decimal places)
##############################################################################
# Question 10
# Compute the correlation between the scores predicted by the multiple regression 
# model and the residuals from the same model. 
# Is the correlation statistically significant?
##############################################################################
