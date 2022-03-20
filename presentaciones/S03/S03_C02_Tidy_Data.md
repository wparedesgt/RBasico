<p align="center">
<img src="logomingob2018.png">
</p>

Datos Ordenados
========================================================
author: William V. Paredes  
date: Agosto-Septiembre 2019
autosize: true

Tidy Data
========================================================
Decimos que una tabla de datos está en formato ordenado si cada fila representa una observación y las columnas representan las diferentes variables disponibles para cada una de estas observaciones. El conjunto de datos de murders es un dataframe en formato TIDY.


```r
library(tidyverse)
library(dslabs)

data(murders)
```


Tidy Data
========================================================


```r
head(murders)
```

```
       state abb region population total
1    Alabama  AL  South    4779736   135
2     Alaska  AK   West     710231    19
3    Arizona  AZ   West    6392017   232
4   Arkansas  AR  South    2915918    93
5 California  CA   West   37253956  1257
6   Colorado  CO   West    5029196    65
```

========================================================
Cada fila representa un estado con cada una de las cinco columnas que proporcionan una variable diferente relacionada con estos estados: nombre, abreviatura, región, población y asesinatos totales.

Para ver cómo se puede proporcionar la misma información en diferentes formatos, considere el siguiente ejemplo:


========================================================

```r
data("gapminder")

gapminder %>% filter(country == c("Germany", "South Korea")) %>% select(c(country, year, fertility)) %>% head()
```

```
      country year fertility
1     Germany 1960      2.41
2 South Korea 1960      6.16
3     Germany 1962      2.47
4 South Korea 1962      5.79
5     Germany 1964      2.49
6 South Korea 1964      5.36
```


========================================================
Este conjunto de datos ordenado proporciona tasas de fertilidad para dos países a lo largo de los años. Este es un conjunto de datos ordenado porque cada fila presenta una observación con las tres variables: condado, año y tasa de fertilidad. Sin embargo, este conjunto de datos originalmente vino en otro formato y se reformó para el paquete dslabs. Originalmente, los datos estaban en el siguiente formato:

========================================================

```r
dat <- read_csv("data/sp_dyn_tfrt_in.csv")
dat %>% filter(country == "Germany") %>% head()
```

```
# A tibble: 1 x 59
  country `1960` `1961` `1962` `1963` `1964` `1965` `1966` `1967` `1968` `1969`
  <chr>    <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>
1 Germany   2.37   2.45   2.44   2.51   2.54    2.5   2.53   2.48   2.38   2.21
# ... with 48 more variables: `1970` <dbl>, `1971` <dbl>, `1972` <dbl>,
#   `1973` <dbl>, `1974` <dbl>, `1975` <dbl>, `1976` <dbl>, `1977` <dbl>,
#   `1978` <dbl>, `1979` <dbl>, `1980` <dbl>, `1981` <dbl>, `1982` <dbl>,
#   `1983` <dbl>, `1984` <dbl>, `1985` <dbl>, `1986` <dbl>, `1987` <dbl>,
#   `1988` <dbl>, `1989` <dbl>, `1990` <dbl>, `1991` <dbl>, `1992` <dbl>,
#   `1993` <dbl>, `1994` <dbl>, `1995` <dbl>, `1996` <dbl>, `1997` <dbl>,
#   `1998` <dbl>, `1999` <dbl>, `2000` <dbl>, `2001` <dbl>, `2002` <dbl>, ...
```

========================================================
Se proporciona la misma información, pero hay dos diferencias importantes en el formato: 1) cada fila incluye varias observaciones y 2) una de las variables, año, se almacena en el encabezado. Para que los paquetes tidyverse se utilicen de manera óptima, los datos deben volver a formarse en un formato ordenado (tidy), que aprenderá a hacer en la parte de domado de datos. Hasta entonces, utilizaremos conjuntos de datos de ejemplo que ya están en formato ordenado (tidy).


========================================================
Aunque no es inmediatamente obvio, a medida que avance en el curso comenzará a apreciar las ventajas de trabajar en un marco en el que las funciones utilizan formatos ordenados tanto para las entradas como para las salidas. Verá cómo esto permite que el analista de datos se centre en aspectos más importantes del análisis en lugar del formato de los datos.





