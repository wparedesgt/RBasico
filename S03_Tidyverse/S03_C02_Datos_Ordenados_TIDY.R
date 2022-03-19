#S03_C02_Tidy_Data
#Datos Ordenados (tidy)

#Decimos que una tabla de datos está en formato ordenado si cada fila representa una observación y las columnas representan las diferentes variables disponibles para cada una de estas observaciones. El conjunto de datos de murders es un dataframe en formato TIDY.

library(tidyverse)
library(dslabs)
data("murders")

head(murders)

#Cada fila representa un estado con cada una de las cinco columnas que proporcionan una variable diferente relacionada con estos estados: nombre, abreviatura, región, población y asesinatos totales.

#Para ver cómo se puede proporcionar la misma información en diferentes formatos, considere el siguiente ejemplo:

data("gapminder")
head(gapminder)

gapminder %>% filter(country == c("Germany", "South Korea")) %>% select(c(country, year, fertility)) %>% head()


#Este conjunto de datos ordenado proporciona tasas de fertilidad para dos países a lo largo de los años. Este es un conjunto de datos ordenado porque cada fila presenta una observación con las tres variables: condado, año y tasa de fertilidad. Sin embargo, este conjunto de datos originalmente vino en otro formato y se reformó para el paquete dslabs. Originalmente, los datos estaban en el siguiente formato:

dat <- read_csv("data/sp_dyn_tfrt_in.csv")
dat %>% filter(country == "Germany") %>% head()

#Se proporciona la misma información, pero hay dos diferencias importantes en el formato: 1) cada fila incluye varias observaciones y 2) una de las variables, año, se almacena en el encabezado. Para que los paquetes tidyverse se utilicen de manera óptima, los datos deben volver a formarse en un formato ordenado (tidy), que aprenderá a hacer en la parte de domado de datos. Hasta entonces, utilizaremos conjuntos de datos de ejemplo que ya están en formato ordenado (tidy).

#Aunque no es inmediatamente obvio, a medida que avance en el curso comenzará a apreciar las ventajas de trabajar en un marco en el que las funciones utilizan formatos ordenados tanto para las entradas como para las salidas. Verá cómo esto permite que el analista de datos se centre en aspectos más importantes del análisis en lugar del formato de los datos.


