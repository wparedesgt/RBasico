#Ejercicios Listas

#Ejercicio 1.

#Si

p <- c(2,7,8) 
q <- c("A", "B", "C") 
x <- list(p, q)

#Cual es el valor de x[2]?

x

x[2]
  
#a. NULL
#b. "A" "B" "C" #RESPUESTA
#c. "7"


#Ejercicio 2.

#Si

w <- c(2, 7, 8)
v <- c("A", "B", "C")
x <- list(w, v)

#Como reemplazaría “A” en x con “K”

x

x[[2]][1] <- "K"

#Ejercicio 3.

#Si

a <- list ("x"=5, "y"=10, "z"=15)

a
#Que escribiría para la suma de todos los elementos en a?
  
sum(unlist(a))

#Ejercicio 4.

#Si

Newlist <- list(a=1:10, b="Good morning", c="Hi")

Newlist

Newlist$a <- Newlist$a +1

Newlist


#Ejercicio 5.


#Si

b <- list(a=1:10, c="Hello", d="AA")


#Escriba una expresión en R que contenga todos los elementos, exceptuando el segundo del primer vector de b.


b$a[-2]


#Ejercicio 6.

#Si

x <- list(a=5:10, c="Hello", d="AA")

#Escriba una declaración en R para agregar un nuevo item, z = “NewItem” en la lista x.


x$z <- "NewItem"

x

#Ejercicio 7.

#Considere lo siguiente:
  
y <- list("a", "b", "c")

names(y) <- c("one", "two","three")

y

#Ejercicio 8.

#Si

x <- list(y=1:10, t="Hello", f="TT", r=5:20)

#Escriba una declaración en R que muestre la longitud del vector r en x.


length(x$r)

#Tip:  Busque y utilice la función length(), adecuadamente.


#Ejercicio 9.

#Si

string <- "Grand Opening"


#Escriba una declaración en R que retorne la siguiente salida:
  
#[[1]]
#[1] "Grand"

#[[2]]
#[1] "Opening"

a <- strsplit(string," ")
a
list(a[[1]][1], a[[1]][2])


#Tip:  Busque la función strsplit() para efectuar el ejercicio.


#Ejercicio 10.

#Si

y <- list("a", "b", "c") 
q <- list("A", "B", "C", "a", "b", "c")

#Escriba una declaración que retorne todos los elementos de q, que no estén en y, con el resultado siguiente:
  
#[[1]]
#[1] "A"

#[[2]]
#[1] "B"

#[[3]]
#[1] "C"


setdiff(q, y)


#Tip: Utilice la funcion setdiff() para la solución.


