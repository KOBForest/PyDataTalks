# This week, we turn to a classic study on helping behavior by Darley ; Batson (1973). 
# Simulated data are provided here. The study demonstrates that people’s likelihood of helping 
# a person in distress depends largely on their level of haste—whether they were running early, 
# on time, or late for an appointment—when they encounter him, rather than on whether they have been 
# asked to reflect on a pro-helping message (the parable of the Good Samaritan) as opposed to a 
# neutral message (occupational effectiveness). In this dataset, independent variables include 
# Prime (1 = parable of the Good Samaritan; 2 = occupational effectiveness) ; Haste 
# (1 = early, 2 = on time, 3 = late). 
#
# On their way to a nearby location, participants encounter a moaning individual in distress. 
# The Helping variable provides a measure of how much they help, ranging from 0 to 6 with 
# higher scores indicating greater helping.

# Question 1
A.B = read.table("Stats1.13.HW.09.txt", header = T) 
names(A.B) 
class(A.B$Haste) ; class(A.B$Prime)

# Question 2
Haste = factor(A.B$Haste, levels = c(1,2,3), labels = c("Early", "On Time", "Late")) 
Prime = factor(A.B$Prime, levels = c(1,2), labels = c("Parable", "Control")) 
aov.A.B = aov(A.B$Helping ~ Haste * Prime) 
summary(aov.A.B)

# Question 3
summary(aov.A.B)

# Question 4
# Yes 
summary(aov.A.B)

# Question 5
aov.table = summary(aov.A.B) 
TukeyHSD(aov.A.B)

# Question 6
etaSquared(aov.A.B, anova=T)

# Question 7
etaSquared(aov.A.B, anova=T)

# Question 8 
A1.B = subset(A.B, A.B$Haste == "1") 
A2.B = subset(A.B, A.B$Haste == "2")
A3.B = subset(A.B, A.B$Haste == "3") 
aov.A1.B = aov(A1.B$Helping ~ A1.B$Prime) 
summary(aov.A1.B) 
aov.A2.B = aov(A2.B$Helping ~ A2.B$Prime) 
summary(aov.A2.B) 
aov.A3.B = aov(A3.B$Helping ~ A3.B$Prime) 
summary(aov.A3.B)

# Question 9
A1.B = subset(A.B, A.B$Haste == "1") ; A2.B = subset(A.B, A.B$Haste == "2") ; A3.B = subset(A.B, A.B$Haste == "3") ; 
aov.A1.B = aov(A1.B$Helping ~ A1.B$Prime) ; summary(aov.A1.B) ; aov.A2.B = aov(A2.B$Helping ~ A2.B$Prime) ; summary(aov.A2.B) ; 
aov.A3.B = aov(A3.B$Helping ~ A3.B$Prime) ; summary(aov.A3.B)

# Question 10
# People are more likely to help others after being primed to do so if they are early
