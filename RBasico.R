#Clase 03 Ministerio de Gobernacion


#Estructuras de datos R

#Existen numerosos tipos de estructuras de datos en todos los lenguajes de programación, cada uno Con fortalezas y debilidades adecuadas para tareas particulares. Dado que R es una programación lenguaje utilizado ampliamente para el análisis de datos estadísticos, las estructuras de datos que utiliza fueron Diseñado con este tipo de trabajo en mente.

#Las estructuras de datos R utilizadas con mayor frecuencia en el aprendizaje automático son vectores, Factores, listas, matrices y marcos de datos. Cada uno se adapta a un determinado tarea de gestión de datos, lo que hace que sea importante entender cómo lo harán interactuar en tu proyecto R En las siguientes secciones, revisaremos sus similitudes y las diferencias.


#Vectores
#La estructura de datos R fundamental es el vector, que almacena un conjunto ordenado de valores llamados elementos. Un vector puede contener cualquier número de elementos, pero todos los elementos deben ser del mismo tipo de valores. Por ejemplo, un vector no puede contener números y texto. Para determinar el tipo de vector v, use el comando typeof(v).

#Varios tipos de vectores se utilizan comúnmente en el aprendizaje automático: enteros (números sin decimales), dobles (números con decimales), caracteres (datos de texto) y lógicos (valores VERDADEROS o FALSOS). También hay dos valores especiales: NULL, que se utiliza para indicar la ausencia de cualquier valor, y NA, que indica un valor faltante.

#Es tedioso ingresar grandes cantidades de dat```os manualmente, pero se pueden crear pequeños vectores usando la función de combinación c (). También se le puede dar un nombre al vector mediante el operador de flecha <, que es la forma en que R asigna valores, al igual que el operador de asignación = se usa en muchos otros lenguajes de programación.


#Por ejemplo, construyamos varios vectores para almacenar los datos de diagnóstico de tres pacientes médicos. Crearemos un vector de caracteres llamado subject_name para almacenar los tres nombres de los pacientes, un vector doble llamado temperatura para almacenar la temperatura corporal de cada paciente y un vector lógico llamado flu_status para almacenar el diagnóstico de cada paciente (VERDADERO si tiene influenza, FALSO de lo contrario) ). Echemos un vistazo al siguiente código para crear estos tres vectores:

subject_name <- c("John Doe", "Jane Doe", "Steve Graves")
temperature <- c(98.1, 98.6, 101.4)
flu_status <- c(FALSE, FALSE, TRUE)


#Debido a que los vectores R están ordenados de forma inherente, se puede acceder a los registros contando el número del elemento en el conjunto, comenzando en uno y rodeando este número entre corchetes (es decir, [y]) después del nombre del vector. Por ejemplo, para obtener la temperatura corporal de la paciente Jane Doe (el segundo elemento en el vector de temperatura) simplemente escriba:
 
temperature[2]


#R ofrece una variedad de métodos convenientes para extraer datos de vectores. Se puede obtener un rango de valores utilizando el operador de colon (:). Por ejemplo, para obtener la temperatura corporal de Jane Doe y Steve Graves, escriba:

temperature[2:3]


#Los artículos se pueden excluir especificando un número de artículo negativo. Para excluir los datos de temperatura de Jane Doe, escriba:

temperature[-2]

temperatura2 <- temperature[-2]

#Finalmente, a veces también es útil especificar un vector lógico que indique si se debe incluir cada elemento. Por ejemplo, para incluir las dos primeras lecturas de temperatura pero excluir la tercera, escriba:

temperature[c(TRUE, TRUE, FALSE)]

#Como verá en breve, el vector pro`porciona la base para muchas otras estructuras de datos R. Por lo tanto, el conocimiento de las diversas operaciones vectoriales es crucial para trabajar con datos en R.


#Factores

#Un factor es un caso especial de vector que se usa únicamente para representar variables categóricas u ordinales. En el conjunto de datos médicos que estamos construyendo, podríamos usar un factor para representar el género, porque usa dos categorías: MASCULINO Y FEMENINO.

#¿Por qué no usar vectores? 

#Una ventaja de los factores es que las etiquetas de categoría se almacenan solo una vez. Por ejemplo, en lugar de almacenar MALE, MALE, FEMALE, la computadora puede almacenar 1, 1, 2, lo que reduce el tamaño de la memoria necesaria para almacenar la misma información. Además, muchos algoritmos de aprendizaje automático tratan los datos nominales y numéricos de manera diferente. La codificación como factores a menudo es necesaria para informar una función R para tratar los datos categóricos de manera adecuada.

#No se debe usar un factor para los vectores de caracteres que no son realmente categóricos. Si un vector almacena en su mayoría valores únicos como nombres o cadenas de identificación, manténgalo como un vector.
``

#Para crear un factor a partir de un vector de caracteres, simplemente aplique la función factor ().

#Por ejemplo:

gender <- factor(c("MALE", "FEMALE", "MALE"))

gender

#Observe que cuando se mostraron los datos de género de John Doe y Jane Doe, R imprimió información adicional sobre el factor de género. La variable de niveles comprende el conjunto de posibles categorías que el factor podría tomar, en este caso: MASCULINO, FEMENINO.

#Cuando creamos factores, podemos agregar niveles adicionales que pueden no aparecer en los datos. Supongamos que agregamos otro factor para el tipo de sangre, como se muestra en el siguiente ejemplo:

blood <- factor(c("O", "AB", "A"), levels = c("A", "B", "AB", "O"))

#Observe que cuando definimos el factor sanguíneo para los tres pacientes, especificamos un vector adicional de cuatro tipos de sangre posibles usando el parámetro de niveles. Como resultado, aunque nuestros datos solo incluyeron los tipos O, AB y A, los cuatro tipos se almacenan con el factor sanguíneo como lo indica la salida. Almacenar el nivel adicional permite la posibilidad de agregar datos con otros tipos de sangre en el futuro. También garantiza que si tuviéramos que crear una tabla de tipos de sangre, sabríamos que existe el tipo B, a pesar de que no se registra en nuestros datos.

#La estructura de datos de factores también nos permite incluir información sobre el orden de las categorías de una variable nominal, lo que proporciona una manera conveniente de almacenar datos ordinales.

#Por ejemplo, supongamos que tenemos datos sobre la gravedad de los síntomas de un paciente codificados en un nivel creciente de gravedad de leve a moderada a grave. Indicamos la presencia de datos ordinales al proporcionar los niveles del factor en el orden deseado, enumerados en orden ascendente de menor a mayor, y estableciendo el parámetro ordenado en VERDADERO, como se muestra:

symptoms <- factor(c("SEVERE", "MILD", "MODERATE"),levels = c("MILD", "MODERATE", "SEVERE"), ordered = TRUE)


#Una característica útil de los factores ordenados es que las pruebas lógicas funcionan como usted espera. Por ejemplo, podemos probar si los síntomas de cada paciente son más que moderados:


symptoms > "MODERATE"


#Los algoritmos de aprendizaje automático capaces de modelar datos ordinales esperarán los factores ordenados, así que asegúrese de codificar sus datos en consecuencia.


#Listas

#Una lista es una estructura de datos, muy parecida a un vector, en el sentido de que se utiliza para almacenar un conjunto ordenado de elementos. Sin embargo, cuando un vector requiere que todos sus elementos sean del mismo tipo, una lista permite recopilar diferentes tipos de elementos. Debido a esta flexibilidad, las listas se utilizan a menudo para almacenar diversos tipos de datos de entrada y salida y conjuntos de parámetros de configuración para modelos de aprendizaje automático.
``
#Para ilustrar listas, considere el conjunto de datos de pacientes médicos que hemos estado construyendo con los datos de tres pacientes almacenados en seis vectores. Si queremos mostrar todos los datos en John Doe (sujeto 1), deberíamos ingresar cinco comandos R:

subject_name[1]
temperature[1]
flu_status[1]
gender[1]
blood[1]
symptoms[1]


#Esto parece mucho trabajo para mostrar los datos médicos de un paciente. La estructura de la lista nos permite agrupar todos los datos del paciente en un objeto que podemos usar repetidamente.

#Similar a crear un vector con c (), una lista se crea utilizando la función list (), como se muestra en el siguiente ejemplo. Una diferencia notable es que cuando se construye una lista, a cada componente de la secuencia casi siempre se le asigna un nombre. Los nombres no son técnicamente necesarios, pero permiten acceder a los valores de la lista más adelante por nombre en lugar de por posición numerada. Para crear una lista con componentes con nombre para todos los datos del primer paciente, escriba lo siguiente:

subject1 <- list(fullname = subject_name[1], temperature = temperature[1], flu_status = flu_status[1],gender = gender[1],
                 blood = blood[1], symptoms = symptoms[1])


#Los datos de este paciente ahora se recopilan en la lista subject1:

#Tenga en cuenta que los valores están etiquetados con los nombres que especificamos en el comando anterior. Sin embargo, todavía se puede acceder a una lista utilizando métodos similares a un vector.

#Para acceder al valor de temperatura, use el siguiente comando:

subject1[2]


#El resultado de usar operadores de estilo vectorial en un objeto de lista es otro objeto de lista, que es un subconjunto de la lista original. Por ejemplo, el código anterior devolvió una lista con un solo componente de temperatura. Para devolver un solo elemento de la lista en su tipo de datos nativo, use corchetes dobles ([[y]]) cuando intente seleccionar el componente de la lista. Por ejemplo, lo siguiente devuelve un vector numérico de longitud uno:

subject1[[2]]

#Para mayor claridad, a menudo es más fácil acceder a los componentes de la lista directamente, agregando $ y el nombre del valor al nombre del componente de la lista, de la siguiente manera:

subject1$temperature

#Al igual que la notación de doble corchete, esto devuelve el componente de lista en su tipo de datos nativos (en este caso, un vector numérico de longitud uno).

#El acceso al valor por nombre también garantiza que se recupere el elemento correcto, incluso si el orden de los elementos de la lista se modifica más adelante.

#Es posible obtener varios elementos en una lista especificando un vector de nombres. Lo siguiente devuelve un subconjunto de la lista del sujeto 1, que contiene solo los componentes de temperatura y estado de la gripe:

subject1[c("temperature", "flu_status")]


#Conjuntos de datos completos se podrían construir utilizando listas y listas de listas. Por ejemplo, podría considerar crear una lista subject2 y subject3, y combinarlas en un solo objeto de lista llamado pt_data.

#Sin embargo, la construcción de un conjunto de datos de esta manera es lo suficientemente común como para que R proporcione una estructura de datos especializada específicamente para esta tarea.


#Data Frames

#Por mucho, la estructura de datos R más importante utilizada en el aprendizaje automático es el marco de datos, una estructura análoga a una hoja de cálculo o una base de datos, ya que tiene filas y columnas de datos. En términos de R, un marco de datos puede entenderse como una lista de vectores o factores, cada uno con exactamente el mismo número de valores. Debido a que el marco de datos es literalmente una lista de objetos de tipo vectorial, combina aspectos de ambos vectores y listas.

#Vamos a crear un marco de datos para nuestro conjunto de datos de pacientes. Usando los vectores de datos del paciente que creamos anteriormente, la función data.frame() los combina en un marco de datos:

pt_data <- data.frame(subject_name, temperature, flu_status, gender, blood, symptoms, stringsAsFactors = FALSE)


#Es posible que note algo nuevo en el código anterior. Incluimos un parámetro adicional: stringsAsFactors = FALSE. Si no especificamos esta opción, R convertirá automáticamente cada vector de caracteres en un factor.

#Esta característica es ocasionalmente útil, pero a veces también es injustificada. Aquí, por ejemplo, el campo subject_name definitivamente no son datos categóricos, ya que los nombres no son categorías de valores. Por lo tanto, establecer la opción stringsAsFactors en FALSE nos permite convertir vectores de caracteres a factores solo donde tiene sentido para el proyecto.

#Cuando mostramos el marco de datos pt_data, vemos que la estructura es bastante diferente de las estructuras de datos con las que trabajamos anteriormente:

pt_data

#En comparación con los vectores, factores y listas unidimensionales, un marco de datos tiene dos dimensiones y se muestra en formato de matriz. Este marco de datos en particular tiene una columna para cada vector de datos del paciente y una fila para cada paciente. En términos de aprendizaje automático, las columnas del marco de datos son las características o atributos y las filas son los ejemplos.


#Para extraer columnas enteras (vectores) de datos, podemos aprovechar el hecho de que un marco de datos es simplemente una lista de vectores. Similar a las listas, la forma más directa de extraer un solo elemento es refiriéndose a él por su nombre. Por ejemplo, para obtener el vector subject_name, escriba:

pt_data$subject_name

#También similar a las listas, se puede usar un vector de nombres para extraer varias columnas de un marco de datos:

pt_data[c("temperature", "flu_status")]


#Cuando accedemos al marco de datos de esta manera, el resultado es un marco de datos que contiene todas las filas de datos para todas las columnas solicitadas. Alternativamente, el comando pt_data[2: 3] también extraerá las columnas de temperatura y flu_status. Sin embargo, solicitar las columnas por nombre da como resultado un código R claro y fácil de mantener que no se romperá si el marco de datos se reestructura en el futuro.

#Para extraer valores en el marco de datos, se utilizan métodos como los para acceder a valores en vectores. Sin embargo, hay una excepción importante.

#Debido a que el marco de datos es bidimensional, se deben especificar tanto las filas como las columnas que se desea extraer. Las filas se especifican primero, seguidas de una coma y luego las columnas en un formato como este: [filas, columnas]. Al igual que con los vectores, las filas y columnas se cuentan comenzando en uno.

#Por ejemplo, para extraer el valor en la primera fila y la segunda columna del marco de datos del paciente (el valor de temperatura para John Doe), use el siguiente comando:

pt_data[1, 2]

#Si desea más de una fila o columna de datos, especifique vectores para las filas y columnas deseadas. El siguiente comando extraerá los datos de las filas primera y tercera y las columnas segunda y cuarta:

pt_data[c(1, 3), c(2, 4)]


#Para extraer todas las filas o columnas, simplemente deje la parte de la fila o columna en blanco.

#Por ejemplo, para extraer todas las filas de la primera columna:

pt_data[, 1]


#Para extraer todas las columnas de la primera fila, use el siguiente comando:

pt_data[1, ]

#Para extraer todo, use el siguiente comando:
  
pt_data[,]

#También se pueden utilizar otros métodos para acceder a valores en listas y vectores para recuperar filas y columnas de marcos de datos. Por ejemplo, se puede acceder a las columnas por nombre en lugar de por posición, y los signos negativos se pueden usar para excluir filas o columnas de datos.

#Por lo tanto, el siguiente comando:

pt_data[c(1, 3), c("temperature", "gender")]

#Que es el equivalente a:

pt_data[-2, c(-1, -3, -5, -6)]


#Para familiarizarse con los marcos de datos, intente practicar operaciones similares con el conjunto de datos del paciente o, mejor aún, utilice los datos de uno de sus propios proyectos. Estos tipos de operaciones son cruciales para gran parte del trabajo que haremos en los próximos capítulos.


#Matrices y Arreglos

#Además de los marcos de datos, R proporciona otras estructuras que almacenan valores en forma tabular. Una matriz es una estructura de datos que representa una tabla bidimensional con filas y columnas de datos. Al igual que los vectores, las matrices R pueden contener cualquier tipo de datos, aunque se utilizan con mayor frecuencia para operaciones matemáticas y, por lo tanto, generalmente solo almacenan datos numéricos.


#Para crear una matriz, simplemente proporcione un vector de datos a la función matrix () junto con un parámetro que especifique el número de filas (nrow) o el número de columnas (ncol).

#Por ejemplo, para crear una matriz de 2 x 2 que almacene los números del uno al cuatro, podemos usar el parámetro nrow para solicitar que los datos se dividan en dos filas:

m <- matrix(c(1, 2, 3, 4), nrow = 2)

m

m <- matrix(c(1:4), nrow = 2)

m

#Notarán que R cargó la primera columna de la matriz primero antes de cargar la segunda columna. Esto se denomina orden mayor de columna y es el método predeterminado de R para cargar matrices.

#Para anular esta configuración predeterminada y cargar una matriz por filas, establezca el parámetro byrow = TRUE al crear la matriz.


m <- matrix(c(1:4), nrow = 2, byrow = TRUE)

m

#Para ilustrar esto con más detalle, veamos qué sucede si agregamos más valores a la matriz.
#Con seis valores, la solicitud de dos filas crea una matriz con tres columnas:


m <- matrix(c(1:6), nrow = 2)
m

#Solicitar dos columnas crea una matriz con tres filas:

m <- matrix(c(1:6), ncol = 2)
m

#Al igual que con los marcos de datos, los valores en matrices se pueden extraer usando la notación [fila, columna]. Por ejemplo, m [1, 1] devolverá el valor 1 y m [3, 2] extraerá 6 de la matriz m. Además, se pueden solicitar filas o columnas completas:


m[1, ]

m[, 1]




#Manejando datos con R


#Uno de los desafíos que se enfrentan al trabajar con conjuntos de datos masivos es la recopilación, preparación y gestión de datos de una variedad de fuentes. Si bien cubriremos la preparación de datos, la limpieza de datos y la administración de datos en profundidad al trabajar en tareas de aprendizaje automático en el mundo real, aqui destacaremos la funcionalidad básica para capturar datos de R.


#Guardar, cargar y eliminar datos en R


#Cuando haya pasado mucho tiempo obteniendo un marco de datos en el formulario deseado, no debería tener que volver a crear su trabajo cada vez que reinicie su sesión R. Para guardar una estructura de datos en un archivo que puede recargarse más tarde o transferirse a otro sistema, use la función save (). La función save () escribe una o más estructuras de datos R en la ubicación especificada por el parámetro de archivo. Los archivos de datos R tienen una extensión .RData.



x <- c(1:50)
y <- c("Lunes", "Martes", "Miercoles", "Jueves", "Viernes")
z <- factor(c("p", "q", "p", "r", "q"))



#Suponga que tiene tres objetos llamados x, y, y z que desea guardar en un archivo permanente. Independientemente de si son vectores, factores, listas o marcos de datos, podríamos guardarlos en un archivo llamado mydata.RData usando el siguiente comando:


save(x, y, z, file = "mydata.RData")


#El comando load () puede recrear cualquier estructura de datos que se haya guardado en un archivo .RData. Para cargar el archivo mydata.RData que guardamos en el código anterior, simplemente escriba:

load("mydata.RData")

#Alli creamos nuevamente nuestra estructura de datos

#¡Ten cuidado con lo que estás cargando! Todas las estructuras de datos almacenadas en el archivo que está importando con el comando load () se agregarán a su espacio de trabajo, van a sobreescribir cualquier trabajo que tenga abierto.

#Si necesita finalizar su sesión R a toda prisa, el comando save.image () escribirá toda su sesión en un archivo llamado simplemente .RData. De forma predeterminada, R buscará este archivo la próxima vez que inicie R, y su sesión se volverá a crear tal como la dejó.

#Después de trabajar en una sesión R durante algún tiempo, es posible que haya acumulado varias estructuras de datos. La función de listado ls () devuelve un vector de todas las estructuras de datos actualmente en la memoria. 
ls()


#R se eliminará automáticamente de su memoria al salir de la sesión, pero para estructuras de datos grandes, es posible que desee liberar la memoria antes. La función rm () remove puede usarse para este propósito. Por ejemplo, para eliminar los objetos m y subject1, simplemente escriba:

#Pueden utilizar Ctl + Alt + R para correr todo el ejemplo.

rm(m, subject1)

#La función rm () también se puede suministrar con un vector de caracteres de los nombres de objetos que se eliminarán. Esto funciona con la función ls () para borrar toda la sesión R:

rm(list = ls())

#¡Tenga mucho cuidado al ejecutar el comando anterior, ya que no se le pedirá que guarde sus objetos!


#Importando y guardando datos desde un CSV


#Es muy común que los conjuntos de datos públicos se almacenen en archivos de texto. Los archivos de texto se pueden leer en prácticamente cualquier computadora o sistema operativo, lo que hace que el formato sea casi universal. También se pueden exportar e importar desde y hacia programas como Microsoft Excel, lo que proporciona una manera rápida y fácil de trabajar con datos de hojas de cálculo.

#Un archivo de datos tabular (como en "tabla") está estructurado en forma de matriz, de manera que cada línea de texto refleja un ejemplo, y cada ejemplo tiene el mismo número de características.

#Los valores de las características en cada línea están separados por un símbolo predefinido, conocido como delimitador. A menudo, la primera línea de un archivo de datos tabular enumera los nombres de las columnas de datos. Esto se llama una línea de encabezado.

#Quizás el formato de archivo de texto tabular más común es el archivo CSV (valores separados por comas), que como su nombre indica, utiliza la coma como delimitador. Los archivos CSV se pueden importar y exportar desde muchas aplicaciones comunes. Un archivo CSV que representa el conjunto de datos médico construido previamente se podría almacenar como:
`
write.csv(pt_data,'pt_data.csv', row.names = TRUE)`

#Explorando y entendiendo datos

#Después de recopilar los datos y cargarlos en las estructuras de datos de R, el siguiente paso en el proceso de aprendizaje automático consiste en examinar los datos en detalle. Es durante este paso que comenzará a explorar las características y los ejemplos de los datos, y se dará cuenta de las peculiaridades que hacen que sus datos sean únicos. Cuanto mejor comprenda sus datos, mejor podrá relacionar un modelo de aprendizaje automático con su problema de aprendizaje.

#La mejor manera de aprender el proceso de exploración de datos es con un ejemplo. En esta sección, exploraremos el conjunto de datos usedcars.csv, que contiene datos reales sobre autos usados recientemente anunciados para la venta en un popular sitio web de los EE. UU.



#Dado que el conjunto de datos se almacena en el formato CSV, podemos usar la función read.csv () para cargar los datos en un marco de datos R:

usedcars <- read.csv ("data/usedcars.csv", stringsAsFactors = FALSE)

#Dado el marco de datos de coches usados, ahora asumiremos el papel de un científico de datos que tiene la tarea de comprender los datos de automóviles usados. Si bien la exploración de datos es un proceso fluido, los pasos se pueden imaginar como una especie de investigación en la que las preguntas sobre

#Los datos son respondidos. Las preguntas exactas pueden variar según los proyectos, pero los tipos de preguntas son siempre similares. Debe poder adaptar los pasos básicos de esta investigación a cualquier conjunto de datos que desee, ya sea grande o pequeño.



#Explorando la estructura de datos

#Una de las primeras preguntas que debe hacerse en una investigación de un nuevo conjunto de datos debe ser sobre cómo se organiza el conjunto de datos. Si tiene suerte, su fuente proporcionará un diccionario de datos, que es un documento que describe las características del conjunto de datos. En nuestro caso, los datos de automóviles usados no vienen con esta documentación, por lo que necesitaremos crear uno.

#La función str () proporciona un método para mostrar la estructura de las estructuras de datos R, como marcos de datos, vectores o listas. Se puede utilizar para crear el esquema básico de nuestro diccionario de datos:


str(usedcars)

summary(usedcars)

#Usando un comando tan simple, aprendemos una gran cantidad de información sobre el conjunto de datos.

#La declaración 150 obs nos informa que los datos incluyen 150 observaciones, que es solo otra forma de decir que el conjunto de datos contiene 150 registros o ejemplos. El número de observaciones a menudo se abrevia como n. Como sabemos que los datos describen autos usados, ahora podemos suponer que tenemos ejemplos de n = 150

#Venta de automóviles.

#La declaración de 6 variables se refiere a las seis características que se registraron en los datos.

#Estas características se enumeran por nombre en líneas separadas. Mirando la línea para la característica llamada color, podemos notar algunos detalles adicionales:
#  $ color
#: chr
#"Amarillo" "Gris" "Plata" "Gris" ...
#Después del nombre de la variable, la etiqueta chr nos dice que la característica es el tipo de carácter. En este conjunto de datos, tres de las variables son caracteres, mientras que tres se indican como int, lo que indica un tipo de entero. Aunque el conjunto de datos usedcars incluye solo caracteres y variables enteras, también es probable que encuentre números o tipos numéricos mientras usa datos no integrales. Cualquier factor sería listado como tipo de factor. Siguiendo el tipo de cada variable, R presenta una secuencia de los primeros valores de características. Los valores "Amarillo" "Gris" "Plata" "Gris" son los primeros cuatro valores de la característica de color.


#Variable categórica

#Las variables categóricas contienen un número finito de categorías o grupos distintos. Los datos categóricos pueden no tener un orden lógico. Por ejemplo, los predictores categóricos incluyen sexo, tipo de material y método de pago.

#Variable discreta
#Las variables discretas son variables numéricas que tienen un número contable de valores entre dos valores cualesquiera. Una variable discreta siempre es numérica. Por ejemplo, el número de quejas de los clientes o el número de fallas o defectos.

#Variable continua
#Las variables continuas son variables numéricas que tienen un número infinito de valores entre dos valores cualesquiera. Una variable continua puede ser numérica o de fecha/hora. Por ejemplo, la longitud de una pieza o la fecha y hora en que se recibe un pago.
