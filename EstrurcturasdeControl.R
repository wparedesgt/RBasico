#Estructuras de Control

#Son aquellas construcciones sintacticas del lenguaje que dirigen el flujo de ejecucion de un programa.

#Construcciones IF-ELSE

#Funcionan igual que otros lenguajeas de programacion, con la salvedad que pueden ser capitalizadas, es decir la construccion en si misma regresa un valor que puede ser asignado a una variable o utilizado de otras maneras.

#Los siguientes ejemplos muestran la Sintaxis.

aa <-  15

if(aa > 14) print("SI MAYOR") #if sin else

if(aa > 14){                 #Instruccion compuesta
  print("Primer Reglon") 
  print("Si Mayor")
  } 

#Usando el valor que regresa el IF

y <- 10

y <- if(aa > 14) 50

y

#La construccion de IF adminte unicamente una sola expresion, pero esta puede ser compuesta, que se contruye mediante los parentesis {}, y las expresiones en su interior separadas por un cambio de reglon o ;.

#Ejemplo con varios operadores y expresiones compuestas.

#Pueder ver ??operator para ver mas operadores en R

if(10 > aa) {  #1mer Bloque
  print("Rango Menor")
} else if (10 <= aa && aa <= 20) {  #Segundo Bloque
  print("Primer Renglon"); print("Rango Medio")
} else { #Tercer Bloque
  print("Rango Mayor")
}

#Los Ciclos

#R cuenta con varios tipos de ciclos o repeticiones, ya sea de un determinado numero de veces, mientras se cumple una condicion, o infinitas veces.

#Repeticiones con N derminado.

#Explicita en ella misma

letras <- c("c", "L", "i", "M", "T", "A")

for (i in 1:6) {
  print(letras[i])
  
}

#El No. de veces que se repite la expresion puede quedar implicito en esta forma:

for (i in seq_along(letras)) {
  print(letras[i])
}

for (letra in letras) {
  print(letra)
}

#En el primer caso se llamo a la funcion seq_along() que genera una secuencia de enteros acorde al no. de elementos que contenga la variable o el objeto.

#El segundo caso tipifica la esencia de la construccion for(), ya que tratara de ir tomado uno a uno los elementos del objeto consignado.


#Repeticiones con condicion.

#Se habilita esta operacion con la instruccion while.

i <- 1

while(i <= 6) {
  print(letras[i])
  i <- i + 1
}

#Hay que tener cuidado con esta opcion pues si no se pone el indice i da lugar a un ciclo sin salida.


#Repeticiones infinitas

#Generalmente utilizaremos la funcion repeat() aunque es una condicionante infinita el lenguaje provee facilidades para que desde el interior del bloque de expresiones se obligue a interrumpir el ciclo.

i <- 1

repeat {
  print(letras[i])

    i <-  i + 1
  
    if(i > 6)
    break
}


#En este caso el if prueba la condicion de salida que dispara la instruccion break que interrumpe el ciclo.

#Los ciclos se pueden interrumpir con tres instrucciones diferentes, ya sean break, next, return.

#Usaremos un generador de numeros aleatorios para el ejemplo.
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

paste("Y_ini", Y_ini, "Y:", Y, "Num.Iter", iter)

#El el ejemplo el objetivo fue alcanzado en 8 iteracciones, hemos utilizado el abs() para entregar el valor absoluto, rnorm nos sirvio para generar numeros aleatorios de distribucion normal que inicializamos con set.seed.

#Utilizar ?rnorm y ?set.seed para obtener mas ayuda al respecto.

#Ejecutaremos una funcion como ejemplo con los numero de fibbonacci, en la cual argumenta que tenidos o dados los dos primeros numeros F0 y F1, calculara cada uno de los siguientes como la suma de los dos anteriores.

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

#Generación del 8vo numero de fibbonacci

fibbonacci(8)

#%in% es un operador que identifica si cierto elemento esta dentro de un conjunto representado por un vector.

#La instruccion return es una funcion que termina la funcion y entrega como resultado de la funcion el argumento que se le pase.

#El siguiente ejemplo se utilizara next() para interrumpir el flujo normal de la ejecucion de una manera diferente, en vez de salir del ciclo solamente impedira la ejecuccion de las instrucciones siguientes, regresando el principio del ciclo.


for(i in 1:7) {
  if(3 <= i && i <= 5)
    next
  print(i)
}




