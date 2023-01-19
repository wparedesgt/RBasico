#Ejercicio de operadores Logicos

library(tidyverse)
library(dslabs)

data(murders)

options(scipen = 999)

#Pregunta No. 1

#Calcule la tasa de asesinatos por cada 100,000 para cada estado y guárdela en un objeto llamado murder_rate. Luego, use operadores lógicos para crear un vector lógico llamado low que nos indique qué entradas de murder_rate son inferiores a 1.

murders <- murders %>% mutate(murder_rate = total/population * 10^5, low = murder_rate < 1)

#Pregunta No. 2

#Ahora use los resultados del ejercicio anterior y la función witch() para determinar los índices de tasa de asesinatos asociados con valores inferiores a 1.

index <- which(murders$low == TRUE)

#Pregunta No. 3

#Use los resultados del ejercicio anterior para informar los nombres de los estados con tasas de asesinatos inferiores a 1.

murders$state[index]

#Pregunta No. 4

#Ahora extienda el código del ejercicio 2 y 3 para informar los estados en el noreste con tasas de homicidios inferiores a 1. Sugerencia: use el vector lógico previamente definido y el operador lógico &.

index <- which(murders$low == TRUE & murders$region == 'Northeast')
murders$state[index]

#Pregunta No. 5

#En un ejercicio anterior, calculamos la tasa de homicidios de cada estado y el promedio de estos números. ¿Cuántos estados están por debajo del promedio?
  
index <- which(murders$murder_rate < mean(murders$murder_rate))
murders$state[index]


# Pregunta No. 6
# 
# Use la función match() para identificar los estados con abreviaturas AK, MI e IA. Sugerencia: comience definiendo un índice de las entradas de asesinatos $ abb que coincidan con las tres abreviaturas, luego use el operador “[]“ para extraer los estados.

v1 <- c('AK', 'MI', 'IA')

index <- match(v1, murders$abb)
murders$state[index]

#Pregunta No. 7

#Use el operador %in% para crear un vector lógico que responda a la pregunta: ¿cuáles de las siguientes son abreviaturas reales: MA, ME, MI, MO, MU?
  
v2 <- c('MA', 'ME', 'MI', 'MO', 'MU')
murders$state[murders$abb %in% v2]

# Pregunta No. 8
# 
# Extienda el código que utilizó en el ejercicio 7 para informar la entrada que no es una abreviatura real. Sugerencia: use el operador “!”, que convierte FALSO en VERDADERO y viceversa, para obtener un índice.

v2 <- c('MA', 'ME', 'MI', 'MO', 'MU')
index <- !v2 %in% murders$abb
v2[index]





