#Definir Variables
A = cos(pi/2)
A
b=32 ; c=40
media.de.x <- 333

#Definir Vectores
x = c(5, 3, -2, 1.7, 0.3) #Index empieza en 1

?seq # seq {base} : está en el paquete básico de R
help(seq)
y = seq(0, 1, 0.01)
y
z = seq(0.1, len = 101)
z
1:6 # para by=1

rep(1, 10)
rep(x, 10) #con vectores

#Acceso a el. de un vector
x[2]
x[c(2,4)]
x[-3] # Todas las posiciones menos la 3
x[-seq(1, 5, by=2)]

#Condiciones
(x<=2) & (x>-3)
(x<=2) | (x>-3)

x<0 #Vector de la misma len x de T/F
x[x<0]
which(x<0) #posición de los el. que cumplen la condición

length(x)

#Matrices
A1 = matrix(1:6, nrow=3, ncol=2); A1
f1 = c(1,4)
f2 = c(2,5)
f3 = c(3,6)
A2= rbind(f1, f2, f3); A2 #por filas
c1 = 1:3
c2 = 4:6
A3= cbind(c1, c2) # por columnas

#Acceso a el. de una M
A1[2,2]
A1[-1, 1:2]
A1[2:3, 1:2]
A1[c(2, 3), c(1,2)]

A1<2 #T/F
A1[A1<2] # devuelve el numero que True

#Operaciones con M
A1 + 4
A1^2
A1%*%t(A1) #Producto matricial de A1 por su Traspuesta

#Variable caracter
a = "suma"
class(a)
class(A1) #vector -> M -> array (n >= 3)

letras = c("a", "b", "c")
letras
letras == "a"
letras[letras == "a"]
#No puede haber distintos dtypes en una M

#DataFrame
data = data.frame(edad=c(25, 24, 27), sexo=c("H", "H", "M"))
data

dim(data)
names(data) #Nombres col

#Accceder el.
data[,1] # por col
data$edad
data[2,] # por fila

# Tipos de redondeos
round(1.6) # usa 0.5
ceiling(2.3) # hacia arriba
floor(2.3) # hacia abajo
round(1.34577689, digits=3) # n decimales

# Na's, Nan (Not a Number)

#Factor
variable = c("Fumador", "NoFumador", "Fumador", "NoFumador", "ExFumador")
class(variable)
length(variable)
variable_factor = factor(variable)
variable_factor2 = factor(variable, levels= c("Fumador", "NoFumador", "ExFumador"))
variable_factor2
class(variable_factor2)

#Listas
x
letras
A1
lista = list(x=x, letras=letras, A=A1, d=data)
lista # objeto de 3 niveles ($)
lista$A
lista[[3]] #esto es una matriz como cualquiera
lista[[3]][1,2] #accedo a un el. de la matriz
lista$letras[1]
lista$letras == "b"
lista$d$sexo
names(lista)#nombre de los componentes

#Ejercicio 1
# Crea un data.frame con los nombres de las aplicaciones y sus beneficios.
df = data.frame(APP=c("ADX", "AUT", "CATTLE", "COP", "EDI"), 
                Beneficios=c(32, 1010, 47, 491, 6942.5)
                )
df
dim(df)
names(df)
head(df)

#¿Cual es el total de los beneficios de todas las aplicaciones?
total <- sum(df$Beneficios)
apply(df, 2, sum)# error porque no todas las col de tipo numerico

#¿Que porcentaje supone el beneficio de AUT sobre el total?
df$Beneficios/sum(df$Beneficios)
porcentaje_de_RGX <- (sum(which(df$APP == "AUT")))/(total)
porcentaje_de_RGX

# Anade una nueva columna al data.frame con la informacion de imputable
df$Imputable= factor(c("Si", "Si", "No", "Si", "No"))
df
df$APP[which(df$Imputable=="Si")]

#Librerías
install.packages("Rcmdr")
library(Rcmdr)

