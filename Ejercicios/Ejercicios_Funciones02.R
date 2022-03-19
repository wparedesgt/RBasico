# Ejercicio #1

f.sum <- function (x, y) {
  w <- x + y
  w
}

f.sum(5, 10)


## [1] 15

# Ejercicio No. 2

f.exists <- function (v, x) {
  exist <- FALSE
  i <- 1
  
  while (i <= length(v) & !exist) {
    
    if (v[i] == x) {
      exist <- TRUE
    }
    i <- 1 + i
  }
  exist
}

f.exists(c(1:10), 10)
## [1] TRUE
f.exists(c(9, 3, 1), 10)
## [1] FALSE

f.exists(c(5:15), 4)


# Ejercicio 3

f.class <- function (df) {
  for (i in 1:ncol(df)) {
    cat(names(df)[i], "es", class(df[, i]), "\n")
  }
}
f.class(cars)

names(cars)

## speed is numeric 
## dist is numeric


#Ejercicio 4 

f.uniq <- function(v){
  s <- c()
  
  for(i in 1:length(v)) {
    if(sum(v[i] == s) == 0) {
      s <- c(s, v[i])
    }
  }
  s
}
f.uniq(c(9, 9, 1, 1, 1, 0))
## [1] 9 1 0


 
 # Ejercicio 5 

?rep()

x <- c(1:9, rep(10, 100))

f.count <- function (v, x) {
  count <- 0
  
  for (i in 1:length(v)) {
    if (v[i] == x) {
      count <- count + 1
    }
  }
  count
}

f.count(c(1:9, rep(10, 100)), 10)


## [1] 100


# Ejercicio 6

round(mean(c(1:10)))
round(sd(c(1:10)))
median(c(1:10))

f.desi <- function(v, med=FALSE) {
  
  mean <- round(mean(v), 1)
  stdv <- round(sd(v), 1)
  cat("El promedio es:", mean, ", La desviación estándard es:", stdv, "\n")
  
  if(med) {
    median <- median(v)
    cat("La media es:", median , "\n")
  }
}

f.desi(1:10, med=FALSE)
f.desi(1:10, med=TRUE)


# Ejercicio 7

f.div <- function(n) {
    i <- 2
    counter <- 0
    
    while(i <= n/2) {
      if(n%%i==0) {
        counter <- counter + 1
        cat (i ,"\n")
      }
      i <- i + 1
    }
    counter
  }
  f.div(13)
  ## [1] 0
  f.div(32)
  
  
  # Ejercicio 8 
  
f.na <- function (df, otherna) {
  for(i in 1:ncol (df)) {
    for(j in 1:nrow (df)) {
      if(df[j,i] == otherna) {
        df[j,i] <- NA
      }
    }
  }
  df
}

carsnuevo <- f.na(cars, 10)

library(tidyverse)

carsnuevo %>% head(10)
cars %>% head(10)
