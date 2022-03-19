#S03_C07_Clasificacion_Anidada
#Clasificacion Anidada

#Si estamos ordenando por una columna con ligaduras, podemos usar una segunda columna para romper la ligadura. Del mismo modo, se puede usar una tercera columna para romper los lazos entre la primera y la segunda, y así sucesivamente. Aquí ordenamos por región, luego dentro de la región ordenamos por índice de asesinatos:

murders %>% 
  arrange(region, desc(rate)) %>% 
  head()

#Top de N

#En el código anterior, hemos utilizado la funcion head() para evitar que la página se llene con todo el conjunto de datos. Si queremos ver una proporción mayor, podemos usar la función top_n. Esta función toma un dataframe como primer argumento, el número de filas para mostrar en el segundo y la variable para filtrar en el tercero. Aquí hay un ejemplo de cómo ver las 10 filas superiores:

murders %>% top_n(10, rate)

