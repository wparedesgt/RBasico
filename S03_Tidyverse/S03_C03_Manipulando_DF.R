#S03_C03_Manipulando_DataFrames
#Manipulando Data Frames



#El paquete dplyr del tidyverse presenta funciones que realizan algunas de las operaciones más comunes cuando se trabaja con dataframes y usa nombres para estas funciones que son relativamente fáciles de recordar. 

#Por ejemplo, para cambiar la tabla de datos agregando una nueva columna, usamos mutate().

#Para filtrar la tabla de datos a un subconjunto de filas, usamos filter(). 

#Finalmente, para subdividir los datos seleccionando columnas específicas, usamos select.

#Agregando una columna con la funcion mutate().

#Queremos que toda la información necesaria para nuestro análisis se incluya en la tabla de datos. 

#Entonces, la primera tarea es agregar las tasas de asesinatos a nuestro dataframe.

#La función mutate() toma el dataframe como primer argumento y el nombre y los valores de la variable como segundo argumento usando la convención nombre = valores. Entonces, para agregar tasas de asesinatos, usamos:

library(tidyverse)
library(dslabs)
data("murders")

murders <- mutate(murders, rate = total/population * 10^5)

#Observe que aquí usamos total y población dentro de la función, que son objetos que no están definidos en nuestro espacio de trabajo. Pero, ¿por qué no recibimos un error?
  
# Esta es una de las principales características de dplyr. Las funciones en este paquete, como mutate, saben buscar variables en el dataframe proporcionado en el primer argumento. En la llamada a mutate() anterior, total tendrá los valores en murders$total. Este enfoque hace que el código sea mucho más legible.

#Podemos ver que se agrega la nueva columna:

head(murders)


#Aunque hemos sobrescrito el objeto de asesinatos original, esto no cambia el objeto que se cargó con datos (murders). Si volvemos a cargar los datos murders, el original sobrescribirá nuestra versión mutada.


#Subsetings con la funcion filter()


#Ahora suponga que queremos filtrar la tabla de datos para mostrar solo las entradas para las cuales la tasa de homicidios es inferior a 0,71. 

#Para hacer esto, utilizamos la función filter(), que toma la tabla de datos como el primer argumento y luego la declaración condicional como el segundo. Al igual que mutate(), podemos usar los nombres de variables sin comillas de murders dentro de la función y sabrá que nos referimos a las columnas y no a los objetos en el espacio de trabajo.

filter(murders, rate <= 0.71)


#Seleccionando las columnas con la funcion select().

#Aunque nuestra tabla de datos solo tiene seis columnas, algunas tablas de datos incluyen cientos. Si queremos ver algunas, podemos usar la función dplyr select. En el siguiente código seleccionamos tres columnas, asignamos esto a un nuevo objeto y luego filtramos el nuevo objeto:

new_table <- select(murders, state, region, rate)
filter(new_table, rate <= 0.71)


#En la llamada a select(), el primer argumento de murders es un objeto en este caso un dataframe, pero estado, región y tasa son nombres de variables.

