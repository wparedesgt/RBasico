#S03_C10_do
#do

#Las funciones tidyverse saben interpretar tibbles agrupados. 

#Además, para facilitar los comandos de encadenamiento a través de la tubería%>%, las funciones tidyverse devuelven constantemente los dataframes, ya que esto asegura que la salida de una función sea aceptada como la entrada de otra. 

#Pero la mayoría de las funciones R no reconocen los tibbles agrupados ni devuelven dataframes.

#La función cuantil es un ejemplo que describimos.

#Las funciones do sirven como puente entre las funciones R, como el cuantil y el tidyverse. La función do comprende tibbles agrupados y siempre devuelve un dataframe.

#En la Sección anterior, notamos que si intentamos usar el cuantil para obtener el mínimo, la mediana y el máximo en una llamada, recibiremos un error: Error: esperando el resultado de la longitud uno, obtuve: 2.

data(heights)
heights %>% 
  filter(sex == "Female") %>%
  summarize(range = quantile(height, c(0, 0.5, 1)))

#Podemos usar la función do para solucionar esto.

#Primero tenemos que escribir una función que se ajuste al enfoque tidyverse: es decir, recibe un dataframe y devuelve un dataframe.

my_summary <- function(dat){
  x <- quantile(dat$height, c(0, 0.5, 1))
  tibble(min = x[1], median = x[2], max = x[3])
}


#Ahora podemos aplicar la función al conjunto de datos de alturas para obtener los resúmenes:


heights %>% 
  group_by(sex) %>% 
  my_summary

  
#Pero esto no es lo que queremos. Queremos un resumen para cada sexo y el código devolvió solo un resumen. Esto se debe a que my_summary no es parte del tidyverse y no sabe cómo manejar los tibbles agrupados. hacer hace esta conexión:

heights %>% 
  group_by(sex) %>% 
  do(my_summary(.))

#Tenga en cuenta que aquí necesitamos usar el operador de punto".". El tibble creado por group_by se canaliza. Dentro de la llamada a hacer, el nombre de este tibble es "." y queremos enviarlo a my_summary. Si no usa el punto, my_summary no tiene ningún argumento y devuelve un error que nos dice que falta el argumento "dat". Puede ver el error escribiendo:

heights %>% 
  group_by(sex) %>% 
  do(my_summary())

#Si no utiliza el paréntesis, la función no se ejecuta y, en cambio, sí intenta devolver la función. Esto da un error porque do siempre debe devolver un dataframe. Puede ver el error escribiendo:

heights %>% 
  group_by(sex) %>% 
  do(my_summary)
