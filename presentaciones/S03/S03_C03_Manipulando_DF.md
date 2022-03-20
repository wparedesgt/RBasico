<p align="center">
<img src="tidyverse.jpg">
</p>

Manipulando Data Frames
========================================================
author: William V. Paredes
date: Abril-Mayo 2022
autosize: true

Introducción
========================================================
El paquete dplyr del tidyverse presenta funciones que realizan algunas de las operaciones más comunes cuando se trabaja con dataframes y usa nombres para estas funciones que son relativamente fáciles de recordar. 
- Por ejemplo, para cambiar la tabla de datos agregando una nueva columna, usamos mutate().
- Para filtrar la tabla de datos a un subconjunto de filas, usamos filter(). 
- Finalmente, para subdividir los datos seleccionando columnas específicas, usamos select().


Funcion mutate()
========================================================
- Agregando una columna con la funcion mutate().

- Queremos que toda la información necesaria para nuestro análisis se incluya en la tabla de datos. 

- Entonces, la primera tarea es agregar las tasas de asesinatos a nuestro dataframe.


Funcion mutate()
========================================================
La función mutate() toma el dataframe como primer argumento y el nombre y los valores de la variable como segundo argumento usando la convención nombre = valores. Entonces, para agregar tasas de asesinatos, usamos:


```r
library(tidyverse)
library(dslabs)
data("murders")

murders <- mutate(murders, rate = total/population * 10^5)
```

Funcion mutate()
========================================================
Observe que aquí usamos total y población dentro de la función, que son objetos que no están definidos en nuestro espacio de trabajo. Pero, ¿por qué no recibimos un error?
  
 Esta es una de las principales características de dplyr. Las funciones en este paquete, como mutate, saben buscar variables en el dataframe proporcionado en el primer argumento. En la llamada a mutate() anterior, total tendrá los valores en murders$total. Este enfoque hace que el código sea mucho más legible.

Funcion mutate()
========================================================
Podemos ver que se agrega la nueva columna:

```r
head(murders)
```

```
       state abb region population total     rate
1    Alabama  AL  South    4779736   135 2.824424
2     Alaska  AK   West     710231    19 2.675186
3    Arizona  AZ   West    6392017   232 3.629527
4   Arkansas  AR  South    2915918    93 3.189390
5 California  CA   West   37253956  1257 3.374138
6   Colorado  CO   West    5029196    65 1.292453
```

Funcion mutate()
========================================================
Aunque hemos sobrescrito el objeto de asesinatos original, esto no cambia el objeto que se cargó con datos (murders). Si volvemos a cargar los datos murders, el original sobrescribirá nuestra versión mutada.

Funcion filter()
========================================================
Ahora suponga que queremos filtrar la tabla de datos para mostrar solo las entradas para las cuales la tasa de homicidios es inferior a 0,71. 

Para hacer esto, utilizamos la función filter(), que toma la tabla de datos como el primer argumento y luego la declaración condicional como el segundo. Al igual que mutate(), podemos usar los nombres de variables sin comillas de murders dentro de la función y sabrá que nos referimos a las columnas y no a los objetos en el espacio de trabajo.

Funcion filter()
========================================================

```r
filter(murders, rate <= 0.71)
```

```
          state abb        region population total      rate
1        Hawaii  HI          West    1360301     7 0.5145920
2          Iowa  IA North Central    3046355    21 0.6893484
3 New Hampshire  NH     Northeast    1316470     5 0.3798036
4  North Dakota  ND North Central     672591     4 0.5947151
5       Vermont  VT     Northeast     625741     2 0.3196211
```

Funcion select()
========================================================
Aunque nuestra tabla de datos solo tiene seis columnas, algunas tablas de datos incluyen cientos. Si queremos ver algunas, podemos usar la función dplyr select. En el siguiente código seleccionamos tres columnas, asignamos esto a un nuevo objeto y luego filtramos el nuevo objeto:

Funcion select()
========================================================


```r
new_table <- select(murders, state, region, rate)
filter(new_table, rate <= 0.71)
```

```
          state        region      rate
1        Hawaii          West 0.5145920
2          Iowa North Central 0.6893484
3 New Hampshire     Northeast 0.3798036
4  North Dakota North Central 0.5947151
5       Vermont     Northeast 0.3196211
```


Funcion select()
========================================================
En la llamada a select(), el primer argumento de murders es un objeto en este caso un dataframe, pero estado, región y tasa son nombres de variables.




