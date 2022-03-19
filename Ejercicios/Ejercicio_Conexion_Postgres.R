#Conexión a postgresql
#Si no ha instalado instalar las siguientes librerias:
#tidyverse, tibble, RpostgreSQL, rvest y googleway

#Primero llamar las librerias siguientes:

library(tidyverse)
library(tibble)
library(RPostgreSQL)
library(rvest)
library(googleway)


#Cargando la data desde la base de datos del servidor

require(RPostgreSQL)


#Creando la conexión a la base de datos


#Password, aqui podemos utiliar codificacion MD5 o alguna otra mas adelante
pw <- {"Wp12090910Fa"}
#Dirección del servidor
watchdog <- "192.168.0.73"
#Puerto de coneccion
portpg <-  9999
#usuarop
usrpg <- "cd_usr"
#Base de Datos
dbpg <- "bd_geo_mingob"
#Driver de coneccion
drv <- dbDriver("PostgreSQL")
#Cadena de Conexión
con <- dbConnect(drv, dbname = dbpg, host = watchdog, port = portpg, 
                 user = usrpg, password = pw)

#removiendo el password

rm(pw)


dt_armas_robadas <- dbGetQuery(con,"select * from pnc.armas_robadas;" )


#Desconectando el servidor

dbDisconnect(con)


#Ejercicio 1

#Con los siguientes valores revise el encabezado del conjunto de datos.

dt_armas_robadas %>% head(10)

#Ejercicio 2

#Revise los nombres de las columnas del conjunto de datos.

names(dt_armas_robadas)


#Ejercicio 3

#Seleccione unicamente el No., Latitud, Longitud y año.

dt_armas_robadas <- dt_armas_robadas[2:5]

#Ejercicio 4

#Cambie los nombres a No, lon, lat, year


names(dt_armas_robadas)[1] <- "No"
names(dt_armas_robadas)[2] <- "lon"
names(dt_armas_robadas)[3] <- "lat"
names(dt_armas_robadas)[4] <- "year"

dt_armas_robadas %>% head()


#Ejercicio 5

#Revise el conjunto de datos y si aun no es un dataframe conviertalo.

class(dt_armas_robadas)


#Ejercicio 6

#Ordene las columnas de dataframe para que queden ordenas en No, lat, lon, year.

colnames(dt_armas_robadas)

dt_armas_robadas <- dt_armas_robadas[,c(1,3,2,4)]

colnames(dt_armas_robadas)

#Ejercicio 7

#Unicamente filtre la data del 2010 y llamelo dt_armas_robadas_filter, utilice la funcion filter y pipe (%>%) para asignar los valores

dt_armas_robadas_filter <- dt_armas_robadas %>% filter(dt_armas_robadas$year == 2010) 

dt_armas_robadas_filter %>% head(10)

summary(dt_armas_robadas_filter)

#Ejercicio 8

#utilice los siguientes valores para cargar el mapa de guatemala en memoria

lat <- 15.6356088
lon <- -89.8988087
zoom <- 7

mapKey <- 'AIzaSyBtvPesVevvfjVcfM69EQp3f5gB5DW7oWE'

#Asigne a gt_map los valores correspondientes de la funcion google_map() utilice la ayuda para asignar los valores que ya tiene obtenidos, unicamente utilizaremos location, zoom, key y data)


gt_map <- google_map(location = c(mean(lat), mean(lon)), zoom = zoom, key = mapKey, data =  dt_armas_robadas_filter)

gt_map

#Ejercicio 9 

#Asignemos gt_map la funcion add_heatmap con %>%, analice sus resultados.

gt_map %>% add_heatmap(lat = "lat", lon = "lon")

