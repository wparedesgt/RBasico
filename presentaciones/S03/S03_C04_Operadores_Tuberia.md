<p align="center">
<img src="logomingob2018.png">
</p>

Operadores de Tuberia
========================================================
author: William V. Paredes
date: Agosto-Septiembre 2019
autosize: true

Introducción
========================================================
Con dplyr podemos realizar una serie de operaciones, por ejemplo, seleccionar y luego filtrar, enviando los resultados de una función a otra utilizando lo que se llama operador de tubería:%>%. 

Algunos detalles se incluyen a continuación.

========================================================
Escribimos el código anterior para mostrar tres variables (estado, región, tasa) para los estados que tienen tasas de homicidio por debajo de 0,71. Para hacer esto, definimos el objeto intermedio new_table. En dplyr podemos escribir código que se parezca más a una descripción de lo que queremos hacer sin objetos intermedios:

- original data → select → filter 


Para tal operación, podemos usar la tubería%>% (pipes). El código se ve así:

========================================================

```r
library(tidyverse)
library(dslabs)
data("murders")

murders <- mutate(murders, rate = total/population * 10^5)

murders %>% select(state, region, rate) %>% filter(rate <= 0.71)
```

```
          state        region      rate
1        Hawaii          West 0.5145920
2          Iowa North Central 0.6893484
3 New Hampshire     Northeast 0.3798036
4  North Dakota North Central 0.5947151
5       Vermont     Northeast 0.3196211
```

========================================================
Esta línea de código es equivalente a las dos líneas de código anteriores. 

- ¿Que esta pasando aqui?
  
En general, la tubería envía el resultado del lado izquierdo de la tubería como primer argumento de la función en el lado derecho de la tubería. Aquí hay un ejemplo muy simple:


========================================================

```r
16 %>% sqrt() %>% log(base = 2)
```

```
[1] 2
```


========================================================
Por lo tanto, al usar la tubería con dataframe y dplyr, ya no necesitamos especificar el primer argumento requerido ya que las funciones de dplyr que hemos descrito toman todos los datos como el primer argumento. En el código que escribimos:

========================================================

```r
murders %>% select(state, region, rate) %>% filter(rate <= 0.71)
```

```
          state        region      rate
1        Hawaii          West 0.5145920
2          Iowa North Central 0.6893484
3 New Hampshire     Northeast 0.3798036
4  North Dakota North Central 0.5947151
5       Vermont     Northeast 0.3196211
```


========================================================
Tenga en cuenta que la tubería funciona bien con funciones donde el primer argumento son los datos de entrada. Las funciones en paquetes tidyverse como dplyr tienen este formato y se pueden usar fácilmente con la tubería.


