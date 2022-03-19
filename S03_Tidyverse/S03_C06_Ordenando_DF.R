#S03_C06_Ordenando_Dataframes
#Ordenando Data Frames

#Al examinar un conjunto de datos, a menudo es conveniente ordenar la tabla por las diferentes columnas. Sabemos acerca de la función order() y sort(), pero para ordenar tablas enteras, la función de dplyr arrange() es útil. Por ejemplo, aquí ordenamos los estados por tamaño de población:

murders %>%
  arrange(population) %>%
  head()

#Con la funcion arrange() podemos decidir por qué columna ordenar. Para ver los estados por población, de menor a mayor, organizamos por rate:

murders %>% 
  arrange(rate) %>% 
  head()


#Tenga en cuenta que el comportamiento predeterminado es ordenar en orden ascendente. En dplyr, la función desc() transforma un vector para que esté en orden descendente. Para ordenar la tabla en orden descendente, podemos escribir:


murders %>% arrange(desc(rate)) %>% head()
