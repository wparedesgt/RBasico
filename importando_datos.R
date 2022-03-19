#Importando Datos

#Trabajar con datos puede consumir mucho tiempo y ser agotador. Afortunadamente, R puede proporcionar un marco para importar y procesar datos fácilmente para implementar análisis y modelos estadísticos. 

#En este ejercicio, vamos a explorar y analizar datos de una cuenca tropical.

#Ejercicio 1.

#Primero, importemos los niveles diarios de un río y los datos de lluvia de la cuenca, almacenados en un archivo CSV. Ese csv se los enviare a su correo o lo distruibuiremos en la capacitación este se llama (PAICOL.csv) impórtelos con la función read.csv.

#Luego, asignarlo a river_data.

#Recuerde que river_data es un dataframe, por lo que podemos acceder a los atributos con $; por ejemplo, puede obtener los valores de fecha con river_data$DATE.

river_data <- read.csv("data/PAICOL.csv")

#Ejercicio 2


#Para garantizar que la columna DATE tenga el formato adecuado, es crucial convertir los valores de cadena en fechas con la función as.date . Por favor, reemplace el valor de DATE con fechas formateadas.


class(river_data$DATE)

river_data$DATE=as.Date(river_data$DATE)

class(river_data$DATE)

river_data$DATE


#Ejercicio 3

#Cree una sumatoria o resumen de river_data

summary(river_data)


#Ejercicio 4

#Instale la libreria Tidiverse y llamela, utilice la funcion ggplot() con los datos de river_data.

#Paso 1 ubique en el menu la ayuda y descargue la hoja de visualización de datos con ggplot2, estudiela y siga los pasos solicitados a continuacion.

#Paso 2 cargue la libreria tidyverse.

#Paso 3 cree un plot con variable continua DATE y variable Discreta LEVEL usando ggplot + geom_line. 

library(tidyverse)

ggplot( data = river_data, aes( DATE, LEVEL )) + geom_line()


#Ejercicio 5

#Cree un plot con variable continua RAIN y variable Discreta LEVEL usando ggplot y asigne geom_point. Esta ves utilice %>% para crear la conexion desde la data y la funcion.

river_data %>% ggplot(aes(RAIN, LEVEL)) + geom_point()

#Ejercicio 6

#Usando los datos river_data realice un solo plot que muestre los datos sobre la variable continua DATE, pero que muestre LEVEL y RAIN utilizando geom_line y diferenciando por color las variables discretas.

river_data %>% ggplot(aes(DATE,LEVEL)) + geom_line(aes(color="LEVEL")) + geom_line(aes(DATE,RAIN,color="RAIN"))

#Ejercicio 7

#Encuentre y ponga un punto en la gráfica de LEVEL al valor máximo y mínimo, utilice geom_line y geom_point, establesca una variable index_max e index_min respectivamente para realizar el ejercicio.


index_max <- river_data$LEVEL==max(river_data$LEVEL)
index_min <- river_data$LEVEL==min(river_data$LEVEL)



ggplot(river_data,aes(DATE,LEVEL))+geom_line(aes(color="LEVEL"))+
  geom_point(data=river_data[index_max,],aes(DATE,LEVEL,color="MAX"))+
  geom_point(data=river_data[index_min,],aes(DATE,LEVEL,color="MIN"))


#Ejercicio 8

#Cree un plot de LEVELS unicamente para el año 2001, utilice la funcion as.numeric() y format() para aislar unicamente el año. 

#Cree la variable index_2001 que contenga uncamente el año 2001 

river_data$YEAR = as.numeric(format(river_data$DATE, "%Y"))
index_2001=river_data$YEAR==2001

river_data[index_2001,] %>% ggplot(aes(DATE, LEVEL)) + geom_line(aes(color = "LEVEL"))

