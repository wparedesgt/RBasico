<p align="center">
<img src="tidyverse.jpg">
</p>

Paquete Purrr
========================================================
author: William V. Paredes
date: Mayo 2022
autosize: true

Introducción
========================================================
Anteriormente aprendimos sobre la función sapply, que nos permitió aplicar la misma función a cada elemento de un vector. Construimos esta función:


```r
compute_s_n <- function(n){
  x <- 1:n
  sum(x)
}
```


Introducción
========================================================
y usé sapply para calcular la suma de los primeros n enteros para varios valores de n como este:

```r
n <- 1:25
s_n <- sapply(n, compute_s_n)

s_n
```

```
 [1]   1   3   6  10  15  21  28  36  45  55  66  78  91 105 120 136 153 171 190
[20] 210 231 253 276 300 325
```


========================================================
Este tipo de operación, que aplica la misma función o procedimiento a elementos de un objeto, es bastante común en el análisis de datos. El paquete purrr incluye funciones similares a sapply pero que interactúan mejor con otras funciones tidyverse. La principal ventaja es que podemos controlar mejor el tipo de funciones de salida. 

Por el contrario, sapply puede devolver varios tipos de objetos diferentes; por ejemplo, podríamos esperar un resultado numérico de una línea de código, pero sapply podría convertir nuestro resultado en carácter en algunas circunstancias. 



========================================================
Las funciones de purrr nunca harán esto: devolverán objetos de un tipo específico o devolverán un error si esto no es posible.

La primera función de purrr que aprenderemos es map(), que funciona de manera muy similar a sapply pero siempre, sin excepción, devuelve una lista:


```r
library(tidyverse)
library(purrr)
s_n <- map(n, compute_s_n)
class(s_n)
```

```
[1] "list"
```

Función map()
========================================================
Si queremos un vector numérico, podemos usar map_dbl que siempre devuelve un vector de valores numéricos.

```r
s_n <- map_dbl(n, compute_s_n)
class(s_n)
```

```
[1] "numeric"
```

Esto produce los mismos resultados que la llamada sapply que se muestra arriba.


Función map_df()
========================================================
Una función de purrr particularmente útil para interactuar con el resto del tidyverse es map_df, que siempre devuelve un tibble. Sin embargo, la función que se llama debe devolver un vector a o una lista con nombres. Por esta razón, el siguiente código daría como resultado un Argumento 1 que debe tener un error de nombre:


s_n <- map_df(n, compute_s_n)


Necesitamos cambiar la funcion para que trabaje correctamente
========================================================

```r
compute_s_n <- function(n){
  x <- 1:n
  tibble(sum = sum(x))
}

s_n <- map_df(n, compute_s_n)

head(s_n)
```

```
# A tibble: 6 x 1
    sum
  <int>
1     1
2     3
3     6
4    10
5    15
6    21
```


========================================================
Purrr provee mucho mas funcionalidades que veremos mas adelante en el curso.



