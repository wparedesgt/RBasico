#Ejercicio No2 Practicas con Data Frames

#Ejercicio 11.

#Considere 2 vectores.

#x <- seq(1,43,along.with=Id)
#y <-  seq(-20,0,along.with=Id)

#Cree un data frame df igual al expuesto:

#Id Letter         x          y
#1   1      a  1.000000 -20.000000
#2   1      b  4.818182 -18.181818
#3   1      c  8.636364 -16.363636
#4   2      a 12.454545 -14.545455
#5   2      b 16.272727 -12.727273x<-seq(1,43,along.with=Id)
#6   2      c 20.090909 -10.909091
#7   3      a 23.909091  -9.090909
#8   3      b 27.727273  -7.272727
#9   3      c 31.545455  -5.454545
#10  4      a 35.363636  -3.636364
#11  4      b 39.181818  -1.818182
#12  4      c 43.000000   0.000000  


#df


Id <- rep(c(1,2,3,4),each=3)
Letter <- rep(letters[1:3],4)
x <- seq(1,43,along.with=Id)
y <- seq(-20,0,along.with=Id)
df <-data.frame(Id,Letter,x,y)
df


#Ejercicio 12

#Con el dataframe anterior crear este dataframe.

#Id      x.a        y.a       x.b        y.b       x.c        y.c
#1   1  1.00000 -20.000000  4.818182 -18.181818  8.636364 -16.363636
#4   2 12.45455 -14.545455 16.272727 -12.727273 20.090909 -10.909091
#7   3 23.90909  -9.090909 27.727273  -7.272727 31.545455  -5.454545
#10  4 35.36364  -3.636364 39.181818  -1.818182 43.000000   0.000000

reshape(df,timevar='Letter',idvar='Id',direction='wide')



#Ejercicio 13.

#Cree dos dataframes df1 y df2.

Id <- c(1:4)
Age <- c(14,12,15,10)
Sex <- c('F','M','M','F')
Code <- c('a','b','c','d')
df1 <- data.frame(Id,Age)
df2 <- data.frame(Id,Sex,Code)

df1
df2


# Y despues el datafarme M

M <- merge(df1,df2,by='Id')
M

#Ejercicio No. 14

#Cree el dataframe df3


id2 <- seq(4,1)
score <- c(100,98,94,99)
df3 <- data.frame(id2,score)

df3

#Del dataframe M y df3 cree el dataframe N.

N=merge(M,df3,by.x='Id',by.y='id2')
N

#Ejercicio 15.

#Considere el dataframe N:
  
#1) Remueva las variables sex y code.

N[,c("Sex")]=NULL
N[,c("Code")]=NULL

N

#2)De N crear el dataframe 

stack(N)

