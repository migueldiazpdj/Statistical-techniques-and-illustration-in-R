datos <- read.table("arroz.txt", header = TRUE)
attach(datos)
table(Variedad,Tipo)
table(Variedad,Estacion)
table(Tipo,Estacion)

library(MASS)
data(birthwt);attach(birthwt)
head(birthwt)
table(race,smoke)
table(low,smoke)
prop.table(table(low,smoke))


#Representaciones
barplot(table(smoke))
barplot(table(low,smoke))
barplot(prop.table(table(low,smoke)))


mosaicplot(table(smoke))
mosaicplot(table(low,smoke))



#-------------------------------------#
#Diagrama de dispersion
#-------------------------------------#
data(iris)
attach(iris)
names(iris)

windows()
y <- Petal.Length
x <- Petal.Width
plot(y~x,pch=16)

mx <- mean(x)
my <- mean(y)
points(mx,my,pch=16,col=3,cex=2)
abline(v=mx,col=3,lty=2)
abline(h=my,col=3,lty=2)

#----------------------------------#
# Diagrama de dispersion con especies
#----------------------------------#
ggplot(iris, aes(x=x, y=y, color=Species)) + 
  geom_point(size=2)

#---------------------------#
# Covarianza e correlacion
#---------------------------#
cov(x,y)
cor(x,y)
cor(iris[,1:4])
plot(iris[,1:4])

#---------------------------#
#---------------------------#
install.packages("GGally")
library(GGally)
windows()
ggcorr(iris[,1:4], method = c("everything", "pearson")) 

windows()
ggpairs(iris, columns = 1:4, ggplot2::aes(colour=Species))

#------------------------------------#
# Correlation plots
#------------------------------------#
library(ellipse)
windows()
plotcorr(cor(iris[,1:4]))


# Datos IRIS
p <- ggplot(iris, aes(x=Petal.Length, y=Petal.Width, col=Species))+geom_point()
p
# with marginal histogram
p1 <- ggMarginal(p, type="histogram");p1
# marginal density
p2 <- ggMarginal(p, type="density");p2
# marginal boxplot
p3 <- ggMarginal(p, type="boxplot");p3


#------------------------------#
# Pearson simulado
#------------------------------#
set.seed(1234)
x <- runif(200,-1,1)
y <-x^2
cor(x,y)

#-----------------------#
# Kendall y Spearman
#-----------------------#
cor(Petal.Width,Petal.Length)
cor(Petal.Width,Petal.Length,method="kendall")
cor(Petal.Width,Petal.Length,method="spearman")

#------------------------------#
# Continua - Categórica
#------------------------------#
data(iris)
attach(iris)
x <- Petal.Width
boxplot(Petal.Width~Species)

ggplot(iris, aes(x=Species, y=Petal.Width, fill=Species)) + 
  geom_boxplot() 

#-------------------------------#
# Bubble plot
#-------------------------------#
ggplot(iris,aes(x=Petal.Width, y=Petal.Length, size=Sepal.Length, color=Species)) +
  geom_point(alpha=0.5) 

#-----------------------------------#
# Radar chart
#-----------------------------------#
install.packages("fmsb")
library(fmsb)

#Para una flor de cada especie
data <- rbind(rep(7.5,4),rep(0,4),iris[c(35,90,140),1:4])
radarchart(data)

#Para las flores "medias" de cada especie
m.setosa <- apply(iris[Species=="setosa",1:4],2,mean)
m.virginica <- apply(iris[Species=="virginica",1:4],2,mean)
m.versicolor <- apply(iris[Species=="versicolor",1:4],2,mean)
medias <- rbind(m.setosa,m.virginica,m.versicolor)
datos <- data.frame(rbind(rep(7,4),rep(0,4),medias))
radarchart(datos)

#-----------------------------------#
# Parallel coordinates
#-----------------------------------#

library(GGally)
ggparcoord(
  iris,
  columns = 1:4, groupColumn = 5, order = "anyClass",
  showPoints = TRUE,
  title = "Parallel Coordinate Plot for the Iris Data",
  alphaLines = 0.3
) +
  theme_bw() +
  theme(legend.position = "top")


#-----------------------------#
# Otros gráficos: Nubes de palabras
#-----------------------------#
install.packages("wordcloud")
library(wordcloud)
#Creamos una lista de palabras
a <- c("Verano", "Toalla", "Playa", "Calor", "Sol", "Ensalada", "Cerveza", "Gazpacho",
       "Sombrilla", "Crema", "Flotador", "Piscina", "Chanclas",
       "Ba�ador","Insolaci�n", "Helado")

#Asignamos frecuencias
b <- sample(seq(0,1,0.01) , length(a) , replace=TRUE) 

windows()
wordcloud(a , b , col=terrain.colors(length(a) ))



