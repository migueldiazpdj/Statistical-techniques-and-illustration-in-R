#Analisis Multivariante
install.packages("FactoMineR")
library(FactoMineR)
data(decathlon)
head(decathlon)

#-------#

# Analisis lineal discriminante
library(MASS)
linear <- lda(Species~., training)
linear
predict(linear,testing)$class
testing$Species #especie real
# Biplot
library(devtools)
install_github("fawda123/ggord")
library(ggord)
ord <- lda(Species ~ .,iris,prior=rep(1, 3)/3)
ggord(ord, iris$Species)

install.packages("gamlss.data")
library(gamlss.data)
?usair
data(usair)
round(cor(usair[,-1]),2)
usair.pc<-princomp(usair[,-1],cor=TRUE)
summary(usair.pc)

summary(usair.pc,loadings=TRUE)
class(usair.pc$scores)
plot(usair.pc$scores[,1],usair.pc$scores[,2])


#ANALISIS CLUSTER#
library(FactoMineR)
data("decathlon")
hc<-hclust(dist(decathlon[,c(1:10,12)]))
plot(hc)
