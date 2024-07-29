##### Datos IGE ####
setwd(...)
 Datos.IGE <- read.delim("Datos-IGE.txt", sep=" ", header = T)
 View(Datos.IGE)
 Datos.IGE$idade <- Datos.IGE$edad
 attach(Datos.IGE) 

 
 sabe.hablar.gallego <- ifelse( Datos.IGE$sabehab <3, "SI", "NO")
 
 table(sabe.hablar.gallego)
 
 sabe.hablar.gallego <- as.factor(sabe.hablar.gallego)
 levels(sabe.hablar.gallego) 
 
 sabe.hablar.gallego<- factor( sabe.hablar.gallego, levels =  c( "SI", "NO" )  )
 levels( sabe.hablar.gallego ) 
 table(sabe.hablar.gallego)
 
 # Calculamos la propocion muestral
 n <- length(sabe.hablar.gallego)
 pgorro=sum(sabe.hablar.gallego=="SI")/n
 pgorro

 #Calculamos el intervalo de confianza
 prop.test(x=sum(sabe.hablar.gallego=="SI"),
              n=length(sabe.hablar.gallego),conf.level=0.95)
 

 sabe.escribir.gallego <- ifelse( Datos.IGE$sabeesc <3, "SI", "NO")
 
 table(sabe.escribir.gallego)
 
 sabe.escribir.gallego <- as.factor(sabe.escribir.gallego)
 levels(sabe.escribir.gallego) 
 
 sabe.escribir.gallego<- factor( sabe.escribir.gallego, levels =  c( "SI", "NO" )  )
 levels( sabe.escribir.gallego ) 
 
 # Calculamos la propocion muestral
 n <- length(sabe.escribir.gallego)
 pgorro=sum(sabe.escribir.gallego=="SI")/n
 pgorro
 
 #Calculamos el intervalo de confianza
 prop.test(x=sum(sabe.escribir.gallego=="SI"),
           n=length(sabe.escribir.gallego),conf.level=0.95)
 
 
 #contraste sabe.hablar.gallego
 prop.test(x=sum(sabe.hablar.gallego=="SI"),
              n=length(sabe.hablar.gallego),
              p=0.9,alternative="greater")

  
 ##### Datos SICRI #####
 
 Datos.SICRI <- read.delim2("Datos-SICRI.txt")
 View(Datos.SICRI)
 attach(Datos.SICRI)
 
 # Estimacion de la media
 mean(IMC[SEXO==1],na.rm=TRUE)
 
 # Otra forma: Eliminamos los NA
 IMC.hombres=IMC[SEXO==1 & !is.na(IMC)]
 mean(IMC.hombres) # Media muestral
 
 # Estimacion de la dispersion
 var(IMC.hombres) # Cuasivarianza
 sd(IMC.hombres) # Cuasidesviacion tpica
 n=length(IMC.hombres)
 var(IMC.hombres)*(n-1)/n # Varianza muestral
 sqrt(var(IMC.hombres)*(n-1)/n) # Desv. tpica muestral
 
 
 t.test(IMC.hombres,conf.level=0.95)
 
 
 install.packages("TeachingDemos")
 library(TeachingDemos)
 
 
 # IC de nivel 99% para la varianza
 sigma.test(IMC.hombres,conf.level=0.99)
 
 # IC de nivel 99% para la desviacion tipica
 sqrt(sigma.test(IMC.hombres,conf.level=0.99)$conf.int)
 
 
 # Estimacion de la media
 mean(IMC[SEXO==2],na.rm=TRUE)
 
 # Otra forma: Eliminamos los NA
 IMC.mujeres=IMC[SEXO==2 & !is.na(IMC)]
 mean(IMC.mujeres) # Media muestral
 
 # Estimacion de la dispersion
 var(IMC.mujeres) # Cuasivarianza
 sd(IMC.mujeres)
 n=length(IMC.mujeres)
 var(IMC.mujeres)*(n-1)/n # Varianza muestral
 sqrt(var(IMC.mujeres)*(n-1)/n) # Desv. tpica muestral
 
 
 t.test(IMC.mujeres,conf.level=0.95)
 
 
 # IC de nivel 99% para la varianza
 sigma.test(IMC.mujeres,conf.level=0.979)
 # IC de nivel 99% para la desviacion tipica
 sqrt(sigma.test(IMC.mujeres,conf.level=0.95)$conf.int)
 
 
 #contraste IMC hombres
 t.test(IMC.hombres, mu=26.5,
         alternative="two.sided")
 

 #Pruebas de normalidad
 install.packages("car")
 library(car)
  qqPlot(TALLA.hombres)
  library(ggplot2)
  
  a<-qqnorm(TALLA.hombres, 
            main = "Talla hombres")
  qqline(TALLA.hombres, col = 2)
  
  
 # Comparacion con la densidad Normal
 hist(TALLA.hombres,freq=F,main="Histograma")
 curve(dnorm(x,mean=mean(TALLA.hombres,na.rm=T),sd=sd(TALLA.hombres,na.rm=T)), col=2,lwd=2,add=TRUE)
 lines(density(TALLA.hombres,na.rm=T),col=3,lwd=2)
 legend(177,0.04,c('Densidad Normal','Estimacion Densidad'), col=c(2,3),lwd=2,bty='n')
 
 #las coordenadas en el gr?fico vimos que se pueden obtener con locator(1)
 
 ?shapiro.test
 #La H0 en el test de Shapiro es que los datos provienen de una distribuci?n normal.
 shapiro.test(TALLA.hombres)
 
 #Contraste sobre la varianza

 sigma.test(IMC.hombres, sigma=sqrt(15),
             alternative="greater")
 
 #- - - - - - - - 
 #Ejercicio
 #- - - - - - - - 
 
 PESO.mujeres = PESO[SEXO==2 & !is.na(PESO)]
 
 t.test(PESO.mujeres, mu=67,
        alternative="less",
        conf.level = 0.99)
 
 
 sigma.test(PESO.mujeres, sigma=12,
            alternative="greater",
            conf.level = 0.95)
 
 
 #Comparacion Medias
 
 t.test(IMC.mujeres,IMC.hombres, paired=FALSE,
          var.equal = FALSE, alternative="greater")
 
 
 t.test(IMC.mujeres,IMC.hombres, paired=FALSE,
        var.equal = TRUE, alternative="greater")
 
 
 ##### Comparacion Medias ####
 Antes=c(140, 165, 160, 160, 175, 190, 170, 175,155, 160)
 Despues=c(145, 150, 150, 160, 170, 175, 160, 165,145, 170)
  
  
 t.test(Antes,Despues,alternative="two.sided",paired=TRUE)
 
 # IC para la diferencia de medias
 t.test(Antes,Despues,conf.level=0.99,paired=TRUE)
  