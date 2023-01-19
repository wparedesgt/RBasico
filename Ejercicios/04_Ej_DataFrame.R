#Ejercicios Data Frames


#Ejercicio 1

#Cree el siguiente Data Frame, luego invierta el sexo para todos los individuos.

#Age Height Weight Sex
#Alex      25    177     57   M
#Lilly     31    163     69   M
#Mark      23    190     83   F
#Oliver    52    179     75   F
#Martha    76    163     70   M
#Lucas     49    183     83   F
#Caroline  26    164     53   M


#Creando los vectores

Name <- c("Alex", "Lilly", "Mark", "Oliver", "Martha", "Lucas", "Caroline")
Age <- c(25, 31, 23, 52, 76, 49, 26)
Height <- c(177, 163, 190, 179, 163, 183, 164)
Weight <- c(57, 69, 83, 75, 70, 83, 53)
Sex <- as.factor(c("Masculino", "Masculino", "Femenino", "Femenino", "Masculino", "Femenino", "Masculino"))

#Creando el Data Frame

df <- data.frame (row.names = Name, Age, Height, Weight, Sex)

str(df)

#Asignando los niveles

levels(df$Sex) <- c("M", "F")


#Consultando el resultado

df



#Ejercicio 2

#Cree este Data Frame (asegúrese de importar la variable Working como carácter y no como factor).


#Working
#Alex         Yes
#Lilly         No
#Mark          No
#Oliver       Yes
#Martha       Yes
#Lucas         No
#Caroline     Yes


#Ralizando los vectores

Name <- c("Alex", "Lilly", "Mark", "Oliver", "Martha", "Lucas", "Caroline")
Working <- c("Yes", "No", "No", "Yes", "Yes", "No", "Yes")

#Convirtiendo en un data frame

dfa <- data.frame(row.names = Name, Working)

dfa


#Agregue este Data Frame en forma de columna al anterior que realizo en el ejercicio 1, utilice la función cbind.

df

dfa

dfa <- cbind(df, dfa)

dfa

#a) ¿Cuántas filas y columnas tiene el nuevo Data Frame?

#contando filas

nrow(dfa)

#contando columnas

ncol(dfa)

#Utilizando la funcion DIM para mostrar ambos.

dim(dfa)

#b) ¿Qué clase de datos hay en cada columna?

#Usando la funcion sapply()

sapply(dfa, class)

#Usando mi funcion preferida str()

str(dfa)


#Ejercicio 3

#Compruebe qué clase de datos es conjunto de datos incorporado state.center y conviértalo a Data Frame.

#TIP: Cargue desde R studio la clase de la siguiente forma:
  
class(state.center)

df <- as.data.frame(state.center)

df


#Ejercicio 4

#Cree un Data Frame simple a partir de 3 vectores con nombre v, b, y n. Cree en Data Frame etiquetándolo así Age = v, Class = b, Grade = n . Ordene todo el Data Frame por la primera columna para que quede igual que el resultado siguiente:
  
  ##   Age Class Grade
  ## 6  30     C    57
  ## 7  31     A    64
  ## 8  32     B    59
  ## 9  33     C    73
  ## 5  41     B    61
  ## 4  42     A    71
  ## 3  43     C    70
  ## 2  44     B    63
  ## 1  45     A    62

#Utilice LETTERS para “v”, de esta forma “LETTERS[rep()]”
#Utilice la funcion round() para eliminar los decimales y rnorm() para crear en n, 9 observaciones, con un promedio de 65 y una desviación estándar de 5.
  
  
#Creando los vectores

set.seed(20)

v <- c(45:41, 30:33)
b <- LETTERS[rep(1:3, 3)]
n <- round(rnorm(9, 65, 5))


df <- data.frame(Age = v, Class = b, Grade = n)

df

#Solucion 1

df[with (df, order(Age)),]

#Otra solucion valida

df[order(df$Age), ]  




#Ejercicio 5

#Cree un Data Frame a partir de una matriz, con numero del 1 al 20 y 5 columnas, cambie los nombres de las filas para que cada fila diga id_i (donde i es el número de la fila) y cambie los nombres de las columnas a variable_i (donde i es el número de la columna). Es decir, para la columna 1 dirá variable_1, y para la fila 2 dirá id_2 y así sucesivamente.

#matriz de ejemplo

matr <- matrix(1:20, ncol = 5) 

matr

#Creando el DF

df <- as.data.frame(matr)

df

colnames(df) <- paste("variable_", 1:ncol(df))

df

rownames(df) <- paste("id_", 1:nrow(df))

df

#Ejercicio 6

#Para este ejercicio, usaremos el conjunto de datos VADeaths (incorporado).


class(VADeaths)


VADeaths

#a) Asegúrese de que el objeto sea un Data Frame, si no lo cambia a un Data Frame.

df <- as.data.frame(VADeaths)

class(df)

#b) Cree una nueva variable, llamada Total, que es la suma de cada fila.

df
df[,]

rowSums(df)

df$Total <- rowSums(df) 

df$Total <- rowSums(df[1:4])


#Otra solucion

df$Total <- df[, 1] + df[, 2] + df[, 3] + df[, 4]

df

#c) Cambie el orden de las columnas para que el total sea la primera variable.


df <- df[,c(5, 1:4)]

#tambien

df <- df[, c(5,1,2,3,4)]

df

#Ejercicio 7

#Para este ejercicio usaremos el conjunto de datos (incorporado) state.x77.

#TIP: en este caso R ya posee los datos en memoria, unicamente teclee  state.x77 para llamar la información.

#a) Asegúrese de que el objeto sea un Data Frame, si no lo cambia a un Data Frame.

class (state.x77)

df <- as.data.frame(state.x77)


#b) Averigüe cuántos estados tienen un ingreso inferior a 4300.


View(df)


subset(df, df$Income < 4300)

nrow(subset(df, df$Income < 4300))


#c) Averiguar cuál es el estado con mayor ingreso.

max(df$Income)

which(max(df$Income) == df$Income)

row.names(df)[2]

row.names(df)[which(max(df$Income) == df$Income)]


#Ejercicio 8

#Con el conjunto de datos swiss, cree un Data Frame de solo las filas 1, 2, 3, 10, 11, 12 y 13, y solo las variables Examination, Education y Infant.Mortality.

class(swiss)

swiss

df <- swiss[c(1:3, 10:13), c("Examination", "Education", "Infant.Mortality")]

str(df)

df

#a) La mortalidad infantil de Sarine es incorrecta, debe ser una NA, cambiarla.

df[4,3] <- NA

df

#b) Cree una fila que será la suma total de la columna, asígnele el nombre Total.

sum(df$Examination)
sum(df$Education)
sum(df$Infant.Mortality, na.rm = TRUE)

c(sum(df$Examination), sum(df$Education), sum(df$Infant.Mortality, na.rm = TRUE))



df["Total",] <- c(sum(df$Examination), sum(df$Education), sum(df$Infant.Mortality, na.rm = TRUE))

df

#c) Crear una nueva variable que será la proporción del examen (examen / total)

round(df$Examination / df["Total", "Examination"], 3)


df$proportion <- round(df$Examination / df["Total", "Examination"],3)

df

#Ejercicio 9

#Cree un Data Frame con los conjuntos de datos state.abb, state.area, state.division, state.name, state.region. Los nombres de las filas deben ser los nombres de los estados.


df <- data.frame(state.abb, state.area, state.division, state.region, row.names = state.name)

df

#a) Cambie el nombre de los nombres de las columnas para que solo aparezcan las primeras 3 letras (por ejemplo, States.abb será abb).

names(df)

substr(names(df), 7, 9)

names(df) <- substr(names(df), 7, 9)

df

#Ejercicio 10

state.x77


#Agregue el Data Frame anterior en forma de columna a state.x77

state.x77
df


cbind(state.x77, df)

dfa <- cbind(state.x77, df)

str(dfa)

dfa

#a) Eliminar la variable div.

dfa$div <- NULL


#b) También elimine las variables Life Exp, HS Grad, Frost, abb y are.

dfa$`Life Exp` <- NULL
dfa$`HS Grad` <- NULL
dfa$Frost <- NULL
dfa$abb <- NULL
dfa$are <- NULL

dfa


#c) Agregue una variable al Data Frame que debería categorizar el nivel de analfabetismo: [0,1) es bajo, [1,2) es algo, [2, inf) es alto.

dfa$analfabetismo <- ifelse(dfa$Illiteracy < 1,
                   "Bajo analfabetismo",
                   ifelse(dfa$Illiteracy >= 1 & dfa$Illiteracy < 2,
                          "Algo de Analfabetismo",
                          "Alto Analfabetismo"))

dfa

#d) Averigüe qué estado del oeste, con bajo analfabetismo, tiene el ingreso más alto y cuál es ese ingreso.

sub <- subset(dfa, analfabetismo == "Bajo analfabetismo" & reg == "West")

sub

max <- max(sub$Income)

max

stat <- row.names(sub)[which (sub$Income == max)]

stat


cat("El ingreso mas alto es", max , "y el estado es", stat, "\n")

