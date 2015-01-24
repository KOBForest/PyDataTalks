#Question 1
#Yes
data.f = subset(data, data$cond == "fixed")
data.m = subset(data, data$cond == "malleable")
data.pre = data.frame(data[1:3], data[5], data[7])
data.post = data.frame(data[1:2], data[4], data[6], data[8]) 
t.test(data.f$verbal.pre, data.f$verbal.post, paired = T)

#Question 2
t.test(data.f$spatial.pre, data.f$spatial.post, paired = T)

#Question 3
#Wilcoxon
wilcox.test(data.f$spatial.pre, data.f$spatial.post, paired=T)

#Question 4
cohensD(data.f$spatial.pre, data.f$spatial.post, method="paired")

#Question 5
#Verbal
cohensD(data.f$verbal.pre, data.f$verbal.post, method="paired") 
cohensD(data.f$spatial.pre, data.f$spatial.post, method="paired") 
cohensD(data.f$intel.pre, data.f$intel.post, method="paired")

#Question 6
#Not Spatial
cohensD(data.m$verbal.pre, data.m$verbal.post, method="paired")
cohensD(data.m$spatial.pre, data.m$spatial.post, method="paired") 
cohensD(data.m$intel.pre, data.m$intel.post, method="paired")

#Question 7
wilcox.test(data$spatial.pre, data$verbal.pre, paired=F) 
wilcox.test(data$spatial.pre, data$intel.pre, paired=F) 
wilcox.test(data$verbal.pre, data$intel.pre, paired=F)

#Question 8
#Malleable
pre.m = data.m$verbal.pre + data.m$spatial.pre + data.m$intel.pre 
post.m = data.m$verbal.post + data.m$spatial.post + data.m$intel.post 
cohensD(pre.m, post.m, method="paired") 
pre.f = data.f$verbal.pre + data.f$spatial.pre + data.f$intel.pre 
post.f = data.f$verbal.post + data.f$spatial.post + data.f$intel.post 
cohensD(pre.f, post.f, method="paired")

#Question 9
# Not Spatial
cohensD(data.m$verbal.pre, data.m$verbal.post, method="paired") 
cohensD(data.m$spatial.pre, data.m$spatial.post, method="paired") 
cohensD(data.m$intel.pre, data.m$intel.post, method="paired") 
cohensD(data.f$verbal.pre, data.f$verbal.post, method="paired") 
cohensD(data.f$spatial.pre, data.f$spatial.post, method="paired") 
cohensD(data.f$intel.pre, data.f$intel.post, method="paired")

#Question 10
# No
