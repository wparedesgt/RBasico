<p align="center">
<img src="logomingob2018.png">
</p>

Los Ciclos
========================================================
author: William V. Paredes
date: Agosto-Septiembre 2019
autosize: true

Introducción
========================================================
R cuenta con varios tipos de ciclos o repeticiones, ya sea de un determinado numero de veces, mientras se cumple una condicion, o infinitas veces.

Repeticiones con N derminado.
========================================================
Explicita en ella misma


```r
letras <- c("c", "L", "i", "M", "T", "A")

for (i in 1:6) {
  print(letras[i])
  
}
```

```
[1] "c"
[1] "L"
[1] "i"
[1] "M"
[1] "T"
[1] "A"
```

El No. de veces que se repite la expresion puede quedar implicito en esta forma:
========================================================
Se llamo a la funcion seq_along() que genera una secuencia de enteros acorde al no. de elementos que contenga la variable o el objeto.


```r
for (i in seq_along(letras)) {
  print(letras[i])
}
```

```
[1] "c"
[1] "L"
[1] "i"
[1] "M"
[1] "T"
[1] "A"
```



El No. de veces que se repite la expresion puede quedar implicito en esta forma:
========================================================
El segundo caso tipifica la esencia de la construccion for(), ya que tratara de ir tomado uno a uno los elementos del objeto consignado.


```r
for (letra in letras) {
  print(letra)
}
```

```
[1] "c"
[1] "L"
[1] "i"
[1] "M"
[1] "T"
[1] "A"
```


Repeticiones con condicion.
========================================================
Se habilita esta operacion con la instruccion while.
Hay que tener cuidado con esta opcion pues si no se pone el indice i da lugar a un ciclo sin salida.


```r
i <- 1

while(i <= 6) {
  print(letras[i])
  i <- i + 1
}
```

```
[1] "c"
[1] "L"
[1] "i"
[1] "M"
[1] "T"
[1] "A"
```

Repeticiones infinitas
========================================================
Generalmente utilizaremos la funcion repeat() aunque es una condicionante infinita el lenguaje provee facilidades para que desde el interior del bloque de expresiones se obligue a interrumpir el ciclo.

repeat()
========================================================


```r
i <- 1

repeat {
  print(letras[i])

    i <-  i + 1
  
    if(i > 6)
    break
}
```

```
[1] "c"
[1] "L"
[1] "i"
[1] "M"
[1] "T"
[1] "A"
```



========================================================
En este caso el if prueba la condicion de salida que dispara la instruccion break que interrumpe el ciclo.

Los ciclos se pueden interrumpir con tres instrucciones diferentes, ya sean break, next, return.


Ejemplo
========================================================
Usaremos un generador de numeros aleatorios para el ejemplo.


```r
set.seed(140) #Cualquier numero
aprox <- 0.003 #Valor de la salida del ciclo
Y_ini <- 2.7 #Valor inicial de Y supuesto
for(iter in 1:1000) {  #Aseguro no mas de 1000 interaciones
#Procedimiento para calcular la siguiente Y, que en este caso simularemos mediante un generador aleatorio
Y <- Y_ini + 0.008*rnorm(1)
if(abs(Y - Y_ini) <= aprox)
  break #salir del ciclo
Y_ini <- Y
}
```


========================================================


```r
paste("Y_ini", Y_ini, "Y:", Y, "Num.Iter", iter)
```

```
[1] "Y_ini 2.76443400590741 Y: 2.76582777768031 Num.Iter 8"
```



========================================================
El el ejemplo el objetivo fue alcanzado en 8 iteracciones, hemos utilizado el abs() para entregar el valor absoluto, rnorm nos sirvio para generar numeros aleatorios de distribucion normal que inicializamos con set.seed.


========================================================
El siguiente ejemplo se utilizara next() para interrumpir el flujo normal de la ejecucion de una manera diferente, en vez de salir del ciclo solamente impedira la ejecuccion de las instrucciones siguientes, regresando el principio del ciclo.

========================================================


```r
for(i in 1:7) {
  if(3 <= i && i <= 5)
    next
  print(i)
}
```

```
[1] 1
[1] 2
[1] 6
[1] 7
```





