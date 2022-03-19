library(tidyverse)
#library(compare)


sui01 <- read_csv('/var/bkps_sui/suibitacora01.csv', col_names = TRUE)

sui04 <- read_csv('/var/bkps_sui/suibitacora.csv', col_names = TRUE)

cuenta <- c(nrow(sui04) - nrow(sui01))

comparacion <- setdiff(sui04, sui01)

remove(sui01)
remove(sui04)


head(comparacion$respuesta)

summary(comparacion)

class(comparacion)

patron <- "Astrid"

x <- str_detect(comparacion$respuesta, patron)

sum(str_detect(comparacion$respuesta, patron))

comparacion$respuesta[x]



