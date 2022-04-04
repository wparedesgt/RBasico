install.packages('RJDBC')
library(RJDBC)


jdbcDriver <- JDBC("oracle.jdbc.OracleDriver",classPath="D:/Oracle/ojdbc8.jar")

jdbcConnection <- dbConnect(jdbcDriver,"jdbc:oracle://10.100.61.205:1521/dbsat1", "GIF_WVPAREDE", "W1ll1am2022#")


# Query on the Oracle instance name.
instanceName <- dbGetQuery(jdbcConnection, "SELECT instance_name FROM v$instance")
print(instanceName)

# Close connection
dbDisconnect(jdbcConnection)