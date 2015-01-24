###  Question 7
Suppose that diastolic blood pressures (DBPs) for men aged 35-44 are normally distributed with a mean of 80 (mm Hg) 
and a standard deviation of 10. What is the probability that a random 35-44 year old has a DBP greater than 100 (mm Hg)?

About 2.5%	Correct	1.00	
About 5%			
About 50%			
About 16%			
About 1%			


100 is (100 - 80) / 10 = 2 standard deviations above the mean. 
The probability that a standard normal is more than 2 standard deviations above the mean is 2.5%. 
You can get this from R via pnorm(2, lower.tail = FALSE) = pnorm(100, mean = 80, sd = 10, lower.tail = FALSE).

<hr>
### Question 8
Brain volume for adult women is about 1,100 cc for women with a standard deviation of 75 cc. About what brain volume representes the 10th percentile?

980 cc			
1020 cc	Inorrect	0.00	
1000 cc			
950 cc			

####  Question Explanation

-1.28 represents the 10th percentile from the standard normal. 
Thus the answer is 1100 - 1.28 * 75 which is around 1000 cc. 
Also qnorm(.10, mean = 1100, sd = 75)
