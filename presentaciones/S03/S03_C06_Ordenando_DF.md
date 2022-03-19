<p align="center">
<img src="logomingob2018.png">
</p>


Ordenando Data Frames
========================================================
author: William V. Paredes
date: Agosto-Septiembre 2019
autosize: true

Introducción
========================================================
Al examinar un conjunto de datos, a menudo es conveniente ordenar la tabla por las diferentes columnas. Sabemos acerca de la función order() y sort(), pero para ordenar tablas enteras, la función de dplyr arrange() es útil. Por ejemplo, aquí ordenamos los estados por tamaño de población:

Función arrange()
========================================================

```r
library(tidyverse)
library(dslabs)
data(murders)

murders %>%
  arrange(population) %>%
  head()
```

```
                 state abb        region population total
1              Wyoming  WY          West     563626     5
2 District of Columbia  DC         South     601723    99
3              Vermont  VT     Northeast     625741     2
4         North Dakota  ND North Central     672591     4
5               Alaska  AK          West     710231    19
6         South Dakota  SD North Central     814180     8
```


Función arrange()
========================================================
Con la funcion arrange() podemos decidir por qué columna ordenar. Para ver los estados por población, de menor a mayor, organizamos por rate:

```r
murders <- mutate(murders, rate = total/population * 10^5)
murders %>% 
  arrange(rate) %>% 
  head()
```

```
          state abb        region population total      rate
1       Vermont  VT     Northeast     625741     2 0.3196211
2 New Hampshire  NH     Northeast    1316470     5 0.3798036
3        Hawaii  HI          West    1360301     7 0.5145920
4  North Dakota  ND North Central     672591     4 0.5947151
5          Iowa  IA North Central    3046355    21 0.6893484
6         Idaho  ID          West    1567582    12 0.7655102
```

Función arrange()
========================================================
Tenga en cuenta que el comportamiento predeterminado es ordenar en orden ascendente. En dplyr, la función desc() transforma un vector para que esté en orden descendente. Para ordenar la tabla en orden descendente, podemos escribir:

Función arrange()
========================================================

```r
murders %>% arrange(desc(rate)) %>% head()
```

```
                 state abb        region population total      rate
1 District of Columbia  DC         South     601723    99 16.452753
2            Louisiana  LA         South    4533372   351  7.742581
3             Missouri  MO North Central    5988927   321  5.359892
4             Maryland  MD         South    5773552   293  5.074866
5       South Carolina  SC         South    4625364   207  4.475323
6             Delaware  DE         South     897934    38  4.231937
```

