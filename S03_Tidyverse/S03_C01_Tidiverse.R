#S03_C01_Tidiverse
#Tidiverse

#Hasta ahora hemos estado manipulando vectores reordenándolos y subconjuntándolos mediante indexación. Sin embargo, una vez que comenzamos los análisis más avanzados, la unidad preferida para el almacenamiento de datos no es el vector sino el dataframe. 

#En este capítulo aprendemos a trabajar directamente con dataframes, lo que facilita enormemente la organización de la información. Utilizaremos dataframes para la mayoría de este libro. Nos centraremos en un formato de datos específico denominado ordenado o (tidy) y en una colección específica de paquetes que son particularmente útiles para trabajar con datos ordenados (tidy) denominados tidyverse.

#Podemos cargar todos los paquetes tidyverse a la vez instalando y cargando el paquete tidyverse:
  
library(tidyverse)


#Aprenderemos cómo implementar el enfoque tidyverse a lo largo del curso, pero antes de profundizar en los detalles, en este capítulo presentaremos algunas de las funcionalidades tidyverse más utilizadas. 

#Comenzando con el paquete dplyr para manipular marcos de datos y el paquete purrr para trabajar con funciones. Tenga en cuenta que tidyverse también incluye un paquete de gráficos, ggplot2, que presentamos más adelante en la parte de Visualización de datos. Primero presentamos el concepto de datos ordenados (Tidy) y luego demostramos cómo usamos el tidyverse para trabajar con dataframes en este formato.