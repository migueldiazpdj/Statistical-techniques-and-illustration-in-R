library(MASS)
head(geyser)
tespera=geyser$waiting
summary(tespera)
par(mfrow=c(1,2))
hist(tespera)
rug(tespera)
boxplot(tespera)
par(mfrow=c(1,1))

hist(tespera,main="",ylab="",xlab="Tiempo
espera (min)",freq=F)
hist(tespera,breaks=4,main="",ylab="",
     + xlab="Tiempo espera (min)",freq=F)
hist(tespera,breaks=100,main="",ylab="",
     + xlab="Tiempo espera (min)",freq=F)
hist(tespera,breaks=c(40,60,80,100,110),main="",
     + ylab="",xlab="Tiempo espera (min)",freq=F)
hist(tespera,breaks=seq(35,120,by=20),main="",
     + ylab="",xlab="Tiempo espera (min)",freq=F)


#Nucleo GAUSSIANO-------------------#
dat<-tespera[266:270];n2<-length(dat)
h1<-5
kde2<-density(tespera,bw=h1)
seqx<-seq(30,110,len=1000)
plot(kde2,lwd=2)
for(i in 1:length(dat)){
   fgauss1<-dnorm((seqx-dat[i])/h1)/(n2*h1)
   lines(seqx,fgauss1,lty=2,col="red")}
#-----------------------------------#

#--------------------------------------#
#Densidad conjunta de las dos variables
#--------------------------------------#
install.packages("sm")
library(sm)
sm.density(geyser, display = "image")
sm.density(geyser, display = "persp")


#TESTs de independencia
#-------------------------------------#
#Fisher test
#-------------------------------------#
install.packages("LearningStats")
library(LearningStats)
data("sicri2018")
x=sicri2018$smoke
y=sicri2018$cann
fi=fisher.test(x,y);fi

#
x=rbind(c(12,24,31,16),c(20,18,30,14))
chisq.test(x)
