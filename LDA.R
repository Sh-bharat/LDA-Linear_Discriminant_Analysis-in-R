## LDA Linear Discriminant Analysis
# Let C1 and C2 be two classes then Appling LDA
C1<-cbind(c(1,2,3,4,5),c(3,6,9,1,5))
C2<-cbind(c(11,22,33),c(23,45,67))

#calculating classes mean
c1_mean<-c()
for (i in 1:ncol(C1)){c1_mean<-c(c1_mean,mean(C1[,i]))}
c2_mean<-c()
for (i in 1:ncol(C2)){c2_mean<-c(c2_mean,mean(C2[,i]))}

#calculating total mean
data<-rbind(C1,C2)
data_mean<-c()
for (i in 1:ncol(data)){data_mean<-c(data_mean,mean(data[,i]))}

#Calculating between class variance 
S_theta1<-nrow(C1)*(as.matrix(c1_mean-data_mean)%*%t(c1_mean-data_mean))
S_theta2<-nrow(C2)*(as.matrix(c2_mean-data_mean)%*%t(c2_mean-data_mean))
S_theta<-S_theta1+S_theta2

#Calculating within class variance 
Matrix1<-rbind(c1_mean)
Matrix1<-matrix(rep(t(Matrix1),nrow(C1)),ncol=ncol(Matrix1),byrow=TRUE)
C1_meandeviation<-C1-Matrix1
Sw1<-(t(C1_meandeviation)%*%C1_meandeviation)

Matrix2<-rbind(c2_mean)
Matrix2<-matrix(rep(t(Matrix2),nrow(C2)),ncol=ncol(Matrix2),byrow=TRUE)
C2_meandeviation<-C2-Matrix2
Sw2<-(t(C2_meandeviation)%*%C2_meandeviation)
Sw<-Sw1+Sw2

#Finding eigen vectors
eig<-eigen(solve(Sw)%*%S_theta)

#Printing Projected data 
print("Projected vector of C1 is given by : ");print(C1%*%eig$vectors[,1])
print("Projected vector of C2 is given by : ");print(C2%*%eig$vectors[,1])
