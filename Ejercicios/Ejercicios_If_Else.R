#Ejercicio If Else

#Ejercicio 1

#Cual es la salida en su R del siguiente código:
  
ifelse(sqrt(9)<2,sqrt(9),0)


#Ejercicio 2

#Cual es la salida de R en el siguiente código:
  
ifelse(sqrt(100)>9,sqrt(100),0)


#Ejercicio 3

#Cual es la salida de y en:
  
x  <- 12
if(is.numeric(x)) y = x *2

y

#Ejercicio 4

#Cual es la salida de x,y en:

z <- -1
if(z<0){x=abs(z)
y=z*3
}

x
y

#Ejercicio 5

#Cual es la salida de y en:
  
z <- 6

if(z<0) y=z*3  else y=z*5

z


#Ejercicio 6

#Cual es la salida de z en:

x <- 15
y <-  3

if(is.numeric(x))
  if(is.numeric(y) & y!=0)
    z=x/y


#Ejercicio 7

#Cual es la salida de:


x <- letters[20]
if (is.numeric(x)) print('es numerico') else
  if(is.character(x)) print('es caracter')

#Ejercicio 8

#Cual es la salida de:

x <- 90
ifelse(x<100,ifelse(x/2==trunc(x/2),x/2,0),
       ifelse(x/100==trunc(x/100),x/100,-1))

x <- 120
ifelse(x<100,ifelse(x/2==trunc(x/2),x/2,0),
       ifelse(x/100==trunc(x/100),x/100,-1))

x <- 200
ifelse(x<100,ifelse(x/2==trunc(x/2),x/2,0),
       ifelse(x/100==trunc(x/100),x/100,-1))

#Ejercicio 9

#Cual es la salida de:


z <- 'i'
if (z %in% letters)
  if (z=='a') n=1 else
    if (z=='e') n=2 else
      if (z=='i') n=3 else
        if (z=='o') n=4 else n=5

n


#Ejercicio 10

#Cual es la salida de n en:

z='u'
if (z %in% letters)
  if (z=='a') n=1 else
    if (z=='e') n=2 else
      if (z=='i') n=3 else
        if (z=='o') n=4 else n=5
n
