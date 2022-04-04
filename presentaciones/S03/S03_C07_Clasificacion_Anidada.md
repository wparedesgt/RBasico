<p align="center">
<img src="tidyverse.jpg">
</p>

Clasificacion Anidada
========================================================
author: William V. Paredes
date: Mayo 2022
autosize: true

Introducción
========================================================
Si estamos ordenando por una columna con ligaduras, podemos usar una segunda columna para romper la ligadura. Del mismo modo, se puede usar una tercera columna para romper los lazos entre la primera y la segunda, y así sucesivamente. Aquí ordenamos por región, luego dentro de la región ordenamos por índice de asesinatos:

Introducción
========================================================

```r
library(tidyverse)
library(dslabs)
data("murders")
murders <- mutate(murders, rate = total/population * 10^5)
murders %>% 
  arrange(region, desc(rate)) %>% 
  head()
```

```
          state abb    region population total     rate
1  Pennsylvania  PA Northeast   12702379   457 3.597751
2    New Jersey  NJ Northeast    8791894   246 2.798032
3   Connecticut  CT Northeast    3574097    97 2.713972
4      New York  NY Northeast   19378102   517 2.667960
5 Massachusetts  MA Northeast    6547629   118 1.802179
6  Rhode Island  RI Northeast    1052567    16 1.520093
```

Función top_n()
========================================================
En el código anterior, hemos utilizado la funcion head() para evitar que la página se llene con todo el conjunto de datos. Si queremos ver una proporción mayor, podemos usar la función top_n. Esta función toma un dataframe como primer argumento, el número de filas para mostrar en el segundo y la variable para filtrar en el tercero. Aquí hay un ejemplo de cómo ver las 10 filas superiores:

Función top_n()
========================================================


```r
murders %>% top_n(10, rate)
```

```
                  state abb        region population total      rate
1               Arizona  AZ          West    6392017   232  3.629527
2              Delaware  DE         South     897934    38  4.231937
3  District of Columbia  DC         South     601723    99 16.452753
4               Georgia  GA         South    9920000   376  3.790323
5             Louisiana  LA         South    4533372   351  7.742581
6              Maryland  MD         South    5773552   293  5.074866
7              Michigan  MI North Central    9883640   413  4.178622
8           Mississippi  MS         South    2967297   120  4.044085
9              Missouri  MO North Central    5988927   321  5.359892
10       South Carolina  SC         South    4625364   207  4.475323
```


