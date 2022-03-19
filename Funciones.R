#Funciones

#R trata las funciones practicamente igual que cualquier otra variable.
#De esta manera se pueden manipular de manera semejante, se pueden pasar como argumentos, se pueden regresar como un valor final, se pueden definir en el interior de otra funcion. Esta se agrega con la directiva function().

#La funcion cuenta con dos partes la definicion de los argumentos formales y el cuerpo de la funcion.

#El cuerpo de la funcion es constituido por una o mas expresiones validas del lenguaje.

#Tambien hay  dos momentos importantes en la vida de una funcion, la definicion de la funcion la cual basicamente ocurre una sola vez y le ejecucion de la funcion que puede ocurrir N cantidad de veces.

#Ejemplo

#f es el simbolo asociado a la funcion

# f <- function("<Argumentos>") { #Argumentos Formales

#Expresiones  #Cuerpo de la funcion expresiones

#<Valor>   #Valor que regresa la funcion

#}  #Fin de la funcion


#Los argumentos formales en donde la funcion se comunica con el ambiente exterior.

#Definicion V.1

MiFunc.v1 <- function(x,yyy,z=5, t) {
  w <- x + yyy + z
  w
}

MiFunc.v1(5,10,6)  

#Definicion V.2

MiFunc.V2 <- function(x, yyy, z= 5, t) {
  w <- x + yyy + z
  return(w)
  3.1416  #Aqui no se va a ejecutar nada
}

MiFunc.V2(5,10)

#Definicion V.3

MiFunc.V3 <- function(x, yyy, z=5, t) {
  x+yyy+z
}

MiFunc.V3(5,10)




