<p align="center">
<img src="Azure_R_ML.jpg">
</p>

Matrices
========================================================
author: William V. Paredes  
date:  Marzo 2022
autosize: true

Introducción
========================================================
Además de los marcos de datos, R proporciona otras estructuras que almacenan valores en forma tabular. Una matriz es una estructura de datos que representa una tabla bidimensional con filas y columnas de datos. Al igual que los vectores, las matrices R pueden contener cualquier tipo de datos, aunque se utilizan con mayor frecuencia para operaciones matemáticas y, por lo tanto, generalmente solo almacenan datos numéricos.


========================================================
Para crear una matriz, simplemente proporcione un vector de datos a la función matrix () junto con un parámetro que especifique el número de filas (nrow) o el número de columnas (ncol).

Por ejemplo, para crear una matriz de 2 x 2 que almacene los números del uno al cuatro, podemos usar el parámetro nrow para solicitar que los datos se dividan en dos filas:


```r
m <- matrix(c(1, 2, 3, 4), nrow = 2)
m
```

```
     [,1] [,2]
[1,]    1    3
[2,]    2    4
```

========================================================
Es practicamente lo mismo si lo hacemos así:


```r
m <- matrix(c(1:4), nrow = 2)
m
```

```
     [,1] [,2]
[1,]    1    3
[2,]    2    4
```


========================================================
Notarán que R cargó la primera columna de la matriz primero antes de cargar la segunda columna. Esto se denomina orden mayor de columna y es el método predeterminado de R para cargar matrices.

Para anular esta configuración predeterminada y cargar una matriz por filas, establezca el parámetro byrow = TRUE al crear la matriz.


```r
m <- matrix(c(1:4), nrow = 2, byrow = TRUE)

m
```

```
     [,1] [,2]
[1,]    1    2
[2,]    3    4
```

========================================================
Para ilustrar esto con más detalle, veamos qué sucede si agregamos más valores a la matriz.
Con seis valores, la solicitud de dos filas crea una matriz con tres columnas:


```r
m <- matrix(c(1:6), nrow = 2)
m
```

```
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6
```


========================================================
Solicitar dos columnas crea una matriz con tres filas:


```r
m <- matrix(c(1:6), ncol = 2)
m
```

```
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6
```


========================================================
Al igual que con los marcos de datos, los valores en matrices se pueden extraer usando la notación [fila, columna]. Por ejemplo, m [1, 1] devolverá el valor 1 y m [3, 2] extraerá 6 de la matriz m. Además, se pueden solicitar filas o columnas completas:


```r
m[1, ]
```

```
[1] 1 4
```

```r
m[, 1]
```

```
[1] 1 2 3
```


