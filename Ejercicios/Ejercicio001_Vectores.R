#Ejercicios Vectores

#Ejercicio 1.

#Considere el siguiente vector:

x <- c(4,6,5,7,10,9,4,15)

#Cual es el valor de:
  
c(4,6,5,7,10,9,4,15) < 7

#a. TRUE, FALSE, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE

#b. TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE #Este Es

#c. FALSE, TRUE, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE

#d. TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, FALSE

#e. TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE


#Ejercicio 2.

#Considere 2 vectores “p” y “q”:
  
p <- c (3, 5, 6, 8)
q <- c (3, 3, 3)

#Cual es el valor de p+q?
 
p+q
 
#a. 6, 8, 6, 8

#b. 6, 8, 0, 0

#c. 6, 8, NA, NA

#d. 3, 5, 6, 8 

#e. 6, 8, 9, 11 Warning message: In p+q : longer object length is not a multiple of shorter object length #WP


#Ejercicio 3.

#Si:
  
Age <- c(22, 25, 18, 20)
Name <- c("James", "Mathew", "Olivia", "Stella")
Gender <- c("M", "M", "F", "F")

#Cual es el código que usaría en R para la siguiente salida:
  
  ##   Age   Name Gender
  ## 1  22  James      M
  ## 2  25 Mathew      M
#  a. #WP
#DataFrame = data.frame(c(Age), c(Name), c(Gender))
#subset(DataFrame, Gender == "M")

#b.
#DataFrame = data.frame(c(Age),c(Name),c(Gender))
#subset(Gender=="M"), eval=FALSE 

#c.
DataFrame = data.frame(Age,Name,Gender)
subset(DataFrame,Gender=="M")

#d.
DataFrame = data.frame(c(Age,Name,Gender))
subset(DataFrame,Gender=="M")

#Ejercicio 4.

#Si
z <- 0:9

#entonces, ¿cuál es el resultado de las siguientes declaraciones R:
  
digits <- as.character(z)
as.integer(digits)

#a. Error in subset. object 'z' not found

#b. 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 #WP

#c. "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA"

#d. "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"

#e. 0, 0, 0, 0, 0, 0, 0, 0, 0


#Ejercicio 5.

#Considere el vector:
  
x <- c(1,2,3,4)

#Cual es el valor de K para:
  
(x+2)[(!is.na(x)) & x > 0] -> k

k

#a. 1, 2, 3, 4

#b. 1, 4, 9, 16

#c. Error: object 'k' not found

#d. 3, 4, 5, 6 #WP

#e. numeric(0)


#Ejercicio 6.

#Considere el data set AirPassenger incluido en R por defecto.

data(AirPassengers)

#Cual declaración producirá la siguiente salida?
  
  ##  [1] 112 118 132 129 121 135 148 148 136 119 104 118
  
  
AirPassengers[time(AirPassengers) >= 1949 & time(AirPassengers) < 1950, 12]

AirPassengers[AirPassengers >= 1949 & AirPassengers < 1950]

AirPassengers[time(AirPassengers) >= 1949 & time(AirPassengers) < 1950] #WP

AirPassengers[AirPassengers >= 1949 & AirPassengers < 1950, 12]

c[[1]]

#Ejercicio 7.

#Si

x <- c(2, 4, 6, 8)

#y ademas

y <- c(TRUE, TRUE, FALSE, TRUE)

#Cual es el valor del siguiente enunciado?
  
sum(x[y])

#a. 20

#b. 8

#c. 14 #WP

#d. NA

#Ejercicio No. 8

#Considere el siguiente vector:
  
x <- c(34, 56, 55, 87, NA, 4, 77, NA, 21, NA, 39)

#¿Qué enunciado R contará el número de valores de NA en x?
  
  
count(is.na(X))

length(is.na(x))

sum(is.na(x)) #WP

count(!is.na(x))

sum(!is.na(x))
