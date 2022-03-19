#Ejercicios Factores

#Ejercicio 1.

#Si

#x <- 1, 2, 3, 3, 5, 3, 2, 4, NA, cuales son los “levels” del factor (x)?

#Tip: cree el factor primero

x <- c(1,2,3,3,5,3,2,4,NA)

factor(x)  

levels(factor(x))



#a. 1, 2, 3, 4, 5 #WP
#b. NA
#c. 1, 2, 3, 4, 5, NA


#Ejercicio 2.

#Si

x <- c(11, 22, 47, 47, 11, 47, 11)

#Generamos la siguiente expresión en R:
  
factor(x, levels=c(11, 22, 47), ordered=TRUE)

#Cual es el 4to elemento de la salida?
  
#a. 11
#b. 22
#c. 47 #WP


#Ejercicio 3.

#Si

z <- c("p", "a" , "g", "t", "b")

#cuál de las siguientes expresiones R reemplazará el tercer elemento en la variable z con "b"?
  
factor(z[3]) <- "b"
levels(z[3]) <- "b"
z[3] <- "b" #WP

z

#Ejercicio 4.

#Si

z <- factor(c("p", "q", "p", "r", "q"))

#y los niveles de z  son: "p", "q" ,"r", escriba una expresión en R que pueda cambiar el nivel de “p” a “w” para que z z sea igual al resultado siguiente: "w", "q" , "w", "r" , "q".


#Su respuesta aquí: _________________________________________

levels(z)[1] <- "w"

z

#Tip: Es una respuesta corta, observe la posición de p con respecto a los otros, utilice la función levels(), propocionando el nombre de la variable y la posición de “p”.


#Ejercicio 5.

#Aquí usaremos una función de R llamada sample(), que toma un ejemplo de un vector y set.seed para una muestra aleatoria.

#Si

set.seed(1)

s1 <- factor(sample(letters, size=5, replace=TRUE)) 
s2 <- factor(sample(letters, size=5, replace=TRUE))

#Escriba una expresión en R para concatenar s1 y s2 en un solo factor s3 con 10 elementos.

#Su respuesta aquí:__________________________________________

factor(c(levels(s1)[s1], levels(s2)[s2]))


#Ejercicio 6.

#Vamos a considerar otro data set por defecto de R, en este caso es “iris”, como podemos observar podemos llamar un dataset en memoria con la funcion data().

data("iris")

#Escribamos una expresión que nos permita cortar la variable Sepal.Length y crear el siguiente factor con sus 5 niveles “levels”.

#Esto es mas avanzado les puede tomar algo de tiempo, pero aprendemos dos cosas, a buscar la ayuda y a pensar una solución adecuada.


(4.3, 5.02] (5.02, 5.74] (5.74, 6.46] (6.46, 7.18] (7.18, 7.9]
32 41 42 24 11


#Su respuesta aquí:___________________________________________________

table(cut(iris$Sepal.Length, 5))


#Tip: buscaremos en la ayuda de R la funcion table(), y cut() de esta forma:
  
#?table()
#?cut()

#Ademas nuestra primera función a utilizar es table() que contendrá la otra función cut().


#Ejercicio 7.

#Consideraremos nuevamente el dataset IRIS, como el anterior ejercicio.

#Escriba una expresión R que genere una tabla de frecuencia de dos vías con dos filas y tres columnas. Las filas deben relacionarse con Sepal.length (less than 5: TRUE or FALSE) y columnas con Species, con el siguiente resultado:
  
#setosa versicolor virginica
#FALSE 30 49 49
#TRUE 20 1 1

#Su respuesta aquí:________________________________________________________

table(iris$Sepal.Length < 5, factor(iris$Species))

#Tip: nuevamente utilizamos la función table


#Ejercicio 8.

#Considere el siguiente factor:
  
responses <- factor(c("Agree", "Agree", "Strongly Agree", "Disagree", "Agree"))

#el cual le da la siguiente salida:
  
#[1] Agree          Agree          Strongly Agree Disagree       Agree         
#Levels: Agree Disagree Strongly Agree

responses

#Mas tarde encontró que existe un nuevo nivel "Strongly Disagree".

#Escriba una expresión en R la cual incluya el nivel "Strongly Disagree", como un nuevo atributo del factor, ademas devuelva exactamente el siguiente resultado:
  
#[1] Agree Agree Strongly Agree Disagree Agree
#Levels: Strongly Agree Agree Disagree Strongly Disagree

#Su respuesta aquí:___________________________________________________________


factor(responses, levels = c("Strongly Agree","Agree", "Disagree", "Strongly Disagree"))


#Ejercicio 9.

#Si

x <- data.frame(q=c(2, 4, 6), p=c("a", "b", "c"))

#Escriba una instrucción en r que reemplace los niveles a,b,c con las etiquetas (labels), "fertiliser1", "fertliser2", "fertiliser3".

#Su respuesta aquí:__________________________________________________________

x$p <- factor(x$p, levels = c("a", "b", "c"), labels = c("fertiliser1", "fertiliser2", "fertiliser3"))

x

#Ejercicio 10.

#Si

x <- factor(c("high", "low", "medium", "high", "high", "low", "medium"))

#Escriba una expresión en R que proporcione valores numéricos únicos para varios niveles de x con la siguiente salida:
  
#levels value
#1 high 1
#2 low 2
#3 medium 3



#Su respuesta aquí:__________________________________________________________

data.frame(levels = unique(x), value = as.numeric(unique(x)))
