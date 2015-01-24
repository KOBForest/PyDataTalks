#Coursera 

fileurl='https://spark-public.s3.amazonaws.com/stats1/datafiles/Stats1.13.HW.02.txt'
HW2 <- read.table(fileurl,header=T)
HW2

summary(HW2)

########################################################################
# aggregate(df$var , by =list(Grp1,Grp2, etc) ,function)

aves1 = aggregate(HW2$SR, by=list(Time=HW2$time), mean) 
aves1

aves2 = aggregate(HW2$SR, by=list(Group = HW2$condition), mean) 
aves2

aves3 = aggregate(HW2$SR, by=list(Time=HW2$time, Group = HW2$condition), mean) 
aves3

########################################################################
