<p align="center">
<img src="logomingob2018.png">
</p>


Funciones
========================================================
author: William V. Paredes
date: Agosto-Septiembre 2019
autosize: true

Introducción
========================================================
R trata las funciones practicamente como cualquier otro objeto.
De esta manera se pueden manipular de manera semejante, se pueden pasar como argumentos, se pueden regresar como un valor final, se pueden definir en el interior de otra funcion. Esta se agrega con la directiva function().



========================================================
La funcion cuenta con dos partes la definicion de los argumentos formales y el cuerpo de la funcion.


========================================================
El cuerpo de la funcion es constituido por una o mas expresiones validas del lenguaje.


========================================================
Tambien hay  dos momentos importantes en la vida de una funcion, la definicion de la funcion la cual basicamente ocurre una sola vez y le ejecucion de la funcion que puede ocurrir N cantidad de veces.

Ejemplo
========================================================
f es el simbolo asociado a la funcion

f <- function("<Argumentos>") { #Argumentos Formales

Expresiones  #Cuerpo de la funcion expresiones

<Valor>   #Valor que regresa la funcion

}  #Fin de la funcion



========================================================
Los argumentos formales en donde la funcion se comunica con el ambiente exterior.



Definicion V.1
========================================================


```r
MiFunc.v1 <- function(x,yyy,z=5, t) {
  w <- x + yyy + z
  w
}

MiFunc.v1(5,10,6)  
```

```
[1] 21
```


Definicion V.2
========================================================


```r
MiFunc.V2 <- function(x, yyy, z= 5, t) {
  w <- x + yyy + z
  return(w)
  3.1416  #Aqui no se va a ejecutar nada
}

MiFunc.V2(5,10)
```

```
[1] 20
```


Definicion V.3
========================================================


```r
MiFunc.V3 <- function(x, yyy, z=5, t) {
  x+yyy+z
}

MiFunc.V3(5,10)
```

```
[1] 20
```



========================================================
Ejecutaremos una funcion como ejemplo con los numero de fibbonacci, en la cual argumenta que tenidos o dados los dos primeros numeros F0 y F1, calculara cada uno de los siguientes como la suma de los dos anteriores.


========================================================

```r
fibbonacci <- function(n) {
  if(n %in% c(0,1))
    return(1)
  
  F0 <- 1
  F1 <- 1
  i <- 2
  
  repeat {
    s <- F0 + F1 #Suma de los fib anteriores
    if(i == n) #Buscar el no.
      return(s)
    F0 <- F1
    F1 <- s
    i <- i+1 #Incrementamos el indice
  }
}
```

========================================================

```r
fibbonacci(8)
```

```
[1] 34
```

