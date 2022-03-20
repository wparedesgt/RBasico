<p align="center">
<img src="Azure_R_ML.jpg">
</p>

Primera Carga y Exploración  de un CSV
========================================================
author: William V. Paredes
date: Agosto 2019
autosize: true

Introducción
========================================================
Es muy común que los conjuntos de datos públicos se almacenen en archivos de texto. Los archivos de texto se pueden leer en prácticamente cualquier computadora o sistema operativo, lo que hace que el formato sea casi universal. También se pueden exportar e importar desde y hacia programas como Microsoft Excel, lo que proporciona una manera rápida y fácil de trabajar con datos de hojas de cálculo.

========================================================
Un archivo de datos tabular (como en "tabla") está estructurado en forma de matriz, de manera que cada línea de texto refleja un ejemplo, y cada ejemplo tiene el mismo número de características.

Los valores de las características en cada línea están separados por un símbolo predefinido, conocido como delimitador. A menudo, la primera línea de un archivo de datos tabular enumera los nombres de las columnas de datos. Esto se llama una línea de encabezado.





========================================================
Quizás el formato de archivo de texto tabular más común es el archivo CSV (valores separados por comas), que como su nombre indica, utiliza la coma como delimitador. Los archivos CSV se pueden importar y exportar desde muchas aplicaciones comunes. Un archivo CSV que representa el conjunto de datos médico construido previamente se podría almacenar como:



```r
write.csv(pt_data,'pt_data.csv', row.names = TRUE)
```


========================================================
Después de recopilar los datos y cargarlos en las estructuras de datos de R, el siguiente paso en el proceso de aprendizaje automático consiste en examinar los datos en detalle. Es durante este paso que comenzará a explorar las características y los ejemplos de los datos, y se dará cuenta de las peculiaridades que hacen que sus datos sean únicos. Cuanto mejor comprenda sus datos, mejor podrá relacionar un modelo de aprendizaje automático con su problema de aprendizaje.

========================================================
La mejor manera de aprender el proceso de exploración de datos es con un ejemplo. En esta sección, exploraremos el conjunto de datos usedcars.csv, que contiene datos reales sobre autos usados recientemente anunciados para la venta en un popular sitio web de los EE. UU.

========================================================
Dado que el conjunto de datos se almacena en el formato CSV, podemos usar la función read.csv () para cargar los datos en un marco de datos R.


```r
usedcars <- read.csv ("usedcars.csv", stringsAsFactors = FALSE)
```


========================================================

El dataframe de vehiculos usados esta listo, ahora asumiremos el papel de un científico de datos que tiene la tarea de comprender los datos de automóviles usados. Si bien la exploración de datos es un proceso fluido, los pasos se pueden imaginar como una especie de investigación en la que las preguntas sobre los datos son respondidas. Las preguntas exactas pueden variar según los proyectos, pero los tipos de preguntas son siempre similares. Debe poder adaptar los pasos básicos de esta investigación a cualquier conjunto de datos que desee, ya sea grande o pequeña.

Explorando la estructura de datos
========================================================
Una de las primeras preguntas que debe hacerse en una investigación de un nuevo conjunto de datos debe ser sobre cómo se organiza el conjunto de datos. Si tiene suerte, su fuente proporcionará un diccionario de datos, que es un documento que describe las características del conjunto de datos. 

En nuestro caso, los datos de automóviles usados no vienen con esta documentación, por lo que necesitaremos crear uno.

========================================================
La función str () proporciona un método para mostrar la estructura de las estructuras de datos R, como marcos de datos, vectores o listas. Se puede utilizar para crear el esquema básico de nuestro diccionario de datos:


```r
str(usedcars)
```

```
'data.frame':	150 obs. of  6 variables:
 $ year        : int  2011 2011 2011 2011 2012 2010 2011 2010 2011 2010 ...
 $ model       : chr  "SEL" "SEL" "SEL" "SEL" ...
 $ price       : int  21992 20995 19995 17809 17500 17495 17000 16995 16995 16995 ...
 $ mileage     : int  7413 10926 7351 11613 8367 25125 27393 21026 32655 36116 ...
 $ color       : chr  "Yellow" "Gray" "Silver" "Gray" ...
 $ transmission: chr  "AUTO" "AUTO" "AUTO" "AUTO" ...
```

========================================================


```r
summary(usedcars)
```

```
      year         model               price          mileage      
 Min.   :2000   Length:150         Min.   : 3800   Min.   :  4867  
 1st Qu.:2008   Class :character   1st Qu.:10995   1st Qu.: 27200  
 Median :2009   Mode  :character   Median :13592   Median : 36385  
 Mean   :2009                      Mean   :12962   Mean   : 44261  
 3rd Qu.:2010                      3rd Qu.:14904   3rd Qu.: 55125  
 Max.   :2012                      Max.   :21992   Max.   :151479  
    color           transmission      
 Length:150         Length:150        
 Class :character   Class :character  
 Mode  :character   Mode  :character  
                                      
                                      
                                      
```


