install.packages("arules") 
install.packages("Matrix")
library("arules")
setwd("C:\Users\kosmo023\Dropbox\201409_bigdataDaeWoo")
asso=read.table("ex421.txt",header=T ,fileEncoding = "EUC-KR")
asso
trans<-as.matrix(asso,"Transaction")
rules1<-apriori(trans,parameter=list(supp=0.4,conf=0.6,  target="rules"))
rules1
inspect(sort(rules1))

rules2<-apriori(trans,parameter=list(suppor=0.6))

#?λ―? ?? κ²°κ³Όλ₯? ? κ±°νκΈ? ??΄? ?Όμͺ? λΆλΆμ΄ ?? κ²μ κ²°κ³Ό?? λΊ?-
rules2.sub_1=subset(rules1,subset=lhs %pin% ""  & lift>0.6)
inspect(sort( rules2.sub_1)[1:3])
inspect(sort(rules2))
result=as(sort( rules2.sub_1)[1:3], "data.frame")
result
