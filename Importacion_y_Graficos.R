#Importar datos .txt, .xlsx, .sav

getwd()
setwd("C:/Users/miguel.diaz.perez/Desktop/R/data")
getwd()

df.1 = read.table("aplicaciones1.txt", header=FALSE, sep=",", dec=".")
df.1
names(df.1) = c("Var1", "Var2", "Var3")
head(df.1)

df.2 = read.table("aplicaciones2.txt", header = F, sep="\t", dec=",")
head(df.2)

df.3 = read.table("aplicaciones3.txt", header = T, sep="\t", dec=",")
head(df.3)
df.3$APP

# Los archivos “houses.txt”, “twosample.txt”, “twoseries.txt” y “places.txt” contienen diferentes conjuntos de datos. Abrelos con un editor de texto para comprobar su estructura e importalos
df.houses = read.table("houses.txt", header=T, sep="|", dec=".")
head(df.houses)
df.twoseries = read.table("twoseries.txt", header=T, sep="\t", dec=".")
head(df.twoseries)
df.twosample = read.table("twosample.txt", header=T, sep="\t", dec=".")
head(df.twosample)
df.places = read.table("places.txt", header=T, sep=";", dec=".")
head(df.places)

install.packages("xlsx")
library(xlsx)
df.xlsx = read.xlsx("imputaciones.xlsx", sheetIndex = 1)
head(df.xlsx)

install.packages("foreign")
library(foreign)
df.spss = read.spss("twosample.sav", to.data.frame = T)
head(df.spss)

#Escribir ficheros
write.table(df.spss, file="DatosSpss.txt")

# Datos en R
data("EuStockMarkets")
x = EuStockMarkets
head(x)
?EuStockMarkets #Daily Closing Prices of Major European Stock Indices, 1991–1998

#Funciones genericas sobre ficheros de datos
summary(df.1)
str(df.1)

#GRAFICOS
alumnos = read.table("alumnos.csv", header = T, sep=";", dec=",")
head(alumnos)
attach(alumnos)
plot(Altura, Peso, main="Titulo", pch=9, cex=0.9, col="#12624e")

plot(Altura, Peso, main="Titulo", pch=9, cex=0.9, col=Sexo)
plot(Altura, Peso, main="Titulo", pch=9, cex=0.9, col=c("#12624e", "purple")[Sexo],
     sub="....", xlab="", ylab="KG") #axes=F no pinta los ejes

#Funciones de 2º Nivel
points(190, 50, pch=4, cex=6, lwd=23)
?axis
abline(h=54, lty=32)
abline(a=0, b=86) #pintar una recta y=ax + b

segments(x0=50, y0=52, x1=158, y1=58)

par(mfrow=c(1,3)) #ventana grafica dividida
plot(Altura, Peso, main="Titulo", pch=9, cex=0.9, col="#12624e")
plot(Altura, Peso, main="Titulo", pch=9, cex=0.9, col=Sexo)
plot(Altura, Peso, main="Titulo", pch=9, cex=0.9, col=c("#12624e", "purple")[Sexo],
     sub="....", xlab="", ylab="KG")
par(mfrow(1,1)) #ventana grafica normal sin divisiones
