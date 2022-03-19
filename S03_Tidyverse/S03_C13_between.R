#S03_C13_between
#between


#Una operación común en el análisis de datos es determinar si un valor cae dentro de un intervalo. Podemos verificar esto usando condicionales. Por ejemplo, para verificar si los elementos de un vector x están entre a y b, podemos escribir

#x >= a & x <= b

#Sin embargo, esto puede volverse engorroso, especialmente dentro del enfoque tidyverse. La función between realiza la misma operación.


#between(x, a, b)


