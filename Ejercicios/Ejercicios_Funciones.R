#Ejercicios Funciones

#Ejercicio 1

#Cree una función que calcula el factorial de un número con la ayuda de la función reduce().

Reduce('*', as.numeric(6:1))


factorial_reduce <- function(n){
  stopifnot( n>=0)
  
  if(n==0){
    return(1)
  }
  else{
    
    Reduce('*',as.numeric(n:1))
  }
  
}


factorial_reduce(6)


#Ejercicio 2

#Cree una función llamada cum_add que haga una suma acumulada, por ejemplo, si x <- 1: 3 cum_add (x) resultará en 1 3 6 .Sin usar la función cumsum().


cum_add <- function(x) Reduce("+", x, accumulate = TRUE)

cum_add(1:5)

#Ejercicio 4

#Cree una función que tome un data frame y devuelva la media, el mínimo y el máximo de todas las columnas numéricas. Su función debe tomar un dataframe como entrada, por ejemplo, su_funcion(iris)

#.Trate de evitar los loops, es posible hacerlo en una sola línea.

answer4 <- function(df){
  Map(function(x){list("min" = min(x),"max"=max(x),"avg"= mean(x))},
  Filter(function(x)is.numeric(x),df))}

data("iris")

promedio <- answer4(iris)

promedio

#Ejercicio 4

#Cree una función centerColumnAroundMean que tome un dataframe numérico y manipule el mismo de tal manera que todos los valores de la columna estén centrados con el valor promedio de la columna. 

#Por ejemplo, si mi dataframe es como este

df <- data.frame (x = 1: 5, y = 6: 10, c = 11: 15)

#luego de  centerColumnAroundMean (df) resultará en:
  
#  x  y  c
#1 -2 -2 -2
#2 -1 -1 -1
#3  0  0  0
#4  1  1  1
#5  2  2  2


mm <- data.frame(x= 1:5,y=6:10,c=11:15)

sweep(mm,2,colMeans(mm),"-")

centerColumnArounMean <- function(df) {
  
  sweep(df,2,colMeans(df),"-")
}

centerColumnArounMean(mm)

#Ejercicio 5


#Tengo una lista de películas, que tienen dos franquicias como los elementos, Starwars y LOTR. Puede crear la lista de películas mediante:
  
#my_movie_list<- list(STARWARS= list("A NEW HOPE","The Last Jedi","The Force Awakens"),LOTR=list("THE FELLOWSHIP OF THE RING","THE Two Towers","The RETURN of the KING","Hobbit" = list("An unexpected Journey","The Battle of the FIVE ARMY","The Desolation of Smaug") ))

#Ahora el problema:  algunos de los textos están en mayúsculas y otros en minúsculas, está es una pequeño ejercicio creado como entrada para cuando nos toque ver el domado de datos, los anteriores están sin ningún orden en particular. 

#Su solucion: Me gustaría que la lista tuviera un formato como

#“The Last Jedi”

#Escriba una función que haga esto.

#. Tenga en cuenta que la lista es una lista anidada (nested list).



my_movielist <-  list(star_wars= list("A NEW HOPE","The Last Jedi","The Force Awakens"),LOTR=list("THE FELLOWSHIP OF THE RING","THE Two Towers","The RETURN of the KING","Hobbit" = list("An unexpected Journey","The Battle of the FIVE ARMY","The Desolation of Smaug") ))

helper_fncs <- function(x){
  x <- strsplit(x," ")[[1]]
  paste0(toupper(substring(x,1,1)),tolower(substring(x,2,)),collapse = " ")
}

rapply(my_movielist,helper_fncs,how = "replace")


## $star_wars
## $star_wars[[1]]
## [1] "A New Hope"
## 
## $star_wars[[2]]
## [1] "The Last Jedi"
## 
## $star_wars[[3]]
## [1] "The Force Awakens"
## 
## 
## $LOTR
## $LOTR[[1]]
## [1] "The Fellowship Of The Ring"
## 
## $LOTR[[2]]
## [1] "The Two Towers"
## 
## $LOTR[[3]]
## [1] "The Return Of The King"
## 
## $LOTR$Hobbit
## $LOTR$Hobbit[[1]]
## [1] "An Unexpected Journey"
## 
## $LOTR$Hobbit[[2]]
## [1] "The Battle Of The Five Army"
## 
## $LOTR$Hobbit[[3]]
## [1] "The Desolation Of Smaug"

## 


#Ejercicio 6

#Cargue el conjunto de datos diamonds del paquete ggplot 2. Para ello primero carguemos la librería tidyverse en la cual ya esta incluida la de ggplot.

#Quiero comprar un diamante de cada color pero no quiero pagar el precio más alto, creo que el segundo precio más alto es lo suficientemente bueno para mí. Escribamos una función para encontrar el segundo precio más alto para cada color del conjunto de datos.


library(tidyverse)

dataset <- diamonds
helper_function <-  function(x){
  max(x[x < max(x)])
}


aggregate(dataset$price,by = dataset["color"],FUN = helper_function)

##   color     x
## 1     D 18674
## 2     E 18729
## 3     F 18784
## 4     G 18806
## 5     H 18795
## 6     I 18797
## 7     J 18706


#Ejercicio 7

#Utilice el conjunto de datos de diamons ya cargados del ejercicio anterior. Quiero saber el precio promedio de cada combinación de corte y color. Su salida debería ser similar a la siguiente. No use la función table().


dataset <- diamonds
tapply(dataset$price,list(dataset$cut,dataset$color),mean)

##                  D        E        F        G        H        I        J
## Fair      4291.061 3682.312 3827.003 4239.255 5135.683 4685.446 4975.655
## Good      3405.382 3423.644 3495.750 4123.482 4276.255 5078.533 4574.173
## Very Good 3470.467 3214.652 3778.820 3872.754 4535.390 5255.880 5103.513
## Premium   3631.293 3538.914 4324.890 4500.742 5216.707 5946.181 6294.592
## Ideal     2629.095 2597.550 3374.939 3720.706 3889.335 4451.970 4918.186


#Ejercicio 8

#Cargue el conjunto de datos del iris, quiero obtener la tercera fila para cada grupo de especies. 
#Escriba una función corta para que realice eso.

aggregate(iris,iris["Species"],"[[",3)

data_iris_function <- function(df) {
  
  aggregate(df,df["Species"],"[[",3)
  
}


data_iris_function(iris)


##      Species Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
## 1     setosa          4.7         3.2          1.3         0.2     setosa
## 2 versicolor          6.9         3.1          4.9         1.5 versicolor
## 3  virginica          7.1         3.0          5.9         2.1  virginica


#Ejercicio 9

#Cree un nuevo entorno con el comando new.env () y cree 3 variables vectoriales bajo ese entorno como a = 1: 10; b = 100: 500; c = 1000: 1500 sin saber o llamar manualmente la media para todas las variables vectoriales,  imprima el promedio de todas las variables del nuevo entorno.


m <- new.env()
m$a = 1:10
m$b = 100:500
m$c = 1000:1500
eapply(m,mean)


## $a
## [1] 5.5
## 
## $b
## [1] 300
## 
## $c
## [1] 1250

