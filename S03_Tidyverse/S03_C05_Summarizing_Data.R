#S03_C05_Summarizing_Data
#Resumiendo los datos

#Una parte importante del análisis exploratorio de datos es resumir los datos. 

#El promedio y la desviación estándar son dos ejemplos de estadísticas de resumen ampliamente utilizadas. 

#A menudo se pueden obtener resúmenes más informativos dividiendo primero los datos en grupos. 

#En esta sección, cubrimos dos nuevos verbos dplyr que facilitan estos cálculos: summarize() y group_by(). Aprendemos a acceder a los valores resultantes utilizando la función pull().


#Funcion summarize()

#La función de resumen en dplyr proporciona una forma de calcular estadísticas de resumen con código intuitivo y legible. Comenzamos con un ejemplo simple basado en alturas. El conjunto de datos de alturas incluye las alturas y el sexo reportados por los estudiantes en una encuesta en clase.

library(dplyr)
library(dslabs)
data(heights)

#El siguiente código calcula el promedio y la desviación estándar para las mujeres:

s <- heights %>% 
  filter(sex == "Female") %>%
  summarize(promedio = mean(height), desviacion_standard = sd(height))
s



#Esto toma nuestra tabla de datos original como entrada, la filtra para mantener solo a las mujeres y luego produce una nueva tabla resumida con solo el promedio y la desviación estándar de las alturas. Podemos elegir los nombres de las columnas de la tabla resultante. Por ejemplo, arriba decidimos usar el promedio y la desviación estándar, pero podríamos haber usado otros nombres de la misma manera.

#Debido a que la tabla resultante almacenada en s es un dataframe, podemos acceder a los componentes con el descriptor de acceso $:

s$promedio
s$desviacion_standard


#Al igual que con la mayoría de las otras funciones de dplyr, summary es consciente de los nombres de las variables y podemos usarlas directamente. Entonces, dentro de la llamada a la función de resumen, escribimos media (altura), la función accede a la columna con el nombre "altura" y luego calcula el promedio del vector numérico resultante. Podemos calcular cualquier otro resumen que opera en vectores y devuelve un solo valor. Por ejemplo, podemos agregar las alturas mediana, mínima y máxima de esta manera:


heights %>% 
  filter(sex == "Female") %>%
  summarize(median = median(height), minimum = min(height), maximum = max(height))


#Podemos obtener estos tres valores con una sola línea utilizando la función de cuantiles: por ejemplo, cuantil (x, c (0,0.5,1)) devuelve el mínimo (percentil 0), la mediana (percentil 50) y el máximo (percentil 100 ) del vector x. Sin embargo, si intentamos usar una función como esta que devuelve dos o más valores dentro de resumen:


heights %>% 
  filter(sex == "Female") %>%
  summarize(range = quantile(height, c(0, 0.5, 1)))

#recibiremos un error: Error: esperando el resultado de la longitud uno, obtuve: 2. Con el resumen de la función, solo podemos llamar a las funciones que devuelven un solo valor.

#Para otro ejemplo de cómo podemos usar la función summarize(), calculemos la tasa promedio de asesinatos en los Estados Unidos. Recuerde que nuestra tabla de datos incluye asesinatos totales y el tamaño de la población para cada estado y ya hemos utilizado dplyr para agregar una columna de índice de asesinatos:

data(murders)
murders <- murders %>% mutate(rate = total/population*10^5)


#Recuerde que la tasa de asesinatos en los Estados Unidos no es el promedio de las tasas de asesinatos estatales:

summarize(murders, mean(rate))

#Esto se debe a que en el cálculo anterior, los estados pequeños tienen el mismo peso que los grandes. La tasa de homicidios en los Estados Unidos es el número total de asesinatos en los Estados Unidos dividido por la población total de los Estados Unidos,entonces el cálculo correcto es:

us_murder_rate <- murders %>%
  summarize(rate = sum(total) / sum(population) * 10^5)

us_murder_rate

#Este cálculo cuenta estados más grandes proporcionalmente a su tamaño, lo que da como resultado un valor mayor.



#PULL

#El objeto us_murder_rate definido anteriormente representa solo un número. Sin embargo, lo estamos almacenando en un dataframe:

class(us_murder_rate)


#dado que, como la mayoría de las funciones de dplyr, summarize siempre devolverá un dataframe.

#Esto podría ser problemático si queremos usar este resultado con funciones que requieren un valor numérico. Aquí mostramos un truco útil para acceder a los valores almacenados en los datos cuando se usan tuberías: cuando un objeto de datos se canaliza a ese objeto y se puede acceder a sus columnas usando la función pull(). Para entender lo que queremos decir, eche un vistazo a esta línea de código:

us_murder_rate %>% pull(rate)


#Esto devuelve el valor en la columna de tasa de us_murder_rate, por lo que es equivalente a us_murder_rate $ rate.

#Para obtener un número de la tabla de datos original con una línea de código, podemos escribir:

us_murder_rate <- murders %>% 
  summarize(rate = sum(total) / sum(population) * 10^5) %>%
  pull(rate)

us_murder_rate


#que ahora es numérico:

class(us_murder_rate)

#Agrupar los resumenes con group_by

#Una operación común en la exploración de datos es dividir primero los datos en grupos y luego calcular resúmenes para cada grupo. Por ejemplo, es posible que queramos calcular la desviación promedio y estándar para las alturas de hombres y mujeres por separado. La función group_by nos ayuda a hacer esto.

#Si escribimos esto:

heights %>% group_by(sex)


#El resultado no se ve muy diferente de las alturas, excepto que vemos Grupos: sexo  cuando imprimimos el objeto. Aunque no es inmediatamente obvio por su apariencia, ahora es un dataframe especial llamado dataframe agrupado y las funciones de dplyr, en particular, se comportarán de manera diferente cuando actúen sobre este objeto.

#Conceptualmente, puede pensar en esta tabla como muchas tablas, con las mismas columnas pero no necesariamente el mismo número de filas, apiladas juntas en un objeto. Cuando resumimos los datos después de la agrupación, esto es lo que sucede:

heights %>% 
  group_by(sex) %>%
  summarize(average = mean(height), standard_deviation = sd(height))

#La función summarize() aplica el resumen a cada grupo por separado.

#Para otro ejemplo, calculemos la tasa media de asesinatos en las cuatro regiones del país:

murders %>% 
  group_by(region) %>%
  summarize(median_rate = median(rate))



