#Indexando

#R proporciona una forma poderosa y conveniente de indexar vectores. Podemos, por ejemplo, subconjuntar un vector basado en las propiedades de otro vector. En esta sección, continuamos trabajando con nuestro ejemplo de asesinatos en EE. UU., Que podemos cargar así:

library(dslabs)
data("murders")

#Subconjunto con lógicas
#Ahora hemos calculado la tasa de asesinatos usando:

murder_rate <- murders$total / murders$population * 100000 


#Imagine que se muda de Italia donde, según un informe de noticias de ABC, la tasa de asesinatos es de solo 0.71 por 100,000. Preferiría mudarse a un estado con una tasa de homicidios similar. Otra característica poderosa de R es que podemos usar lógicas para indexar vectores. Si comparamos un vector con un solo número, en realidad realiza la prueba para cada entrada. El siguiente es un ejemplo relacionado con la pregunta anterior:

ind <- murder_rate < 0.71

ind

#Si, en cambio, queremos saber si un valor es menor o igual, podemos usar:

ind <- murder_rate <= 0.71
ind

#Tenga en cuenta que recuperamos un vector lógico con VERDADERO para cada entrada menor o igual a 0.71. Para ver qué estados son estos, podemos aprovechar el hecho de que los vectores pueden indexarse con lógicamente.

murders$state[ind]


#Para contar cuántos son VERDADEROS, la suma de funciones devuelve la suma de las entradas de un vector y los vectores lógicos se convierten en numéricos con VERDADERO codificado como 1 y FALSO como 0. Por lo tanto, podemos contar los estados usando:

sum(ind)

#Operadores Logicos

#Supongamos que nos gustan las montañas y queremos mudarnos a un estado seguro en la región occidental del país. Queremos que la tasa de asesinatos sea como máximo 1. En este caso, queremos que dos cosas diferentes sean ciertas. Aquí podemos usar el operador lógico y, que en R se representa con &. Esta operación da como resultado VERDADERO solo cuando ambas lógicas son VERDADERAS. Para ver esto, considere este ejemplo:

TRUE & TRUE
TRUE & FALSE
FALSE & FALSE

#Para nuestro ejemplo, podemos formar dos lógicas:

west <- murders$region == "West"
safe <- murder_rate <= 1


#y podemos usar el & para obtener un vector de lógicas que nos dice qué estados satisfacen ambas condiciones:

ind <- safe & west

murders$state[ind]


#Funcion which

#Supongamos que queremos ver la tasa de homicidios de California. Para este tipo de operación, es conveniente convertir vectores de lógicos en índices en lugar de mantener largos vectores de lógicos. La función que nos dice qué entradas de un vector lógico son VERDADERAS. Entonces podemos escribir:

ind <- which(murders$state == "California")
murder_rate[ind]

#Funcion match

#Si en lugar de un solo estado queremos averiguar las tasas de homicidio de varios estados, digamos Nueva York, Florida y Texas, podemos usar la función de coincidencia. Esta función nos dice qué índices de un segundo vector coinciden con cada una de las entradas de un primer vector:

ind <- match(c("New York", "Florida", "Texas"), murders$state)
ind

#Ahora podemos ver las tasas de asesinatos:

murder_rate[ind]


#Funcion %in%

#Si en lugar de un índice queremos una lógica que nos diga si cada elemento de un primer vector está en un segundo, podemos usar la función %in%. Imaginemos que no está seguro de si Boston, Dakota y Washington son estados. Puedes averiguar así:

c("Boston", "Dakota", "Washington") %in% murders$state

#Tenga en cuenta que usaremos %in% a menudo en todo el curso.

#Avanzado: hay una conexión entre coincidencias e %in%. Para ver esto, observe que las siguientes dos líneas producen el mismo índice (aunque en orden diferente):


match(c("New York", "Florida", "Texas"), murders$state)


which(murders$state%in%c("New York", "Florida", "Texas"))

