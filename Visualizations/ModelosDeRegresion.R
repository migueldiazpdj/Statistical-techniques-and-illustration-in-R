# Modelos de Regresion#
lluvia<-read.table("DatosLluvia.txt",sep="\t",
                    header=TRUE)
x<-lluvia$Exterior
y<-lluvia$Interior
c(mean(x),mean(y)); apply(lluvia[,2:3],2,mean)
cov(x,y); cor(x,y)
plot(x,y,xlab="Exterior",ylab="Interior",pch=16)

x<-lluvia$Exterior
y<-lluvia$Interior
mod <- lm(y~x)
plot(y~x,xlab="Exterior",ylab="Interior",pch=16)
abline(mod,col=4,lwd=2)

summary(mod)
summary(mod)$r.squared

mod2<-lm(y~x-1)
plot(mod2)
plot(x,mod2$residuals,xlab="x",ylab="Residuals")
install.packages("lmtest")
library(lmtest)
resettest(mod2)
harvtest(mod2)

#Ejercicio#
mod2<-lm(y~x-1)
res=mod2$residuals
Box.test(res,lag=1,type="Ljung-Box")
Box.test(res,lag=2,type="Ljung-Box")
Box.test(res,lag=3,type="Ljung-Box")

library(lmtest)
dwtest(y~x,alternative="two.sided")
#-------------------------------#

bridges=read.table("bridges.txt",header=TRUE)
attach(bridges)
modm=lm(log(Time)~log(DArea)+log(CCost)+log(Dwgs)
          +log(Length)+log(Spans))
modm=lm(log(Time)~log(DArea)+log(CCost)+log(Dwgs)
          +log(Length)+log(Spans))
summary(modm)

#ANOVA#
install.packages("faraway")
library(faraway)
data(savings)
attach(savings)

modelo=lm(sr~pop15+pop75+dpi+ddpi,savings)
modelo1=lm(sr~pop15+pop75+dpi,savings)
anova(modelo1,modelo)
