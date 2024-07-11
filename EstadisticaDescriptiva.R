#Estadistica DESCRIPTIVA UNIVARIANTE
# Variables: cuantitativas o cualitativas
    #Cuant -> Discretas o Continuas
    #Cual -> Nominales o Ordinales

setwd("C:/Users/...")
datos = read.table("evaluacion4.txt", header=TRUE, dec=",", sep="\t")
head(datos)

variable1=factor(datos$FORMULA) #var. cualitativas siempre a factor pq es var. categórica
class(variable1)
variable1

# TABLA DE FRECUENCIAS
FA = table(variable1) ; FA #f. absolutas
n=length(variable1) ; n
FR = FA/n ; FR #f. relativas

tabla = cbind("Frec. Absoluta" = FA,
              "Frec. Relativa" = FR)
tabla # no tendría sentido hacer las frecuencias acumuladas, porque no hay orden lógico
#Si fuese una variable ordinal ...
tabla2 = cbind(FA, FR, cumsum(FA), cumsum(FR)); tabla2
round(tabla2, 2)

#Métodos gráficos según el tipo de variable
# Diagrama de Barras para frecuencias Abs o Rel
?barplot
barplot(FA)
barplot(FR) #cambio en eje Y
barplot(FR, xlab="Var. Formula",
        ylab="Frec. RELATIVAS",
        main="Diagrama de Barras",
        ylim=c(0, 0.35),
        col=c("pink", "red", "purple")) # colorbrever2.org

# Diagrama de Sectores
pie(FR, xlab="Variable FORMULA",
    main="Diagrama de Sectores",
    col= c("pink", "red", "purple"))

install.packages("plotrix")
library(plotrix)
pie3D(FR)

#Dividir la ventana gráfica
par(mfrow=c(2,1))
barplot(FR, xlab="Var. Formula",
        ylab="Frec. RELATIVAS",
        main="Diagrama de Barras",
        ylim=c(0, 0.35),
        col=c("pink", "red", "purple"))
pie3D(FR)

#Ej: Calcular la tabla de frecuencias para la variable LOC desc
# TABLA DE FRECUENCIAS
variable2=factor(datos$LOC_desc) #var. cualitativas siempre a factor pq es var. categórica = as.factor()
class(variable2)

FA = table(variable2) ; FA #f. absolutas
n=length(variable2) ; n
FR = FA/n ; FR #f. relativas, no tiene sentido hacerlas acumuladas
?names
names(FA)= c("A Coruña", "Lugo", "Ourense", "Pontevedra")
FA

#PLOT
par(mfrow=c(1,2))
barplot(FA,
        xlab= "Provincia",
        ylab= "Frecuencia Absoluta",
        col = c("#2b8cbe", "#a6bddb", "#ece7f2", "white"),
        ylim= c(0, 10))
pie(FA, xlab="Variable FORMULA",
    main="Diagrama de Sectores",
    col= c("#2b8cbe", "#a6bddb", "#ece7f2", "white"))

barplot(cumsum(FA)) #Frecuencias Acumuladas

#Para Var. Continuas (intervalos de clase)
datos$LONGAL
table(datos$LONGAL)

#TABLA DE FRECUENCIAS
n = length(datos$LONGAL) # Tamaño muestra
nI = round(sqrt(n),1) # numero intervalos
L = seq(min(datos$LONGAL),max(datos$LONGAL)+1,length=(nI+1))
MC=(L[-length(L)]+L[-1])/2 # marca de clase
LONGAL_cat=cut(datos$LONGAL,breaks=L,right=FALSE)
LONGAL_cat #right FALSE -> [)

ni=table(LONGAL_cat) # Frec. absolutas
fi=ni/n # Frec. relativas
Ni = cumsum(ni) # Frec. abs. acumuladas
Fi = cumsum(fi) # Frec. rel. acumuladas
tabla=cbind(MC,ni, fi, Ni, Fi);tabla

#Representación gráfica
par(mfrow=c(1,1))
hist(datos$LONGAL, breaks=L, freq=FALSE,
     main="Histograma",
     xlab="LONGAL",
     ylab="densidad",
     col="darkblue",
     xlim=c(40, 120))
lines(density(datos$LONGAL), col="blue") #Funciones gráficas de segundo nivel
legend(100, 0.025, "Densidad", lwd=2, col="blue", bty="n")

#MEDIAS caracteristicas
mean(datos$LONGAL)
median(datos$LONGAL) #cuando media y mediana son muy diferentes indica la presencia de datos atipicos en mi muestra y rompen la simetría
quantile(datos$LONGAL) #valor estimado del quantile
quantile(datos$LONGAL, seq(0,1, length=11))

#Medidas de DISPERSIÓN
range(datos$LONGAL)
diff(range(datos$LONGAL)) #mis datos se mueven en un rango de 60.4
#Rango intercuartilico
IQR(datos$LONGAL) #el 50% de mis datos estan en un intervalo de 20 unidades
var(datos$LONGAL)
sd(datos$LONGAL) #raiz cuadrada de la distancia de los ptos. a la media

#Coeficiente de variación CV = S / Xmedia
sd(datos$LONGAL)/mean(datos$LONGAL)

#Diagrama de Cajas / BOXPLOT representa estas medidas y ayuda a encontrar datos atípicos
boxplot(datos$LONGAL, horizontal = T)
#Interpretación de la dispersión
#La caja se encuentra en el medio, asi que los datos se concentran en el medio aprox.
#La mediana está ligeramente hacia el mínimo (Q1)
#La sit. idilica sería que la mediana estuviera en el centro.
#Entre las dos líneas mas alejadas esperamos dentro de ellas encontrar la muestra si el dato esta fuerá sería atípico.

#Medidas de FORMA
install.packages("moments")
library(moments)

skewness(datos$LONGAL) # 0.38 cercano a 0, simetría ligeramente +
#Si es cero es simétrica
kurtosis(datos$LONGAL) # 2.5 VS 3 (distr. normal), cerca de la normal
#si es 3 significa que es exactamente igual que la campana de Gauss

#Ejercicio: La variable PORCEPER disponible en el fichero “evaluacion.txt” mide el rendimiento (en %). Para esta variable obtener:
summary(datos$PORCEPER)

n = length(datos$PORCEPER) # Tamaño muestra
nI = round(sqrt(n),1) # numero intervalos
L = seq(min(datos$PORCEPER),max(datos$PORCEPER)+1,length=(nI+1))
MC=(L[-length(L)]+L[-1])/2 # marca de clase
PORCEPER_cat=cut(datos$LONGAL,breaks=L,right=FALSE)
PORCEPER_cat #right FALSE -> [)

ni=table(PORCEPER_cat) # Frec. absolutas
fi=ni/n # Frec. relativas
Ni = cumsum(ni) # Frec. abs. acumuladas
Fi = cumsum(fi) # Frec. rel. acumuladas
tabla_2=cbind(MC,ni, fi, Ni, Fi);tabla_2

#GRAFICO
par(mfrow=c(1,1))
hist(datos$PORCEPER, breaks=L, freq=FALSE,
     main="Histograma",
     xlab="PORCEPER",
     ylab="densidad",
     col="lightblue")

#MEDIAS caracteristicas
mean(datos$PORCEPER)
median(datos$PORCEPER) #excesiva diferencia entre mediana y media
quantile(datos$PORCEPER)

#Medidas de DISPERSIÓN
range(datos$PORCEPER)
diff(range(datos$PORCEPER))
IQR(datos$PORCEPER)
var(datos$PORCEPER)
sd(datos$PORCEPER)
sd(datos$PORCEPER)/mean(datos$PORCEPER)

boxplot(datos$PORCEPER, horizontal = T,
        col="lightblue",
        main= "dato atípico en PORCEPER",
        xlab=paste("Media=", round(mean(datos$PORCEPER)))) 
#Dato atípico encontrado en la cola de la derecha, dist de este punto al resto es muy grande
#Tener en cuenta el dato para futuros análisis

skewness(datos$PORCEPER) # Cercano a 0, simétrica
kurtosis(datos$PORCEPER) #cerca de 3
