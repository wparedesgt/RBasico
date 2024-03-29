Vectores
========================================================
author: William V. Paredes
date: Marzo 2022
autosize: true

Introducción
========================================================


Existen numerosos tipos de estructuras de datos en todos los lenguajes de programación, cada uno con fortalezas y debilidades adecuadas para tareas particulares. Dado que R es un lenguaje de  programación utilizado ampliamente para el análisis de datos, machine learning y depp learning, las estructuras de datos que utiliza fueron diseñadas con este tipo de trabajo en mente.

Estructuras
========================================================

Las estructuras de datos en R utilizadas con mayor frecuencia en el aprendizaje automático son:
- vectores
- factores 
- listas 
- matrices y marcos de datos o dataframes 

Cada uno se adapta a una determinada tarea de gestión de datos, lo que hace que sea importante entender cómo lo harán al interactuar en su proyecto de R.

Vectores
========================================================
La estructura de datos R fundamental es el vector, que almacena un conjunto ordenado de valores llamados elementos. Un vector puede contener cualquier número de elementos, pero todos los elementos deben ser del mismo tipo de valores. Por ejemplo, un vector no puede contener números y texto. Para determinar el tipo de vector v, use el comando typeof(v).


```r
x <- c(1:10)
y <- c("a", "b", "c")
z <- c(1-9)

typeof(x)
```

```
[1] "integer"
```

```r
typeof(y)
```

```
[1] "character"
```


Sacando una muestra
========================================================
Por ejemplo, si queremos sacar una muestra de un objeto (x), digamos que el 50% y que estos no se repitán podriamos escribir el siguiente codigo:


```r
x <- c(1:10)
w <- sample(x, 5, replace = FALSE, prob = NULL)
w
```

```
[1]  3  8 10  1  2
```



Tipos de Vectores
========================================================

Varios tipos de vectores se utilizan comúnmente en el aprendizaje automático: enteros (números sin decimales), dobles (números con decimales), caracteres (datos de texto) y lógicos (valores VERDADEROS o FALSOS). También hay dos valores especiales: NULL, que se utiliza para indicar la ausencia de cualquier valor, y NA, que indica un valor faltante.


Funcion de combinación
========================================================

Es tedioso ingresar grandes cantidades de datos manualmente, pero se pueden crear pequeños vectores usando la función de combinación c (). También se le puede dar un nombre al vector mediante el operador de flecha <, que es la forma en que R asigna valores, al igual que el operador de asignación = se usa en muchos otros lenguajes de programación.


Ejemplo
========================================================

Por ejemplo, construyamos varios vectores para almacenar los datos de diagnóstico de tres pacientes médicos. Crearemos un vector de caracteres llamado subject_name para almacenar los tres nombres de los pacientes, un vector doble llamado temperatura para almacenar la temperatura corporal de cada paciente y un vector lógico llamado flu_status para almacenar el diagnóstico de cada paciente (VERDADERO si tiene influenza, FALSO de lo contrario) ). Echemos un vistazo al siguiente código para crear estos tres vectores:


Ejemplo
========================================================



```r
subject_name <- c("John Doe", "Jane Doe", "Steve Graves")
temperature <- c(98.1, 98.6, 101.4)
flu_status <- c(FALSE, FALSE, TRUE)
```


Orden Inherente
========================================================

Debido a que los vectores R están ordenados de forma inherente, se puede acceder a los registros contando el número del elemento en el conjunto, comenzando en uno y rodeando este número entre corchetes (es decir, [y]) después del nombre del vector. Por ejemplo, para obtener la temperatura corporal de la paciente Jane Doe (el segundo elemento en el vector de temperatura) simplemente escriba:


```r
temperature[2]
```

```
[1] 98.6
```

Metodos
========================================================

R ofrece una variedad de métodos convenientes para extraer datos de vectores. Se puede obtener un rango de valores utilizando el operador de dos puntos (:). Por ejemplo, para obtener la temperatura corporal de Jane Doe y Steve Graves, escriba:


```r
temperature[2:3]
```

```
[1]  98.6 101.4
```

Exclusiones
========================================================

Los artículos se pueden excluir especificando un número de artículo negativo. Para excluir los datos de temperatura de Jane Doe, escriba:


```r
temperature[-2]
```

```
[1]  98.1 101.4
```

```r
temperatura2 <- temperature[-2]

temperatura2
```

```
[1]  98.1 101.4
```

Como vector logico
========================================================

Finalmente, a veces también es útil especificar un vector lógico que indique si se debe incluir cada elemento. Por ejemplo, para incluir las dos primeras lecturas de temperatura pero excluir la tercera, escriba:


```r
temperature[c(TRUE, TRUE, FALSE)]
```

```
[1] 98.1 98.6
```

Finalizando
========================================================

Como verá en breve, el vector proporciona la base para muchas otras estructuras de datos R. Por lo tanto, el conocimiento de las diversas operaciones vectoriales es crucial para trabajar con datos en R.

